DROP DATABASE IF EXISTS Assignment_2;       
CREATE DATABASE IF NOT EXISTS Assignment_2 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE Assignment_2;

CREATE TABLE IF NOT EXISTS Staff(
Staff_ID INT NOT NULL AUTO_INCREMENT,
Staff_Email VARCHAR(255) NOT NULL,
Staff_Firstname VARCHAR(20) DEFAULT NULL,
Staff_Lastname VARCHAR (20) DEFAULT NULL,
PRIMARY KEY (Staff_ID),
UNIQUE (Staff_Email)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS Customers (
Customer_ID INT NOT NULL AUTO_INCREMENT,
Customer_Email VARCHAR(255) DEFAULT NULL,
Customer_Firstname VARCHAR(20) DEFAULT NULL,
Customer_Lastname VARCHAR (20) DEFAULT NULL,
Customer_House_No_Name VARCHAR (60) DEFAULT NULL,
Customer_Post_Code VARCHAR (20) DEFAULT NULL,
Customer_City VARCHAR(30) DEFAULT NULL,
PRIMARY KEY (Customer_ID),
UNIQUE (Customer_Email)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS Services (
Service_ID INT NOT NULL AUTO_INCREMENT, 
Service_Name VARCHAR (50) DEFAULT NULL,
Service_Description VARCHAR (255) DEFAULT NULL,
Service_Price DECIMAL (6,2) DEFAULT NULL,
PRIMARY KEY (Service_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `Order` (
Order_ID INT NOT NULL AUTO_INCREMENT,
Customer_ID INT(10) NOT NULL,
Staff_ID INT (10) NOT NULL,
Order_Date_Time DATETIME DEFAULT NULL,
PRIMARY KEY (Order_ID),
KEY (Customer_ID),
KEY (Staff_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

       
CREATE TABLE IF NOT EXISTS `Order_Details` (
Order_ID INT(10) NOT NULL,
Order_DetailsID INT(10) NOT NULL,
Customer_Email VARCHAR(255) DEFAULT NULL,
Customer_ID INT (10) NOT NULL,
Order_Date_Time DATETIME DEFAULT NULL,
Service_Name VARCHAR(255) DEFAULT NULL,
Service_Ordered_Price DECIMAL (6,2) DEFAULT NULL,
Discount DECIMAL(10,2) DEFAULT NULL,
Quantity INT DEFAULT NULL,
PRIMARY KEY (Order_ID),
KEY(Customer_ID),
KEY(Service_Name)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `Order`
ADD CONSTRAINT FOREIGN KEY (Customer_ID) REFERENCES `Customers` (Customer_ID),
ADD CONSTRAINT FOREIGN KEY (Staff_ID) REFERENCES `Staff` (Staff_ID);


ALTER TABLE `Order_Details` 
ADD CONSTRAINT FOREIGN KEY (Customer_Email) REFERENCES `Customers` (Customer_Email),
ADD CONSTRAINT FOREIGN KEY (Customer_ID) REFERENCES `Customers` (Customer_ID),
ADD CONSTRAINT FOREIGN KEY (Order_ID) REFERENCES `Order` (Order_ID);

ALTER TABLE `Order_Details`
DROP COLUMN Order_DetailsID;

INSERT INTO Staff (Staff_ID,Staff_Email,Staff_Firstname,Staff_Lastname) VALUES
(1,'D-Wilsom92@gmail.co.uk','Darcie','Wilson'),
(2,'M-Davis12@gmail.co.uk','Molly','Davis'),
(3,'K-Miller21@gmail.co.uk','Kye','Miller'),
(4,'E-Jones83@gmail.co.uk','Evelyn','Jones'),
(5,'T-More53@gmail.co.uk','Tina','Moore'),
(6,'C-Blaese73@gmail.co.uk','Christina','Blaese'),
(7,'E-Brown212@gmail.co.uk','Evie','Brown'),
(8,'P-Taylor53@gmail.co.uk','Penelope','Taylor'),
(9,'S-Williams48@gmail.co.uk','Salma','Williams'),
(10,'E-Johnson465@gmail.co.uk','Emmie','Johnson'),
(11,'M-Martin223@gmail.co.uk','Matthew','Martin'),
(12,'D-Robinson94@gmail.co.uk','Daniel','Robinson'),
(13,'J-Anderson47@gmail.co.uk','Joshua','Anderson'),
(14,'J-Thomas99@gmail.co.uk','Joseph','Thomas'),
(15,'J-Harris85@gmail.co.uk','James','Harris'),
(16,'M-White27@gmail.co.uk','Michael','White'),
(17,'W-Jackson09@gmail.co.uk','William','Jackson'),
(18,'C-Thompson74@gmail.co.uk','Christopher','Thompson'),
(19,'T-Garcia22@gmail.co.uk','Thomas','Garcia'),
(20,'D-Martinez21@gmail.co.uk','David','Martinez');

DROP TABLE IF EXISTS copy_of_Staff;
CREATE TABLE IF NOT EXISTS copy_of_Staff LIKE Staff;
INSERT INTO copy_of_Staff
SELECT * FROM Staff;

INSERT INTO Customers (Customer_ID,Customer_Email,Customer_Firstname,Customer_Lastname,Customer_House_No_Name,Customer_Post_Code,Customer_City) VALUES
(1,'d-snyder22@yahoo.com','Danielle ','Snyder','22','LN1 1HG','Lincoln'),
(2,'a-dunn65@btinternet.com','Amy','Dunn','56','M1 1PG ','Manchester'),
(3,'s-kelly63@gmail.com','Samantha','Kelley','23','BA1 1ME','Bath'),
(4,'a-bradley76@yahoo.com','Abigail','Bradley','56','BS1 1WD','Bristol'),
(5,'m-elliott44@btinternet.com','Melissa ','Elliott','54','CB1 1HF','Cambridge'),
(6,'o-cunningham23@googlemail.com','Olivia ','Cunningham','43','DH1 1GT','Durham'),
(7,'k-hunt00@yahoo.com','Katherine ','Hunt','15','M1 1DD','Manchester'),
(8,'c-wagner43@gmail.com','Caitlin','Wagner','Fairview','BA1 1DW','Bath'),
(9,'k-rice95@btinternet.com','Katie ','Rice','53','BS1 1HU','Bristol'),
(10,'v-dixon978@gmail.com','Victoria','Dixon','12','BA1 1VB','Bath'),
(11,'s-ferguson465@googlemail.co.uk','Stephanie','Ferguson','42','LN1 1JH','Lincoln'),
(12,'j-palmer65@gmail.com','Jennifer ','Palmer','435','CB1 1DA','Cambridge'),
(13,'j-ruiz145@yahoo.com','Jasmine','Ruiz','63','DH1 1FG','Durham'),
(14,'m-spencer789@btinternet.com','Molly','Spencer','Yew Tree Cottage','BA1 1DA','Bath'),
(15,'k-payen562@gmail.com','Kathryn ','Payne','32','M1 1HF','Manchester'),
(16,'a-warren897@gmail.co.uk','Anthony ','Warren','87','DH1 1AB','Durham'),
(17,'j-chavez312@yahoo.com','John ','Chavez','62','DH1 1AD','Durham'),
(18,'b-knight45@gmail.com','Bradley ','Knight','The Coach House','LN1 1NH','Lincoln'),
(19,'s-hart21@googlemail.com','Sean','Hart','34','BS1 1AV','Bristol'),
(20,'n-holmes415@googlemail.com','Nicholas ','Holmes','87','CB1 1BH','Cambridge'),
(21,'j-hawkins21@gmail.co.uk','Jonathan ','Hawkins',' The Lodge','M1 1AD','Manchester'),
(22,'a-grant159@gmail.co.uk','Andrew ','Grant','12','BA1 1DA','Bath'),
(23,'b-peters5268@googlemail.com','Brandon','Peters','541','LN1 1GH','Lincoln'),
(24,'l-rose145@gmail.com','Luke','Rose','56','M1 1HG','Manchester'),
(25,'richard-n245@yahoo.com','Richard ','Nichols','Rose Cottage','M1 1FS','Manchester'),
(26,'scott-daniels78@btinternet.com','Scott','Daniels','42','BS1 1AD','Bristol'),
(27,'e-gardner213@gmail.co.uk','Edward','Gardner','Woodside','LN1 1HG','Lincoln'),
(28,'n-mills84971@gmail.com','Nathaniel','Mills','66','BA1 1FD','Bath'),
(29,'t-weaver51422@btinternet.com','Tyler','Weaver','43','CB1 1JH','Cambridge'),
(30,'p-nichols123@yahoo.com','Peter ','Nichols','Meadow View','LN1 1SA','Lincoln'),
(31, "freddie561@btinternet.com","Freddie","Palmer","56","BS1 1GE",'Bristol'),
(32, "J-Peters099@gmail.com","James","Peters","21","BS1 1UI",'Bristol');

DELETE FROM Customers WHERE Customer_ID='31';

UPDATE Customers
SET Customer_Lastname = 'Anderson'
WHERE Customer_ID = 32;

DROP TABLE IF EXISTS copy_of_Customers;
CREATE TABLE IF NOT EXISTS copy_of_Customers LIKE Customers;
INSERT INTO copy_of_Customers
SELECT * FROM Customers;


INSERT INTO Services (Service_ID,Service_Name,Service_Description,Service_Price) VALUES
(1,'Internet and WiFi Service','Setting up and maintaining internet for one year', 50.00 ),
(2,'Crash Report Diagnosis','Diagnostics to why something in a computer system is crashing', 20.00 ),
(3,'Software Issues','Checking software for any issues', 20.00 ),
(4,'Data Recovery','Attempting to recover data from a broken hdd', 50.00 ),
(5,'Hardware Faults and Upgrades','Fixing any hardware faults in existing computer systems and then upgrading them', 50.00 ),
(6,'Bluescreens and Boot Fails','Attempting to fix a blue sceen or boot failure', 20.00 ),
(7,'Mobile and Handheld Repairs (Screen)','Fixing a computer monitor/screen', 79.00 ),
(8,'Mobile and Handheld Repairs (Keyboard)','Fixing a computers keyboard', 39.00 ),
(9,'Mobile and Handheld Repairs (Battery)','Fixing a laptops battery', 40.00 ),
(10,'Training and Tuition (p/ lesson)','Teaching basic computer system skills', 50.00 ),
(11,'Network Setups and Installations','Setting up a network for a business to use', 150.00 ),
(12,'Operating System Installation','Installing new operating systems on PCs', 40.00 ),
(13,'Virus Removal and Security','Removal of any viruses within a system and upgrading security if needed', 40.00 ),
(14,'Setup of New Computer','Setting up software required for the pc to run', 40.00 );

DROP TABLE IF EXISTS copy_of_Services;
CREATE TABLE IF NOT EXISTS copy_of_Services LIKE Services;
INSERT INTO copy_of_Services
SELECT * FROM Services;

INSERT INTO `Order` (Order_ID,Customer_ID,Staff_ID,Order_Date_Time) VALUES
(1,1,1,'2019-01-2 9:00:00'),
(2,2,5,'2019-01-2 10:00:00'),
(3,3,3,'2019-01-2 11:00:00'),
(4,4,6,'2019-01-2 12:00:00'),
(5,5,2,'2019-01-2 13:00:00'),
(6,6,3,'2019-01-2 14:00:00'),
(7,7,6,'2019-01-2 15:00:00'),
(8,8,5,'2019-01-3 12:00:00'),
(9,9,9,'2019-01-3 1-00:00'),
(10,10,10,'2019-01-3 13:00:00'),
(11,11,11,'2019-01-3 14:00:00'),
(12,12,4,'2019-01-4 10:00:00'),
(13,13,3,'2019-01-4 12:00:00'),
(14,14,6,'2019-01-5 13:00:00'),
(15,15,2,'2019-01-5 14:00:00'),
(16,16,2,'2019-01-5 15:00:00'),
(17,17,7,'2019-01-5 16:00:00'),
(18,18,8,'2019-01-6 10:00:00'),
(19,19,5,'2019-01-6 11:00:00'),
(20,20,19,'2019-01-6 12:00:00'),
(21,21,12,'2019-01-7 13:00:00'),
(22,22,16,'2019-01-7 15:00:00'),
(23,23,14,'2019-01-7 16:00:00'),
(24,24,12,'2019-01-7 17:00:00'),
(25,25,17,'2019-01-8 10:00:00'),
(26,26,19,'2019-01-8 11:00:00'),
(27,27,10,'2019-01-8 12:00:00'),
(28,28,20,'2019-01-8 13:00:00'),
(29,29,4,'2019-01-9 9:00:00'),
(30,30,18,'2019-01-9 12:00:00'),
(31,5,7,'2019-01-9 13:00:00'),
(32,21,4,'2019-01-10 10:00:00'),
(33,19,7,'2019-01-10 11:00:00'),
(34,13,15,'2019-01-10 12:00:00'),
(35,7,20,'2019-01-11 9:00:00'),
(36,29,17,'2019-01-11 11:00:00'),
(37,23,13,'2019-01-12 11:00:00'),
(38,9,17,'2019-01-13 13:00:00'),
(39,10,12,'2019-01-14 12:00:00'),
(40,11,1,'2019-01-14 15:00:00');

DROP TABLE IF EXISTS copy_of_Order;
CREATE TABLE IF NOT EXISTS copy_of_Order LIKE `Order`;
INSERT INTO copy_of_Order
SELECT * FROM `Order`;

INSERT INTO `Order_Details` (Order_ID,Customer_Email,Customer_ID,Order_Date_Time,Service_Name,Service_Ordered_Price,Discount,Quantity) VALUES
(1,'d-snyder22@yahoo.com',1,'2019-01-2 9:00:00','Internet and WiFi Service',45.00,10.0,1),
(2,'a-dunn65@btinternet.com',2,'2019-01-2 10:00:00','Crash Report Diagnosis', 20.00,0.0,1),
(3,'s-kelly63@gmail.com',3,'2019-01-2 11:00:00','Software Issues', 20.00,0.0,1),
(4,'a-bradley76@yahoo.com',4,'2019-01-2 12:00:00','Data Recovery', 50.00,0.0,1),
(5,'m-elliott44@btinternet.com',5,'2019-01-2 13:00:00','Hardware Faults and Upgrades', 50.00,0.0,1),
(6,'o-cunningham23@googlemail.com',6,'2019-01-2 14:00:00','Crash Report Diagnosis', 20.00,0.0,1),
(7,'k-hunt00@yahoo.com',7,'2019-01-2 15:00:00','Software Issues', 20.00,0.0,1),
(8,'c-wagner43@gmail.com',8,'2019-01-3 12:00:00','Mobile and Handheld Repairs (Screen)', 79.00,0.0,1),
(9,'k-rice95@btinternet.com',9,'2019-01-3 1-00:00','Network Setups and Installations', 150.00,0.0,1),
(10,'v-dixon978@gmail.com',10,'2019-01-3 13:00:00','Data Recovery', 50.00,0.0,1),
(11,'s-ferguson465@googlemail.co.uk',11,'2019-01-3 14:00:00','Crash Report Diagnosis', 20.00,0,1),
(12,'j-palmer65@gmail.com',12,'2019-01-4 10:00:00','Mobile and Handheld Repairs (Battery)', 40.00,0.0,1),
(13,'j-ruiz145@yahoo.com',13,'2019-01-4 12:00:00','Software Issues', 20.00,0.0,1),
(14,'m-spencer789@btinternet.com',14,'2019-01-5 13:00:00','Crash Report Diagnosis', 20.00,0.0,1),
(15,'k-payen562@gmail.com',15,'2019-01-5 14:00:00','Training and Tuition (p/ lesson)', 50.00,0.0,1),
(16,'a-warren897@gmail.co.uk',16,'2019-01-5 15:00:00','Mobile and Handheld Repairs (Keyboard)', 39.00 ,0.0,1),
(17,'j-chavez312@yahoo.com',17,'2019-01-5 16:00:00','Data Recovery', 50.00,0.0,1),
(18,'b-knight45@gmail.com',18,'2019-01-6 10:00:00','Software Issues', 20.00,0.0,1),
(19,'s-hart21@googlemail.com',19,'2019-01-6 11:00:00','Hardware Faults and Upgrades', 50.00,0.0,1),
(20,'n-holmes415@googlemail.com',20,'2019-01-6 12:00:00','Crash Report Diagnosis', 20.00,0.0,1),
(21,'j-hawkins21@gmail.co.uk',21,'2019-01-7 13:00:00','Bluescreens and Boot Fails', 15.00,25.0,1),
(22,'a-grant159@gmail.co.uk',22,'2019-01-7 15:00:00','Network Setups and Installations', 150.00,0.0,1),
(23,'b-peters5268@googlemail.com',23,'2019-01-7 16:00:00','Data Recovery', 50.00,0.0,1),
(24,'l-rose145@gmail.com',24,'2019-01-7 17:00:00','Operating System Installation', 40.00,0.0,1),
(25,'richard-n245@yahoo.com',25,'2019-01-8 10:00:00','Crash Report Diagnosis', 20.00,0.0,1),
(26,'scott-daniels78@btinternet.com',26,'2019-01-8 11:00:00','Mobile and Handheld Repairs (Keyboard)', 35.10 ,10.0,1),
(27,'e-gardner213@gmail.co.uk',27,'2019-01-8 12:00:00','Mobile and Handheld Repairs (Screen)', 79.00,0.0,1),
(28,'n-mills84971@gmail.com',28,'2019-01-8 13:00:00','Software Issues', 20.00,0.0,1),
(29,'t-weaver51422@btinternet.com',29,'2019-01-9 9:00:00','Internet and WiFi Service',100.00,0.0,2),
(30,'p-nichols123@yahoo.com',30,'2019-01-9 12:00:00','Data Recovery', 50.00,0.0,1),
(31,'m-elliott44@btinternet.com',5,'2019-01-9 13:00:00','Hardware Faults and Upgrades', 45.00,10.0,1),
(32,'j-hawkins21@gmail.co.uk',21,'2019-01-10 10:00:00','Software Issues', 20.00,0.0,1),
(33,'s-hart21@googlemail.com',19,'2019-01-10 11:00:00','Crash Report Diagnosis', 20.00,0.0,1),
(34,'j-ruiz145@yahoo.com',13,'2019-01-10 12:00:00','Mobile and Handheld Repairs (Battery)', 36.00,10.0,1),
(35,'k-hunt00@yahoo.com',7,'2019-01-11 9:00:00','Training and Tuition (p/ lesson)', 50.00,0.0,1),
(36,'t-weaver51422@btinternet.com',29,'2019-01-11 11:00:00','Mobile and Handheld Repairs (Screen)', 79.00,0.0,1),
(37,'b-peters5268@googlemail.com',23,'2019-01-12 11:00:00','Virus Removal and Security', 40.00,0.0,1),
(38,'k-rice95@btinternet.com',9,'2019-01-13 13:00:00','Setup of New Computer', 40.00,0.0,1),
(39,'v-dixon978@gmail.com',10,'2019-01-14 12:00:00','Bluescreens and Boot Fails', 20.00,0.0,1),
(40,'s-ferguson465@googlemail.co.uk',11,'2019-01-14 15:00:00','Crash Report Diagnosis', 18.00,10.0,1);

ALTER TABLE Order_Details ADD COLUMN Service_ID INT(10) DEFAULT NULL;

DROP TABLE IF EXISTS copy_of_Order_Details;
CREATE TABLE IF NOT EXISTS copy_of_Order_Details LIKE Order_Details;
INSERT INTO copy_of_Order_Details
SELECT * FROM Order_Details;

/*Query 1 2.2. The manager of LCS wishes to know details of customers who have placed a service request (order). Write ONE SQL statement to output data in response to this request. */

SELECT Customers.Customer_ID,Customers.Customer_Firstname,Customers.Customer_Lastname,Customers.Customer_Email,Customers.Customer_House_No_Name,Customers.Customer_Post_Code,Customers.Customer_City,Order.Order_ID
FROM Customers
RIGHT JOIN `Order` ON Customers.Customer_ID = Order.Customer_ID
ORDER BY Customers.Customer_Firstname;
/*Query 2 2.3. The manager also wishes to know all staff members, and any orders they might have allocated. Write ONE SQL statement to output data in response to this request. */
 
SELECT Staff.Staff_ID,Staff.Staff_Email,Staff.Staff_Firstname,Staff.Staff_Lastname, Order.Order_ID
FROM Staff
RIGHT JOIN `Order` ON Staff.Staff_ID = Order.Staff_ID
ORDER BY Staff.Staff_ID;

/*Query 3 2.4. The manager wishes to know all the customers and details of their orders.  */

SELECT Customers.Customer_ID,Customers.Customer_Firstname,Customers.Customer_Lastname,Customers.Customer_Email,Order_Details.Order_ID,Order_Details.Order_Date_Time,Order_Details.Service_Name,Order_Details.Service_Ordered_Price,Order_Details.Discount,Order_Details.Quantity
FROM Customers
RIGHT JOIN `Order_Details` ON Customers.Customer_ID = Order_Details.Customer_ID
ORDER BY Customers.Customer_ID;

/* Procedure to input a Service ID into the Order_Details table */
DROP PROCEDURE IF EXISTS UpdateServiceIDs;

DELIMITER //
CREATE PROCEDURE UpdateServiceIDs()
BEGIN
  DECLARE columnExists boolean;
  DECLARE detailId INT(10);
  DECLARE detailName VARCHAR(255);
  DECLARE serviceId INT(10);
  DECLARE amount_in_table INT(10);
  DECLARE loop_counter INT DEFAULT 0;
  SELECT COUNT(*) FROM Order_Details INTO amount_in_table;
  SELECT COUNT(*) > 0 INTO columnExists FROM information_schema.columns WHERE table_name = "Order_Details" AND column_name = "Service_ID";
  
  
 
  loop_label:  LOOP
        IF  loop_counter > amount_in_table THEN 
            LEAVE  loop_label;
        END  IF;
  
  SELECT Order_Id, Service_Name INTO detailId, detailName FROM Order_Details LIMIT 1 OFFSET loop_counter;
  Set loop_counter = loop_counter + 1;
  
  SELECT Service_Id INTO serviceId FROM Services WHERE Service_Name = detailName ;
  IF serviceId is NULL THEN
  UPDATE Order_details set Service_Name = concat (Service_Name, " (NOT FOUND)") WHERE order_id = detailId;
  ELSE
  UPDATE Order_Details SET Service_ID = serviceId WHERE Order_Id = detailId ;
  END IF;
  END LOOP;

END//
DELIMITER ;
CALL UpdateServiceIDs;

ALTER TABLE `Order_Details`
ADD CONSTRAINT FOREIGN KEY (`Service_ID`) REFERENCES `Services` (`Service_ID`);