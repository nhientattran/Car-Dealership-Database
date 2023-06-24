CREATE OR REPLACE FUNCTION add_saleperson(_saleperson_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _work_from DATE)
RETURNS void
AS $$
BEGIN 
	INSERT INTO salepersons
	VALUES (_saleperson_id, _first_name, _last_name, _work_from);
END;
$$
LANGUAGE plpgsql;
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION add_car(_car_id INTEGER, _brand VARCHAR, _model VARCHAR, _year INTEGER, _new_car BOOLEAN, _saleperson_id INTEGER)
RETURNS void
AS $$
BEGIN 
	INSERT INTO cars
	VALUES (_car_id, _brand, _model, _year, _new_car, _saleperson_id);
END;
$$
LANGUAGE plpgsql;
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _address VARCHAR, _birthday DATE, _car_id INTEGER)
RETURNS void
AS $$
BEGIN 
	INSERT INTO customers
	VALUES (_customer_id, _first_name, _last_name, _address, _birthday, _car_id);
END;
$$
LANGUAGE plpgsql;
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION add_part(_part_id INTEGER, _name VARCHAR, _amount NUMERIC(10,2))
RETURNS void
AS $$
BEGIN 
	INSERT INTO parts
	VALUES (_part_id, _name, _amount);
END;
$$
LANGUAGE plpgsql;
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void
AS $$
BEGIN 
	INSERT INTO mechanics
	VALUES (_mechanic_id, _first_name, _last_name);
END;
$$
LANGUAGE plpgsql;
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION add_invoice(_invoice_id INTEGER, _invoice_date DATE, _amount NUMERIC(10,2), _customer_id INTEGER, _saleperson_id INTEGER)
RETURNS void
AS $$
BEGIN 
	INSERT INTO invoices
	VALUES (_invoice_id, _invoice_date, _amount, _customer_id, _saleperson_id);
END;
$$
LANGUAGE plpgsql;
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION add_service_ticket(_service_id INTEGER, _name VARCHAR, _service_date DATE, _amount NUMERIC(10,2), _mechanic_id INTEGER, _part_id INTEGER, _car_id integer)
RETURNS void
AS $$
BEGIN 
	INSERT INTO service_tickets
	VALUES (_service_id, _name, _service_date, _amount, _mechanic_id, _part_id, _car_id );
END;
$$
LANGUAGE plpgsql;
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION add_service_history(_service_history_id INTEGER, _car_id INTEGER, _service_id INTEGER)
RETURNS void
AS $$
BEGIN 
	INSERT INTO service_history
	VALUES (_service_history_id, _car_id, _service_id);
