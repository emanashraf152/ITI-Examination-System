reports.sql
-------------Report1-----------------------------------
-------------------------------------------------------
CREATE OR ALTER PROCEDURE get_st_info 
    @tr_id INT
AS
BEGIN
    BEGIN TRY
        SELECT * 
        FROM Students
        WHERE St_Id IN (
            SELECT St_Id
            FROM Student_Assign
            WHERE track_id = @tr_id
        );
    END TRY
    BEGIN CATCH
        SELECT 'Check Your Values' AS ErrorMessage;
    END CATCH;
END;

EXEC get_st_info @tr_id =1;


---------------REPORT2------------------------------------
----------------------------------------------------------
CREATE OR ALTER PROC get_st_grades (@st_id INT)
AS
BEGIN TRY
    SELECT CONCAT(s.St_Fname,' ', s.St_Lname) as Full_Name, sa.Stud_Grade AS Grade
    FROM Student_Answer sa
    JOIN Students s ON sa.ST_ID = s.ST_ID
    WHERE s.ST_ID = @st_id
END TRY
BEGIN CATCH
    SELECT 'An error occurred. Please check your values.'
END CATCH


EXEC get_st_grades @st_id = 123; 

------------------------------------Report3----------------------------------------
-----------------------------------------------------------------------------------
CREATE PROC courses_info_for_instructor
@Ins_Id BIGINT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT * FROM Instructors i WHERE i.Ins_Id = @Ins_Id)
        BEGIN
            SELECT 
                c.Course_Name as [Course Name], 
                COUNT(sc.St_Id) AS 'Number of students'
            FROM 
                Courses c 
                INNER JOIN Inst_Course ic ON c.Course_Id = ic.Course_Id  AND ic.Ins_Id = @Ins_Id
                INNER JOIN Student_Course sc ON c.Course_Id = sc.Course_Id
            GROUP BY 
                c.Course_Name
        END
        ELSE
        BEGIN
            SELECT 'This instructor does not exist' as Error
        END
    END TRY 
    BEGIN CATCH
        SELECT 'An error occurred while processing the request' as Error
    END CATCH
END

EXEC courses_info_for_instructor @Ins_Id = 1
--------------------------------------------------------------Report 4----------------------------------------------
--------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER   PROCEDURE [dbo].[Course_Topics] (@CrId INT)
AS
BEGIN
    DECLARE @Course_Name VARCHAR(50)
    
    SELECT @Course_Name = Course_Name
    FROM Courses
    WHERE Course_Id = @CrId
    
    IF @Course_Name IS NOT NULL
    BEGIN
        SELECT @Course_Name AS [Course Name], Topic_Name AS [Topic Name]
        FROM Topics
        WHERE Course_Id = @CrId
    END
    ELSE
    BEGIN
        SELECT 'This course is not found' AS Error
    END
END

EXEC Course_Topics @CrId = 1;

------------------------------------------------------------------Report5----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE get_ques_opt
    @ex_id INT
AS
BEGIN
    -- Try to select all questions and their options for the specified exam.
    BEGIN TRY
        SELECT
            Q.Quest_Title,
            QC.Choices
        FROM
            Questions Q
        INNER JOIN
            Question_Choise QC ON Q.Quest_Id = QC.Quest_Id
        INNER JOIN
            Student_Answer SA ON Q.Quest_Id = SA.Quest_Id
        INNER JOIN
            Exams ON SA.Exam_Id = Exams.Exam_Id
        WHERE
            Exams.Exam_Id = @ex_id;
    END TRY
	BEGIN CATCH
        SELECT 'Check Your Values';
    END CATCH;
END;

EXEC get_ques_opt @ex_id = 1;

------------------------------------------------------------------Report6-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE get_ques_ans
    @ex_id INT,
    @st_id INT
AS
BEGIN
    BEGIN TRY
        SELECT
            Q.Quest_Title,
            QC.Choices,
            SA.Stud_Answer
        FROM
            Questions Q
        INNER JOIN
            Question_Choise QC ON Q.Quest_Id = QC.Quest_Id
        INNER JOIN
            Student_Answer SA ON Q.Quest_Id = SA.Quest_Id
        INNER JOIN
            Exams ON SA.Exam_Id = Exams.Exam_Id
        WHERE
            SA.Exam_Id = @ex_id AND
            SA.St_Id = @st_id;
    END TRY
    BEGIN CATCH
        SELECT 'Check Your Values';
    END CATCH;
END;

EXEC get_ques_ans 1, 10;
