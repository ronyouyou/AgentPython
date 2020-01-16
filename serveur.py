
from flask import Flask, render_template,request,json
import pymysql.cursors

# Connect to the database
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='',
                             db='utilisateurs',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
app = Flask(__name__)

@app.route('/',methods=['POST', 'GET'])
def signUp():
    global data
    try:
     with connection.cursor() as cursor:
     # Read a single record
       sql = "SELECT * from users"
       cursor.execute(sql)
       data=cursor.fetchall()
    finally:
     return render_template("index.html", taille = len(data), donnees=data)

@app.route("/test" , methods=['GET', 'POST'])
def test():
    global data
    select = request.form.get('user')
    try:
     with connection.cursor() as connector:
     # Read a single record
       sql = "SELECT * from users where iduser=1"
       connector.execute(sql)
       data=connector.fetchall()
    finally:
     return render_template("select.html", donnees=data)# just to see what select is

if __name__ == "__main__":
    app.run()
