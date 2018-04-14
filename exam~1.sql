
CREATE TYPE DepartmentType AS OBJECT(
Dname VARCHAR(25),
location VARCHAR(25),
Depno VARCHAR(25),
Location REF EmployeeType);

CREATE TABLE Department OF DepartmentType(
Depno PRIMARY KEY,
SCOPE FOR (Location) IS Employee);

CREATE TYPE EmployeeType AS OBJECT(
SSN VARCHAR(25),
Ename VARCHAR(25),
Address VARCHAR(25),
Phone NUMBER,
function VARCHAR(25),
salary NUMBER,
Emp_dep REF DepartmentType);

CREATE TABLE Employee OF EmployeeType(
SSN PRIMARY KEY,
SCOPE FOR (Emp_dep) IS Department);

CREATE TYPE Produced_itemType AS OBJECT(
prod_date DATE);

CREATE TYPE ItemType AS OBJECT(
model VARCHAR(25),
itemno VARCHAR(25)) NOT FINAL;

CREATE TABLE Item OF ItemType(
itemno PRIMARY KEY);

CREATE TABLE Produced_item OF Produced_itemType;

CREATE TYPE Car_itemType AS OBJECT(
car_piece REF CarType,
item_piece REF ItemType);

CREATE TYPE CarType AS OBJECT(
carno VARCHAR(25),
color VARCHAR(25),
data DATE,
model VARCHAR(25));

CREATE TABLE Car OF CarType(
carno PRIMARY KEY);

CREATE TABLE Car_item OF Car_itemType(
SCOPE FOR (car_piece) IS Car,
SCOPE FOR (item_piece) IS Item);

CREATE TYPE Supplied_itemType AS OBJECT(
quantity NUMBER,
data DATE,
Sname_item REF SuppliersType,
Invoice_item REF InvoicesType);

CREATE TABLE Supplied_item OF Supplied_itemType(
CONSTRAINT Supplied_item_pk PRIMARY KEY (quantity, data),
SCOPE FOR (Sname_item) IS Suppliers,
SCOPE FOR (Invoice_item) IS Invoices);

CREATE TYPE InvoicesType AS OBJECT(
invoice VARCHAR(25),
amount DECIMAL(5,10),
pay_day DATE);

CREATE TYPE SuppliersType AS OBJECT(
Sname VARCHAR(25),
address VARCHAR(25),
phone VARCHAR(25),
contact VARCHAR(25));

CREATE TABLE Suppliers OF SuppliersType(
Sname PRIMARY KEY);

CREATE TABLE Invoices OF InvoicesType(
invoice PRIMARY KEY);



















