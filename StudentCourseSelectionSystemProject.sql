--create database ProjeYeni
--Öðrenci ders sistemi kurulmaya çalýþýlmýþtýr.



------------------###########################################################################
------------------#             Öðrenci ders sistemi kurulmaya çalýþýlmýþtýr.               #
------------------#              Burada 5 farklý tabo oluþturulmuþtur                       #
------------------#                                                                         #
------------------#                                                                         #
------------------###########################################################################
create table Students (
StudentID int primary key identity (1,1),
FirstName nvarchar(50),
LastName nvarchar(50),
Email nvarchar(50),
BirthDate DATE
)

CREATE TABLE Courses (
    CourseID int primary key identity(1,1),
    CourseName nvarchar(100),
    Credits int,
    AvailableSeats int -- Her dersin mevcut kontenjaný
);

-- Öðrenci Kayýtlarý tablosu
CREATE TABLE StudentCourses (
    StudentCourseID int primary key identity(1,1),
    StudentID int,
    CourseID int,
    EnrollmentDate date,
    foreign key  (StudentID) references Students(StudentID),
    foreign key (CourseID) references Courses(CourseID)
);

-- Öðretmenler tablosu

CREATE TABLE Instructors (
    InstructorID int primary key identity(1,1),
    FirstName nvarchar(50),
    LastName nvarchar(50),
    Email nvarchar(100),
	);

-- Ders Atamalarý tablosu
CREATE TABLE CourseAssignments (
    CourseAssignmentID int primary key identity(1,1),
    CourseID int,
    InstructorID int,
    foreign key (CourseID) references Courses(CourseID),
    foreign key (InstructorID) references Instructors(InstructorID)
);

------------------###########################################################################
------------------#                    Burada 6 tabloya ekleme yapýlmýþtýr                  #
------------------#                                                                         #
------------------#                                                                         #
------------------#                                                                         #
------------------###########################################################################

--Öncelikle rastgele öðrenci eklemesi yapýldý daha sonra random þekilde dolduruldu.
INSERT INTO Students (FirstName, LastName, Email, BirthDate) VALUES
('Rabia', 'Kaþýkcý', 'rabia.kaþýkcý@example.com', '1998-03-25'),
('Ömer', 'Özütemiz', 'ömer.özütemiz@example.com', '1997-01-15'),
('Gülnaz', 'Temiz', 'gülnaz.temiz@example.com', '1996-06-08'),
('Uður', 'Yirmibeþ', 'uður.yirmibeþ@example.com', '1996-04-12'),
('Zeynep', 'Karay', 'zeynep.karay@example.com', '2001-05-27'),
('Ali', 'Yýlmaz', 'ali.yilmaz@example.com', '2000-01-01'),
('Ayþe', 'Kara', 'ayse.kara@example.com', '1999-12-02'),
('Tahir', 'Onur', 'tahir.onur@example.com', '1999-09-05'),
('Selma', 'Ay', 'selma.ay@example.com', '2000-10-18'),
('Süha', 'Kaþýkcý', 'süha.kaþýkcý@example.com', '2001-11-06'),
('Tuðba', 'Sayat', 'tugba.sayat@example.com', '2000-07-05');

declare @counter int = 0

while @counter < 70000
begin
    declare @FirstName nvarchar(50)
    declare @LastName nvarchar(50)
    declare @Email nvarchar(100)
    declare @BirthDate date
	declare @randomnumber int
	

    set @FirstName = (select top 1 FirstName from Students order by NEWID())
    set @LastName = (select top 1 LastName from Students order by NEWID())
	set @randomnumber =  FLOOR(RAND() * 100) + 1;
    set @Email = @FirstName + '.' + @LastName +CAST(@randomnumber as nvarchar(10)) +'@example.com' -- Örnek bir e-posta oluþturmak için ad ve soyad kullanýldý
    set @BirthDate = DATEADD(day, -RAND() * 365 * 30, GETDATE()) -- Rastgele bir doðum tarihi oluþturuldu

    insert into  Students (FirstName, LastName, Email, BirthDate)
    values (@FirstName, @LastName, @Email, @BirthDate)

    set @counter = @counter + 1
end

select COUNT(*) from Students

