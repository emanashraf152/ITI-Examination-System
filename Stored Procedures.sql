go
create OR ALTER proc retrive_branch
as
begin
select * from Branch
end
------------------------------------------------------------
GO
CREATE OR ALTER PROC ADD_branch
@b_location varchar(50)
AS 
BEGIN 
 BEGIN TRY
  INSERT INTO Branch VALUES(@b_location)
 END TRY
 BEGIN CATCH
  SELECT 'ERROR'
 END CATCH
END
-------------------------------------------------------
GO 
CREATE OR ALTER PROC UPDATE_branch
@b_id int,
@b_loc varchar(50)
AS
BEGIN
 BEGIN TRY
  UPDATE Branch
  SET 
  Branch_Loc=@b_loc
  WHERE Branch_Id=@b_id
 END TRY
 BEGIN CATCH
  SELECT 'ERROR'
 END CATCH
END
------------------------------------------------------------------------------
GO
CREATE OR ALTER PROC DELETE_BRANCH
@B_ID INT
AS
BEGIN 
 BEGIN TRY
  DELETE FROM Branch WHERE Branch_Id=@B_ID
 END TRY
 BEGIN CATCH
  SELECT 'ERROR'
 END CATCH
END

-- Procedure to retrieve all certificates
CREATE PROCEDURE select_Certificate(@Cert_Ver INT)
AS
	BEGIN
		IF @Cert_Ver = 0
			BEGiN 
				SELECT * FROM Courses
			END
		ELSE
		SELECT *
		FROM	Certificates
		WHERE Cert_verification = @Cert_Ver
	END

------------------------------------------------------------

-- Procedure to add a new certificate
CREATE OR ALTER PROCEDURE ADD_CERT
    @ST_ID INT,
    @C_NAME VARCHAR(75),
    @DURATION INT,
    @PLATFORM VARCHAR(75)
AS 
BEGIN
    BEGIN TRY
        INSERT INTO Certificates 
            VALUES (@ST_ID, @C_NAME, @DURATION, @PLATFORM)
    END TRY
    BEGIN CATCH
        SELECT 'ERROR' AS ErrorMessage
    END CATCH
END

-------------------------------------------------------

-- Procedure to update an existing certificate
CREATE OR ALTER PROCEDURE Update_Certificate
    @CERT_VER INT,
    @ST_ID INT,
    @C_NAME VARCHAR(75),
    @DURATION INT,
    @PLATFORM VARCHAR(75)
AS
BEGIN
    BEGIN TRY
        UPDATE Certificates
        SET 
            St_Id = @ST_ID,
            Cert_name = @C_NAME,
            Duration = @DURATION,
            Platform = @PLATFORM
        WHERE Cert_verification = @CERT_VER
    END TRY
    BEGIN CATCH
        SELECT 'ERROR' AS ErrorMessage
    END CATCH
END

------------------------------------------------------------------------------

-- Procedure to delete a certificate by verification
CREATE OR ALTER PROCEDURE DELETE_CERT
    @CERT_VER INT
AS
BEGIN 
    BEGIN TRY
        DELETE FROM Certificates WHERE Cert_verification = @CERT_VER
    END TRY
    BEGIN CATCH
        SELECT 'ERROR' AS ErrorMessage
    END CATCH
END

------------------------------------Course SELECT Proc------------------------------
----------------------------------------------------------------------------------------
CREATE PROCEDURE select_Course(@Course_Id INT)
AS
	BEGIN
		IF @Course_Id = 0
			BEGiN 
				SELECT * FROM Courses
			END
		ELSE
		SELECT *
		FROM	Courses
		WHERE Course_Id = @Course_Id
	END
----------------------------------------------------------------------------------------
------------------------------------Course UPDATE Proc------------------------------
CREATE PROCEDURE Update_Course
(
    @Course_Id INT,  
    @Course_Name VARCHAR(50),  
    @Course_Duration INT
)                               
AS
BEGIN TRY  
    UPDATE Courses
    SET    
	    Course_Id=@Course_Id,
        Course_Name = @Course_Name,
        Course_Duration = @Course_Duration
    WHERE Course_Id = @Course_Id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() AS Errors;
