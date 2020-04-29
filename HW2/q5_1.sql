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



SELECT DISTINCT Chef from DesserChef
WHERE Chef 
IN (
	SELECT t1.Chef FROM DesserChef t1
	JOIN OrdersTaken t2 ON t2.Dessert = t1.Dish
	GROUP BY t1.Chef
	HAVING Count(*) = (SELECT Count(*) FROM OrdersTaken)
);


/*
+------+
| Chef |
+------+
| D    |
| E    |
+------+

*/



/*

INNER QUERY :
SELECT t1.Chef FROM DesserChef t1 JOIN OrdersTaken t2 ON t2.Dessert = t1.Dish GROUP BY t1.Chef HAVING Count(*) = (SELECT Count(*) FROM OrdersTaken)

Explanation: Retrives the chefs upon doing a natural join with the DessertChef table and OrdersTaken table where the Dessert and Dish are the same , grouped by chef and having the table count equal to the OrdersTaken table count.



ENTIRE QUERY:
Explanation: Retrieves the unique chefs where the chef is in the table formed by doing a natural join with the DessertChef table and OrdersTaken table where the Dessert and Dish are the same, grouped by chef and having the table count equal to the OrdersTaken table count.

*/

