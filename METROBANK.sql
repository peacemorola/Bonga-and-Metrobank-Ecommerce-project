--METROBANK (Tables include: Customer, Branches, account, Transactions, Employee and Loan)


--Customer--
create table customers(
	customerID int Primary key,
	firstname varchar(255),
	lastname varchar(255),
	dateOfbirth Date,
	address text,
	phoneNumber varchar(20),
	city varchar(255)
);

--branches--
create table branches(
	branchID int Primary key,
	branchname varchar(255),
	branchaddress text,
	branchphonenumber varchar(20)
)

create table account(
	accountNumber int Primary Key,
	customerID int,
	accounttype varchar(20),
	balance decimal(15, 2),
	dateopened date,	
	Foreign key(customerID) references customers(customerID)
	 
);

--TRANSACTION--
create table transactions(
	transactionID int Primary key,
	accountnumber int,
	transactiontype varchar (255),
	amount varchar (20),
	transactiondate date,
	foreign key (accountNumber) references account(accountNumber)
);

--EMPLOYEE TABLE--
create table employee(
	employeeID int Primary key,
	name varchar(255),
	position varchar (255),
	branchID int,
	hiredate date,
	foreign key(branchID) references branches(branchID)
	
); 

--LOAN TABLE--
create table loan(
	loanID int Primary key,
	customerID int,
	loanamount decimal (15,2),
	loantype varchar(30),
	issuedate date,
	interestrate decimal(3,2),
	foreign key(customerID) references customers(customerID)
);

alter table customers add email varchar (255);
alter table account add branchID int;
alter table loan alter column interestrate type float;
alter table customers add unique(phoneNumber);
alter table account add foreign key (branchID) references branches(branchID)