END CATCH;

----------------------------------------------------------------------------------------
------------------------------------Course INSERT Proc------------------------------
CREATE PROCEDURE Insert_Course
(
    @Course_Id INT,  
    @Course_Name VARCHAR(50),  
    @Course_Duration INT
)   
AS  
BEGIN  
    BEGIN TRY
        INSERT INTO Courses
        (
            Course_Id ,  
            Course_Name ,  
            Course_Duration
        )   
        VALUES
        (
            @Course_Id,  
            @Course_Name,  
            @Course_Duration
        );   
    END TRY	
    
    BEGIN CATCH
        SELECT ERROR_MESSAGE() as Errors;	
    END CATCH;
END;

----------------------------------------------------------------------------------------
------------------------------------Course Delete Proc-----------------------------
CREATE PROCEDURE Delete_Course
(
    @Course_Id INT
)
AS
BEGIN TRY
    DELETE FROM Courses 
    WHERE Course_Id = @Course_Id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;

----------------------------------------------Exam Table----------------------------
----------------------------------------------PROC INSERT---------------------------
CREATE PROCEDURE insertExam 
(
    @Exam_ID int,
    @Duration INT,
    @Exam_FullMark Int,
    @Question_Num INT,
    @Cr_id int
)
AS
BEGIN TRY
    INSERT INTO Exams (Exam_ID, Exam_Duration, Exam_FullMark, Question_Num, Course_Id)
    VALUES (@Exam_ID, @Duration, @Exam_FullMark, @Question_Num, @Cr_id)
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS Errors;
END CATCH;

------------------------------------------------SELECT PROC-------------------------------------
--------------------------------------------------------------------------------------------
CREATE PROCEDURE selectexam 
    @Exam_ID int
AS 
BEGIN TRY
    SELECT * FROM Exams
    WHERE Exam_Id = @Exam_ID
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS Errors;
END CATCH;

 ----------------------------------- UPDATE PROC----------------------------------------------
 --------------------------------------------------------------------------------------------
CREATE PROCEDURE updateExam 
    @Exam_ID int,
    @Duration INT,
    @Exam_FullMark Int,
    @Question_Num INT,
    @Cr_id int
AS 
BEGIN TRY
    UPDATE Exams
    SET
        Exam_Duration = @Duration,
        Exam_FullMark = @Exam_FullMark,
        Question_Num = @Question_Num,
        Course_Id = @Cr_id
    WHERE Exam_Id = @Exam_ID
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS Errors;
END CATCH;
 
 ----------------------------------- ---- PROCE DELETE ------------------------------------------------
-------------------------------------------------------------------------------------------------------
CREATE PROCEDURE deleteExam 
    @Exam_ID int
AS 
BEGIN TRY
    DELETE FROM Exams
    WHERE Exam_Id = @Exam_ID
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS Errors;
END CATCH;

-- Procedure to retrieve all freelance records
CREATE OR ALTER PROC Select_FreeLance(@FreeLance_Id INT)
AS 
BEGIN
    SELECT * FROM Freelance
    WHERE Freelance_Id = @FreeLance_Id
END

------------------------

-- Procedure to add a new freelance record
CREATE OR ALTER PROC Insert_Freelance
    @S_ID INT,
    @Job_Title VARCHAR(75),
    @PLatform VARCHAR(75),
    @Start_Date DATE,
    @End_Date DATE,
    @COST MONEY
AS
BEGIN
    BEGIN TRY
        INSERT INTO Freelance 
            VALUES(@S_ID, @Job_Title, @PLatform, @Start_Date, @End_Date, @COST)
    END TRY
    BEGIN CATCH
        SELECT 'ERROR' AS ErrorMessage
    END CATCH
END

-------------------------

-- Procedure to update an existing freelance record
CREATE OR ALTER PROCEDURE Update_FreeLance
    @F_ID INT,
    @S_ID INT,
    @J_TITLE VARCHAR(75),
    @PLATFORM VARCHAR(75),
    @S_DATE DATE,
    @E_DATE DATE,
    @COST MONEY
