USE `mydb`;

DROP TRIGGER IF EXISTS `mydb`.trig_make_cart;
CREATE TRIGGER trig_make_cart AFTER INSERT ON Customer
	FOR EACH ROW INSERT INTO `mydb`.`Cart` VALUES (NEW.AccountID, SYSDATE());
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_account;
CREATE TRIGGER trig_insert_account BEFORE INSERT ON Account_
	FOR EACH ROW SET NEW.DateCreate = SYSDATE();
    
DROP TRIGGER IF EXISTS `mydb`.trig_update_account;
DELIMITER //
CREATE TRIGGER trig_update_account AFTER UPDATE ON Account_
	FOR EACH ROW 
	BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE Account_ SET DateCreate = OLD.DateCreate WHERE AccountID = NEW.AccountID;
		END IF;
	END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_attribute;
CREATE TRIGGER trig_insert_attribute BEFORE INSERT ON Attribute
	FOR EACH ROW SET NEW.DateCreate = SYSDATE();

DROP TRIGGER IF EXISTS `mydb`.trig_update_attribute;
DELIMITER //
CREATE TRIGGER trig_update_attribute AFTER UPDATE ON Attribute
	FOR EACH ROW 
	BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE Attribute SET DateCreate = OLD.DateCreate WHERE AttributeID = NEW.AttributeID;
		END IF;
	END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_update_cart;
CREATE TRIGGER trig_update_cart BEFORE UPDATE ON Cart
	FOR EACH ROW SET NEW.DateLastEdit = SYSDATE();

DROP TRIGGER IF EXISTS `mydb`.trig_update_cart_from_contents_insert;
CREATE TRIGGER trig_update_cart_from_contents_insert AFTER INSERT ON CartContainsProduct
	FOR EACH ROW UPDATE Cart SET DateLastEdit = SYSDATE() WHERE CustomerID = NEW.CartID;

DROP TRIGGER IF EXISTS `mydb`.trig_update_cart_from_contents_delete;
CREATE TRIGGER trig_update_cart_from_contents_delete AFTER DELETE ON CartContainsProduct
	FOR EACH ROW UPDATE Cart SET DateLastEdit = SYSDATE() WHERE CustomerID = OLD.CartID;

DROP TRIGGER IF EXISTS `mydb`.trig_update_cart_from_contents_update;
CREATE TRIGGER trig_update_cart_from_contents_update AFTER UPDATE ON CartContainsProduct
	FOR EACH ROW UPDATE Cart SET DateLastEdit = SYSDATE() WHERE CustomerID = NEW.CartID;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_category;
CREATE TRIGGER trig_insert_category BEFORE INSERT ON Category
	FOR EACH ROW SET NEW.DateCreate = SYSDATE();

DROP TRIGGER IF EXISTS `mydb`.trig_update_category;
DELIMITER //
CREATE TRIGGER trig_update_category AFTER UPDATE ON Category
	FOR EACH ROW 
	BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE Category SET DateCreate = OLD.DateCreate WHERE CategoryID = NEW.CategoryID;
		END IF;
	END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_delivery;
CREATE TRIGGER trig_insert_delivery BEFORE INSERT ON Delivery
	FOR EACH ROW SET NEW.DateAdded = SYSDATE();

DROP TRIGGER IF EXISTS `mydb`.trig_update_delivery;
DELIMITER //
CREATE TRIGGER trig_update_delivery AFTER UPDATE ON Delivery
	FOR EACH ROW 
	BEGIN
		IF (NEW.DateAdded != OLD.DateAdded) THEN
			UPDATE Delivery SET DateAdded = OLD.DateAdded WHERE DeliveryID = NEW.DeliveryID;
		END IF;
	END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_discount_code;
DELIMITER //
CREATE TRIGGER trig_insert_discount_code BEFORE INSERT ON DiscountCode
	FOR EACH ROW
    BEGIN
		IF (EXISTS (SELECT * FROM DiscountCode WHERE Code_ = NEW.Code_ AND SYSDATE() <= DateEnd)) THEN
			SIGNAL SQLSTATE '45006'
					SET MESSAGE_TEXT = 'Cannot create discount code, duplicate code.';
        END IF;
		SET NEW.DateCreate = SYSDATE();
	END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_update_discount_code;