-- Dersler tablosuna veri eklendi
INSERT INTO Courses (CourseName, Credits, AvailableSeats) VALUES
('Matematik', 4, 75000),
('Fizik', 3, 7000),
('Biyoloji', 3, 5000),
('Tarih', 3, 6000),
('Kimya', 3, 25000),
('Ýngilizce', 3, 30000),
('Müzik', 2, 50000),
('Edebiyat', 3, 3000),
('Coðrafya', 3, 3000),
('Sanat', 2, 2800),
('Sosyal Bilgiler', 2, 28000),
('Bilgisayar Bilimleri', 3, 30000),
('Psikoloji', 3, 5000),
('Ekonomi', 3, 5000),
('Felsefe', 2, 1000),
('Sosyoloji', 2, 1500),
('Astronomi', 2, 2000);


INSERT INTO Instructors (FirstName, LastName, Email) VALUES
('Mehmet', 'Demir', 'mehmet.demir@example.com'),
('Fatma', 'Çelik', 'fatma.celik@example.com'),
('Ahmet', 'Yýlmaz', 'ahmet.yilmaz@example.com'),
('Ayþe', 'Kaya', 'ayse.kaya@example.com'),
('Mustafa', 'Yýldýz', 'mustafa.yildiz@example.com'),
('Zeynep', 'Þahin', 'zeynep.sahin@example.com'),
('Ali', 'Koç', 'ali.koc@example.com'),
('Aylin', 'Öztürk', 'aylin.ozturk@example.com'),
('Hasan', 'Sarý', 'hasan.sari@example.com'),
('Gülay', 'Erdoðan', 'gulay.erdogan@example.com'),
('Osman', 'Aydýn', 'osman.aydin@example.com'),
('Sema', 'Turan', 'sema.turan@example.com'),
('Emre', 'Kara', 'emre.kara@example.com'),
('Zehra', 'Yýlmaz', 'zehra.yilmaz@example.com'),
('Deniz', 'Tekin', 'deniz.tekin@example.com'),
('Serkan', 'Yýlmaz', 'serkan.yilmaz@example.com'),
('Figen', 'Koç', 'figen.koc@example.com'),
('Burak', 'Aydýn', 'burak.aydin@example.com'),
('Pýnar', 'Yýldýz', 'pinar.yildiz@example.com'),
('Kemal', 'Kaya', 'kemal.kaya@example.com'),
('Mustafa', 'Taþ', 'mustafa.tas@example.com'),
('Emine', 'Aksoy', 'emine.aksoy@example.com'),
('Ömer', 'Er', 'ömer.er@example.com'),
('Can', 'Ara', 'can.ara@example.com'),
('Melek', 'Yýldýz', 'melek.yýldýz@example.com'),
('Rabia', 'Aksoy', 'rabia.aksoy@example.com'),
('Hakan', 'Güneþ', 'hakan.gunes@example.com');




declare @courseID INT = 1
declare @instructorID INT = 1
declare @numberofinstructors int;
select @numberofinstructors = COUNT(*) from Instructors;
declare @numberofcourses int;
select @numberofcourses = COUNT(*) from Courses;


while @instructorID <= @numberofinstructors
begin
    if @courseID > @numberofcourses
    begin
        set @courseID = 1
    end

    insert into CourseAssignments (CourseID, InstructorID)
    values (@courseID, @instructorID)

    set @courseID = @courseID + 1
    set @instructorID = @instructorID + 1
end

---While ile öðrencileri derse atýyoruz.
declare @counterassigment int
set @counterassigment = 1

while @counterassigment <= 30000
begin
    declare @studentID int
    declare @courseID int
    declare @enrollmentDate date

    -- Rastgele öðrenci ve ders ID'leri seçildi
    set @studentID = FLOOR(RAND()*(select MAX(StudentID) from Students)) + 1
    set @courseID = FLOOR(RAND()*(select MAX(CourseID) from Courses)) + 1

    -- Rastgele bir tarih seçildi 
    set @enrollmentDate = DATEADD(DAY, FLOOR(RAND()*(DATEDIFF(DAY, '2020-01-01', '2024-01-01'))), '2020-01-01')

    -- Öðrenci ve dersi tabloya eklendi
    insert into StudentCourses (StudentID, CourseID, EnrollmentDate)
    values (@studentID, @courseID, @enrollmentDate)

    set @counterassigment = @counterassigment + 1
end


------------KONTENJAN GÜNCELLEMESÝ--------------
declare @quota int
set @quota = 1

declare @numberofcourses int
select @numberofcourses = COUNT(*) from Courses;

while @quota <= @numberofcourses
begin

