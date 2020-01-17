
from flask import Flask, render_template,request,json
import pymysql.cursors
global data
# Connect to the database
connection = pymysql.connect(host='192.168.3.26',
                             port=3306,
                             user='tests4',
                             password='4NqGjgkZ',
                             db='tests4',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
app = Flask(__name__)

@app.route('/',methods=['POST', 'GET'])
def getAll():

    try:
     with connection.cursor() as cursor:
     # Read a single record
       sql = "SELECT * from hote"
       cursor.execute(sql)
       data=cursor.fetchall()
       cursor.close()
    finally:
     return render_template("index.html", taille = len(data), donnees=data)

@app.route("/machine/idMachine" , methods=['GET', 'POST'])
def getMachine():
    try:
     with connection.cursor() as connector:
     # Read a single record
       select = request.values.get("machine")
       sql = "SELECT * FROM hote where hote.idHote="+(str(select))
       connector.execute(sql)
       hostInfo=connector.fetchall()
       sql2 = "SELECT * FROM disque where disque.idHote="+(str(select))
       connector.execute(sql2)
       memoryUsage=connector.fetchall()
       sql3 = "SELECT * FROM typepartition inner join disque on disque.idDisque=typepartition.idDisque where disque.idHote="+(str(select))
       connector.execute(sql3)
       diskUsage=connector.fetchall()
       sql4 = "SELECT * FROM cpu where cpu.idHote="+(str(select))
       connector.execute(sql4)
       cpuUsage=connector.fetchall()

    finally:
     return render_template("select.html", host=hostInfo,memory=memoryUsage,disk=diskUsage,cpu=cpuUsage)# just to see what select is

if __name__ == "__main__":
    app.run()
