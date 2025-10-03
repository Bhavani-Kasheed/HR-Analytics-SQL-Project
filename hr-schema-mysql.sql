SELECT * FROM northwind.product
where unitPrice > 30 
ORDER BY unitPrice DESC LIMIT 5;
select companyName, city from northwind.customer
where city = 'London' or 'Berlin' AND fax is NOT NULL order by city ; 
select * from northwind.customer
where city = 'Paris';
delete from customer where city = 'Paris';
DELETE FROM Customer WHERE City = 'Paris';
select * from northwind.customer
limit 10 ; 