DELIMITER //
CREATE TRIGGER trig_update_discount_code AFTER UPDATE ON DiscountCode
	FOR EACH ROW 
	BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE DiscountCode SET DateCreate = OLD.DateCreate WHERE DiscountID = NEW.DiscountID;
		END IF;
        IF ((SELECT COUNT(*) FROM DiscountCode WHERE Code_ = NEW.Code_ AND SYSDATE() <= DateEnd) > 1) THEN
			SIGNAL SQLSTATE '45006'
					SET MESSAGE_TEXT = 'Cannot create discount code, duplicate code.';
        END IF;
	END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_order;
CREATE TRIGGER trig_insert_order BEFORE INSERT ON Order_
	FOR EACH ROW SET NEW.DateCreate = SYSDATE();

DROP TRIGGER IF EXISTS `mydb`.trig_update_order;
DELIMITER //
CREATE TRIGGER trig_update_order AFTER UPDATE ON Order_
	FOR EACH ROW 
	BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE Order_ SET DateCreate = OLD.DateCreate WHERE OrderID = NEW.OrderID;
		END IF;
	END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_product;
CREATE TRIGGER trig_insert_product BEFORE INSERT ON Product
	FOR EACH ROW SET NEW.DateCreate = SYSDATE();

DROP TRIGGER IF EXISTS `mydb`.trig_update_product;
DELIMITER //
CREATE TRIGGER trig_update_product AFTER UPDATE ON Product
	FOR EACH ROW 
	BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE Product SET DateCreate = OLD.DateCreate WHERE ProductID = NEW.ProductID;
		END IF;
	END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_review;
CREATE TRIGGER trig_insert_review BEFORE INSERT ON Review
	FOR EACH ROW SET NEW.`Date` = SYSDATE();
    
DROP TRIGGER IF EXISTS `mydb`.trig_update_review;
CREATE TRIGGER trig_update_review BEFORE UPDATE ON Review
	FOR EACH ROW SET NEW.`Date` = SYSDATE();
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_storage;
CREATE TRIGGER trig_insert_storage BEFORE INSERT ON `Storage`
	FOR EACH ROW SET NEW.DateAddition = SYSDATE();

DROP TRIGGER IF EXISTS `mydb`.trig_update_storage;
DELIMITER //
CREATE TRIGGER trig_update_storage AFTER UPDATE ON `Storage`
	FOR EACH ROW 
	BEGIN
		IF (NEW.DateAddition != OLD.DateAddition) THEN
			UPDATE `Storage` SET DateAddition = OLD.DateAddition WHERE StorageID = NEW.StorageID;
		END IF;
	END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_subcategory;
CREATE TRIGGER trig_insert_subcategory BEFORE INSERT ON SubCategory
	FOR EACH ROW SET NEW.DateCreate = SYSDATE();

DROP TRIGGER IF EXISTS `mydb`.trig_update_subcategory;
DELIMITER //
CREATE TRIGGER trig_update_subcategory BEFORE UPDATE ON SubCategory
	FOR EACH ROW 
	BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			SET NEW.DateCreate = OLD.DateCreate;
		END IF;
	END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_suborder;
DELIMITER //
CREATE TRIGGER trig_insert_suborder BEFORE INSERT ON SubOrder
	FOR EACH ROW BEGIN
		SET NEW.DateCreate = SYSDATE();
        SET NEW.DateLastEdit = SYSDATE();
	END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_update_suborder;
DELIMITER //
CREATE TRIGGER trig_update_suborder BEFORE UPDATE ON SubOrder
	FOR EACH ROW 
	BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			SET NEW.DateCreate = OLD.DateCreate;
		END IF;
        SET NEW.DateLastEdit = SYSDATE();
	END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_transaction;
