--
-- File generated with SQLiteStudio v3.2.1 on Mon Nov 30 15:03:27 2020
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ACCOUNT
CREATE TABLE ACCOUNT (Account_number INT NOT NULL, Username VARCHAR (15) NOT NULL, Street CHAR (30) NOT NULL, ZipCode CHAR (5) NOT NULL, Karma_points INT, Phone_number CHAR (10) NOT NULL, FName VARCHAR (30) NOT NULL, LName VARCHAR (30) NOT NULL, PRIMARY KEY (Account_number));
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (1, 'kadiewheatley@gmail.com', '40 Fremont Street', '39180', 18, '939-261-5642', 'Kadie', 'Wheatley');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (2, 'fredschmitt@gmail.com', '7676 Halifax St.',  '60156', 98, '760-397-7044', 'Fred' , 'Schmitt');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (3, 'eilishnava@gmail.com', '9120 Glenridge Lane', '23803', 13, '773-320-6658', 'Eilish', 'Nava');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (4, 'mikeyhsingleton@gmail.com', '2 Heritage Street',  '01906', 78, '419-689-3490', 'Mikeyh', 'Singleton');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (5, 'lesliecalvert@gmail.com', '337 Colonial Rd.', '06360', 90, '620-247-9090', 'Leslie', 'Calvert');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (6, 'rhiannehines@gmail.com', '9463 University Lane',  '55378', 14, '601-799-2240', 'Rhianne', 'Hines');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (7, 'izabelsosa@gmail.com', '66 Front St.',  '53066', 4, '347-985-5162', 'Izabel', 'Sosa');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (8, 'belindasmall@gmail.com', '8190 Eagle Road', '07740', 93, '336-855-0401', 'Belinda', 'Small');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (9, 'salahuddingillespie@gmail.com', '501 Redwood St.', '33823', 68, '323-557-7860', 'Salahuddin', 'Gillespie');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (10, 'tannerwells@gmail.com', '74 Marshall Lane', '02864', 64, '951-708-8529', 'Tanner', 'Wells');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (11, 'arissafitzpatrick@gmail.com', '43 N. St Paul Street', '44070', 98, '432-398-8324', 'Arissa', 'Fitzpatrick');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (12, 'jaydnneal@gmail.com', '74 Marshall Lane',  '08723', 59, '631-842-2409', 'Jaydn', 'Neal');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (13, 'rachaelfarley@gmail.com', '7046 Second St.', '10583', 38, '770-231-7288', 'Rachael', 'Farley');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (14, 'kristopherterrell@gmail.com', '31 High Road',  '10512', 3, '517-568-5259', 'Kristopher', 'Terrell');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (15, 'felicityashley@gmail.com', '809 Bow Ridge Street', '28752', 54, '610-580-5234', 'Felicity', 'Ashley');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (16, 'frayabritt@gmail.com', '21 Gonzales Dr.', '28173', 72, '970-818-1322', 'Fraya', 'Britt');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (17, 'augustholman@gmail.com', '7875 SW. Miles Street', '08060', 83, '914-787-1998', 'August', 'Holman');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (18, 'rivkaredmond@gmail.com', '99 Fulton St. Apt 7',  '02895', 13, '561-947-1042', 'Rivka', 'Redmond');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (19, 'johncobb@gmail.com', '53 New Ave.', '38106', 24, '415-998-6437', 'John', 'Cobb');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (20, 'alexcastaneda@gmail.com', '6 High Noon Dr.',  '84010', 81, '858-251-0363', 'Alex', 'Castaneda');
INSERT INTO ACCOUNT (Account_number, Username, Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (21, 'waqasclayton@gmail.com', '29 N. Broad Drive',  '30019', 18, '682-967-2033', 'Waqas', 'Clayton');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (22, 'cinarmcdonald@gmail.com', '642 Princess St.', '28348', 98, '560-583-7219', 'Cinar', 'Mcdonald');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (23, 'ailaburton@gmail.com', '92 Oakwood St.',  '24401', 63, '129-955-7386', 'Aila', 'Burton');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (24, 'breannamathis@gmail.com', '920 Evergreen Avenue',  '10541', 35, '838-921-4748', 'Breanna', 'Mathis');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (25, 'rhiannfinch@gmail.com', '429 S. Academy Street',  '08816', 4, '765-654-1150', 'Rhiann', 'Finch');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (26, 'stephaniemaddox@gmail.com', '856 North San Pablo St.', '06484', 68, '327-882-8174', 'Stephanie', 'Maddox');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (27, 'roberthamilton@gmail.com', '9 Kingston Drive', '21236', 30, '793-324-8530', 'Robert', 'Hamilton');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (28, 'marilynharrison@gmail.com', '13 Mayfair Lane',  '33801', 72, '757-202-4045', 'Marilyn', 'Harrison');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (29, 'hazelsilva@gmail.com', '9420 Littleton Dr.',  '07740', 93, '828-612-7915', 'Hazel', 'Silva');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (30, 'leiladawson@gmail.com', '964 Somerset St.',  '60621', 64, '966-617-7444', 'Leila', 'Dawson');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (31, 'maegankennedy@gmail.com', '655 Hillcrest Rd.',  '28031', 71, '819-894-7139', 'Sienna', 'Parry');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (33, 'abusaunders@gmail.com', '3 Fordham Ave.', '22030', 12, '549-779-9330', 'Abu', 'Saunders');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (34, 'zackbrennan@gmail.com', '9037 Riverside Ave.',  '16001', 51, '479-601-1484', 'Jem', 'Sheppard');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (36, 'macaulayfranklin@gmail.com', '9 Evergreen Dr.', '75043', 61, '144-415-7448', 'Macaulay', 'Franklin');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (37, 'thaliabeasley@gmail.com', '7554 Amherst Dr.', '53511', 83, '274-272-9228', 'Thalia', 'Beasley');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (38, 'teriplummer@gmail.com', '7668 Cambridge Street',  '20886', 30, '112-889-4268', 'Teri', 'Plummer');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (39, 'emerbryan@gmail.com', '30 Honey Creek Road',  '21234', 70, '980-661-4803', 'Emer', 'Bryan');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (40, 'yasmeenfrank@gmail.com', '246 Sunset Street', '18052', 52, '626-452-6788', 'Yasmeen', 'Frank');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (41, 'blakec@gmail.com', '9562 Lexington Lane', '38106', 500, '123-456-7899', 'Blake', 'Charlton');

-- Table: ZIP
CREATE TABLE ZIP
   (ZipCode CHAR(5) NOT NULL,
    City VARCHAR(30) NOT NULL,
    State VARCHAR(30) NOT NULL,
    PRIMARY KEY (ZipCode));
INSERT INTO ZIP(ZipCode, City, State) VALUES ('39180', 'Columbus', 'OH');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('60156', 'Cleveland', 'OH');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('23803', 'Delaware', 'OH');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('01906', 'Cincinnati', 'OH');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('06360', 'Akron', 'OH');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('55378', 'Dayton', 'OH');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('53066', 'Toledo', 'OH');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('07740', 'Los Angeles', 'CA');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('33823', 'San Diego', 'CA');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('02864', 'San Francisco', 'CA');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('44070', 'Sacramento', 'CA');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('08723', 'Miami', 'FL');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('10583', 'Orlando', 'FL');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('10512', 'Jacksonville', 'FL');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('28752', 'Tampa', 'FL');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('28173', 'Tallahassee', 'FL');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('08060', 'Austin', 'TX');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('02895', 'Dallas', 'TX');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('38106', 'Houston', 'TX');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('84010', 'San Antonio', 'TX');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('30019', 'Atlanta', 'GA');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('28348', 'Detroit', 'MI');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('24401', 'Ann Arbor', 'MI');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('10541', 'Lansing', 'MI');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('08816', 'Grand Rapids', 'MI');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('06484', 'New York City', 'NY');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('21236', 'Buffalo', 'NY');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('33801', 'Rochester', 'NY');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('60621', 'Syracuse', 'NY');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('28031', 'Philadelphia', 'PA');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('22030', 'Pittsburgh', 'PA');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('16001', 'Allentown', 'PA');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('75043', 'Louisville', 'KY');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('53511', 'Lexington', 'KY');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('20886', 'Youngstown', 'OH');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('21234', 'Sandusky', 'OH');
INSERT INTO ZIP(ZipCode, City, State) VALUES ('18052', 'Canton', 'OH');

-- Table: BUYER
CREATE TABLE BUYER
 (Account_number INT NOT NULL,
  PRIMARY KEY(Account_number),
  FOREIGN KEY(Account_number) REFERENCES ACCOUNT(Account_number) ON DELETE CASCADE);
INSERT INTO BUYER (Account_number) VALUES (1);
INSERT INTO BUYER (Account_number) VALUES (2);
INSERT INTO BUYER (Account_number) VALUES (3);
INSERT INTO BUYER (Account_number) VALUES (4);
INSERT INTO BUYER (Account_number) VALUES (5);
INSERT INTO BUYER (Account_number) VALUES (6);
INSERT INTO BUYER (Account_number) VALUES (7);
INSERT INTO BUYER (Account_number) VALUES (8);
INSERT INTO BUYER (Account_number) VALUES (9);
INSERT INTO BUYER (Account_number) VALUES (10);
INSERT INTO BUYER (Account_number) VALUES (21);
INSERT INTO BUYER (Account_number) VALUES (22);
INSERT INTO BUYER (Account_number) VALUES (23);
INSERT INTO BUYER (Account_number) VALUES (24);
INSERT INTO BUYER (Account_number) VALUES (25);
INSERT INTO BUYER (Account_number) VALUES (26);
INSERT INTO BUYER (Account_number) VALUES (27);
INSERT INTO BUYER (Account_number) VALUES (28);
INSERT INTO BUYER (Account_number) VALUES (29);
INSERT INTO BUYER (Account_number) VALUES (30);
INSERT INTO BUYER (Account_number) VALUES (41);

-- Table: IMAGE
CREATE TABLE IMAGE
   (ImageID INT NOT NULL,
    Creation_date DATE NOT NULL,
    Link VARCHAR(60) NOT NULL,
    PRIMARY KEY (ImageID));
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (1, '2020/10/27', 'eszycidpyo.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (2, '2020/10/27', 'pumzgdpamn.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (3, '2020/10/27', 'tyyawoixzh.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (4, '2020/10/27', 'sdkaaauram.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (5, '2020/10/27', 'vgnxaqhyop.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (6, '2020/10/27', 'rhlhvhyoja.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (7, '2020/10/27', 'nrudfuxjdx.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (8, '2020/10/27', 'kxwqnqvgjj.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (9, '2020/10/27', 'spqmsbphxz.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (10, '2020/10/27', 'mnvflrwyvx.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (11, '2020/10/27', 'lcovqdyfqm.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (12, '2020/10/27', 'lpxapbjwts.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (13, '2020/10/27', 'smuffqhayg.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (14, '2020/10/27', 'rrhmqlsloi.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (15, '2020/10/27', 'vrtxamzxqz.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (16, '2020/10/27', 'eqyrgnbpls.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (17, '2020/10/27', 'rgqnplnlar.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (18, '2020/10/27', 'rtztkotazh.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (19, '2020/10/27', 'ufrsfczrzi.jpg');
INSERT INTO IMAGE (ImageID, Creation_date, Link) VALUES (20, '2020/10/27', 'bvccaoayyi.jpg');

-- Table: ORDERS
CREATE TABLE ORDERS (Order_Number INT NOT NULL, Order_Date DATE NOT NULL, CartID INT NOT NULL, FOREIGN KEY (CartID) REFERENCES SHOPPING_CART (CartID) ON DELETE CASCADE, PRIMARY KEY (Order_Number));
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (1, '2020-01-10', 1);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (2, '2020-01-31', 2);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (3, '2020-02-01', 3);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (4, '2020-02-10', 4);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (5, '2020-02-27', 5);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (6, '2020-03-10', 6);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (7, '2020-04-01', 7);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (8, '2020-04-02', 8);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (9, '2020-04-03', 9);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (10, '2020-05-01', 10);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (11, '2020-05-28', 11);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (12, '2020-05-29', 12);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (13, '2020-06-01', 13);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (14, '2020-06-15', 14);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (15, '2020-06-17', 15);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (16, '2020-07-02', 16);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (17, '2020-07-08', 17);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (18, '2020-08-01', 18);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (19, '2020-08-03', 19);
INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (20, '2020-10-07', 20);

-- Table: PAYMENT
CREATE TABLE PAYMENT
(PaymentID INT NOT NULL,
 Type_of_Payment VARCHAR(10) NOT NULL,
 Payment_Account_Number INT NOT NULL,
 ExpDate DATE NOT NULL,
 Order_Number INT NOT NULL,
Account_number INT NOT NULL,
 FOREIGN KEY (Order_Number) REFERENCES ORDERS(Order_Number) ON DELETE CASCADE,
 FOREIGN KEY (Account_Number) REFERENCES Buyer(Account_number) ON DELETE CASCADE,
 PRIMARY KEY(PaymentID));
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (1, 'Credit', 123456, '2020/10/27', 1, 1);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (2, 'Debit', 113456, '2020/10/27', 2, 2);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (3, 'Credit', 111456, '2020/10/27', 3, 3);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (4, 'Debit', 111156, '2020/10/27', 4, 4);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (5, 'Credit', 111116, '2020/10/27', 5, 5);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (6, 'Debit', 111111, '2020/10/27', 6, 6);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (7, 'Credit', 223456, '2020/10/27', 7, 7);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (8, 'Debit', 222456, '2020/10/27', 8, 8);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (9, 'Credit', 222256, '2020/10/27', 9, 9);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (10, 'Debit', 222226, '2020/10/27', 10, 10);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (11, 'Credit', 222222, '2020/10/27', 11, 21);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (12, 'Debit', 333456, '2020/10/27', 12, 22);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (13, 'Credit', 333356, '2020/10/27', 13, 23);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (14, 'Debit', 333336, '2020/10/27', 14, 24);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (15, 'Credit', 333333, '2020/10/27', 15, 25);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (16, 'Debit', 444456, '2020/10/27', 16, 26);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (17, 'Credit', 444446, '2020/10/27', 17, 27);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (18, 'Debit', 444444, '2020/10/27', 18, 28);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (19, 'Credit', 555556, '2020/10/27', 19, 29);
INSERT INTO PAYMENT (PaymentID, Type_of_Payment, Payment_Account_Number, ExpDate, Order_Number, Account_number) VALUES (20, 'Debit', 555555, '2020/10/27', 20, 30);

-- Table: PAYMENT_METHODS
CREATE TABLE PAYMENT_METHODS
    (Method_name VARCHAR(15) NOT NULL,
     StoreID INT NOT NULL,
     FOREIGN KEY (StoreID) REFERENCES VIRTUAL_STOREFRONT(StoreID) ON DELETE CASCADE,
     PRIMARY KEY (Method_name, StoreID));
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 2);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 2);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 3);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 3);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 4);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 4);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 5);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 5);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 6);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 6);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 7);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 7);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 8);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 8);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 9);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 9);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 10);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 10);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 11);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 11);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 12);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 12);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 13);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 13);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 14);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 14);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 15);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 15);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 16);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 16);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 17);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 17);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 18);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 18);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 19);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 19);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 20);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 20);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Karma', 1);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Debit', 1);
INSERT INTO PAYMENT_METHODS (Method_name, StoreID) VALUES ('Credit', 1);

