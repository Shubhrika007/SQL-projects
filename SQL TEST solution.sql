-- Creating the database
CREATE DATABASE StudentsDB
USE StudentsDB

CREATE TABLE [ATTENDANCE SHEET](
[S.No] INT IDENTITY(1,1)  PRIMARY KEY,
NAME VARCHAR(20),
DATE_1 DATE, 
[ATTENDANCE] VARCHAR(20)
)

INSERT INTO [ATTENDANCE SHEET] VALUES
('Amit', '2021/1/1', 'Present'), 
('Ravi', '2021/1/1', 'Absent'), 
('Amit', '2021/1/2', 'Present'), 
('Ravi', '2021/1/2', 'Absent'), 
('Amit', '2021/1/3', 'Absent'), 
('Ravi', '2021/1/3', 'Present'), 
('Amit', '2021/1/4', 'Absent'), 
('Ravi', '2021/1/4', 'Present') 

-- Attendance status for the last two days

SELECT  ROW_NUMBER() OVER(ORDER BY NAME) AS [S.No], NAME,
CASE WHEN SUM( CASE WHEN ATTENDANCE ='Present' THEN 1 ELSE 0 END )>0 THEN 'No' 
ELSE 'Yes' END AS [Last 2 days absent] 
FROM [ATTENDANCE SHEET] 
WHERE [DATE_1] BETWEEN  (SELECT DATEADD(DAY,-1, max(DATE_1)) FROM [ATTENDANCE SHEET]) AND (SELECT MAX(DATE_1) FROM [ATTENDANCE SHEET])
GROUP BY NAME


