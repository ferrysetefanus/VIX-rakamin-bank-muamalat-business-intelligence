CREATE TABLE master_table AS (
	SELECT o.orderid, o.date, p.prodnumber, p.prodname, pc.categoryname,
	c.customerid, c.firstname, c.lastname, c.customercity, c.customerstate,
	o.quantity, p.price, (o.quantity * p.price) as total
	FROM orders as o
	LEFT JOIN product as p
	ON o.prodnumber = p.prodnumber
	LEFT JOIN product_category as pc
	ON p.category = pc.categoryid
	LEFT JOIN customer as c
	ON o.customerid = c.customerid
	ORDER BY o.orderid ASC
)