from flask import Flask, request, Response
from mysql.connector import connect

app = Flask(__name__)

db = connect(host="localhost", user="root", database="mydb")
cursor = db.cursor()

table_names = [
"Account_",
"Address",
"Admin",
"Att_Numerical",
"Att_Qualitative",
"Attribute",
"Att_String",
"CanStore",
"Cart",
"CartContainsProduct",
"Category",
"CategoryHasAtt",
"Customer",
"CustomerHasAddress",
"Delivery",
"DiscountCode",
"Order_",
"PaymentMethod",
"Picture",
"Product",
"ProductHasAtt",
"PurchaseAmount",
"Quality",
"Review",
"Storage",
"Stores",
"SubCategory",
"SubCategoryHasAtt",
"SubOrder",
"SubOrderHasProduct",
"Transaction_",
"Transfer",
"Uses",
"VehicleType",
"Video",
"WorksOrManages",
]

def table_is_safe(table):
	return isinstance(table, str) and table in table_names

@app.route('/insert', methods=['GET'])
def result():
	table = request.args.get('table')
	if not table_is_safe(table):
		return Response("Bad table name!", status=400)
	values = request.args.get('values').split(",")
	query = f"INSERT INTO {table} VALUES ({', '.join(['%s'] * len(values))})"
	print(query, values)
	cursor.execute(query, values)
	return 'Done!'

if __name__ == "__main__":
	app.run(debug=True, port=8080)