CREATE TRIGGER trig_insert_transaction BEFORE INSERT ON Transaction_
	FOR EACH ROW SET NEW.`Date` = SYSDATE();
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_insert_transfer;
CREATE TRIGGER trig_insert_transfer BEFORE INSERT ON Transfer
	FOR EACH ROW SET NEW.`Date` = SYSDATE();
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_handle_dicount_usage_count_insert;
DROP TRIGGER IF EXISTS `mydb`.trig_handle_discount_usage_count_insert;
DELIMITER //
CREATE TRIGGER trig_handle_discount_usage_count_insert AFTER INSERT ON Order_
	FOR EACH ROW 
    BEGIN
		IF (NEW.DiscountCodeID IS NOT NULL) THEN
			IF ((SELECT MaxUsage FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID) = 
					(SELECT CurrentUsageCount FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID)) THEN
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'Max usage of discount code reached, cannot use code.';
			ELSE 
				UPDATE DiscountCode SET CurrentUsageCount = CurrentUsageCount + 1 WHERE DiscountID = NEW.DiscountCodeID;
			END IF;
        END IF;
    END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_handle_dicount_usage_count_update;
DROP TRIGGER IF EXISTS `mydb`.trig_handle_discount_usage_count_update;
DELIMITER //
CREATE TRIGGER trig_handle_discount_usage_count_update AFTER UPDATE ON Order_
	FOR EACH ROW 
    BEGIN
		IF (OLD.DiscountCodeID IS NOT NULL) THEN
			UPDATE DiscountCode SET CurrentUsageCount = CurrentUsageCount - 1 WHERE DiscountID = OLD.DiscountCodeID;
        END IF;
        IF (NEW.DiscountCodeID IS NOT NULL) THEN
			IF ((SELECT MaxUsage FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID) = 
					(SELECT CurrentUsageCount FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID)) THEN
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'Max usage of discount code reached, cannot use code.';
			ELSE 
				UPDATE DiscountCode SET CurrentUsageCount = CurrentUsageCount + 1 WHERE DiscountID = NEW.DiscountCodeID;
			END IF;
        END IF;
    END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_handle_full_delivery_fee_insert;
DELIMITER //
CREATE TRIGGER trig_handle_full_delivery_fee_insert AFTER INSERT ON Transfer
	FOR EACH ROW 
    BEGIN
		IF (NEW.OrderID IS NOT NULL) THEN
			UPDATE Order_ SET FullDeliveryFee = FullDeliveryFee + NEW.Fee WHERE OrderID = NEW.OrderID;
        END IF;
    END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_handle_full_delivery_fee_update;
DELIMITER //
CREATE TRIGGER trig_handle_full_delivery_fee_update AFTER UPDATE ON Transfer
	FOR EACH ROW 
    BEGIN
		IF (OLD.OrderID IS NOT NULL) THEN
			UPDATE Order_ SET FullDeliveryFee = FullDeliveryFee - OLD.Fee WHERE OrderID = OLD.OrderID;
        END IF;
		IF (NEW.OrderID IS NOT NULL) THEN
			UPDATE Order_ SET FullDeliveryFee = FullDeliveryFee + NEW.Fee WHERE OrderID = NEW.OrderID;
        END IF;
    END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_handle_product_total_purchases_insert;
DELIMITER //
CREATE TRIGGER trig_handle_product_total_purchases_insert AFTER INSERT ON SubOrderHasProduct
	FOR EACH ROW 
    BEGIN
		IF ((SELECT CurrentState FROM SubOrder WHERE OrderID = NEW.OrderID AND SubOrderID = NEW.SubOrderID) = 1) THEN
			UPDATE Product SET TotalPurchases = TotalPurchases + NEW.Quantity WHERE ProductID = NEW.ProductID;
        END IF;
    END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_handle_product_total_purchases_update;
DELIMITER //
CREATE TRIGGER trig_handle_product_total_purchases_update AFTER UPDATE ON SubOrderHasProduct
	FOR EACH ROW 
    BEGIN
		IF ((SELECT CurrentState FROM SubOrder WHERE OrderID = OLD.OrderID AND SubOrderID = OLD.SubOrderID) = 1) THEN
			UPDATE Product SET TotalPurchases = TotalPurchases - OLD.Quantity WHERE ProductID = OLD.ProductID;
        END IF;
		IF ((SELECT CurrentState FROM SubOrder WHERE OrderID = NEW.OrderID AND SubOrderID = NEW.SubOrderID) = 1) THEN
			UPDATE Product SET TotalPurchases = TotalPurchases + NEW.Quantity WHERE ProductID = NEW.ProductID;
        END IF;
    END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_handle_product_total_purchases_update_of_suborder;
