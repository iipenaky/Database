drop database if exists employeemanagementdb;
create database employeemanagementdb;

use employeemanagementdb;

create table employee(
    empid int primary key,
    fname varchar(50),
    lname varchar(50),
    email varchar(50) unique,
    department varchar(50) default 'unassigned',
    salary float,
    check(salary >= 2000)
);

delimiter $$
create trigger set_default_email before insert on employee
for each row
begin
    if new.email is null or new.email = '' then
        set new.email = concat(new.fname, '.', new.lname, '@gmail.com');
    end if;
end$$
delimiter ;

delimiter $$
create trigger adjust_salary
before insert on employee
for each row
begin
    if new.salary < 2000 then
        set new.salary = 2000;
    end if;
end$$
delimiter ;


-- Inserting data into the employee table
insert into employee (empid, fname, lname, email, department, salary)
values
    (1, 'Kwame', 'Nkrumah', 'kwame.nkrumah@gmail.com', 'Engineering', 5000.00),
    (2, 'Ama', 'Adu', '', 'Marketing', 4000.00),
    (3, 'Yao', 'Mensah', 'Yao.mensah123@example.com', 'Sales', 4500.00);
insert into employee (empid, fname, lname, email, salary)
values
    (4, 'Kendra', 'Antwi', 'ken.antwi@gmail.com', 4800.00);
insert into employee (empid, fname, lname, email, department, salary)
values
    (5, 'Abigail', 'Sarpong', 'a.sarp89ong@example.com', 'Marketing', 1200.00),
    (6, 'Kofi', 'Mensah', 'kofi.mensah@gmail.com', 'HR', 4600.00),
    (7, 'Amina', 'Asante', 'amina.asanteee@yahoo.com', 'Engineering', 4700.00),
    (8, 'Esi', 'Owusu', 'esi.owusu@gmail.com', 'Marketing', 4300.00),
    (9, 'Amalia', 'Kusi', 'amalia.kusi@yahoo.com', 'Sales', 4400.00),
    (10, 'Kwesi', 'Arthur', 'kwesi.arthur@example.com', 'HR', 4500.00);
insert into employee (empid, fname, lname, email, salary)
values
    (11, 'Nana', 'Akuffo', '', 4900.00);
insert into employee (empid, fname, lname, email, department, salary)
values
    (12, 'Akua', 'Boakye', 'akua.boakye@yahoo.com', 'Marketing', 1500.00),
    (13, 'Fiifi', 'Baah', 'fiifi.baah@example.com', 'Sales', 4000.00),
    (14, 'Efua', 'Dapaah', 'efua.dapaah@gmail.com', 'HR', 4300.00);
insert into employee (empid, fname, lname, email, salary)
values
    (15, 'Kweku', 'Asamoah', 'kweku.asamoah@yahoo.com', 50.00);
insert into employee (empid, fname, lname, email, department, salary)
values
    (16, 'Kwabena', 'Osei', 'kwabena.osei@example.com', 'Marketing', 4200.00),
    (17, 'Serwaa', 'Amihere', 'serwaa.amihere@gmail.com', 'Sales', 2.00);
insert into employee (empid, fname, lname, email, salary)
values
    (18, 'Akosua', 'Kwarteng', 'akosua.kwarteng@yahoo.com', 4300.00);
insert into employee (empid, fname, lname, email, department, salary)
values
    (19, 'Kojo', 'Twum', 'kojo.twum@example.com', 'Engineering', 500.00),
    (20, 'Nana', 'Kofi', '', 'Marketing', 4400.00);
    
    
select * from employee;

-- 1. Find all employees whose first name starts with 'K'.
select * from employee where fname like 'K%';

-- 2. Find all employees whose last name ends with 'ah'.
select * from employee where lname like '%ah';

-- 3. Find all employees whose first name has exactly 4 characters.
select * from employee where char_length(fname) = 4;

-- 4. Find all employees whose last name contains 'sa'.
select * from employee where lname like '%sa%';

-- 5. Find all employees whose email contains 'yahoo'.
select * from employee where email like '%yahoo%';

-- 6. Find all employees in the Engineering department.
select * from employee where department = 'Engineering';

-- 7. Find all employees whose first name starts with 'A' and ends with 'a'.
select * from employee where fname like 'A%a';

-- 8. Find all employees whose last name starts with 'A', 'K', or 'M'.
select * from employee where lname like 'A%' or lname like 'K%' or lname like 'M%';

-- 9. Find all employees whose first name does not start with 'A'.
select * from employee where fname not like 'A%';

-- 10. Find all employees whose first name has a vowel as the second character.
select * from employee where fname like '_a%'or fname like '_e%' or fname like '_i%' or fname like '_o%' or fname like '_u%';
