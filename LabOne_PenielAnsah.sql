#Create the database
drop database if exists Studentdb;
create database Studentdb;

#Select the database to use
use Studentdb;

#Create the Student table with the specified columns
create table Student (
    StudentId int(8) primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Major varchar(50),
    YearGroup int,
    dob date
);

#Verify the creation of the database and table
show databases;
show tables;

#Insert data into the Student table
insert into Student (StudentId, FirstName, LastName, Major, YearGroup, dob) values
(50292026, 'Peter', 'Rice', 'Computer Science', 2026, '2000-01-27'),
(77342026, 'Nanna', 'Abankwa', 'Economics', 2025, '2000-12-21'),
(22192024, 'Griffin', 'Morgan', 'Electrical Engineering', 2024, '2003-06-06'),
(3122026, 'Nana Ayeyi', 'Djan', 'Business', 2026, '2000-07-13'),
(00422026, 'Stephane', 'Cudjoe', 'Geography', 2027, '1999-07-13'),
(33682025, 'seth', 'Nwolley', 'Physics', 2025, '2004-04-12'),
(99992024, 'Allotei', 'Allotey', 'Poetry', 2024, '1998-11-06');

#update the YearGroup for Nanna Abankwa and Stephane Cudjoe
update Student set YearGroup = 2026 where StudentId = 77342026;
update Student set YearGroup = 2026 where StudentId = 00422026;

#update the Major for Nana Ayeyi Djan
update Student set Major = 'Computer Science' where StudentId = 3122026;

#update the LastName for Allotei Allotey
update Student set LastName = 'Allotey Jnr.' where StudentId = 99992024;

#Delete Seth Nwolley from the Student table
delete from Student where StudentId = 33682025;

#update the dob for Peter Rice
update Student set dob = '1993-01-27' where StudentId = 50292026;

#Insert two new students
insert into Student (StudentId, FirstName, LastName, Major, YearGroup, dob) values
(37122026, 'Bless Charles', 'Oppong', 'Mathematics', 2026, '2002-05-15'),
(20022026, 'Beatrice', 'Abraham', 'Biology', 2026, '2004-08-23');

#Add the new attribute 'Career' to the Student table
alter table Student add column Career varchar(100);

#Assign careers to all students
update Student set Career = 'Software Engineer' where StudentId = 50292026;
update Student set Career = 'Economist' where StudentId = 77342026;
update Student set Career = 'Electrical Engineer' where StudentId = 22192024;
update Student set Career = 'Data Scientist' where StudentId = 3122026;
update Student set Career = 'Geographer' where StudentId = 00422026;
update Student set Career = 'Poet' where StudentId = 99992024;
update Student set Career = 'Mathematician' where StudentId = 37122026;
update Student set Career = 'Biologist' where StudentId = 20022026;

#Verify the updates
select * from Student;
