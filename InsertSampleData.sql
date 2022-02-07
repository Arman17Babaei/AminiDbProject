USE `mydb`;

INSERT INTO Account_ VALUES (1, 'Admin', 'Admin', SYSDATE(), NULL, 0, 'admin@gmail.com');
INSERT INTO Account_ VALUES	(2, 'Navid', 'Eslami', SYSDATE(), NULL, 0, 'n3slami@gmail.com');
INSERT INTO `Admin` VALUES (1, 3);
INSERT INTO `Customer` VALUES (2);

INSERT INTO Category VALUES (1, 'Fruits', 'Healthy ma dude!', SYSDATE());
INSERT INTO SubCategory VALUES (1, 1, 'Zard', 'Hm?', SYSDATE());
INSERT INTO Product VALUES (1, 'Moz', 10, 'Bayati Co.', 'Bayati?', SYSDATE(), 0, 0, 1, 1);

INSERT INTO Attribute VALUES (1, 'Khoshmaze', SYSDATE()),
							 (2, 'Tool', SYSDATE()),
							 (3, 'Mizan Zardi', SYSDATE());
INSERT INTO Att_String VALUES (1);
INSERT INTO Att_Numerical VALUES (2, 0.0, 10.0);
INSERT INTO Att_Qualitative VALUES (3);
INSERT INTO Quality VALUES (3, 1, 'Kam'), (3, 2, 'Motevasset'), (3, 3, 'Ziad');

INSERT INTO Address VALUES (1, 'Tehran', 'Sabounchi', 1, 7), (2, 'Tehran', 'Khorram-shahr', -1, 2);
INSERT INTO CustomerHasAddress VALUES (2, 1);
INSERT INTO `Storage` VALUES (1, SYSDATE(), 2);

INSERT INTO ProductHasAtt VALUES (3, 1, 9, 2);
INSERT INTO SubCategoryHasAtt VALUES (3, 1, 1, 900, 1);

INSERT INTO CanStore VALUES (1, 1, 1);
INSERT INTO Stores VALUES (1, 1, 10);

INSERT INTO PaymentMethod VALUES (1, 'Capitalism Co.', 'copium.it');
INSERT INTO Transaction_ VALUES (1, 10, 1, SYSDATE(), 1, 1);

INSERT INTO CartContainsProduct VALUES (2, 1, 5);
INSERT INTO Review VALUES (1, 2, SYSDATE(), 'Chera bayatie?!', 99);

INSERT INTO Delivery VALUES (1, 'Hammal Co.', SYSDATE(), 1);
INSERT INTO VehicleType VALUES (1, 'Truck');

INSERT INTO WorksOrManages VALUES (1, 1);

INSERT INTO DiscountCode VALUES (1, 'AsGhAr', SYSDATE(), '2023-01-01 00:00:00', 10, 10, 1, 0, 1);
INSERT INTO Uses VALUES (2, 1);

INSERT INTO DiscountCode VALUES (2, 'AkbAr', SYSDATE(), SYSDATE(), 10, 10, 1, 0, 1);
INSERT INTO Uses VALUES (2, 2);

INSERT INTO Order_ VALUES (1, 0, SYSDATE(), 3, 0, 1, 2, 1);

INSERT INTO Order_ VALUES (2, 0, SYSDATE(), 3, 0, 1, 2, 2);