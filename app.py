from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
from dotenv import load_dotenv
import os
from datetime import datetime

load_dotenv()

app = Flask(__name__)

app.secret_key = os.getenv('SECRET_KEY')
app.config['MYSQL_HOST'] = os.getenv('MYSQL_HOST')
app.config['MYSQL_USER'] = os.getenv('MYSQL_USER')
app.config['MYSQL_PASSWORD'] = os.getenv('MYSQL_PASSWORD')
app.config['MYSQL_DB'] = os.getenv('MYSQL_DB')

mysql = MySQL(app)
# Carley Youngquist 
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
                return redirect(url_for('patient'))
            elif roleID == 1:
                return redirect(url_for('nurse'))
            elif roleID == 3:
                return redirect(url_for('physician'))
            elif roleID == 4:
                return redirect(url_for('admin'))
            elif roleID == 5:
                return redirect(url_for('staff'))
        else:
            msg = 'Failed login!'
    return render_template('login.html', msg=msg)
#Carley Youngquist
@app.route('/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('username', None)
    return redirect(url_for('login'))
#Carley Youngquist
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
            cursor.execute('CALL InsertIntoUsernames(%s, %s, %s, %s, %s)', (username, userID, userTypeID, password, email))
            mysql.connection.commit()
            msg = 'You have successfully registered!'
        else:
            return redirect(url_for('new_user_view'))
    return render_template('register.html', msg=msg)
#Carley Youngquist
@app.route('/profile')
def profile():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM usernames WHERE UserName = %s', (session['username'],))
        user_info = cursor.fetchone()
        cursor.execute('SELECT UserTypeID FROM usernames WHERE UserName = %s', (session['username'],))
        user_type = cursor.fetchone()
        if user_type['UserTypeID'] == 1:
            cursor.execute('SELECT * FROM nurses WHERE nurseusername=%s', (session['username'],))
            nurse_info = cursor.fetchone()
            render_template('nurse_views/nurse_profile_view.html', user_info=user_info, nurse_info=nurse_info)
        elif user_type['UserTypeID'] == 2:
            cursor.execute('SELECT * FROM patients WHERE PatientSUserName=%s', (session['username'],))
            patient_info = cursor.fetchone()
            return render_template('patient_profile_view.html', user_info=user_info, patient_info=patient_info)
        elif user_type['UserTypeID'] == 3:
            cursor.execute('SELECT * FROM physicians WHERE PhysicianUserName=%s', (session['username'],))
            physician_info = cursor.fetchone()
            render_template('physician_views/physician_view.html', user_info=user_info, physician_info=physician_info)
        elif user_type['UserTypeID'] == 4:
            cursor.execute('SELECT * FROM admins WHERE AdminUserName=%s', (session['username'],))
            admin_info = cursor.fetchone()
            return render_template('admin_profile_view.html', user_info=user_info, admin_info=admin_info)
        elif user_type['UserTypeID'] == 5:
            cursor.execute('SELECT * FROM staff WHERE StaffUserName=%s', (session['username'],))
            staff_info = cursor.fetchone()
            return render_template('staff_view.html', user_info=user_info, staff_info=staff_info)
    return redirect(url_for('login'))
#Carley Youngquist

#Connor Stomp   
@app.route('/after_visit_summary')
def after_visit_summary():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('Select * from AfterVisitSummary where PatientUserName = %s' \
        ' Order By DateCreated DESC', (session['username'],))
        visit_summary = cursor.fetchall()
        return render_template('patient_views/after_visit_summary.html', visit_summary=visit_summary)
    return render_template('patient_views/after_visit_summary.html')
#Carley Youngquist
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
            cursor.execute('CALL InsertIntoUsers(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
                           (ssn, first_name, last_name, middle_name, address, city, state, zip_code, dob, phone))
            mysql.connection.commit()
            cursor.execute('SELECT UserID FROM Users WHERE SSN = %s', (ssn,))
            userID = cursor.fetchone()['UserID']
            cursor.execute('SELECT UserTypeID FROM UserTypes WHERE UserTypeDesc = %s', (role,))
            roleType = cursor.fetchone()
            userTypeID = roleType['UserTypeID']
            cursor.execute('CALL InsertIntoUsernames(%s, %s, %s, %s, %s)', (username, userID, userTypeID, password, email))
            mysql.connection.commit()
            msg = 'You have successfully registered!'

        return render_template('login.html', msg=msg)
    return render_template('new_user_view.html', msg=msg)
#Carley Youngquist
@app.route('/patient')
def patient():
    if 'loggedin' in session:
        return render_template('patient_views/patient_view.html')
    return redirect(url_for('login'))
#Connor Stomp
@app.route('/edit_insurance', methods=['GET', 'POST'])
def edit_insurance():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

        # Get all available insurances
        cursor.execute('SELECT InsuranceID, ProviderName FROM Insurance')
        insurance_list = cursor.fetchall()

        if request.method == 'POST':
            new_insurance_id = request.form.get('insurance_id')
            # Update the patient's insurance ID
            cursor.execute(
                'UPDATE Patients SET InsuranceID = %s WHERE PatientUserName = %s',
                (new_insurance_id, session['username'])
            )
            mysql.connection.commit()
            return redirect(url_for('patient'))

        return render_template('patient_views/edit_insurance.html', insurance_list=insurance_list)
    return redirect(url_for('login'))

@app.route('/patient_insurance')
def patient_insurance():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('CALL GetPatientInsuranceInfo(%s)', (session['username'],))
        insurance = cursor.fetchone()
        return render_template('patient_views/patient_insurance.html', insurance=insurance)
    return redirect(url_for('login'))

@app.route('/schedule_appointment', methods=['GET', 'POST'])
def schedule_appointment():
    if 'loggedin' not in session:
        return redirect(url_for('login'))

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    if request.method == 'POST':
        appt_type_id = request.form['appt_type_id']
        clinic_id = request.form['clinic_id']
        date = request.form['date']
        start_time = request.form['start_time']
        end_time = request.form['end_time']
        physician_username = request.form['physician_username']
        schedule_type_id = request.form['schedule_type_id']

        cursor.execute('SELECT PhysicianCalenderID FROM PhysicianCalenders WHERE PhysicianUserName = %s', (physician_username,))
        row = cursor.fetchone()
        if not row:
            return "Error: No calendar entry found for physician", 400
        
        physician_calendar_id = row['PhysicianCalenderID']
        # Insert the new appointment
        cursor.execute('''
            INSERT INTO PhysicianAppts (PhysicianCalenderID, PatientUserName, Date, StartTime, EndTime, ApptTypeID, ClinicID, ScheduleTypeID)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        ''', (physician_calendar_id, session['username'], date, start_time, end_time, appt_type_id, clinic_id, schedule_type_id))
        mysql.connection.commit()

        return redirect(url_for('patient'))  # or wherever you want to send them after
    cursor.execute('CALL GetFutureAppointmentsByPatient(%s);', (session['username'],))
    appointments = cursor.fetchall()

    # Fetch form options
    cursor.execute('SELECT ApptTypeID, ApptTypeDesc FROM ApptTypes')
    appt_types = cursor.fetchall()

    cursor.execute('SELECT * FROM ScheduleTypes')
    schedule_types = cursor.fetchall()

    cursor.execute('SELECT ClinicID, ClinicName FROM Clinics')
    clinics = cursor.fetchall()

    cursor.execute('SELECT PhysicianUserName FROM Physicians')
    physicians = cursor.fetchall()

    return render_template('patient_views/schedule_appointment.html', appt_types=appt_types, schedule_types=schedule_types, clinics=clinics, physicians=physicians,appointments=appointments)


#Connor Stomp
@app.route('/patient_views/patient_billing')
def patient_billing():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('CALL GetPatientBilling(%s)', (session['username'],))
        billing_info = cursor.fetchall()
        return render_template('patient_views/patient_billing.html', billing_info=billing_info)
    return redirect(url_for('login'))
#Connor Stomp
@app.route('/pay_bill', methods=['POST'])
def pay_bill():
    if 'loggedin' in session and 'billing_id' in request.form:
        billing_id = request.form['billing_id']
        cursor = mysql.connection.cursor()
        cursor.execute('DELETE FROM Billing WHERE BillingID = %s AND PatientUserName = %s', (billing_id, session['username']))
        mysql.connection.commit()
    return redirect(url_for('patient_billing'))
#Fiza 
@app.route('/nurse')
def nurse():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('Select * from detailnotes where NurseUserName = %s AND NotesDesc IS NUll', (session['username'],))
        notes = cursor.fetchall()
        return render_template('nurse_views/nurse_view.html', notes=notes)
    return redirect(url_for('login'))
#Fiza
@app.route('/update_notes', methods=['POST'])
def update_notes():
    if 'loggedin' in session and 'detail_note_id' in request.form and 'note_desc' in request.form:
        notes_id = request.form['detail_note_id']
        notes_desc = request.form['note_desc']
        cursor = mysql.connection.cursor()
        cursor.execute('UPDATE detailNotes SET NotesDesc = %s WHERE DetailNoteID = %s', (notes_desc, notes_id))
        mysql.connection.commit()
    return redirect(url_for('nurse'))
#Connor Stomp
@app.route('/physician')
def physician():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT UserID FROM usernames WHERE UserName = %s', (session['username'],))
        user_id = cursor.fetchone()
        cursor.execute('SELECT * FROM physicians WHERE PhysicianUserName = %s', (session['username'],))
        physician_info = cursor.fetchone()
        specialty_id = physician_info['PhysicianSpecialtiesID']
        cursor.execute('SELECT SpecialtyDesc FROM physicianspecialties WHERE PhysicianSpecialtiesID = %s', (specialty_id,))
        specialty_info = cursor.fetchone()
        if specialty_info:
            physician_info['SpecialtyDesc'] = specialty_info['SpecialtyDesc']
        type_id = physician_info['PhysicianTypeID']
        cursor.execute('SELECT PhysicianTypeDesc FROM physiciantypes WHERE PhysicianTypeID = %s', (type_id,))
        type_info = cursor.fetchone()
        if type_info:
            physician_info['PhysicianTypeDesc'] = type_info['PhysicianTypeDesc']
        dept_id = physician_info['DepartmentID']
        cursor.execute('SELECT DepartmentName FROM departments WHERE DepartmentID = %s', (dept_id,))
        dept_info = cursor.fetchone()
        if dept_info:
            physician_info['DepartmentName'] = dept_info['DepartmentName']
        cursor.execute('SELECT UserID FROM usernames WHERE UserName = %s', (session['username'],))
        user_id_result = cursor.fetchone()
        user_id = user_id_result['UserID']
        cursor.execute('SELECT * FROM users WHERE UserID = %s', (user_id,))
        user_info = cursor.fetchone()
        return render_template('physician_views/physician_view.html', physician_info=physician_info, user_info=user_info)
    return redirect(url_for('login'))
#Connnor Stomp
@app.route('/physician_patient_records')
def physician_patient_records():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('CALL GetUnfinishedMedicalRecords(%s)', (session['username'],))
        medical_records = cursor.fetchall()
        return render_template('physician_views/physician_patient_records.html', medical_records=medical_records)
    return redirect(url_for('login'))
#Fiza
@app.route('/update_medical_record', methods=['POST'])
def update_medical_record():
    if 'loggedin' in session and 'record_id' in request.form and 'record_desc' in request.form:
        record_id = request.form['record_id']
        record_desc = request.form['record_desc']
        conditions = request.form['condition_desc']
        cursor = mysql.connection.cursor()
        cursor.execute('UPDATE PatientMedicalRecords SET RecordDesc = %s, Conditions = %s WHERE PatientMedicalRecordsID = %s',(record_desc, conditions, record_id))
        mysql.connection.commit()
    return redirect(url_for('physician_patient_records'))
#Carley Youngquist
@app.route('/admin')
def admin():
    if 'loggedin' in session:
        return render_template('admin_views/admin_view.html')
    return redirect(url_for('login'))
#Connnor Stomp
@app.route('/staff')
def staff():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('CALL GetTodayAppointmentsByStaff(%s)', (session['username'],))
        appointments = cursor.fetchall()
        cursor.execute('SELECT ClinicID FROM Staff WHERE StaffUserName = %s', (session['username'],))
        clinic = cursor.fetchone()['ClinicID']
        cursor.execute('Select NurseUserName From nurses where clinicID = %s', (clinic,))
        nurses = cursor.fetchall()
        return render_template('staff_views/staff_view.html', appointments=appointments, nurses=nurses)
    return redirect(url_for('login'))
#Connor Stomp
@app.route('/assign_nurse', methods=['POST'])
def assign_nurse():
    if 'loggedin' in session and 'nurse_username' in request.form and 'appointment_id' in request.form:
        nurse_username = request.form['nurse_username']
        appointment_id = request.form['appointment_id']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('UPDATE PhysicianAppts SET checkedIn = %s WHERE PhysicianApptID = %s', (True, appointment_id))
        cursor.execute('Select * From PhysicianAppts where PhysicianApptID = %s', (appointment_id,))
        appointment = cursor.fetchone()
        clinic_id = appointment['ClinicID']
        patient_username = appointment['PatientUserName']
        physician_calendar_id = appointment['PhysicianCalenderID']
        cursor.execute('Select PhysicianUserName From PhysicianCalenders where PhysicianCalenderID = %s', (physician_calendar_id,))
        physician_username = cursor.fetchone()['PhysicianUserName']
        staff_username = session['username']
        cursor.execute('Insert into detailNotes (PatientUserName, NurseUserName,PhysicianUserName, StaffUserName,DateTimeCreated,ClinicID ) values (%s, %s, %s, %s, %s,%s)', 
                       (patient_username, nurse_username,physician_username, staff_username, datetime.now(),clinic_id))
        mysql.connection.commit()
    return redirect(url_for('staff'))
   
#Connor Stomp
@app.route('/user_profile')
def user_profile():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT UserID FROM usernames WHERE UserName = %s', (session['username'],))
        user_id_result = cursor.fetchone()
        user_id = user_id_result['UserID']
        cursor.execute('SELECT * FROM users WHERE UserID = %s', (user_id,))
        user_info = cursor.fetchone()
        cursor.execute('SELECT UserTypeID FROM usernames WHERE UserName = %s', (session['username'],))
        user_type = cursor.fetchone()
        if user_type['UserTypeID'] == 1:
            cursor.execute('SELECT * FROM nurses WHERE nurseusername=%s', (session['username'],))
            nurse_info = cursor.fetchone()
            return render_template('nurse_views/nurse_profile_view.html', user_info=user_info, nurse_info=nurse_info)
        elif user_type['UserTypeID'] == 2:
            cursor.execute('SELECT * FROM patients WHERE PatientUserName=%s', (session['username'],))
            patient_info = cursor.fetchone()
            return render_template('patient_views/patient_profile_view.html', user_info=user_info, patient_info=patient_info)
        elif user_type['UserTypeID'] == 3:
            cursor.execute('SELECT * FROM physicians WHERE PhysicianUserName=%s', (session['username'],))
            physician_info = cursor.fetchone()
            return render_template('physician_views/physician_profile_view.html', user_info=user_info, physician_info=physician_info)
        elif user_type['UserTypeID'] == 4:
            cursor.execute('SELECT * FROM admins WHERE AdminUserName=%s', (session['username'],))
            admin_info = cursor.fetchone()
            dept_id = admin_info['DepartmentID']
            cursor.execute('SELECT DepartmentName FROM departments WHERE DepartmentID = %s', (dept_id,))
            dept_info = cursor.fetchone()
            if dept_info:
                admin_info['DepartmentName'] = dept_info['DepartmentName']
            return render_template('admin_views/admin_profile_view.html', user_info=user_info, admin_info=admin_info)
        elif user_type['UserTypeID'] == 5:
            cursor.execute('SELECT * FROM staff WHERE StaffUserName=%s', (session['username'],))
            staff_info = cursor.fetchone()
            clinic_id = staff_info['ClinicID']
            cursor.execute('SELECT ClinicName FROM clinics WHERE ClinicID = %s', (clinic_id,))
            clinic_info = cursor.fetchone()
            if clinic_info:
                staff_info['ClinicName'] = clinic_info['ClinicName']
            return render_template('staff_views/staff_profile_view.html', user_info=user_info, staff_info=staff_info)
        
        return redirect(url_for('login'))

#Fiza
@app.route('/physician_patients')
def physician_patients():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('CALL GetPhysicianPatients(%s)', (session['username'],))
        patients = cursor.fetchall()
        return render_template('physician_views/physician_patients.html', patients=patients)
    return redirect(url_for('login'))
#Connor Stomp
@app.route('/get_medical_records/<username>')
def get_medical_records(username):
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('CALL GetFullMedicalRecords(%s)', (username,))
        records = cursor.fetchall()

        if not records:
            return "No medical records found."

        html = '<ul>'
        for record in records:
            date_obj = record.get('RecordDate')
            formatted_date = date_obj.strftime('%m/%d/%Y') if isinstance(date_obj, datetime) else 'N/A'

            html += f"""
            <li>
                <strong>Date:</strong> {formatted_date}<br>
                <strong>Description:</strong> {record.get('RecordDesc', 'N/A')}<br>
                <strong>Condition:</strong> {record.get('Conditions', 'N/A')}<br>
                <strong>Allergy:</strong> {record.get('AllergyName', 'N/A')}<br>
                <strong>Allergy Description:</strong> {record.get('AllergyDesc', 'N/A')}<br>
                <strong>Medication:</strong> {record.get('MedicationName', 'N/A')}<br>
                <strong>Strength:</strong> {record.get('MedicationStrength', 'N/A')}<br>
                <strong>Dose:</strong> {record.get('Dose', 'N/A')}<br>
                <strong>Dosage Frequency:</strong> {record.get('Dosage', 'N/A')}
            </li><hr>
            """
        html += '</ul>'
        return html
    return "Unauthorized", 401
#Fiza
@app.route('/user_detail_notes')
def user_detail_notes():
    if 'loggedin' in session:
        return render_template('detailed_notes_view.html', username=session['username'])
    return redirect(url_for('login'))
#Connor Stomp
@app.route('/api/user_detail_notes/<username>')
def get_user_detail_notes(username):
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('CALL GetUserDetailNotes(%s)', (username,))
        notes = cursor.fetchall()

        if not notes:
            return "No detail notes found."

        html = "<ul>"
        for note in notes:
            date = note.get('DateTimeCreated')
            formatted_date = date.strftime('%m/%d/%Y %H:%M') if date else 'N/A'
            html += f"""
                <li>
                    <strong>Date:</strong> {formatted_date}<br>
                    <strong>Patient:</strong> {note.get('PatientUserName', 'N/A')}<br>
                    <strong>Note:</strong> {note.get('NotesDesc', 'N/A')}
                </li><hr>
            """
        html += "</ul>"
        return html
    return "Unauthorized", 401
#Connor Stomp
@app.route('/physician_lab_test_orders', methods=['GET', 'POST'])
def physician_lab_test_orders():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('CALL GetPhysicianPatients(%s)', (session['username'],))
        patients = cursor.fetchall()

        if request.method == 'POST':
            test_name = request.form['test_name']
            test_type = request.form['test_type']
            patient_username = request.form['patient_username']
            physician_username = session['username']
            cursor.execute('SELECT PatientMedicalRecordsID FROM ' \
            'PatientMedicalRecords WHERE PatientUserName = %s AND RecordDesc IS NULL', (patient_username,))
            patient_medical_record_id = cursor.fetchone()['PatientMedicalRecordsID']
            cursor.execute(
                'INSERT INTO LabTest (TestName, TestType, TestResult, PhysicianUserName, PatientUserName, PatientMedicalRecordsID) VALUES (%s, %s, %s, %s, %s, %s)',
                (test_name, test_type, '', physician_username, patient_username,patient_medical_record_id)
            )
            mysql.connection.commit()

        return render_template('physician_views/physician_lab_test_orders.html', patients=patients)
    return redirect(url_for('login'))


if __name__ == '__main__':
    app.run(debug=True)