-- Table: PRODUCT
CREATE TABLE PRODUCT
  (ProductID INT NOT NULL,
   StoreID INT NOT NULL,
   Name VARCHAR(15) NOT NULL,
   Quantity INT,
   Availability VARCHAR(15) NOT NULL,
   Price DECIMAL(15, 2) NOT NULL CHECK(Price > 0),
   Type VARCHAR(15) NOT NULL,
  PRIMARY KEY (ProductID),
  FOREIGN KEY (StoreID) REFERENCES Virtual_storefront(StoreID) ON DELETE CASCADE);
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (1, 5, 'szycidpy', 2, 'Available', 5, '3d');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (2, 10, 'spqmsbph', 5, 'Available', 6, '3d');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (3, 14, 'bplsrgqn', 2, 'Available', 160, '3d');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (4, 14, 'ahamebxf', 3, 'Available', 134, 'Executable');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (5, 16, 'aktmjafg', 4, 'Available', 23, 'Executable');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (6, 13, 'zeekdtsz', 3, 'Available', 3, 'Executable');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (7, 20, 'komkmcck', 1, 'Available', 186, 'CAD');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (8, 17, 'tjegerxb', 3, 'Available', 106, 'CAD');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (9, 19, 'mftchpaf', 3, 'Available', 165, 'CAD');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (10, 4, 'ixceytvv', 3, 'Available', 143, 'CAD');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (11, 13, 'kzxvspdu', 2, 'Available', 2, 'Source Code');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (12, 20, 'alizwnvr', 1, 'Available', 48, 'Source Code');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (13, 10, 'uxwriltx', 2, 'Available', 5, 'Source Code');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (14, 5, 'woljymhd', 2, 'Available', 131, 'PDF');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (15, 15, 'myfhhjor', 5, 'Available', 20, 'PDF');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (16, 12, 'rnrgwrnv', 5, 'Available', 125, 'PDF');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (17, 17, 'ldkberbo', 1, 'Available', 120, 'Image');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (18, 9, 'polxmcsz', 3, 'Available', 123, 'Image');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (19, 20, 'krqfaeiv', 2, 'Available', 56, 'Image');
INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (20, 20, 'phnovlrg', 4, 'Available', 77, 'Image');


