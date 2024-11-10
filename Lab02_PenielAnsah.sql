# Create the database if it doesn't exist
drop database if exists librarydb;
create database librarydb;
use librarydb;

# Create the books table
create table books (
  book_id int AUTO_INCREMENT PRIMARY KEY,
  title varchar(100),
  author varchar(100),
  genre varchar(50),
  publication_year year,
  copies int
);

# Insert books into the books table
insert into books (title, author, genre, publication_year, copies)
values
  ('The Name of the Wind', 'Patrick Rothfuss', 'Fantasy', 2007, 27),
  ('Diary of a Wimpy Kid: Rodrick Rules', 'Jeff Kinney', 'Comedy', 2008, 10),
  ('Diary of a Wimpy Kid: The Last Straw', 'Jeff Kinney', 'Comedy', 2009, 5),
  ('Diary of a Wimpy Kid: Dog Days', 'Jeff Kinney', 'Comedy', 2009, 7),
  ('Diary of a Wimpy Kid: The Ugly Truth', 'Jeff Kinney', 'Comedy', 2010, 7),
  ('Vision in White', 'Nora Roberts', 'Romance', 2009, 9),
  ('How Not to Die', 'Gene Stone', 'Health', 2015, 15),
  ('Revolutionary Spring', 'Christopher Clark', 'History', 2023, 13),
  ('Pompeii', 'Robert Harris', 'History', 2003, 21),
  ('God\'s Generals: The Revivalists', 'Roberts Liardon', 'Religion', 2008, 11),
  ('God\'s Generals: The Healing Evangelists', 'Roberts Liardon', 'Religion', 2011, 4),
  ('God\'s Generals: The Roaring Reformers', 'Roberts Liardon', 'Religion', 2003, 4);

# Create the borrowers table
create table borrowers (
  borrower_id int AUTO_INCREMENT PRIMARY KEY,
  first_name varchar(50),
  last_name varchar(50),
  date_of_birth DATE,
  address varchar(200),
  mobile_number varchar(20),
  email varchar(100),
  book_id int,
  date_borrowed datetime,
  date_returned datetime,
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);

use librarydb;

# Insert borrowers into the borrowers table
insert into borrowers (first_name, last_name, date_of_birth, address, mobile_number, email, book_id, date_borrowed, date_returned)
values
('Amanda', 'Awuni', '2000-01-01', 'Upper West District', '0242229980', 'amanda@g,ail.com', 1, '2024-05-01 10:00:00', '2024-05-15 10:00:00'),
('Beatrice', 'Abraham', '2001-02-02', 'Takoradi', '0597011222', 'abraham@gmailcom', 2, '2024-05-02 10:00:00', '2024-05-16 10:00:00'),
('Sena', 'Adorkor', '2002-03-03', 'Carliforna', '0598765432', 'sena123@gmail.com', 3, '2024-05-03 10:00:00', '2024-05-17 10:00:00'),
('Francesca', 'Dzamedzi', '2003-04-04', 'Tema', '003212345', 'cesca@gmail.com', 4, '2024-05-04 10:00:00', '2024-05-18 10:00:00'),
('Claude', 'Joshua', '2004-05-05', 'Madina', '057234098', 'joshua@gmail.com', 5, '2024-05-05 10:00:00', '2024-05-19 10:00:00');

# Queries to answer the questions
# How many Diary of a Wimpy Kid books in total did you receive?
select sum(copies) as total_copies_diary from books where title like 'Diary of a Wimpy Kid%';

# How many God’s Generals books in total did you receive?
select sum(copies) as total_copies_god from books where title like 'God\'s Generals%';

# List the total number of books in each genre that were received during the month you were gone
select genre, sum(copies) as total_copies_genre from books group by genre;