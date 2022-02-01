USE `mydb`;

CREATE USER IF NOT EXISTS 'APUser'@'localhost' IDENTIFIED BY 'P@ssword123';

GRANT SELECT, INSERT, DELETE, UPDATE(FirstName, LastName, Photo, PassHash, Email) ON `mydb`.`Account_`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(AccessLimit) ON `mydb`.`Admin`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`Customer`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT ON `mydb`.`Uses`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, UPDATE(Value_, CurrentState) ON `mydb`.`Transaction_`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`Name`, `Address`) ON `mydb`.`PaymentMethod`
	TO 'APUser'@'localhost';

GRANT SELECT ON `mydb`.`Cart`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`Comment`, `Rate`) ON `mydb`.`Review`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`Quantity`) ON `mydb`.`CartContainsProduct`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`PictureValue`) ON `mydb`.`Picture`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`VideoValue`) ON `mydb`.`Video`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`PurchaseAmount`
	TO 'APUser'@'localhost';
    
GRANT SELECT, INSERT, DELETE, UPDATE(`Name`, `Price`, `Brand`, `Description`, `CategoryID`, `SubCategoryID`) ON `mydb`.`Product`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`Name`) ON `mydb`.`Attribute`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`Att_String`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`Att_Qualitative`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`ID`, `Name`) ON `mydb`.`Quality`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`Start`, `Finish`) ON `mydb`.`Att_Numerical`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`Quantity`) ON `mydb`.`Stores`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`ProductHasAtt`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`Name`, `Description`) ON `mydb`.`Category`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`CategoryHasAtt`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`Name`, `Description`) ON `mydb`.`SubCategory`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`SubCategoryHasAtt`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`Storage`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`CanStore`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`IsComplete`, `CurrentState`, `AddressID`, `DiscountCodeID`) ON `mydb`.`Order_`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`CurrentState`, `DateDelivery`, `AddressID`) ON `mydb`.`SubOrder`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`WorksOrManages`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`Quantity`) ON `mydb`.`SubOrderHasProduct`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`City`, `Street`, `Floor`, `BuildingNumber`) ON `mydb`.`Address`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE ON `mydb`.`CustomerHasAddress`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`Code_`, `DateEnd`, `MaxDisAmount`, `MaxDisPercent`, `MaxUsage`) ON `mydb`.`DiscountCode`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, UPDATE(`Fee`, `DeliveryID`) ON `mydb`.`Transfer`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`CompanyName`, `VehicleTypeID`) ON `mydb`.`Delivery`
	TO 'APUser'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE(`VehicleTypeValue`) ON `mydb`.`VehicleType`
	TO 'APUser'@'localhost';