-- Table: PRODUCT_IMAGE
CREATE TABLE PRODUCT_IMAGE
   (ImageID INT NOT NULL,
    ProductID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID) ON DELETE CASCADE,
FOREIGN KEY (ImageID) REFERENCES IMAGE(ImageID) ON DELETE CASCADE,
    PRIMARY KEY (ImageId, ProductID));
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (1, 1);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (2, 2);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (3, 3);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (4, 4);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (5, 5);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (6, 6);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (7, 7);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (8, 8);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (9, 9);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (10, 10);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (11, 11);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (12, 12);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (13, 13);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (14, 14);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (15, 15);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (16, 16);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (17, 17);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (18, 18);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (19, 19);
INSERT INTO PRODUCT_IMAGE (ImageID, ProductID) VALUES (20, 20);

-- Table: SELLER
CREATE TABLE SELLER
  (Account_number INT NOT NULL,
   PRIMARY KEY(Account_number),
   FOREIGN KEY(Account_number) REFERENCES ACCOUNT(Account_number) ON DELETE CASCADE);
INSERT INTO SELLER (Account_number) VALUES (10);
INSERT INTO SELLER (Account_number) VALUES (11);
INSERT INTO SELLER (Account_number) VALUES (12);
INSERT INTO SELLER (Account_number) VALUES (13);
INSERT INTO SELLER (Account_number) VALUES (14);
INSERT INTO SELLER (Account_number) VALUES (15);
INSERT INTO SELLER (Account_number) VALUES (16);
INSERT INTO SELLER (Account_number) VALUES (17);
INSERT INTO SELLER (Account_number) VALUES (18);
INSERT INTO SELLER (Account_number) VALUES (19);
INSERT INTO SELLER (Account_number) VALUES (20);
INSERT INTO SELLER (Account_number) VALUES (30);
INSERT INTO SELLER (Account_number) VALUES (31);
INSERT INTO SELLER (Account_number) VALUES (32);
INSERT INTO SELLER (Account_number) VALUES (33);
INSERT INTO SELLER (Account_number) VALUES (34);
INSERT INTO SELLER (Account_number) VALUES (35);
INSERT INTO SELLER (Account_number) VALUES (36);
INSERT INTO SELLER (Account_number) VALUES (37);
INSERT INTO SELLER (Account_number) VALUES (38);
INSERT INTO SELLER (Account_number) VALUES (39);
INSERT INTO SELLER (Account_number) VALUES (40);

