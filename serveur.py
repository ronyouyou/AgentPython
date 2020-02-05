from flask import Flask, render_template,request,jsonify
import pymysql.cursors
# Connect to the database
connection = pymysql.connect(host='192.168.3.26',
                             port=3306,
                             user='tests4',
                             password='4NqGjgkZ',
                             db='tests4',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
app = Flask(__name__)
def select(sql):
  cursor = connection.cursor()
  cursor.execute(sql)
  temp = cursor.fetchall()
  return temp 

@app.route('/',methods=['POST', 'GET'])
def getAll():
  # Read a single record
  sql = "SELECT hote.idHote,hote.nom from hote"
  data = select(sql)
  return render_template("index.html", taille = len(data), listeMachines=data)
@app.route("/machine/<int:idMachine>/getInfos")
def getInfos(idMachine):
  metrics = {}
  sql2 = "SELECT * FROM disque where disque.idHote="+(str(idMachine))
  metrics['memoryUsage']=select(sql2)     
  sql3 = "SELECT * FROM typepartition inner join disque on disque.idDisque=typepartition.idDisque where disque.idHote="+(str(idMachine))
  metrics['diskUsage']=select(sql3)    
  sql4 = "SELECT * FROM cpu where cpu.idHote="+(str(idMachine))
  metrics['cpuUsage']=select(sql4)    
  return jsonify(metrics)
  
@app.route("/machine/<int:idMachine>" , methods=['GET', 'POST'])
def getMachine(idMachine):
  sql = "SELECT * FROM hote where hote.idHote="+(str(idMachine))
  hostInfo=select(sql)
  return render_template("select.html", host=hostInfo)# just to see what select is
if __name__ == "__main__":
    app.run(host='0.0.0.0')