AS 
BEGIN
    BEGIN TRY
        UPDATE Freelance 
        SET
            St_Id = @S_ID,
            Job_Title = @J_TITLE,
            Platform = @PLATFORM,
            Start_Date = @S_DATE,
            End_Date = @E_DATE,
            Cost = @COST
        WHERE Freelance_Id = @F_ID
    END TRY
    BEGIN CATCH
        SELECT 'ERROR' AS ErrorMessage
    END CATCH
END

---------------------------------------------------------------------

-- Procedure to delete a freelance record by ID
CREATE OR ALTER PROC Delete_FreeLance
    @FID INT
AS
BEGIN 
    BEGIN TRY
        DELETE FROM Freelance WHERE Freelance_Id = @FID
    END TRY
    BEGIN CATCH
        SELECT 'ERROR' AS ErrorMessage
    END CATCH
END

------------------------------------Hiring SELECT Proc------------------------------
----------------------------------------------------------------------------------------
CREATE PROCEDURE select_Hiring(@Hiring_Id INT)
AS
	BEGIN
		IF @Hiring_Id= 0
			BEGiN 
				SELECT * FROM Hiring
			END
		ELSE
		SELECT *
		FROM	Hiring
		WHERE Hiring_Id = @Hiring_Id
	END
----------------------------------------------------------------------------------------
------------------------------------Hiring UPDATE Proc------------------------------
CREATE PROCEDURE Update_Hiring
(
    @Hiring_Id INT,  
    @St_Id INT,
	@Job_Title Varchar(75),
    @Hiring_Date Date,
	@Company_Name Varchar(75)
)                               
AS
BEGIN TRY  
    UPDATE Hiring
    SET
	St_Id=@Hiring_Id,
    St_Id=@St_Id,
	Job_Title = @Job_Title,
    Hiring_Date = @Hiring_Date,
	Company_Name = @Company_Name
	Where Hiring_Id=@Hiring_Id
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() AS Errors;
END CATCH;

----------------------------------------------------------------------------------------
------------------------------------Hiring INSERT Proc------------------------------
CREATE PROCEDURE Insert_Hiring
(
    @Hiring_Id INT,  
    @St_Id INT,
	@Job_Title Varchar(75),
    @Hiring_Date Date,
	@Company_Name Varchar(75)
)   
AS  
BEGIN  
    BEGIN TRY
        INSERT INTO Hiring
        (
    Hiring_Id,  
    St_Id,
	Job_Title,
    Hiring_Date,
	Company_Name 
        )   
        VALUES
        (
    @Hiring_Id ,  
    @St_Id ,
	@Job_Title,
    @Hiring_Date,
	@Company_Name 
	     )
    END TRY	
    
    BEGIN CATCH
        SELECT ERROR_MESSAGE() as Errors;	
    END CATCH;
END;

----------------------------------------------------------------------------------------
------------------------------------Hiring Delete Proc-----------------------------
CREATE PROCEDURE Delete_Hiring
(
    @Hiring_Id INT
)
AS
BEGIN TRY
    DELETE FROM Hiring
	WHERE Hiring_Id = @Hiring_Id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;

------------------------------------Ins_Course SELECT Proc------------------------------
----------------------------------------------------------------------------------------
CREATE PROCEDURE  Select_InstCourse(@Instructor_ID   INT)
AS
	BEGIN
		IF @Instructor_ID   = 0
			BEGiN 
				SELECT * FROM Inst_Course
			END
		ELSE
		SELECT *
		FROM Inst_Course
		WHERE Ins_Id  =  @Instructor_ID 
	END
----------------------------------------------------------------------------------------
------------------------------------Ins_Course Delete Proc-----------------------------

CREATE PROCEDURE  Delete_InsCourse(@Instructor_ID  INT)

 AS
	BEGIN TRY
		DELETE FROM Inst_Course  
            WHERE   Ins_ID  = @Instructor_ID  
	END TRY

	BEGIN CATCH
			SELECT ERROR_MESSAGE() as Errors
		
	END CATCH