-- Table: SHOP_PRODUCT
CREATE TABLE SHOP_PRODUCT
(CartID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL,
FOREIGN KEY (CartID) REFERENCES SHOPPING_CART(CartID) ON DELETE CASCADE,
FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID) ON DELETE CASCADE,
PRIMARY KEY (CartID, ProductID));
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (1, 1, 4);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (2, 2, 2);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (3, 3, 3);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (4, 4, 4);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (5, 5, 5);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (6, 6, 7);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (7, 7, 1);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (8, 8, 2);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (9, 9, 3);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (10, 10, 4);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (11, 11, 1);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (12, 12, 2);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (13, 13, 3);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (14, 14, 4);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (15, 15, 5);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (16, 16, 1);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (17, 17, 2);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (18, 18, 3);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (19, 19, 4);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (20, 20, 1);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (1, 2, 300);
INSERT INTO SHOP_PRODUCT (CartID, ProductID, Quantity) VALUES (2, 3, 1);

-- Table: SHOPPING_CART
CREATE TABLE SHOPPING_CART (CartID INT NOT NULL, Purchased BOOLEAN NOT NULL, Account_number INT NOT NULL, FOREIGN KEY (Account_Number) REFERENCES Buyer (Account_number) ON DELETE CASCADE, PRIMARY KEY (CartID));
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (1, 1, 1);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (2, 1, 2);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (3, 1, 3);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (4, 1, 4);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (5, 1, 5);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (6, 1, 6);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (7, 1, 7);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (8, 1, 8);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (9, 1, 9);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (10, 1, 10);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (11, 1, 21);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (12, 1, 22);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (13, 1, 23);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (14, 1, 24);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (15, 1, 25);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (16, 1, 26);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (17, 1, 27);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (18, 1, 28);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (19, 1, 29);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (20, 1, 30);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (21, 0, 1);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (22, 0, 2);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (23, 0, 3);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (24, 0, 4);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (25, 0, 5);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (26, 0, 6);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (27, 0, 7);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (28, 0, 8);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (29, 0, 9);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (30, 0, 10);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (31, 0, 21);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (32, 0, 22);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (33, 0, 23);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (34, 0, 24);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (35, 0, 25);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (36, 0, 26);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (37, 0, 27);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (38, 0, 28);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (39, 0, 29);
INSERT INTO SHOPPING_CART (CartID, Purchased, Account_number) VALUES (40, 0, 30);

