import mysql.connector

def run(script):
	mydb = mysql.connector.connect(
			host="localhost",
			user="root",
			)
	print(script)
	with open(script, 'r') as f:
		mydb.cursor().execute(f.read(), multi=True)
		mydb.commit()

if __name__ == "__main__":
	from sys import argv

	run(argv[1])