----------------------------------------------------------------------------------------
------------------------------------Ins_Course  Insert Proc------------------------------
create PROCEDURE  insert_InsCourse(@Instructor_ID  int,  
                                   @Course_ID  varchar(50))
                                          
AS  
	BEGIN  TRY
		INSERT INTO Inst_Course(Ins_Id, 
		                       Course_Id)
						   
					VALUES(@Instructor_ID,  
                           @Course_ID)
	END TRY
	
	BEGIN CATCH
		SELECT ERROR_MESSAGE() as Errors	
	END CATCH
----------------------------------------------------------------------------------------
------------------------------------Ins_Course UPDATE Proc------------------------------

CREATE PROCEDURE  Update_InsCourse  (@Instructor_ID int,  
                                      @Course_ID  varchar(50))                              
AS  
	BEGIN TRY  
		UPDATE Inst_Course 
        SET    Ins_ID = @Instructor_ID,  
			   Course_ID = @Course_ID              			   
        WHERE  Ins_ID = @Instructor_ID
        END TRY

		BEGIN CATCH
			SELECT ERROR_MESSAGE() as Errors
		END CATCH

------------------------------------Instructor SELECT Proc------------------------------
----------------------------------------------------------------------------------------
CREATE PROCEDURE select_Ins(@Ins_Id INT)
AS
	BEGIN
		IF @Ins_Id = 0
			BEGiN 
				SELECT * FROM Instructors
			END
		ELSE
		SELECT *
		FROM	Instructors
		WHERE Ins_Id=@Ins_Id
	END
----------------------------------------------------------------------------------------
------------------------------------Instructors UPDATE Proc------------------------------
CREATE PROCEDURE Update_Instructors 
(
    @Ins_Id INT,  
    @F_Name VARCHAR(50),  
    @L_Name VARCHAR(50),
    @Phone VARCHAR(50),
    @City VARCHAR(50),
    @Gender VARCHAR(50),  
    @Hiring_Date DATE,
    @Salary INT,
    @Age INT
)                               
AS  
BEGIN TRY  
    UPDATE Instructors  
    SET   
        Ins_Fname = @F_Name,
        Ins_Lname = @L_Name,
        Phone = @Phone,
        City = @City,
        Gender = @Gender,
        Hiring_Date = @Hiring_Date,
        Salary = @Salary,
        Age = @Age
    WHERE  Ins_Id = @Ins_Id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;
----------------------------------------------------------------------------------------
------------------------------------Instructors INSERT Proc------------------------------
CREATE PROCEDURE Insert_INS 
(
    @Ins_Id INT,  
    @F_Name VARCHAR(50),  
    @L_Name VARCHAR(50),
    @Phone VARCHAR(50),
    @City VARCHAR(50),
    @Gender VARCHAR(50),  
    @Hiring_Date DATE,
    @Salary INT,
    @Age INT
)   
AS  
BEGIN  
    BEGIN TRY
        INSERT INTO Instructors
        (
            Ins_Id,  
            Ins_Fname,  
            Ins_Lname,
            Phone,
            City,
            Gender,  
            Hiring_Date,
            Salary,
            Age
        )   
        VALUES
        (
            @Ins_Id,  
            @F_Name,  
            @L_Name,
            @Phone,
            @City,
            @Gender,  
            @Hiring_Date,
            @Salary,
            @Age
        );   
    END TRY	
    
    BEGIN CATCH
        SELECT ERROR_MESSAGE() as Errors;	
    END CATCH;
END;
----------------------------------------------------------------------------------------
------------------------------------Instructors Delete Proc-----------------------------
CREATE PROCEDURE Delete_Ins
(
    @Ins_Id INT
)
AS
BEGIN TRY
    DELETE FROM Instructors 
    WHERE Ins_Id = @Ins_Id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;

