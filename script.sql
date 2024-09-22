CREATE DATABASE PaperDB;

GO

USE PaperDB;

-- Создание таблицы Department
CREATE TABLE Department (
    Id INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL
);

-- Создание таблицы Position
CREATE TABLE Position (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PositionName NVARCHAR(100) NOT NULL
);

-- Создание таблицы Employee
CREATE TABLE Employee (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
	IdPosition INT NOT NULL,
    IdDepartment INT NOT NULL,
    FOREIGN KEY (IdDepartment) REFERENCES Department(Id),
	FOREIGN KEY (IdPosition) REFERENCES Position(Id)
);

-- Создание таблицы DocumentType
CREATE TABLE DocumentType (
    Id INT PRIMARY KEY IDENTITY(1,1),
    TypeName NVARCHAR(100) NOT NULL
);

-- Создание таблицы DocumentStatus
CREATE TABLE DocumentStatus (
    Id INT PRIMARY KEY IDENTITY(1,1),
    StatusName NVARCHAR(50) NOT NULL
);

-- Создание таблицы Document
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

-- Создание таблицы ChangeHistory
CREATE TABLE ChangeHistory (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdDocument INT NOT NULL,
    ChangeDate DATETIME NOT NULL DEFAULT GETDATE(),
    ChangeDescription NVARCHAR(255) NOT NULL,
    FOREIGN KEY (IdDocument) REFERENCES Document(Id)
);

-- Наполнение таблицы Department
INSERT INTO Department (DepartmentName)
VALUES 
(N'Отдел разработки'),
(N'Бухгалтерия'),
(N'Маркетинг'),
(N'HR'),
(N'Отдел продаж'),
(N'IT Поддержка'),
(N'Юридический отдел'),
(N'Администрация');

-- Наполнение таблицы Position
INSERT INTO Position (PositionName)
VALUES 
(N'Разработчик'),
(N'Главный бухгалтер'),
(N'Маркетолог'),
(N'Менеджер по персоналу'),
(N'Менеджер по продажам'),
(N'Техник'),
(N'Юрист'),
(N'Администратор')
;

-- Наполнение таблицы Employee
INSERT INTO Employee (FullName, IdPosition, IdDepartment)
VALUES 
(N'Иванов Иван', 1, 1),
(N'Петров Петр', 2, 2),
(N'Сидорова Мария', 3, 3),
(N'Кузнецова Анна', 4, 4),
(N'Алексеев Алексей', 5, 5),
(N'Николаев Никита', 6, 6),
(N'Федоров Федор', 7, 7),
(N'Григорьев Григорий', 8, 8);

-- Наполнение таблицы DocumentType
INSERT INTO DocumentType (TypeName)
VALUES 
(N'Техническая документация'),
(N'Финансовый отчет'),
(N'Маркетинговый план'),
(N'Кадровый документ'),
(N'Отчет по продажам'),
(N'Запрос на обслуживание'),
(N'Юридический документ'),
(N'Административный приказ');

-- Наполнение таблицы DocumentStatus
INSERT INTO DocumentStatus (StatusName)
VALUES 
(N'Черновик'),
(N'В процессе'),
(N'На утверждении'),
(N'Утвержден'),
(N'Отклонен');

-- Наполнение таблицы Document
INSERT INTO Document (Title, IdDocumentType, IdEmployee, IdDepartment, IdStatus)
VALUES 
(N'Технический отчет', 1, 1, 1, 2),
(N'Финансовый отчет за 2023 год', 2, 2, 2, 4),
(N'Маркетинговый план на 2024 год', 3, 3, 3, 3),
(N'Документ о найме сотрудника', 4, 4, 4, 2),
(N'Отчет по продажам за квартал', 5, 5, 5, 4),
(N'Запрос на обслуживание сервера', 6, 6, 6, 2),
(N'Юридическая консультация по договору', 7, 7, 7, 3),
(N'Приказ о проведении корпоратива', 8, 8, 8, 4);

-- Наполнение таблицы ChangeHistory
INSERT INTO ChangeHistory (IdDocument, ChangeDescription)
VALUES 
(1, N'Создание документа'),
(1, N'Изменение статуса на "В процессе"'),
(2, N'Создание документа'),
(2, N'Документ утвержден'),
(3, N'Создание документа'),
(3, N'Отправлено на утверждение'),
(4, N'Создание документа'),
(5, N'Создание документа'),
(6, N'Создание документа'),
(6, N'Изменение статуса на "На утверждении"'),
(7, N'Создание документа'),
(8, N'Создание документа');
