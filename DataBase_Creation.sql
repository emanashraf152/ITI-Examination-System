
CREATE TABLE Certificates (
    Cert_verification VARCHAR(20) PRIMARY KEY,
    Cert_name VARCHAR(20),
    Duration INT CHECK (duration >= 0) ,
    Platform VARCHAR(20),
     
);


-------------------------------------------------------------------15
Create table Social_Media
(Social_Link  varchar(250),
St_Id int ,
Social_Name varchar(75),
Photo Varbinary(Max)
constraint FK_Sid4 foreign key (st_id) references Students(St_Id),
Constraint PK6 primary key(Social_Link,St_Id)
);

---------------------------------------------------------------16
Create table Login
(User_Name Varchar(50) ,
St_Id int,
Password int ,
Constraint FK_Sid5 Foreign key (St_Id) references Students(St_Id),
Constraint PK7 primary key(user_Name,St_Id)
);
------------------------------------------------------------------17
CREATE TABLE Student_Certificates 
(St_id INT,
 cert_verification VARCHAR(20),
 Constraint FK_Sid6 Foreign key (St_Id) references Students(St_Id),
 Constraint FK_CrtID Foreign key (cert_verification) references Certificates(cert_verification),
Constraint PK8 primary key(cert_verification,St_Id)
);

-----------------------------------------------------------------------18
Create table Intake
(Intake_Num int primary key ,
Intake_Start date ,
Intake_End date ,
);
------------------------------------------------------------------19
Create table Student_Answer
(Date date ,
Quest_Id int, 
Exam_Id int,
St_Id int,
Stud_Answer varchar(200),
Stud_Grade int 
Constraint FK_Sid7 Foreign key(St_Id) References Students(St_Id),
Constraint FK_QUid Foreign key(Quest_Id) References Questions(Quest_Id),
Constraint FK_EXid Foreign key(Exam_Id) References Exams(Exam_Id),
Constraint PK9 Primary key (Date,Exam_Id,St_Id)

);
------------------------------------------------------------------20
Create Table Student_Assign
(Date date ,
St_id int ,
track_id int ,
Branch_id int ,
Constraint FK_Sid8 Foreign key(St_Id) References Students(St_Id),
Constraint Fk_tid2  Foreign key(track_id) References Tracks(track_id),
Constraint FK_Brid Foreign key(Branch_id) References Branch(Branch_id),
Constraint PK10 Primary key (Date,St_Id)
);
---------------------------------------------------------------------21
Create Table Question_Choise 
(Quest_Id int ,
Choices Varchar(200) ,
Constraint FK_QUid2 Foreign key(Quest_Id) References Questions(Quest_Id),
Constraint PK11 Primary key (Quest_Id,Choices)

);
-----------------------------------------------------------------22
Create table Student_Intake
(St_Id int,
Intake_Num	int ,	
Constraint FK_Sid9 Foreign key(St_Id) References Students(St_Id),
Constraint FK_intnum Foreign key(Intake_Num) References Intake(Intake_Num),
Constraint PK12 Primary key (Intake_Num,St_Id)

);