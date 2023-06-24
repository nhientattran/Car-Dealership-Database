CREATE TABLE salepersons (
  saleperson_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  work_from DATE
);

CREATE TABLE mechanics (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);


CREATE TABLE parts (
  part_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  amount NUMERIC(10,2)
);

CREATE TABLE cars (
  car_id SERIAL PRIMARY KEY,
  brand VARCHAR(50),
  model VARCHAR(50),
  year INTEGER,
  new_car BOOLEAN,
  saleperson_id INTEGER,
  	FOREIGN KEY (saleperson_id)
	REFERENCES salepersons(saleperson_id)
);

CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  address VARCHAR(200),
  birthday DATE,
  car_id INTEGER,
  	FOREIGN KEY (car_id)
	REFERENCES cars(car_id)
);

CREATE TABLE invoices (
  invoice_id SERIAL PRIMARY KEY,
  invoice_date DATE,
  amount NUMERIC(10,2),
  saleperson_id INTEGER,
  customer_id INTEGER,
  	FOREIGN KEY (saleperson_id)
		REFERENCES salepersons(saleperson_id),
	FOREIGN KEY (customer_id)
		REFERENCES customers(customer_id)
);

CREATE TABLE service_tickets (
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  service_date DATE,
  amount NUMERIC(10,2),
  car_id INTEGER,
  mechanic_id INTEGER,
  part_id INTEGER,
    FOREIGN KEY (car_id)
      REFERENCES cars(car_id),
	FOREIGN KEY (mechanic_id)
	  REFERENCES mechanics(mechanic_id),
	FOREIGN KEY (part_id)
	  REFERENCES parts(part_id)
);

CREATE TABLE service_history (
  services_history_id SERIAL PRIMARY KEY,
  car_id INTEGER,
  service_id INTEGER,
  	FOREIGN KEY (car_id)
	  REFERENCES cars(car_id),
	FOREIGN KEY (service_id)
	  REFERENCES service_tickets(service_id)
);