DELIMITER //
CREATE TRIGGER trig_handle_product_total_purchases_update_of_suborder AFTER UPDATE ON SubOrder
	FOR EACH ROW 
    BEGIN
		IF (NEW.CurrentState = 1) THEN
			SET SQL_SAFE_UPDATES = 0;
			UPDATE Product SET TotalPurchases = TotalPurchases + 
				(SELECT SUM(Quantity) FROM SubOrderHasProduct WHERE ProductID = Product.ProductID 
					AND OrderID = NEW.OrderID AND SubOrderID = NEW.SubOrderID);
			SET SQL_SAFE_UPDATES = 1;
        END IF;
    END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_handle_product_quantity_insert;
CREATE TRIGGER trig_handle_product_quantity_insert AFTER INSERT ON Stores
	FOR EACH ROW 
		UPDATE Product SET Quantity = Quantity + NEW.Quantity WHERE ProductID = NEW.ProductID;

DROP TRIGGER IF EXISTS `mydb`.trig_handle_product_quantity_update;
DELIMITER //
CREATE TRIGGER trig_handle_product_quantity_update AFTER UPDATE ON Stores
	FOR EACH ROW 
    BEGIN
		UPDATE Product SET Quantity = Quantity - OLD.Quantity WHERE ProductID = OLD.ProductID;
		UPDATE Product SET Quantity = Quantity + NEW.Quantity WHERE ProductID = NEW.ProductID;
    END;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_handle_cart_contains_product_quantity_insert;
DELIMITER //
CREATE TRIGGER trig_handle_cart_contains_product_quantity_insert AFTER INSERT ON CartContainsProduct
	FOR EACH ROW 
		IF ((SELECT Quantity FROM Product WHERE ProductID = NEW.ProductID) < NEW.Quantity) THEN
			SIGNAL SQLSTATE '45001'
				SET MESSAGE_TEXT = 'Cannot add to cart, insufficient quantity of product.';
		END IF;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_handle_cart_contains_product_quantity_update;
DELIMITER //
CREATE TRIGGER trig_handle_cart_contains_product_quantity_update AFTER UPDATE ON CartContainsProduct
	FOR EACH ROW 
		IF ((SELECT Quantity FROM Product WHERE ProductID = NEW.ProductID) < NEW.Quantity) THEN
			SIGNAL SQLSTATE '45002'
				SET MESSAGE_TEXT = 'Cannot update cart, insufficient quantity of product.';
		END IF;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_handle_valid_discount_code_usage_insert;
DELIMITER //
CREATE TRIGGER trig_handle_valid_discount_code_usage_insert AFTER INSERT ON Order_
	FOR EACH ROW 
		IF ((NEW.DiscountCodeID IS NOT NULL)
			AND NOT EXISTS (SELECT * FROM Uses WHERE CustomerID = NEW.CustomerID AND DiscountCodeID = NEW.DiscountCodeID
				AND SYSDATE() <= (SELECT DateEnd FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID))) THEN
			SIGNAL SQLSTATE '45003'
				SET MESSAGE_TEXT = 'Customer cannot use discount code, no permission.';
		END IF;
//
DELIMITER ;
	
DROP TRIGGER IF EXISTS `mydb`.trig_handle_valid_discount_code_usage_update;
DELIMITER //
CREATE TRIGGER trig_handle_valid_discount_code_usage_update AFTER UPDATE ON Order_
	FOR EACH ROW 
		IF ((NEW.DiscountCodeID IS NOT NULL)
			AND NOT EXISTS (SELECT * FROM Uses WHERE CustomerID = NEW.CustomerID AND DiscountCodeID = NEW.DiscountCodeID
				AND SYSDATE() <= (SELECT DateEnd FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID))) THEN
			SIGNAL SQLSTATE '45003'
				SET MESSAGE_TEXT = 'Customer cannot use new discount code, no permission.';
		END IF;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_handle_order_is_complete_and_state_insert;
DELIMITER //
CREATE TRIGGER trig_handle_order_is_complete_and_state_insert AFTER INSERT ON SubOrder
	FOR EACH ROW 
		IF (NOT EXISTS (SELECT * FROM SubOrder WHERE OrderID = NEW.OrderID AND SubOrderID = NEW.SubOrderID AND CurrentState != 1)) THEN
			UPDATE Order_ SET IsComplete = 1 WHERE OrderID = NEW.OrderID;
            UPDATE Order_ SET CurrentState = 1 WHERE OrderID = NEW.OrderID;
		END IF;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_handle_order_is_complete_and_state_update;
