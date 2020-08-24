-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
    Select Product.ProductName, Category.CategoryName 
    from Product
    join Category
    on Category.id = Product.Categoryid;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
    Select 'id', 'companyname', 'shippeddate'
    from[order] 
    join shipper
    on [order].shipvia = shipper.id
    where[order].orderdate < '2012-08-09'
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
    select Product.ProductName, orderdetail.quantity
    from Product
    join orderdetail
        on orderdetail.productid = product.id
    where orderdetail.orderid = '10251'
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
    select [order].id as 'order_id',
            customer.companyname as 'company_name',
            employee.lastname as 'employee_last_name'
    from [order]
    join customer
        on[order].customerid = customer.id
    join employee
        on [order].employeeid = employee.id