-- Table: VIRTUAL_STOREFRONT
CREATE TABLE VIRTUAL_STOREFRONT
    (StoreID INT NOT NULL,
     Account_number INT NOT NULL,
     Name VARCHAR(15) NOT NULL,
     PRIMARY KEY (StoreID)
    FOREIGN KEY (Account_number) REFERENCES SELLER(Account_number) ON DELETE CASCADE);
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (1, 12, 'Jaydn Neal');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (2, 19, 'John Cobb');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (3, 11, 'Arissa Fitzpatrick');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (4, 14, 'Kristopher Terrell');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (5, 11, 'Arissa Fitzpatrick');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (6, 17, 'August Holman');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (7, 17, 'August Holman');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (8, 17, 'August Holman');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (9, 20, 'Alex Castaneda');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (10, 16, 'Fraya Britt');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (11, 13, 'Rachael Farley');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (12, 11, 'Arissa Fitzpatrick');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (13, 17, 'August Holman');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (14, 10, 'Tanner Wells');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (15, 16, 'Fraya Britt');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (16, 16, 'Fraya Britt');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (17, 19, 'John Cobb');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (18, 10, 'Tanner Wells');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (19, 17, 'August Holman');
INSERT INTO VIRTUAL_STOREFRONT (StoreID, Account_number, Name) VALUES (20, 14, 'Kristopher Terrell');

