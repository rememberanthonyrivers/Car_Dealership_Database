-- Create Customer Table -- 
CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	service_ticket_id INT NOT NULL,
	service_name VARCHAR(20),
	price NUMERIC(6,2)
);
SELECT * FROM service;

CREATE TABLE part(
	part_id SERIAL PRIMARY KEY,
	service_ticket_id INT NOT NULL,
	part_name VARCHAR(20),
	price NUMERIC(6,2)
);
SELECT * FROM part;

-- NOW LETS CREATE THE SERVICE PART OF THE ERD, THE FOUR TABLES TO BE CREATED 
-- ARE AS FOLLOWS (service_car) , (service_ticket) , (labor) , (mechanic) 
CREATE TABLE service_car(
	service_car_id SERIAL PRIMARY KEY,
	customer_id INT NOT NULL,
	serial_number VARCHAR(17),
	make VARCHAR(20),
	model VARCHAR(20),
	color varchar(20),
	trim_ VARCHAR(20)
);
SELECT * FROM service_car;

CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY,
	service_car_id INT NOT NULL,
	service_date DATE
);
SELECT * from service_ticket;

CREATE TABLE labor(
	labor_id SERIAL PRIMARY KEY,
	service_ticket_id SERIAL,
	mechanic_id INT NOT NULL,
	hours_worked NUMERIC(4,2)
);
SELECT * FROM labor;

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	mechanic_first_name VARCHAR(50),
	mechanic_last_name VARCHAR(50),
	hourly_rate NUMERIC(4,2)
)
SELECT * FROM mechanic;

-- NOW LETS CREATE THE (customer) , (sales_car) , & (salesperson)
-- tables FOR OUR DATABASE 

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	customer_first_name VARCHAR(50),
	customer_last_name VARCHAR(50),
	customer_address VARCHAR(100),
	customer_email VARCHAR(50),
	customer_phone VARCHAR(15)
)
SELECT * FROM customer;

CREATE TABLE sales_car(
	car_id SERIAL PRIMARY KEY,
	serial_number VARCHAR(17),
	make VARCHAR(20),
	model VARCHAR(20),
	color VARCHAR(20),
	trim_ VARCHAR(20),
	price NUMERIC(8,2)
) 
SELECT * FROM sales_car;

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	sp_first_name VARCHAR(50),
	sp_last_name VARCHAR(50),
	sp_email VARCHAR(50),
	sp_phone VARCHAR(15),
	SP_commission NUMERIC(7,2)
)
SELECT * FROM salesperson; 


-- lastly the invoice table is created as follows


CREATE TABLE invoice(
	invoice SERIAL PRIMARY KEY,
	customer_id INT NOT NULL,
	car_id INT NOT NULL,
	salesperson_id INT NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(car_id) REFERENCES sales_car(car_id),
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
); 
SELECT * FROM invoice;

-- ****************************************** --
-- NOW LETS START ADDING DATA INTO OUT TABLES --
-- ****************************************** --

-- 1 insertion of the service table
INSERT INTO service(
	service_id,
	service_ticket_id,
	service_name,
	price
)VALUES(
	'1',
	'1',
	'tire_service',
	'100.00'
)
INSERT INTO service(
	service_id,
	service_ticket_id,
	service_name,
	price
)VALUES(
	'2',
	'2',
	'windshield_service',
	'200.00'
)
INSERT INTO service(
	service_id,
	service_ticket_id,
	service_name,
	price
)VALUES(
	'3',
	'3',
	'tire_rot_service',
	'200.00'
)
SELECT * FROM service;


-- 2 insertion of the part table
INSERT INTO part(
	part_id,
	service_ticket_id,
	part_name, 
	price
)VALUES(
	'1',
	'1',
	'mavis_tire',
	'50.00'
)
INSERT INTO part(
	part_id,
	service_ticket_id,
	part_name, 
	price
)VALUES(
	'2',
	'2',
	'windshield_wipers',
	'25.00'
)
INSERT INTO part(
	part_id,
	service_ticket_id,
	part_name, 
	price
)VALUES(
	'3',
	'3',
	'balance_beam',
	'25.00'
)
SELECT * FROM part;


-- 3 insertion of the service_car table
select * from service_car;
INSERT INTO service_car(
	service_car_id,
	customer_id,
	serial_number,
	make,
	model,
	color,
	trim_,
)VALUES( 
	'1',
	'1',
	'987654321',
	'toyota',
	'venza',
	'white',
	'not_trimmed',
);
INSERT INTO service_car(
	service_car_id,
	customer_id,
	serial_number,
	make,
	model,
	color,
	trim_
)VALUES( 
	'2',
	'2',
	'987454321',
	'bmx',
	'm4',
	'white',
	'not_trimmed',
);
INSERT INTO service_car(
	service_car_id,
	customer_id,
	serial_number,
	make,
	model,
	color,
	trim_
)VALUES( 
	'3',
	'3',
	'923654321',
	'mercedes',
	'x_class',
	'white',
	'trimmed',
);
-- ^ this code block needs to be fixed 