END;
$$
LANGUAGE plpgsql;
---------------------------------------------------------------------------------------------------------
SELECT add_saleperson(1001, 'John', 'Smith', '2022-01-05');
SELECT add_saleperson(1002, 'Sarah', 'Johnson', '2021-09-15');
SELECT add_saleperson(1003, 'Michel', 'Davis', '2023-03-10');
SELECT add_saleperson(1004, 'Emily', 'Anderson', '2022-06-30');
SELECT add_saleperson(1005, 'Kevin', 'Nguyen', '2023-02-18');
---------------------------------------------------------------------------------------------------------
SELECT add_car(3001, 'Toyota', 'Camry', 2020, false, null);
SELECT add_car(3002, 'Honda', 'CR-V', 2023, true, 1005);
SELECT add_car(3003, 'Ford', 'Mustang', 2023, true, 1003);
SELECT add_car(3004, 'BMW', 'X5', 2021, false, 1001);
SELECT add_car(3005, 'Mazda', 'CX-5', 2022, true, 1004);
SELECT add_car(3006, 'Lexus', 'RX350', 2021, false, 1002);
SELECT add_car(3007, 'Mercedes', 'S550', 2022, true, 1005);
---------------------------------------------------------------------------------------------------------
SELECT add_customer(2001, 'Lisa', 'Johnson', '123 Main St', '1985-08-10', 3001);
SELECT add_customer(2002, 'Mark', 'Thompson', '456 Elm St', '1990-02-15', 3004);
SELECT add_customer(2003, 'Amanda', 'Davis', '789 Oak St', '1982-11-25', 3005);
SELECT add_customer(2004, 'Kevin', 'Brown', '234 Maple Ave', '1995-05-17', 3002);
SELECT add_customer(2005, 'Jake', 'Miller', '567 Pine St', '1992-09-30', 3003);
SELECT add_customer(2006, 'Lisa', 'Johnson', '123 Main St', '1985-08-10', 3006);
SELECT add_customer(2007, 'Phuc', 'Bich', '246 Lawn Dr', '1995-01-09', 3007)
---------------------------------------------------------------------------------------------------------
SELECT add_part(4001, 'Engine', 500);
SELECT add_part(4002, 'Oil Filter', 50);
SELECT add_part(4003, 'Brake Pads', 20);
SELECT add_part(4004, 'Tire', 200);
SELECT add_part(4005, 'Battery', 100);
---------------------------------------------------------------------------------------------------------
SELECT add_mechanic(5001, 'Robert', 'Wilson');
SELECT add_mechanic(5002, 'Davin', 'Wang');
SELECT add_mechanic(5003, 'Shawn', 'Drinkwater');
SELECT add_mechanic(5004, 'Lorey', 'Lying');
SELECT add_mechanic(5005, 'Sho', 'Lame');
---------------------------------------------------------------------------------------------------------
SELECT add_invoice(6001, '2023-05-01', 10000, 1002, 2006);
SELECT add_invoice(6002, '2023-06-10', 30000, 1003, 2005);
SELECT add_invoice(6003, '2023-04-15', 25000, 1004, 2003);
SELECT add_invoice(6004, '2023-05-20', 15000, 1005, 2004);
SELECT add_invoice(6005, '2023-02-14', 40000, 1001, 2002);
---------------------------------------------------------------------------------------------------------
SELECT add_service_ticket(1001, 'Oil Change', '2023-05-02', 100, 3001, 5002, 4002);
SELECT add_service_ticket(1002, 'Brake Repair', '2023-03-27', 80, 3003, 5003, 4003);
SELECT add_service_ticket(1003, 'Tire Change', '2023-04-01', 500, 3005, 5003, 4004);
SELECT add_service_ticket(1004, 'Battery Change', '2023-01-12', 140, 3002, 5004, 4005);
SELECT add_service_ticket(1005, 'Engine Repair', '2023-06-03', 700, 3004, 5001, 4001);
SELECT add_service_ticket(1006, 'Engine Repair', '2023-06-03', null, 3004, 5005, 4001);
SELECT add_service_ticket(1007, 'Oil Change', '2023-03-27', 100, 3003, 5004, 4002);
---------------------------------------------------------------------------------------------------------
SELECT add_service_history(7001, 3002, 1004);
SELECT add_service_history(7002, 3003, 1002);
SELECT add_service_history(7003, 3003, 1007);
SELECT add_service_history(7004, 3005, 1003);
SELECT add_service_history(7005, 3001, 1001);
SELECT add_service_history(7006, 3004, 1005);
SELECT add_service_history(7007, 3004, 1006);
---------------------------------------------------------------------------------------------------------
ALTER TABLE cars
ADD COLUMN is_serviced BOOLEAN;

SELECT customer_id, first_name, last_name, customers.car_id
FROM customers
LEFT JOIN service_history
ON customers.car_id = service_history.car_id
WHERE service_history.car_id IS NULL

CREATE OR REPLACE PROCEDURE oil_change(_car_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
	IF EXISTS (
		SELECT *
		FROM service_history
		WHERE car_id = _car_id
	)	THEN
		RAISE NOTICE 'Car with ID % already has service before.', _car_id;
	ELSE
		UPDATE cars
		SET is_serviced = TRUE
		WHERE car_id = _car_id;
		RAISE NOTICE 'Thank you for choosing us!';
	END IF;
END;
$$

CALL oil_change(3001);
CALL oil_change(3006);