-- Table: WISH_PRODUCT
CREATE TABLE WISH_PRODUCT
   (WishID INT NOT NULL,
    ProductID INT NOT NULL,
Quantity INT NOT NULL,
    FOREIGN KEY (WishID) REFERENCES WISHLIST(WishID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID) ON DELETE CASCADE,
    PRIMARY KEY (WishID, ProductID));
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (2, 2, 1);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (3, 3, 1);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (4, 4, 2);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (5, 5, 2);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (6, 6, 3);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (7, 7, 1);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (8, 8, 3);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (9, 9, 1);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (8, 9, 3);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (11, 11, 1);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (1, 1, 1);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (1, 2, 3);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (1, 3, 2);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (1, 7, 2);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (2, 3, 1);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (3, 4, 1);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (4, 5, 2);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (5, 6, 2);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (6, 7, 3);
INSERT INTO WISH_PRODUCT (WishID, ProductID, Quantity) VALUES (7, 8, 1);

-- Table: WISHLIST
CREATE TABLE "WISHLIST"
(WishID INT NOT NULL,
Account_number INT NOT NULL,
FOREIGN KEY (Account_Number) REFERENCES Buyer(Account_number) ON DELETE CASCADE,
PRIMARY KEY(WishID));
INSERT INTO WISHLIST (WishID, Account_number) VALUES (16, 26);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (8, 8);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (20, 30);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (4, 4);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (19, 29);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (11, 21);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (10, 10);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (1, 1);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (17, 27);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (5, 5);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (3, 3);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (6, 6);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (9, 9);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (14, 24);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (18, 28);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (12, 22);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (2, 2);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (7, 7);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (15, 25);
INSERT INTO WISHLIST (WishID, Account_number) VALUES (13, 23);

-- Table: BUYER_FEEDBACK
CREATE TABLE BUYER_FEEDBACK
   (ProductID INT NOT NULL,
    Account_Number INT NOT NULL,
Feedback VARCHAR(100) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (Account_Number) REFERENCES BUYER(Account_Number) ON DELETE CASCADE,
    PRIMARY KEY (ProductID, Account_Number));
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (1, 1, 'I loved this IP!');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (2, 2, '0/10 recommend');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (3, 3, '10/10, very useful');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (4, 4, 'I highly recommend this product');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (5, 5, 'I had a lot of issues with this product');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (6, 6, 'my favorite IP');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (7, 7, 'This was the worst thing ive ever purchased');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (8, 8, 'Must have IP!');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (9, 9, '0/10');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (10, 10, '7/10, not my favorite IP but still very useful');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (11, 21, 'Amazing!');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (12, 22, 'Horrible.');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (13, 23, 'jfjfjsb rjfnkenr wjejfnnf');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (14, 24, 'no one should buy this!!!!!');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (15, 25, 'Everyone needs to buy this!!!!!!');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (16, 26, 'hfhfhh ehfjjsksj ');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (17, 27, 'hjwndnfnnenjskskmsj sjjsjsjsjsjjs sjkwnkdkemsm');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (18, 28, 'loved this product!');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (19, 29, 'hated this product');
INSERT INTO BUYER_FEEDBACK(ProductID, Account_Number, feedback) VALUES (20, 30, 'jdjdjjs ehfjedwjskksjshfhfbwisndbsjdkfnehidjfbenbduf');
COMMIT TRANSACTION;
PRAGMA foreign_keys = on;




