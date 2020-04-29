DROP TABLE DesserChef;
DROP TABLE OrdersTaken;


CREATE TABLE DesserChef (Chef char(3) NOT NULL, Dish varchar(25) NOT NULL);

CREATE TABLE OrdersTaken(Dessert varchar(25) NOT NULL);
INSERT INTO DesserChef(Chef, Dish) VALUES ('A', 'Apple pie'),('A', 'Beignet'), ('A', 'Andes Chocolate Cake'), ('B', 'Tiramisu'), ('B', 'Creme brulee'), ('B', 'Beignet'), ('C', 'Tiramisu'), ('C', 'Creme brulee'), ('D', 'Apple pie'), ('D', 'Tiramisu'), ('D', 'Creme brulee'), ('E', 'Apple pie'), ('E', 'Bananas Foster'), ('E', 'Creme brulee'), ('E', 'Tiramisu');


SELECT * FROM DesserChef;

/*
+------+----------------------+
| Chef | Dish                 |
+------+----------------------+
| A    | Apple pie            |
| A    | Beignet              |
| A    | Andes Chocolate Cake |
| B    | Tiramisu             |
| B    | Creme brulee         |
| B    | Beignet              |
| C    | Tiramisu             |
| C    | Creme brulee         |
| D    | Apple pie            |
| D    | Tiramisu             |
| D    | Creme brulee         |
| E    | Apple pie            |
| E    | Bananas Foster       |
| E    | Creme brulee         |
| E    | Tiramisu             |
+------+----------------------+
*/



INSERT INTO OrdersTaken VALUES ('Creme brulee'), ('Apple pie'), ('Tiramisu');

SELECT * FROM OrdersTaken;

/*
+--------------+
| Dessert      |
+--------------+
| Creme brulee |
| Apple pie    |
| Tiramisu     |
+--------------+
*/


SELECT Chef FROM DesserChef AS dc 
WHERE NOT EXISTS 
( 
	SELECT ot.Dessert FROM OrdersTaken as ot 
	WHERE ot.Dessert NOT IN 
	( 
		SELECT udc.Dish FROM DesserChef udc 
		WHERE udc.Chef = dc.Chef
	)
)
GROUP BY Chef;


/*
+------+
| Chef |
+------+
| D    |
| E    |
+------+

*/



/*
INNER QUERY 1:

SELECT ot.Dessert FROM OrdersTaken as ot 
	WHERE ot.Dessert NOT IN 
	( 
		SELECT udc.Dish FROM DesserChef udc 
		WHERE udc.Chef = dc.Chef
	)
Explanation: Retrieves the all the desserts that is made by the currently selected chef where this dessert is not in the dishes ordered in the OrdersTaken Table by the currently selected chef.


ENTIRE QUERY:
Explanation: Retrieves the chefs where the (all the desserts that is made by the currently selected chef where this dessert is not in the dishes ordered in the OrdersTaken Table by the currently selected chef) doesn't exist or is empty.



*/