-- Now lets insert values into the table for service_ticket
INSERT INTO service_ticket(
	service_ticket_id,
	service_car_id,
	service_date
)VALUES(
	'1',
	'1',
	'2021_5_1'
);
INSERT INTO service_ticket(
	service_ticket_id,
	service_car_id,
	service_date
)VALUES(
	'2',
	'2',
	'2021_7_1'
);
INSERT INTO service_ticket(
	service_ticket_id,
	service_car_id,
	service_date
)VALUES(
	'3',
	'3',
	'2021_5_7'
);
SELECT * FROM service_ticket;


-- now lets insert data into the Labor table 
INSERT INTO labor(
	labor_id,
	service_ticket_id,
	mechanic_id,
	hours_worked
)VALUES(
	'1',
	'1',
	'1',
	'42'
);
INSERT INTO labor(
	labor_id,
	service_ticket_id,
	mechanic_id,
	hours_worked
)VALUES(
	'2',
	'2',
	'2',
	'50'
);	
INSERT INTO labor(
	labor_id,
	service_ticket_id,
	mechanic_id,
	hours_worked
)VALUES(
	'3',
	'3',
	'3',
	'25'
);
SELECT * FROM labor;


-- next up lets insert data into the mechanics table
INSERT INTO mechanic(
	mechanic_id,
	mechanic_first_name,
	mechanic_last_name,
	hourly_rate
)VALUES(
	'1',
	'john',
	'smith',
	'20'
);
INSERT INTO mechanic(
	mechanic_id,
	mechanic_first_name,
	mechanic_last_name,
	hourly_rate
)VALUES(
	'2',
	'joe',
	'siemen',
	'20'
);
INSERT INTO mechanic(
	mechanic_id,
	mechanic_first_name,
	mechanic_last_name,
	hourly_rate
)VALUES(
	'3',
	'jacob',
	'wiley',
	'20'
);
SELECT * FROM mechanic;


-- next lets insert data into the customer table
INSERT INTO customer(
	customer_id,
	customer_first_name,
	customer_last_name,
	customer_address,
	customer_email,
	customer_phone
)VALUES(
	'1',
	'John',
	'Smith',
	'123 Main Rd, 07023',
	'myemail@gmail.com',
	'123-456-7890'
);
INSERT INTO customer(
	customer_id,
	customer_first_name,
	customer_last_name,
	customer_address,
	customer_email,
	customer_phone
)VALUES(
	'2',
	'Joe',
	'Wiley',
	'123 Offset Rd, 07073',
	'youremail@gmail.com',
	'321-456-7890'
);
INSERT INTO customer(
	customer_id,
	customer_first_name,
	customer_last_name,
	customer_address,
	customer_email,
	customer_phone
)VALUES(
	'3',
	'Jake',
	'Smith',
	'123 High Rd, 07076',
	'theemail@gmail.com',
	'123-456-9999'
);
SELECT * FROM customer;


-- next up the insertion of the Salescar table 
INSERT INTO sales_car(
	car_id,
	serial_number,
	make,
	color,
	trim_,
	price
)VALUES(
	'1',
	'5555555',
	'toyota',
	'venza',
	'tan',
	'trimmed',
	'125.22',
);
INSERT INTO sales_car(
	car_id,
	serial_number,
	make,
	color,
	trim_,
	price
)VALUES(
	'2',
	'5554355',
	'bmw',
	'm4',
	'black',
	'trimmed',
	'325.22',
);
INSERT INTO sales_car(
	car_id,
	serial_number,
	make,
	color,
	trim_,
	price
)VALUES(
	'3',
	'5582555',
	'toyota',
	'highlander',
	'white',
	'not_trimmed',
	'432.00',
);
SELECT * FROM sales_car;


-- following is the query for the insertion of the sales_person table
INSERT INTO salesperson(
	salesperson_id,
	sp_first_name,
	sp_last_name,
	sp_email,
	sp_phone,
	sp_commission
)VALUES(
	'1',
	'tony',
	'jackson',
	'myemail@website.com',
	'908-123-4567',
	'1000.00'
);
INSERT INTO salesperson(
	salesperson_id,
	sp_first_name,
	sp_last_name,
	sp_email,
	sp_phone,
	sp_commission
)VALUES(
	'2',
	'tom',
	'wiley',
	'youremail@website.com',
	'908-321-4567',
	'1200.00'
);
INSERT INTO salesperson(
	salesperson_id,
	sp_first_name,
	sp_last_name,
	sp_email,
	sp_phone,
	sp_commission
)VALUES(
	'3',
	'john',
	'smith',
	'thisemail@website.com',
	'908-654-4567',
	'2000.00'
);
SELECT * FROM salesperson;


--  and lastly lets create the query for he invoice table 
INSERT INTO invoice(
	invoice,
	customer_id,
	car_id,
	salesperson_id
)VALUES(
	'123',
	'1',
	'1',
	'1'
);
INSERT INTO invoice(
	invoice,
	customer_id,
	car_id,
	salesperson_id
)VALUES(
	'124',
	'2',
	'2',
	'2'
);
INSERT INTO invoice(
	invoice,
	customer_id,
	car_id,
	salesperson_id
)VALUES(
	'125',
	'3',
	'3',
	'3'
);
SELECT * FROM invoice;