DELIMITER //
CREATE TRIGGER trig_handle_order_is_complete_and_state_update AFTER UPDATE ON SubOrder
	FOR EACH ROW 
		IF (NOT EXISTS (SELECT * FROM SubOrder WHERE OrderID = NEW.OrderID AND SubOrderID = NEW.SubOrderID AND CurrentState != 1)) THEN
			UPDATE Order_ SET IsComplete = 1 WHERE OrderID = NEW.OrderID;
            UPDATE Order_ SET CurrentState = 1 WHERE OrderID = NEW.OrderID;
		END IF;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_handle_auto_partial_key_video;
CREATE TRIGGER trig_handle_auto_partial_key_video BEFORE INSERT ON Video
	FOR EACH ROW 
		SET NEW.ID = (SELECT COUNT(*) FROM Video WHERE ProductID = NEW.ProductID) + 1;

DROP TRIGGER IF EXISTS `mydb`.trig_handle_auto_partial_key_picture;
CREATE TRIGGER trig_handle_auto_partial_key_picture BEFORE INSERT ON Picture
	FOR EACH ROW 
		SET NEW.ID = (SELECT COUNT(*) FROM Picture WHERE ProductID = NEW.ProductID) + 1;

DROP TRIGGER IF EXISTS `mydb`.trig_handle_auto_partial_key_suborder;
CREATE TRIGGER trig_handle_auto_partial_key_suborder BEFORE INSERT ON SubOrder
	FOR EACH ROW 
		SET NEW.SubOrderID = (SELECT COUNT(*) FROM SubOrder WHERE OrderID = NEW.OrderID) + 1;

DROP TRIGGER IF EXISTS `mydb`.trig_handle_auto_partial_key_subcategory;
CREATE TRIGGER trig_handle_auto_partial_key_subcategory BEFORE INSERT ON SubCategory
	FOR EACH ROW 
		SET NEW.SubCategoryID = (SELECT COUNT(*) FROM SubCategory WHERE CategoryID = NEW.CategoryID) + 1;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_handle_valid_storage_insert;
DELIMITER //
CREATE TRIGGER trig_handle_valid_storage_insert AFTER INSERT ON Stores
	FOR EACH ROW 
		IF (NOT EXISTS (SELECT * FROM CanStore WHERE StorageID = NEW.StorageID
				AND SubCategoryID = (SELECT SubCategoryID FROM Product WHERE ProductID = NEW.ProductID))) THEN
			SIGNAL SQLSTATE '45004'
				SET MESSAGE_TEXT = 'Storage cannot store this product.';
		END IF;
//
DELIMITER ;
-- -----------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS `mydb`.trig_product_handle_attribute_value_insert;
DELIMITER //
CREATE TRIGGER trig_product_handle_attribute_value_insert BEFORE INSERT ON ProductHasAtt
	FOR EACH ROW 
	BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_category_handle_attribute_value_insert;
DELIMITER //
CREATE TRIGGER trig_category_handle_attribute_value_insert BEFORE INSERT ON CategoryHasAtt
	FOR EACH ROW 
	BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_subcategory_handle_attribute_value_insert;
DELIMITER //
CREATE TRIGGER trig_subcategory_handle_attribute_value_insert BEFORE INSERT ON SubCategoryHasAtt
	FOR EACH ROW 
	BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_product_handle_attribute_value_update;
DELIMITER //
CREATE TRIGGER trig_product_handle_attribute_value_update BEFORE UPDATE ON ProductHasAtt
	FOR EACH ROW 
	BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_category_handle_attribute_value_update;
DELIMITER //
CREATE TRIGGER trig_category_handle_attribute_value_update BEFORE UPDATE ON CategoryHasAtt
	FOR EACH ROW 
	BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS `mydb`.trig_subcategory_handle_attribute_value_update;
DELIMITER //
CREATE TRIGGER trig_subcategory_handle_attribute_value_update BEFORE UPDATE ON SubCategoryHasAtt
	FOR EACH ROW 
	BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END;
//
DELIMITER ;