-- View: Total IP purchases
CREATE VIEW [Total_IP_Purchases_By_Each_Buyer] AS
SELECT BUYER.Account_number, SUM(SHOP_PRODUCT.Quantity) 
FROM (((BUYER NATURAL JOIN SHOPPING_CART) NATURAL JOIN ORDERS) NATURAL JOIN SHOP_PRODUCT)
WHERE SHOPPING_CART.purchased = TRUE
GROUP BY account_number;

--View: Total spent by each buyer
CREATE VIEW [Total_spent_by_each_buyer] AS
SELECT BUYER.Account_Number, SUM(PRODUCT.price * SHOP_PRODUCT.Quantity) AS total
FROM BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT
WHERE BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY BUYER.Account_Number;

SELECT Product.Name
FROM Product, Virtual_Storefront, SELLER
WHERE SELLER.Account_number=16 AND Price < 10 AND PRODUCT.StoreID = VIRTUAL_STOREFRONT.StoreID AND SELLER.Account_number = VIRTUAL_STOREFRONT.Account_number;

SELECT product.Name, ORDERS.Order_Date
FROM BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT
WHERE BUYER.Account_number = 1 AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID;

SELECT ACCOUNT.fname, ACCOUNT.lname
FROM Seller, Virtual_Storefront, Product, Account
WHERE Seller.Account_number = Virtual_Storefront.Account_number AND Product.StoreID = Virtual_Storefront.StoreID AND ACCOUNT.Account_number = SELLER.Account_number
GROUP BY Seller.Account_number
HAVING SUM(PRODUCT.Quantity) < 5;

SELECT ACCOUNT.fname, ACCOUNT.lname, PRODUCT.Name
FROM ACCOUNT, PRODUCT, BUYER, SELLER, VIRTUAL_STOREFRONT, SHOPPING_CART, SHOP_PRODUCT, ORDERS
WHERE ACCOUNT.Account_number = BUYER.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND SHOP_PRODUCT.ProductID = PRODUCT.ProductID AND PRODUCT.StoreID = VIRTUAL_STOREFRONT.StoreID AND VIRTUAL_STOREFRONT.Account_number = SELLER.Account_number AND SELLER.Account_number = 11;

SELECT SUM(SHOP_PRODUCT.Quantity) 
FROM BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT
WHERE BUYER.Account_Number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND Buyer.Account_Number = 1 AND SHOPPING_CART.purchased = TRUE;

SELECT BUYER.Account_number, SUM(SHOP_PRODUCT.QUANTITY) AS Total
FROM BUYER, ACCOUNT, SHOPPING_CART, SHOP_PRODUCT, ORDERS
WHERE ACCOUNT.Account_number = BUYER.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND SHOPPING_CART.purchased = TRUE
GROUP BY ACCOUNT.Account_number 
ORDER BY Total DESC LIMIT(1);

SELECT Buyer.Account_Number
FROM (Buyer LEFT JOIN Wishlist ON BUYER.Account_number = WISHLIST.Account_Number)
WHERE WishID IS NULL;

SELECT SUM(PRODUCT.price * SHOP_PRODUCT.Quantity) AS total
FROM BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT
WHERE BUYER.Account_number = 1 AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY BUYER.Account_Number;

SELECT BUYER.Account_number, SUM(WISH_PRODUCT.QUANTITY) AS Total
FROM ((Buyer NATURAL JOIN WishList) NATURAL JOIN WISH_PRODUCT)
GROUP BY Account_number 
ORDER BY Total DESC LIMIT(1);

SELECT ACCOUNT.fname, ACCOUNT.lname, SUM(PRODUCT.price * SHOP_PRODUCT.Quantity) AS totalCost
FROM ACCOUNT, BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT
WHERE ACCOUNT.Account_number = BUYER.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE 
GROUP BY BUYER.Account_Number;

SELECT ACCOUNT.fname, ACCOUNT.lname, ACCOUNT.Username
FROM ACCOUNT, BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT
WHERE ACCOUNT.Account_number = BUYER.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY BUYER.Account_Number
HAVING SUM(PRODUCT.price * SHOP_PRODUCT.Quantity) > (SELECT AVG(totalCost)
FROM (SELECT SUM(PRODUCT.price * SHOP_PRODUCT.Quantity) AS totalCost
FROM ACCOUNT, BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT
WHERE ACCOUNT.Account_number = BUYER.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY BUYER.Account_Number));

SELECT PRODUCT.Name, SUM(SHOP_PRODUCT.QUANTITY) AS Total
FROM BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT
WHERE BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY PRODUCT.Name
ORDER BY Total DESC;

