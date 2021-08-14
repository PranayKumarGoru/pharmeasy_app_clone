--creating Users table
CREATE TABLE Users (
    user_id varchar(255) PRIMARY KEY,
    Password varchar(255),
    Name varchar(255),
    Email varchar(255),
    Phone varchar(255),
    Address varchar(255)
);
--adding mock values to the Users table
INSERT INTO Users (user_id, Password, Name, Email, Phone, Address)  
   VALUES ('ram123', 'dummyP', 'Ram Charan', 'ram.cherry@relevel.com', '7777000055', 'Plot No 5/A, Pedemma Temple Lane, Madhapur, Hyderabad');

   
--creating Inventory table
CREATE TABLE Inventory (
    medicine_id varchar(255) PRIMARY KEY,
    medicine_name varchar(255),
    pharmacy_name varchar(255),
    price DECIMAL,
    available_quantity INTEGER,
    city varchar(255)
);

--adding mock values to the Inventory table
INSERT INTO Inventory (medicine_id, medicine_name, pharmacy_name, price, available_quantity,city)  
   VALUES ('4457', 'Tyhronorm 25mcg', 'Abbott', 174.24, 100, 'Hyderabad');
INSERT INTO Inventory (medicine_id, medicine_name, pharmacy_name, price, available_quantity,city)  
   VALUES ('7441', 'Tyhronorm 50mcg', 'Abbott', 200.24, 100, 'Hyderabad');
INSERT INTO Inventory (medicine_id, medicine_name, pharmacy_name, price, available_quantity,city)  
   VALUES ('6974', 'Paracetamol 250mg', 'Reddy Labs', 10.25, 250, 'Hyderabad');
INSERT INTO Inventory (medicine_id, medicine_name, pharmacy_name, price, available_quantity,city)  
   VALUES ('8745', 'Paracetamol 500mg', 'Reddy Labs', 12.25, 250, 'Hyderabad');
INSERT INTO Inventory (medicine_id, medicine_name, pharmacy_name, price, available_quantity,city)  
   VALUES ('7524', 'Paracetamol 650mg', 'Reddy Labs', 20.28, 250, 'Hyderabad');   
   
--creating Cart table
CREATE TABLE Cart (
    cart_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    user_id varchar(255) references Users(user_id),
    medicine_id varchar(255) references Inventory(medicine_id),
    quantity INTEGER
);

--adding mock values to the Cart table
INSERT INTO Cart (user_id, medicine_id, quantity)  
   VALUES ('ram123', '6974', 10);
INSERT INTO Cart (user_id, medicine_id, quantity)
   VALUES ('ram123', '8745', 5);
INSERT INTO Cart (user_id, medicine_id, quantity)  
    VALUES ('ram123', '7524', 3);
INSERT INTO Cart (user_id, medicine_id, quantity)  
     VALUES ('ram123', '7441', 1);


CREATE TABLE ORDER_DETAILS (
   order_id INTEGER AUTO_INCREMENT PRIMARY KEY,
   user_id varchar(255) references Users(user_id),
   order_created_date DATE,
   order_status varchar2(255)
);
     
INSERT INTO ORDER_DETAILS (user_id, order_created_date, order_status)
values ('ram123', '2021-07-28', 'Delivered');

INSERT INTO ORDER_DETAILS (user_id, order_created_date, order_status)
values ('ram123', '2021-06-28', 'Delivered');

CREATE TABLE ORDER_ITEMS (
   order_items_id INTEGER AUTO_INCREMENT PRIMARY KEY,
   order_id INTEGER references ORDER_DETAILS(order_id),
   medicine_id varchar(255) references Inventory(medicine_id),
   quantity INTEGER
);

INSERT INTO ORDER_ITEMS (order_id, medicine_id, quantity)  
   VALUES (1, '7441', 3);
UPDATE Inventory set available_quantity = (select available_quantity from Inventory where medicine_id = '7441') - 3 where medicine_id = '7441';
INSERT INTO ORDER_ITEMS (order_id, medicine_id, quantity)  
   VALUES (1, '4457', 1);
UPDATE Inventory set available_quantity = (select available_quantity from Inventory where medicine_id = '4457') - 1 where medicine_id = '4457';
INSERT INTO ORDER_ITEMS (order_id, medicine_id, quantity)  
   VALUES (2, '8745', 10);
UPDATE Inventory set available_quantity = (select available_quantity from Inventory where medicine_id = '8745') - 10 where medicine_id = '8745';
