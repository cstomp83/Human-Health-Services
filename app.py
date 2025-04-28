from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)

app.secret_key = os.getenv('SECRET_KEY')
app.config['MYSQL_HOST'] = os.getenv('MYSQL_HOST')
app.config['MYSQL_USER'] = os.getenv('MYSQL_USER')
app.config['MYSQL_PASSWORD'] = os.getenv('MYSQL_PASSWORD')
app.config['MYSQL_DB'] = os.getenv('MYSQL_DB')

mysql = MySQL(app)

@app.route('/')
@app.route('/login', methods=['GET', 'POST'])
def login():
    msg = ''
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        username = request.form['username']
        password = request.form['password']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM usernames WHERE username = %s AND passwordHash = %s', (username, password))
        account = cursor.fetchone()
        if account:
            session['loggedin'] = True
            session['id'] = account['UserID']
            session['username'] = account['UserName']
            roleID = account['UserTypeID']
            if roleID == 2:
                return render_template('patient_views/patient_view.html', msg='logged in successfully')
            elif roleID == 1:
                return render_template('nurse_views/nurse_view.html',msg='logged in succcessfully')
            elif roleID == 3:
                return render_template('physician_views/physician_view.html',msg='logged in succcessfully')
            elif roleID == 4:
                return render_template('admin_views/admin_view.html',msg='logged in succcessfully')
        else:
            msg = 'Failed login!'
    return render_template('login.html', msg=msg)

@app.route('/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('username', None)
    return redirect(url_for('login'))

@app.route('/register', methods=['GET', 'POST'])
def register():
    msg = ''
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form and 'email' in request.form:
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        roles = request.form['role']
        SSN = request.form['SSN']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT UserName, UserTypeID, PasswordHash, email, UserID from usernames WHERE UserName = %s', (username,))
        account = cursor.fetchone()
        cursor.execute('SELECT * FROM Users WHERE SSN = %s',(SSN,))
        user = cursor.fetchone()
        if account:
            msg = 'Account already exists!'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            msg = 'Invalid email address!'
        elif not re.match(r'[A-Za-z0-9]+', username):
            msg = 'Username must contain only letters and numbers!'
        elif not username or not password or not email:
            msg = 'Please fill out the form!'
        if user:
            userID = user['UserID']
            cursor.execute('SELECT UserTypeID FROM UserTypes WHERE UserTypeDesc = %s', (roles,))
            roleType = cursor.fetchone()
            userTypeID = roleType['UserTypeID']
            cursor.execute('INSERT INTO usernames (UserName,UserID,UserTypeID,PasswordHash, email) VALUES (%s,%s,%s,%s,%s)', (username, userID,userTypeID,password,email))
            mysql.connection.commit()
            msg = 'You have successfully registered!'
        else:
            return redirect(url_for('new_user_view'))
    return render_template('register.html', msg=msg)

@app.route('/profile')
def profile():
    return render_template('user_profile.html')
    
@app.route('/after_visit_summary')
def after_visit_summary():
    return render_template('patient_views/after_visit_summary.html')

@app.route('/new_user_view', methods=['GET', 'POST'])
def new_user_view():
    msg = ''
    if request.method == 'POST' and 'SSN' in request.form and 'firstName' in request.form and 'lastName' in request.form and 'email' in request.form:
        # Get form data
        username = request.form.get('username')
        password = request.form.get('password')
        email = request.form.get('email')
        ssn = request.form.get('SSN')
        address = request.form.get('address')
        city = request.form.get('city')
        state = request.form.get('state')
        zip_code = request.form.get('zip')
        dob = request.form.get('dob')
        phone = request.form.get('phone')
        first_name = request.form.get('firstName')
        last_name = request.form.get('lastName')
        middle_name = request.form.get('middleName')
        role = request.form.get('role')
        
        # Get security questions and answers
        security_questions = []
        for i in range(1, 4):
            question = request.form.get(f'security-question-{i}')
            answer = request.form.get(f'security-answer-{i}')
            security_questions.append((question, answer))
        security_question_1, security_answer_1 = security_questions[0]
        security_question_2, security_answer_2 = security_questions[1]
        security_question_3, security_answer_3 = security_questions[2]
        
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT UserName from usernames WHERE UserName = %s', (username,))
        account = cursor.fetchone()
        cursor.execute('SELECT * FROM Users WHERE SSN = %s',(ssn,))
        user = cursor.fetchone()
        if not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            msg = 'Invalid email address!'
        elif not re.match(r'[A-Za-z0-9]+', username):
            msg = 'Username must contain only letters and numbers!'
        if account or user:
            msg = 'Account already exists!'
        else:
            cursor.execute('INSERT INTO Users (SSN, FirstName, LastName,' \
            ' MiddleName, Address1, City, State, Zip, DOB, Phone) VALUES '
            '(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)', 
            (ssn, first_name, last_name, middle_name, address, city, state, zip_code, dob, phone))
            mysql.connection.commit()
            cursor.execute('SELECT UserID FROM Users WHERE SSN = %s', (ssn,))
            userID = cursor.fetchone()['UserID']
            cursor.execute('SELECT UserTypeID FROM UserTypes WHERE UserTypeDesc = %s', (role,))
            roleType = cursor.fetchone()
            userTypeID = roleType['UserTypeID']
            cursor.execute('INSERT INTO usernames (UserName,UserID,UserTypeID,PasswordHash,email,' \
            'secuirtyQuestion1,secuirtyQuestion2,secuirtyQuestion3,' \
            'securityAnswer1,securityAnswer2,securityAnswer3) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)', (username,userID,userTypeID,password,email,security_question_1,security_question_2,security_question_3,security_answer_1,security_answer_2,security_answer_3))  
            mysql.connection.commit()
            msg = 'You have successfully registered!'

        return render_template('login.html', msg=msg)
    return render_template('new_user_view.html', msg=msg)

@app.route('/patient')
def patient():
    return render_template('patient_views/patient_view.html')

@app.route('/nurse')
def nurse():
    return render_template('nurse_views/nurse_view.html')

@app.route('/physician')
def physician():
    return render_template('physician_views/physician_view.html')

@app.route('/admin')
def admin():
    return render_template('admin_views/admin_view.html')

@app.route('/user_profile')
def user_profile():
    return render_template('user_profile.html')

if __name__ == '__main__':
    app.run(debug=True)
