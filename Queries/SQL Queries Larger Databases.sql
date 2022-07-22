--E1
SELECT distinct FirstName, LastName, City, Country
  FROM Customers inner join invoices
                 on Customers.CustomerId = invoices.CustomerId
                 inner join invoice_items
                 on invoices.invoiceId = invoice_items.invoiceId
                 inner join tracks
                 on invoice_items.TrackId = tracks.TrackId
                 inner join albums
                 on albums.AlbumId = tracks.AlbumId
                 inner join artists
                 on artists.ArtistId = albums.ArtistId
where artists.Name = 'Metallica';

--Q1
SELECT * 
FROM customers
Where Country  like 'I%';

--Q2
SELECT * FROM customers
Where City  like '%n';

--Q3
SELECT * FROM tracks
Where Name  like '%love%';

--Q4
SELECT * 
FROM employees
where BirthDate like '____-09-%';

--E2
SELECT Count(CustomerId)
FROM customers
where Country is 'USA' AND PostalCode like '95%';

--Q5
select Country, Count(CustomerId) as CountryCount
From Customers
Group by Country
Order by CountryCount desc;

--E3
SELECT distinct Customers.CustomerId, FirstName, LastName, Count(tracks.TrackId) as trackCount
  FROM Customers inner join invoices
                 on Customers.CustomerId = invoices.CustomerId
                 inner join invoice_items
                 on invoices.invoiceId = invoice_items.invoiceId
                 inner join tracks
                 on invoice_items.TrackId = tracks.TrackId
where tracks.Name like '%love%'
Group by Customers.CustomerId
Order by trackCount desc;

--E4 
select genres.GenreID, genres.Name, count(invoice_items.InvoiceLineId) as purchaseCount
from genres
    inner join tracks
    on genres.GenreId = tracks.GenreId
    inner join invoice_items
    on invoice_items.TrackId = tracks.TrackId
Group by genres.GenreID
Order by purchaseCount desc;

--Q6 
Select Country, count(CustomerID) as CountryCount
From customers
Group by Country
Having CountryCount > 3
Order by CountryCount Desc;

--E5 
Select Country, sum(UnitPrice*Quantity) as Sales
From customers join invoices
                    on customers.CustomerId = invoices.CustomerId
               join invoice_items
                    on invoices.InvoiceId = invoice_items.InvoiceId
group by Country
having Sales > 50
Order by Sales Desc;


--E6
Select FirstName, LastName from customers
Where Country in (
Select Country
From customers join invoices
                    on customers.CustomerId = invoices.CustomerId
               join invoice_items
                    on invoices.InvoiceId = invoice_items.InvoiceId
group by Country
having sum(UnitPrice*Quantity) > 200
);

