use [DBS LAB Project]
--create table Departments
--(
--	DepID int identity(1,1),
--	DepName varchar(50) not null,
--	DepAddrs varchar(50) not null,
--	primary key(DepID)
--);

--create table DepartmentsContacts
--(
--	DepID int not null,
--	ContactNo varchar(15),
--	foreign key (DepID) references Departments(DepID)
--	on delete cascade on update cascade
--);

--create table Sessions
--(
--	SessionID varchar(50),
--	Limit int check(Limit>0),
--	DepID int not null,
--	Fee int check(Fee>0),
--	primary key(SessionID),
--	foreign key (DepID) references Departments(DepID)
--	on delete cascade on update cascade
--);

--create table Accounts
--(
--	LogID varchar(50) not null, 
--	LogPass varchar(20) not NULL default('FS50Z37'),
--	[Assign Date] date default(getdate()),
--	primary key(LogID)
--);

--create table Student
--(
--	PuppilID varchar(50),
--	FName varchar(50) not null,
--	LName varchar(50),
--	DOB date not null,
--	CNIC varchar(20) not NULL,
--	Age int check(Age>0),
--	Email varchar(50) not null,
--	DepID int not NULL,
--	LoginID varchar(50),
--	HostelAllotment varchar(20) check(HostelAllotment='Allocated' or HostelAllotment='Unallocated') default('Unallocated'),
--	SessionID varchar(50),
--	Section varchar(1),
--	unique(PuppilID),
--	primary key (CNIC),

--	foreign key(SessionID) references Sessions(SessionID)
--	on update no action,
--	foreign key(LoginID) references Accounts(LogID)
--	on delete cascade on update cascade,
--	foreign key (DepID) references Departments(DepID)
--	on update cascade
--);

--create table StudentContactDetails
--(
--	PuppilID varchar(50) not null,
--	ContactNo varchar(20) not null,
--	EMail varchar(20) not null,
--	foreign key(PuppilID) references Student(PuppilID)
--	on update cascade
--);

--create table Faculty
--(
--	FacID varchar(50),
--	FiName varchar(50) not null,
--	LaName varchar(50) not null,
--	DOB date not null,
--	CNIC varchar(20) not NULL,
--	Age int check(Age>0),
--	MailAdrss varchar(50) not null,
--	DepID int not NULL,
--	LoginID varchar(50), --derived and add to account as a primary key set a default pasword automatically
--	HostelAllotment varchar(20) check(HostelAllotment='Allocated' or HostelAllotment='Unallocated') default('Unallocated'),
--	primary key(CNIC),
--	unique(FacID),
--	foreign key (DepID) references Departments(DepID)
--	on update cascade,
--	foreign key(LoginID) references Accounts(LogID)
--);

--ALTER TABLE Faculty
--ADD FacCounter int IDENTITY (1,1);
--ALTER TABLE Faculty
--DROP COLUMN MailAdrss

--create table FacultyContactDetails
--(
--	FacID varchar(50) not null,
--	ContactNo varchar(20) not null,
--	EMail varchar(20) not null,
--	foreign key(FacID) references Faculty(FacID)
--	on update cascade
--);

--create table HOD
--(
--	HODId varchar(50),
--	AdminCounter int IDENTITY(1,1),
--	FName varchar(50) not null,
--	LName varchar(50),
--	DOB date not null,
--	CNIC varchar(20) not NULL,
--	Age int check(Age>0), -- is a derived attribute
--	DepID int NOT NULL,
--	LoginID varchar(50),
--	unique(HODID),
--	primary key(CNIC),
--	foreign key(LoginID) references Accounts(LogID)
--	on delete cascade on update cascade,
--	foreign key (DepID) references Departments(DepID)
--	on update cascade,
--);

--create Table Courses
--(
--	CourseId int identity(1,1),
--	SemesterNo int not NULL,
--	CourseName varchar(20) not NULL,
--	Timming varchar(20) not null,
--	DepId int,
--	primary key(CourseId),
--	foreign key (DepId) references Departments(DepID)
--	on update cascade,
--	unique(CourseName,DepId)
--);

--create table TimeTable
--(
--	TimeId int identity(1,1),
--	CourseId int,
--	Timings varchar(100),
--	primary key(TimeId),
--	foreign key (CourseId) references Courses(CourseId)
--	on delete cascade on update cascade
--);

--create table Subjects
--(
--	SubId int identity(730,001),
--	Tittle varchar(50),
--	CourseId int,
--	CreditsHours int check(CreditsHours>0 and CreditsHours<=4),
--	primary key(SubId),
--	foreign key (CourseId) references Courses(CourseId)
--	on delete cascade on update cascade
--);

--create table PreRequisit
--(
--	SubId int,
--	SubPrId int,
--	foreign key(SubId) references Subjects(SubId)
--	on delete cascade on update cascade,
--	foreign key(SubPrId) references Subjects(SubId)
--	on update no action
--);

--create table FeeRecord
--(
--	ChalanNo int identity(500000,000001),
--	IssueDate date default(getdate()),
--	DueDate date default(getdate()+15),
--	Amount float,
--	Feestatus varchar(10) check(Feestatus='Pending' or Feestatus='Paid') default('Pending'),
--	AfterDue int default(0),
--	FeeMonth varchar(20) default(datename(month,getdate())),
--	PuppilID varchar(50) not null unique,
--	primary key(ChalanNo),
--	foreign key(PuppilID) references Student(PuppilID)
--	on update cascade
--);

--create Table CourseRegs
--(
--	PuppilID varchar(50) not null,
--	RegDate date default(getdate()),
--	CourseId int,
--	foreign key(PuppilID) references Student(PuppilID)
--	on update cascade,
--	foreign key (CourseId) references Courses(CourseId)
--	on update no action
--);

--create table FacultySubjects
--(
--	FacID varchar(50) not null,
--	SubId int,
--	foreign key(FacID) references Faculty(FacID)
--	on update cascade,
--	foreign key(SubId) references Subjects(SubId)
--);

--create table DMC
--(
--	DMCId int identity(1,1),
--	FacID varchar(50) not null,
--	SubId int,
--	PuppilID varchar(50) not null,
--	Grade varchar(2) not null,
--	primary key(DMCId),
--	foreign key(FacID) references Faculty(FacID)
--	on update cascade,
--	foreign key(SubId) references Subjects(SubId),
--	foreign key(PuppilID) references student(PuppilID),
--);

--create table AteendenceRecord 
--(
--	FacID varchar(50) not null,
--	SubId int,
--	PuppilID varchar(50) not null,
--	AttStatus varchar(1) check(AttStatus='P' or AttStatus='A' or AttStatus='L') Default('P'),
--	AttDate varchar(50)default(getdate()),
--	Timing varchar(10) default(convert(Time,getdate())),
--	foreign key(FacID) references Faculty(FacID)
--	on update cascade,
--	foreign key(SubId) references Subjects(SubId),
--	foreign key(PuppilID) references Student(PuppilID)
--	on delete no action on update no action
--);

--ALTER TABLE Student 
--DROP COLUMN Email;