------------------------------------Intake SELECT Proc------------------------------
----------------------------------------------------------------------------------------
CREATE PROCEDURE select_Intake(@Intake_Num INT)
AS
    BEGIN
        IF @Intake_Num = 0
            BEGIN 
                SELECT * FROM Intake
            END
        ELSE
            SELECT *
            FROM Intake
            WHERE Intake_Num = @Intake_Num
    END
------------------------------------------------------------------------------------
------------------------------------Intake UPDATE Proc------------------------------
CREATE PROCEDURE Update_Intake
(
    @Intake_Num INT,  
    @Intake_Start Date,  
    @Intake_End Date
)                               
AS
BEGIN TRY  
    UPDATE Intake
    SET    
	Intake_Num= @Intake_Num,
    Intake_Start = @Intake_Start,  
    Intake_End = @Intake_End
    WHERE Intake_Num = @Intake_Num;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() AS Errors;
END CATCH;

----------------------------------------------------------------------------------------
------------------------------------Intake INSERT Proc------------------------------
CREATE PROCEDURE Insert_Intake
(
    @Intake_Num INT,  
    @Intake_Start Date,  
    @Intake_End Date
)   
AS  
BEGIN  
    BEGIN TRY
        INSERT INTO Intake
        (
            Intake_Num ,  
            Intake_Start,  
            Intake_End 
        )   
        VALUES
        (
            @Intake_Num ,  
            @Intake_Start ,  
            @Intake_End 
        );   
    END TRY	
    
    BEGIN CATCH
        SELECT ERROR_MESSAGE() as Errors;	
    END CATCH;
END;

----------------------------------------------------------------------------------------
------------------------------------Intake Delete Proc-----------------------------
CREATE PROCEDURE Delete_Intake
(
    @Intake_Num INT
)
AS
BEGIN TRY
    DELETE FROM Intake
    WHERE Intake_Num = @Intake_Num;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;

-- Retrieve Questions Procedure
CREATE PROCEDURE Select_Qestion(@Q_Id Varchar(50))
AS
BEGIN
    -- Select all rows from Questions table
    SELECT * FROM Questions
	Where Quest_Id=@Q_Id
END

-------------------------------------------------------

-- Add Question Procedure
-- Add Question Procedure
CREATE OR ALTER PROCEDURE Insrt_Question
    @Q_Id Varchar(25),
    @Q_TYPE VARCHAR(25),  
    @Q_TITLE VARCHAR(250), 
    @M_ANSWER VARCHAR(250), 
    @Q_LEVEL VARCHAR(50), 
    @C_ID INT 
AS 
BEGIN 
    BEGIN TRY
        -- Insert a new row into Questions table
        INSERT INTO Questions 
            (Quest_Id, Quest_Type, Quest_Title, Model_Answer, Quest_Level, Course_Id) 
        VALUES 
            (@Q_Id, @Q_TYPE, @Q_TITLE, @M_ANSWER, @Q_LEVEL, @C_ID)
    END TRY
    BEGIN CATCH
        -- Return an error message if an error occurs
        SELECT 'ERROR' AS ErrorMessage
    END CATCH
END


-------------------------------------------------------

-- Update Question Procedure
CREATE OR ALTER PROCEDURE UPDATE_QUEST
    @Q_ID2 INT, 
    @Q_TYPE2 VARCHAR(25),
    @Q_TITLE2 VARCHAR(250),
    @M_ANSWER2 VARCHAR(250), 
    @Q_LEVEL2 VARCHAR(50), 
    @C_ID2 INT 
AS
BEGIN
    BEGIN TRY
        -- Update the specified row in Questions table
        UPDATE QUESTIONS 
        SET 
            Quest_Type = @Q_TYPE2,
            Quest_Title = @Q_TITLE2,
            Model_Answer = @M_ANSWER2,
            Quest_Level = @Q_LEVEL2,
            Course_Id = @C_ID2
        WHERE 
            Quest_Id = @Q_ID2
    END TRY
    BEGIN CATCH
        -- Return an error message if an error occurs
        SELECT 'ERROR' AS ErrorMessage
    END CATCH
