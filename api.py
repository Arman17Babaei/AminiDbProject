from flask import Flask, request, Response
from mysql.connector import connect, MySQLConnection
from mysql.connector.cursor import MySQLCursor

app = Flask(__name__)

db: MySQLConnection = connect(
    host="localhost",
    user="root",
    database="mydb",
    password="a",
    auth_plugin="mysql_native_password",
)
cursor: MySQLCursor = db.cursor()


def table_is_safe(table):
    return isinstance(table, str) and table in table_names


@app.route("/insert", methods=["GET"])
def insert():
    table = request.args.get("table")
    if not table_is_safe(table):
        return Response("Bad table name!", status=400)
    values = request.args.get("values").split(",")
    query = f"INSERT INTO {table} VALUES ({', '.join(['%s'] * len(values))})"
    print(query, values)
    cursor.execute(query, values)
    db.commit()
    return "Done!"


@app.route("/select", methods=["GET"])
def select():
    table = request.args.get("table")
    if not table_is_safe(table):
        return Response("Bad table name!", status=400)

    if "select" in request.args.keys():
        select = []
        for column in request.args.get("select").split(','):
            if column not in column_name:
                return Response(f"Bad column name `{column}`!", status=400)
            select.append(column)
    else:
        select = ['*']

    values = []
    columns = []
    for column in request.args.keys():
        if column in ["table", "select"]:
            continue
        if column in column_name:
            columns.append(column)
            values.append(request.args.get(column))
        else:
            return Response(f"Bad column name `{column}`!", status=400)

    query = f"SELECT {','.join(select)} FROM {table} "
    if len(columns) > 0:
        query += f"WHERE {' AND '.join([f'{column} = %s' for column in columns])}"

    cursor.execute(query, values)
    result = cursor.fetchall()
    table = get_html_table(result, select)
    return table


def get_html_table(result, select):
    table = f"""
        <!DOCTYPE html>
        <html>
        <style>
        table, th, td {{
        border:1px solid black;
        }}
        </style>
        <body>

        <table style="width:100%">
        <tr>
            {''.join([f"<th>{column}</th>" for column in select])}
        </tr>
        {''.join(['<tr>' + ''.join([f'<td>{value}</td>' for value in row]) + '</tr>' for row in result])}
        </table>
        </body>
        </html>"""
    return table


column_name = [
    "AccountID",
    "FirstName",
    "LastName",
    "DateCreate",
    "Photo",
    "PassHash",
    "Email",
    "AddressID",
    "City",
    "Street",
    "Floor",
    "BuildingNumber",
    "AccountID",
    "AccessLimit",
    "AttributeID",
    "Start",
    "Finish",
    "AttributeID",
    "AttributeID",
    "Name",
    "DateCreate",
    "AttributeID",
    "StorageID",
    "CategoryID",
    "SubCategoryID",
    "CustomerID",
    "DateLastEdit",
    "CartID",
    "ProductID",
    "Quantity",
    "CategoryID",
    "Name",
    "Description",
    "DateCreate",
    "AttributeID",
    "CategoryID",
    "AttributeNumValue",
    "AttributeQualValue",
    "AccountID",
    "CustomerID",
    "AddressID",
    "DeliveryID",
    "CompanyName",
    "DateAdded",
    "VehicleTypeID",
    "DiscountID",
    "Code_",
    "DateCreate",
    "DateEnd",
    "MaxDisAmount",
    "MaxDisPercent",
    "MaxUsage",
    "CurrentUsageCount",
    "AdminID",
    "OrderID",
    "IsComplete",
    "DateCreate",
    "CurrentState",
    "FullDeliveryFee",
    "AddressID",
    "CustomerID",
    "DiscountCodeID",
    "PaymentMethodID",
    "Name",
    "Address",
    "ProductID",
    "ID",
    "PictureValue",
    "ProductID",
    "Name",
    "Price",
    "Brand",
    "Description",
    "DateCreate",
    "TotalPurchases",
    "Quantity",
    "CategoryID",
    "SubCategoryID",
    "AttributeID",
    "ProductID",
    "AttributeNumValue",
    "AttributeQualValue",
    "ProductID",
    "PusrchaseAmountValue",
    "AttQualitativeID",
    "ID",
    "Name",
    "ProductID",
    "CustomerID",
    "Date",
    "Comment",
    "Rate",
    "StorageID",
    "DateAddition",
    "AddressID",
    "StorageID",
    "ProductID",
    "Quantity",
    "CategoryID",
    "SubCategoryID",
    "Name",
    "Description",
    "DateCreate",
    "AttributeID",
    "CategoryID",
    "SubCategoryID",
    "AttributeNumValue",
    "AttributeQualValue",
    "OrderID",
    "SubOrderID",
    "CurrentState",
    "DateDelivery",
    "DateCreate",
    "DateLastEdit",
    "StorageID",
    "AddressID",
    "ProductID",
    "OrderID",
    "SubOrderID",
    "Quantity",
    "TransactionID",
    "Value_",
    "CurrentState",
    "Date",
    "AccountID",
    "PaymentMethodID",
    "TransferID",
    "Fee",
    "Date",
    "DeliveryID",
    "FromStorageID",
    "ToAddressID",
    "OrderID",
    "SubOrderID",
    "CustomerID",
    "DiscountCodeID",
    "DeliveryID",
    "VehicleTypeValue",
    "ProductID",
    "ID",
    "VideoValue",
    "StorageID",
    "AdminID",
]


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


if __name__ == "__main__":
    app.run(debug=True, port=8080)
