-- Script 2, learning SQL. Data from DBeaver Sample Database. Challenges from online
-- Maxim Altan-Lu Shapovalov, 30 march, 2026

-- 1) View the entire Track table. Wildcard allows us to display everything from the specific table.
select * from Track


-- 2) Find tracks that cost more than 99 cents. Display names, prices, and sort from most to least expensive
SELECT Name, UnitPrice -- what we want to display
from Track -- from which table
where UnitPrice > 0.99 -- ensure that only display tracks that cost more than 0.99
order by UnitPrice desc -- desc shows highest to lowest, while asc is default (low to high)


-- 3) Find all artists whose names start with A. Display artist's name with column header Artist Name
SELECT Name as 'Artist Name' -- specify what we want to display and how it will be shown in our result
From Artist -- specify which table we're working with
where Name like 'A%' -- ensure that it starts with A


-- 4)In the Customer Table, update the customer with ID #5 to 1600 Pennsylvania Ave NW, Washington, DC, 20500
-- first, must glance at entire table to understand what we're working with
select * from Customer; -- semicolon ensures that this line ends
-- after the analysis. we must change Address, City, State, Country, and PostalCode
-- second, ensure that we can visualize just the row where customer id is 5
select *
from Customer 
where CustomerId = '5';
-- third, perform the change
update Customer -- specify what table we want to update
set Address = '1600 Pennsylvania Ave NW',  -- provide the details
City = 'Washington', 
State = 'DC',
Country = 'USA',
PostalCode = '20002'
where CustomerId = '5' -- specify which row will see these changes


-- 5) write a query that shows a list of album titles and their corresponding artist's name
-- must use table Album for former and Artist for latter. Key function is Inner Join
select album.title as 'Album Title', artist.name as 'Artist Name'
from Album
inner join artist on album.ArtistId = artist.ArtistId
where album.title like 'Z%'; -- optional: show onlu titles that start with Z


-- 5 alt) write a query that shows the customer name and their invoice total (same as #5, different tables)
-- must use table Customer for former and Invoice for latter
select customer.firstname, customer.lastname, invoice.total -- specify all things we wish to display
from Customer -- choose initial table
inner join Invoice on Customer.CustomerId = invoice.CustomerId -- specify what we're connecting with and based on what common column


-- 6) using 3 separate tables, list a track name with album title and artist name for all tracks
select track.name as 'Track Name', album.title as 'Album Title', artist.name as 'Artist'
from Track
inner join album on track.AlbumId = album.AlbumId 
inner join artist on album.ArtistId = artist.ArtistId 
order by album.Title desc; -- bonus: order by album title in a descending order


-- 7) show each artist's name and total number of albums they have
select artist.name, -- we want to see the artist's name
count(album.AlbumId) as 'Total number of albums' -- and how many albums they had total
from Artist -- start with the artist table
inner join album on album.ArtistId = artist.ArtistId -- and connect it with the album table
group by artist.Name; -- crucial: make sure we list each artist


-- 7 alt) show how many invoices each customer has
select customer.firstname as 'First Name', customer.lastname as 'Last Name', -- what we want to display and how
count(invoice.InvoiceId) as 'Number of Invoices' -- sum up number of invoices
from Customer -- start with one table
inner join invoice on customer.CustomerId = invoice.CustomerId -- join it with another table
group by customer.LastName -- make sure each person is displayed
order by FirstName -- ensure certain order


-- 8) find artists who have more than 10 albums, show their name and album count
select artist.name as 'Artist Name', -- get artist's name
count(album.AlbumId) as 'Number of Albums' -- count how many albums
from Artist -- start with getting info from the Artist table
inner join album on artist.ArtistId = album.ArtistId -- join with the album table
group by artist.name -- ensure we display it by artists
having count(album.albumid) > 10 -- set filter to show artists with 10+ albums
order by 'Number of Albums' desc; -- set order from least to most

































