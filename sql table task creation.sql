CREATE DATABASE IF NOT EXISTS task;

use task;

create table if not exists Member (
	member_id int not null auto_increment,
    first_name varchar(20),
    last_name varchar(20),
    member_location varchar(20),
    member_age int,
    primary key(member_id)
    );
    
insert into Member (first_name, last_name, member_location, member_age) values
    ('John', 'Doe', 'New York', '32'),
    ('Jane','Smith','Los Angeles','27'),
    ('Mark' ,'Jones' ,'Chicago', '45'),
    ('Emily', 'Davis', 'Houston', '30'),
    ('Luke', 'Brown', 'Phoenix', '38'),
    ('Sophia', 'White' ,'Dallas', '29'),
    ('Liam', 'Taylor', 'Miami', '41'),
    ('Olivia', 'Green', 'San Diego', '36'),
    ('James', 'Harris', 'Denver', '33'),
    ('Mia', 'Robinson', 'Atlanta', '25');

create table if not exists Vehicle (
	vehicle_registration varchar (10) not null,
    vehicle_make varchar(10),
    vehicle_model varchar(10),
    member_id int,
    primary key(vehicle_registration)
    );
    
    insert into Vehicle (Vehicle_registration, vehicle_make, vehicle_model, member_id) values
    ('ABC1234', 'Toyota', 'Corolla', '1'),
    ('XYZ5678', 'Ford', 'Mustang', '2'),
    ('DEF1111', 'Honda', 'Civic', '3'),
    ('GHI2222', 'Chevy', 'Cruze', '4'),
    ('JKL3333', 'BMW', 'X5', '5'),
    ('MNO4444', 'Audi', 'A4', '1'),
    ('PQR5555', 'Mercedes', 'C300', '2'),
    ('STU6666', 'Nissan', 'Altima', '3'),
	('VWX7777', 'Hyundai', 'Elantra', '6'),
	('YZA8888', 'Tesla', 'Model S', '7'),
	('BCD9999', 'Kia', 'Sportage', '8'),
	('EFG1112', 'Subaru', 'Forester', '9'),
	('HIJ1212', 'Jeep', 'Wrangler', '10'),
	('KLM1414', 'Mazda', 'CX-5', '4'),
	('NOP1515', 'Honda', 'Accord', '5'),
	('QRS1616', 'Chevy', 'Malibu', '6'),
	('TUV1717', 'Nissan', 'Sentra', '7'),
	('WXY1818', 'Ford', 'Explorer', '8'),
	('ZAB1919', 'Volvo', 'XC90', '9'),
	('CDE2020', 'Lexus', 'RX350', '10');
    
    create table if not exists Engineer (
    engineer_id int,
    First_name varchar(20),
    Last_name varchar(20),
    primary key (engineer_id)
    );
    
    insert into Engineer (Engineer_ID, First_Name, Last_Name) values
    ('1', 'Ethan', 'Williams'),
	('2', 'Olivia', 'Miller'),
	('3', 'Sophia', 'Clark'),
	('4', 'Noah', 'Walker');
    
    create table if not exists Breakdown (
    breakdown_id int,
    vehicle_registration varchar(10),
    engineer_id int,
    breakdown_date date,
    breakdown_time time,
    breakdown_location varchar(20),
    primary key (breakdown_id)
    );
    
    insert into Breakdown (Breakdown_ID, Vehicle_Registration, Engineer_ID, Breakdown_Date, Breakdown_Time, Breakdown_Location) values
    ('1', 'ABC1234', '1', '2024-09-10', '10:30:00', 'New York'),
	('2', 'XYZ5678', '2', '2024-09-10', '11:00:00', 'Los Angeles'),
	('3', 'DEF1111', '3', '2024-09-10', '12:30:00', 'Chicago'),
	('4', 'GHI2222', '4', '2024-09-15', '14:00:00', 'Houston'),
	('5', 'JKL3333', '1', '2024-09-18', '09:45:00', 'Phoenix'),
	('6', 'MNO4444', '2', '2024-09-25', '08:20:00', 'New York'),
	('7', 'PQR5555', '3', '2024-09-28', '11:15:00', 'Los Angeles'),
	('8', 'STU6666', '4', '2024-09-30', '15:30:00', 'Chicago'),
	('9', 'ABC1234', '2', '2024-10-10', '09:30:00', 'New York'),
	('10', 'XYZ5678', '3', '2024-10-15', '13:30:00', 'Los Angeles'),
	('11', 'DEF1111', '4', '2024-10-20', '14:45:00', 'Chicago'),
	('12', 'MNO4444', '1', '2024-10-22', '16:20:00', 'New York'),
	('13', 'JKL3333', '2', '2024-10-25', '17:00:00', 'Phoenix'),
	('14', 'VWX7777', '3', '2024-11-01', '08:00:00', 'Dallas'),
	('15', 'YZA8888', '4', '2024-11-05', '09:00:00', 'Miami'),
	('16', 'BCD9999', '1', '2024-11-10', '10:30:00', 'San Diego'),
	('17', 'EFG1112', '2', '2024-11-15', '14:00:00', 'Denver'),
	('18', 'HIJ1212', '3', '2024-11-18', '11:00:00', 'Atlanta'),
	('19', 'KLM1414', '4', '2024-11-20', '15:45:00', 'Houston'),
	('20', 'NOP1515', '1', '2024-11-25', '16:30:00', 'Phoenix');

ALTER TABLE Vehicle
ADD CONSTRAINT fk_vehicle_member
FOREIGN KEY (member_id) REFERENCES Member(member_id);

ALTER TABLE Breakdown
ADD CONSTRAINT fk_breakdown_vehicle
FOREIGN KEY (vehicle_registration) REFERENCES Vehicle(vehicle_registration);

ALTER TABLE Breakdown
ADD CONSTRAINT fk_breakdown_engineer
FOREIGN KEY (engineer_id) REFERENCES Engineer(engineer_id);

