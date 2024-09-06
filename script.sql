CREATE DATABASE PaperDB;

GO

USE PaperDB;

-- �������� ������� Department
CREATE TABLE Department (
    Id INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL
);

-- �������� ������� Position
CREATE TABLE Position (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PositionName NVARCHAR(100) NOT NULL
);

-- �������� ������� Employee
CREATE TABLE Employee (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
	IdPosition INT NOT NULL,
    IdDepartment INT NOT NULL,
    FOREIGN KEY (IdDepartment) REFERENCES Department(Id),
	FOREIGN KEY (IdPosition) REFERENCES Position(Id)
);

-- �������� ������� DocumentType
CREATE TABLE DocumentType (
    Id INT PRIMARY KEY IDENTITY(1,1),
    TypeName NVARCHAR(100) NOT NULL
);

-- �������� ������� DocumentStatus
CREATE TABLE DocumentStatus (
    Id INT PRIMARY KEY IDENTITY(1,1),
    StatusName NVARCHAR(50) NOT NULL
);

-- �������� ������� Project
CREATE TABLE Project (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProjectName NVARCHAR(100) NOT NULL
);

-- �������� ������� Task
CREATE TABLE Task (
    Id INT PRIMARY KEY IDENTITY(1,1),
    TaskName NVARCHAR(100) NOT NULL,
    IdProject INT NOT NULL,
    FOREIGN KEY (IdProject) REFERENCES Project(Id)
);

-- �������� ������� Document
CREATE TABLE Document (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    IdDocumentType INT NOT NULL,
    IdEmployee INT NOT NULL,
    IdDepartment INT NOT NULL,
    IdStatus INT NOT NULL,
    FOREIGN KEY (IdDocumentType) REFERENCES DocumentType(Id),
    FOREIGN KEY (IdEmployee) REFERENCES Employee(Id),
    FOREIGN KEY (IdDepartment) REFERENCES Department(Id),
    FOREIGN KEY (IdStatus) REFERENCES DocumentStatus(Id)
);

-- �������� ������� ChangeHistory
CREATE TABLE ChangeHistory (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdDocument INT NOT NULL,
    ChangeDate DATETIME NOT NULL DEFAULT GETDATE(),
    ChangeDescription NVARCHAR(255) NOT NULL,
    FOREIGN KEY (IdDocument) REFERENCES Document(Id)
);

-- ���������� ������� Department
INSERT INTO Department (DepartmentName)
VALUES 
(N'����� ����������'),
(N'�����������'),
(N'���������'),
(N'HR'),
(N'����� ������'),
(N'IT ���������'),
(N'����������� �����'),
(N'�������������');

-- ���������� ������� Position
INSERT INTO Position (PositionName)
VALUES 
(N'�����������'),
(N'������� ���������'),
(N'����������'),
(N'�������� �� ���������'),
(N'�������� �� ��������'),
(N'������'),
(N'�����'),
(N'�������������')
;

-- ���������� ������� Employee
INSERT INTO Employee (FullName, IdPosition, IdDepartment)
VALUES 
(N'������ ����', 1, 1),
(N'������ ����', 2, 2),
(N'�������� �����', 3, 3),
(N'��������� ����', 4, 4),
(N'�������� �������', 5, 5),
(N'�������� ������', 6, 6),
(N'������� �����', 7, 7),
(N'��������� ��������', 8, 8);

-- ���������� ������� DocumentType
INSERT INTO DocumentType (TypeName)
VALUES 
(N'����������� ������������'),
(N'���������� �����'),
(N'������������� ����'),
(N'�������� ��������'),
(N'����� �� ��������'),
(N'������ �� ������������'),
(N'����������� ��������'),
(N'���������������� ������');

-- ���������� ������� DocumentStatus
INSERT INTO DocumentStatus (StatusName)
VALUES 
(N'��������'),
(N'� ��������'),
(N'�� �����������'),
(N'���������'),
(N'��������');

-- ���������� ������� Project
INSERT INTO Project (ProjectName)
VALUES 
(N'���������� ������ ��������'),
(N'������������� �����������'),
(N'��������� ��������'),
(N'���� �����������'),
(N'���������� ������'),
(N'���������� ��������'),
(N'����������� ������������'),
(N'����������� �������������� �����������');

-- ���������� ������� Task
INSERT INTO Task (TaskName, IdProject)
VALUES 
(N'�������� ���������', 1),
(N'���������� ������ �� �������������', 2),
(N'���������� ���������� ������������', 3),
(N'���������� ��������', 4),
(N'������ ������ �� ������� ���', 5),
(N'������ ���������� ������������', 6),
(N'���������� ����������� ������������', 7),
(N'������ ���������-����', 8);

-- ���������� ������� Document
INSERT INTO Document (Title, IdDocumentType, IdEmployee, IdDepartment, IdStatus)
VALUES 
(N'����������� �����', 1, 1, 1, 2),
(N'���������� ����� �� 2023 ���', 2, 2, 2, 4),
(N'������������� ���� �� 2024 ���', 3, 3, 3, 3),
(N'�������� � ����� ����������', 4, 4, 4, 2),
(N'����� �� �������� �� �������', 5, 5, 5, 4),
(N'������ �� ������������ �������', 6, 6, 6, 2),
(N'����������� ������������ �� ��������', 7, 7, 7, 3),
(N'������ � ���������� �����������', 8, 8, 8, 4);

-- ���������� ������� ChangeHistory
INSERT INTO ChangeHistory (IdDocument, ChangeDescription)
VALUES 
(1, N'�������� ���������'),
(1, N'��������� ������� �� "� ��������"'),
(2, N'�������� ���������'),
(2, N'�������� ���������'),
(3, N'�������� ���������'),
(3, N'���������� �� �����������'),
(4, N'�������� ���������'),
(5, N'�������� ���������'),
(6, N'�������� ���������'),
(6, N'��������� ������� �� "�� �����������"'),
(7, N'�������� ���������'),
(8, N'�������� ���������');