END

-------------------------------------------------------

-- Delete Question Procedure
CREATE OR ALTER PROCEDURE DELETE_QUEST
    @Q_ID3 INT -- ID of the question to be deleted
AS
BEGIN 
    BEGIN TRY
        -- Delete the specified row from Questions table
        DELETE FROM Questions WHERE Quest_Id = @Q_ID3
    END TRY
    BEGIN CATCH
        -- Return an error message if an error occurs
        SELECT 'ERROR' AS ErrorMessage
    END CATCH
END

-- PROCEDURE Student-Answer
-- Insert Student Answer Procedure
CREATE PROCEDURE insert_St_Answer_table
(
    @Date date, 
    @Quest_id INT,
	@Exam_id int,
	@St_id int,
	@Stud_Answer varchar(200),
	@Stud_Grade int
)   
AS  
BEGIN  
    BEGIN TRY
        INSERT INTO Student_Answer
        (
            Date,
			Quest_Id,
			Exam_Id,
            St_Id,  
            Stud_Answer,
			Stud_Grade
		)   
        VALUES
        (
            @Date, 
            @Quest_id,
	        @Exam_id,
	        @St_id,
	        @Stud_Answer,
	        @Stud_Grade 
        );   
    END TRY
	
    BEGIN CATCH
        SELECT ERROR_MESSAGE() as Errors;	
    END CATCH;
END;
----------------------------------------------------------------
-- Update Student Answer Procedure
CREATE PROCEDURE Delete_St_Answer_table
(
   @Date date,
   @St_Id int,
   @Exam_Id int,
   @Quest_Id int
)
AS
BEGIN TRY
    DELETE FROM Student_Answer
    WHERE 
       St_Id = @St_Id
      AND Exam_Id = @Exam_Id
      AND Quest_Id = @Quest_Id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;


----------Select Student Answer Procedure--------------------------------------------------------
CREATE PROCEDURE select_StudentAnswer
(
    @St_Id INT,
    @Exam_Id INT,
    @Quest_Id INT
)
AS    
BEGIN 
    SELECT * 
    FROM Student_Answer
    WHERE  
        St_Id = @St_Id
        AND Exam_Id = @Exam_Id
        AND Quest_Id = @Quest_Id;
END;
----------------------------------update------------------------------------
CREATE PROCEDURE update_StudentAnswer
(
    @St_Id INT,
    @Exam_Id INT,
    @Quest_Id INT,
    @New_Stud_Answer VARCHAR(200),
    @New_Stud_Grade INT
)
AS    
BEGIN 
    UPDATE Student_Answer
    SET  
        Stud_Answer = @New_Stud_Answer,
        Stud_Grade = @New_Stud_Grade
    WHERE  
        St_Id = @St_Id
        AND Exam_Id = @Exam_Id
        AND Quest_Id = @Quest_Id;
END;


-- PROCEDURE Student-Assign
-----------------------------------------------------------------------------------------------------------------------
Create PROCEDURE Insert_StudentAssign
(
    @Date date, 
    @St_id INT,
	@track_id int,
	@Branch_id int
)   
AS  
BEGIN  
    BEGIN TRY
        INSERT INTO Student_Assign
        (
            Date,  
            St_Id,  
            track_id,
			Branch_id
        )   
        VALUES
        (
           @Date, 
           @St_id ,
	       @track_id ,
	       @Branch_id

        );   
    END TRY
	
    BEGIN CATCH
        SELECT ERROR_MESSAGE() as Errors;	
    END CATCH;
END;
--------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE Update_StudentAssign
(
    @Date date, 
    @St_id INT,
    @track_id int,
    @Branch_id int
)                               
AS
BEGIN TRY  
    UPDATE Student_Assign
    SET    
        St_Id = @St_id,
        track_id = @track_id,
        Branch_id = @Branch_id
    WHERE 
        St_Id = @St_id AND
        track_id = @track_id AND
        Branch_id = @Branch_id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() AS Errors;
END CATCH;

