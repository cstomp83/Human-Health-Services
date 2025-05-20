# Demo
[![Watch the Video](https://img.youtube.com/vi/1RC7zeFKZfw/0.jpg)](https://youtu.be/1RC7zeFKZfw)


**Introduction**
hi team! this is just some starter code for our website it uses flask. I am currently on vs code and windows
so if you are using that this should help you get started.
 
**Getting Started**
ok so once you have pulled this code you are going to want to set up your virtual enviroment.
this tutorial should help - https://code.visualstudio.com/docs/python/tutorial-flask (this is for VS code)
if you are on another IDE I don't know. but esseitnally you are going to want to do
1. View > Command Palette or (Ctrl+Shift+P). Then select the Python: Create Environment command to create a virtual environment in your workspace. Select venv and then the Python environment you want to use to create it.
2. open your command prompt (Ctrl+Shift+`)
3. run this command .venv/bin/activate (run this if you are using powershell).venv\Scripts\Activate.ps1
4. Next run this command pip install -r requirements.txt
5. Set up your .env file and add these lines of code
SECRET_KEY='your key'
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD='MySQL password'
MYSQL_DB='DBProject'
6. Open your MySQL workbench and go to Server> startup/shutdown> (make sure your server says running)
7. run the following queries: 
CREATE DATABASE DBProject;
use DBProject;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255),
    email VARCHAR(100) NOT NULL UNIQUE
    roles VARCHAR(12)
);
Note - this is a dummy database just to make sure we have the right configs so when we do make our database we know its connected
8. Finally run this command python -m flask run
9. this should pop up just a login in screen with regersitering new accounts and if you register an account should see it pop up in your db (select * from users;) -query to see it

**Notes** 
Overall this is a starter dummy db once we get further into the project I will change this readme