UPDATE Courses
set AvailableSeats = (
select COUNT(*) from StudentCourses
where CourseID = @quota
)
where CourseID = @quota
set @quota = @quota + 1
end


------------------###########################################################################
------------------#                    PROCEDURE OLUÞTURULDU                                #
------------------#                                                                         #
------------------#                                                                         #
------------------#                                                                         #
------------------###########################################################################

create procedure sp_EnrollStudent
    @StudentID int, 
	@CourseID int
as
  begin
  set nocount on;
  insert into StudentCourses (StudentID, CourseID, EnrollmentDate)
  --kayýtlar ayný gün yapýldýðý için detdate kullanýldý
  values (@StudentID, @CourseID,GETDATE());
  -- öðrenciye ait toplam kayýt sayýsýný ekrana yazdýrýr
  declare @TotalEnroll int;
  set @TotalEnroll = (select COUNT(*) from StudentCourses  where StudentID = @StudentID);
  select @TotalEnroll  AS TotalEnrollmentsforStudent ,@StudentID as StudentIDNumber;
end

---KULLANMA

exec sp_EnrollStudent @StudentID = 1, @CourseID = 5;


------------------###########################################################################
------------------#                    TRIGGER OLUÞTURULDU                                  #
------------------#                                                                         #
------------------#                                                                         #
------------------#                                                                         #
------------------###########################################################################

 create trigger trg_AfterInsertStudentEnrollment
 on StudentCourses 
 after insert
 as 
 begin 
 declare @CourseID int
 declare @AvailableSeats int
 select @CourseID = CourseID from inserted
 select @AvailableSeats = AvailableSeats from Courses where CourseID = @CourseID;
 if @AvailableSeats <=0
 begin 
 RAISERROR('Kontenjan dolmuþtur.Baþka ders seçiniz', 16, 1)
 rollback transaction 
 return
 end

 UPDATE Courses
 set AvailableSeats = AvailableSeats - 1
 where @CourseID = CourseID
 end

 SELECT * FROM Courses WHERE CourseID = 5;

 EXEC sp_EnrollStudent @StudentID = 2, @CourseID = 5;

 SELECT * FROM Courses WHERE CourseID = 5;




------------------###########################################################################
------------------#                    VIEW OLUÞTURULDU                                     #
------------------#                                                                         #
------------------#                                                                         #
------------------#                                                                         #
------------------###########################################################################

 create view TotalEnrollmentbyCoursesV as
 select
 c.CourseName,
 count(sc.StudentCourseID) as TotalEnrollmentforCourses
 from
 Courses c

 join StudentCourses sc ON c.CourseID = sc.CourseID
GROUP BY 
    c.CourseName;

select * from TotalEnrollmentbyCoursesV
  
------------------###########################################################################
------------------#                    Sorgular                                             #
------------------#                                                                         #
------------------#                                                                         #
------------------#                                                                         #
------------------###########################################################################

select s.StudentID,s.FirstName, s.LastName
from Students s
join StudentCourses sc on s.StudentID = sc.StudentID
where sc.CourseID = 6;

select c.CourseID , c.CourseName from Courses c
join StudentCourses sc on c.CourseID = sc.CourseID
where sc.StudentID = 11


select c.CourseName, ýn.FirstName, ýn.LastName
from Courses c
JOIN CourseAssignments ca on c.CourseID = ca.CourseID
JOIN Instructors ýn ON ýn.InstructorID = ca.InstructorID
where ca.InstructorID = 18;

select ýn.FirstName , ýn.LastName
from Instructors ýn
JOIN CourseAssignments ca on ýn.InstructorID = ca.InstructorID
where ca.CourseID = 3;

select CourseName, AvailableSeats
from Courses
where AvailableSeats > 0;

select c.CourseName, COUNT(sc.StudentCourseID) as TotalEnrollments
from StudentCourses sc
JOIN Courses c ON sc.CourseID = c.CourseID
group by  c.CourseName;


select s.StudentID, s.FirstName, s.LastName , c.CourseName
from Students s
join StudentCourses sc on s.StudentID = sc.StudentID
join Courses c on sc.CourseID = c.CourseID 
where EnrollmentDate between '2023-11-01' AND '2023-11-02'


select s.StudentID, s.FirstName, s.LastName, COUNT(sc.CourseID) AS TotalCourses
from Students s
LEFT JOIN StudentCourses sc ON s.StudentID = sc.StudentID
group by s.StudentID, s.FirstName, s.LastName
having  COUNT(sc.CourseID) = 0;