SELECT PRODUCT.Name, SUM(PRODUCT.price * SHOP_PRODUCT.Quantity) AS Total
FROM BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT
WHERE BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY PRODUCT.Name
ORDER BY Total DESC;

SELECT SELLER.Account_number, SUM(SHOP_PRODUCT.QUANTITY) AS Total
FROM BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT, SELLER, VIRTUAL_STOREFRONT
WHERE PRODUCT.StoreID = VIRTUAL_STOREFRONT.StoreID AND SELLER.Account_number = VIRTUAL_STOREFRONT.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY SELLER.Account_number
ORDER BY Total DESC LIMIT(1);

SELECT SELLER.Account_number, SUM(SHOP_PRODUCT.QUANTITY * PRODUCT.Price) AS Total
FROM BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT, SELLER, VIRTUAL_STOREFRONT
WHERE PRODUCT.StoreID = VIRTUAL_STOREFRONT.StoreID AND SELLER.Account_number = VIRTUAL_STOREFRONT.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY SELLER.Account_number
ORDER BY Total DESC LIMIT(1);

SELECT ACCOUNT.fname, lname
FROM ACCOUNT, BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT, VIRTUAL_STOREFRONT, SELLER
WHERE PRODUCT.StoreID = VIRTUAL_STOREFRONT.StoreID AND SELLER.Account_number = VIRTUAL_STOREFRONT.Account_number AND ACCOUNT.Account_number = BUYER.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number
AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
AND SELLER.Account_number = ( SELECT SELLER.Account_number
FROM BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT, SELLER, VIRTUAL_STOREFRONT
WHERE PRODUCT.StoreID = VIRTUAL_STOREFRONT.StoreID AND SELLER.Account_number = VIRTUAL_STOREFRONT.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY SELLER.Account_number
ORDER BY SUM(SHOP_PRODUCT.QUANTITY * PRODUCT.Price) DESC LIMIT(1));

SELECT SELLER.Account_number
FROM SELLER, SHOP_PRODUCT, SHOPPING_CART, VIRTUAL_STOREFRONT, PRODUCT
WHERE PRODUCT.StoreID = VIRTUAL_STOREFRONT.StoreID AND SELLER.Account_number = VIRTUAL_STOREFRONT.Account_number AND SHOP_PRODUCT.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.Account_number = (
SELECT ACCOUNT.Account_number
FROM ACCOUNT, BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT
WHERE ACCOUNT.Account_number = BUYER.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY BUYER.Account_Number
HAVING SUM(PRODUCT.price * SHOP_PRODUCT.Quantity) > (SELECT AVG(totalCost)
FROM (SELECT SUM(PRODUCT.price * SHOP_PRODUCT.Quantity) AS totalCost
FROM ACCOUNT, BUYER, ORDERS, SHOPPING_CART, SHOP_PRODUCT, PRODUCT
WHERE ACCOUNT.Account_number = BUYER.Account_number AND BUYER.Account_number = SHOPPING_CART.Account_number AND ORDERS.CartID = SHOPPING_CART.CartID AND SHOPPING_CART.CartID = SHOP_PRODUCT.CartID AND PRODUCT.ProductID = SHOP_PRODUCT.ProductID AND SHOPPING_CART.purchased = TRUE
GROUP BY BUYER.Account_Number)))
GROUP BY SELLER.Account_number;


INSERT INTO PRODUCT (ProductID, StoreID, Name, Quantity, Availability, Price, Type) VALUES (21, 5, 'sgagcidpy', 2, 'Available', 5, '3d');

INSERT INTO ORDERS (Order_Number, Order_Date, CartID) VALUES (21, '2020-11-15', 1);

INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (42, 'yichensycamore@gmail.com', '750 Old Lancaster Rd.', '19312', 500, '513-903-0084', 'Yi', 'Chen');
INSERT INTO ACCOUNT (Account_number, Username,  Street, ZipCode, Karma_points, Phone_number, FName, LName) VALUES (43, 'brutusbuckeye@gmail.com', '2020 Ohio state.', '12345', 100, '123-123-1234', 'Brutus', 'Buckeye');

INSERT INTO SELLER (Account_number) VALUES (42);
INSERT INTO BUYER (Account_number) VALUES (43);


DELETE FROM PRODUCT WHERE StoreID = 20;

DELETE FROM ACCOUNT WHERE Account_number = 40;
DELETE FROM ACCOUNT WHERE Account_number = 41;

DELETE FROM BUYER WHERE Account_number = 30;
DELETE FROM SELLER WHERE Account_number = 20;

DELETE FROM ORDERS WHERE Order_number = 21;
