import mysql.connector 
mydb = mysql.connector.connect( 
host = "localhost", 
user = "root", 
password = "pavan1", 
database = "medify"
) 

mycursor = mydb.cursor() 

mycursor.execute("SELECT DR_NAME FROM doctor WHERE DR_NAME = 'Dr. Dipesh Fataniya' ") 

result = mycursor.fetchall() 

for x in result:
  print(x)