------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE Delete_StudentAssign
(
   @St_Id INT,
   @track_id INT,
   @Branch_id INT
)
AS
BEGIN TRY
    DELETE FROM Student_Assign
    WHERE St_Id = @St_Id AND
        track_id = @track_id AND
        Branch_id = @Branch_id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;

-----------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE select_StudentAssign
(
    @Date date,
    @St_Id INT,
    @track_id INT,
    @Branch_id INT
)
AS    
BEGIN 
    IF @Date IS NOT NULL
    BEGIN 
        SELECT * FROM Student_Assign
    END
    ELSE
    BEGIN
        SELECT *
        FROM Student_Assign
        WHERE St_Id = @St_Id 
        AND track_id = @track_id 
        AND Branch_id = @Branch_id;
    END
END;

------------------------------------Student_Intake SELECT Proc------------------------------
----------------------------------------------------------------------------------------
CREATE PROCEDURE Select_StIntake
    @St_Id INT
AS
BEGIN
    IF @St_Id = 0
    BEGIN
        SELECT * FROM Student_Intake;
    END
    ELSE
    BEGIN
        SELECT * FROM Student_Intake WHERE St_Id = @St_Id;
    END
END

----------------------------------------------------------------------------------------
------------------------------------Student_Intake Delete Proc-----------------------------
CREATE PROCEDURE Delete_StIntake
    @St_Id INT
AS
BEGIN TRY
    DELETE FROM Student_Intake
    WHERE St_Id = @St_Id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;

----------------------------------------------------------------------------------------
------------------------------------Student_Intake Insert Proc------------------------------
CREATE PROCEDURE insert_StIntake
    @St_Id int,  
    @Intake_Num INT
AS  
BEGIN TRY
    INSERT INTO Student_Intake(St_Id, Intake_Num)
    VALUES (@St_Id, @Intake_Num);
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;
----------------------------------------------------------------------------------------
------------------------------------Student_Intake UPDATE Proc------------------------------
CREATE PROCEDURE Update_InsIntake
    @St_Id int,  
    @Intake_Num INT
AS  
BEGIN TRY  
    UPDATE Student_Intake
    SET St_Id = @St_Id,  
        Intake_Num = @Intake_Num              			   
    WHERE St_Id = @St_Id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;

------------------------------------Track SELECT Proc------------------------------
----------------------------------------------------------------------------------------
CREATE PROCEDURE select_Track(@Track_Id INT)
AS
	BEGIN
		IF @Track_Id = 0
			BEGiN 
				SELECT * FROM Tracks
			END
		ELSE
		SELECT *
		FROM	Tracks
		WHERE Track_Id = @Track_Id
	END
----------------------------------------------------------------------------------------
------------------------------------Track UPDATE Proc------------------------------
CREATE PROCEDURE Update_Track
(
    @Track_Id INT,  
    @Track_Name VARCHAR(50),  
    @Ins_Id INT
)                               
AS
BEGIN TRY  
    UPDATE Tracks
    SET    
	   
        Track_Name = @Track_Name,
        Ins_Id = @Ins_Id
    WHERE Track_Id =@Track_Id ;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() AS Errors;
END CATCH;

----------------------------------------------------------------------------------------
--------------------------------Insert Tracks-------------------------------------------
CREATE PROCEDURE Insert_Track
(
    @Track_Name VARCHAR(50),  
    @Ins_Id INT
)   
AS  
BEGIN  
    BEGIN TRY
        INSERT INTO Tracks
        (
        
            Track_Name,  
            Ins_Id
        )   
        VALUES
        (
      
            @Track_Name,  
            @Ins_Id
        );   
    END TRY
	
    BEGIN CATCH
        SELECT ERROR_MESSAGE() as Errors;	
    END CATCH;
END;
    

----------------------------------------------------------------------------------------
------------------------------------track Delete Proc-----------------------------
CREATE PROCEDURE Delete_Track
(
   @Track_Id INT
)
AS
BEGIN TRY
    DELETE FROM Tracks
    WHERE Track_Id = @Track_Id;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() as Errors;
END CATCH;
