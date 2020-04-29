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

SELECT Chef FROM DesserChef
WHERE Dish IN (SELECT Dessert FROM OrdersTaken GROUP BY Dessert)
GROUP BY Chef
HAVING Count(DISTINCT Dish) = (SELECT COUNT(DISTINCT Dessert) FROM OrdersTaken);
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
SELECT DISTINCT Dessert FROM OrdersTaken

Explanation: Retrieves the unique desserts that have been ordered from the OrdersTaken Table.



INNER QUERY 2:
SELECT COUNT(DISTINCT Dessert) FROM OrdersTaken

Explanation: Retrieves the count of distinct desserts that have been ordered from the OrdersTaken Table.


ENTIRE QUERY:
Explanation: Retrieves the chefs whose dishes are a part of the unique desserts from the OrdersTaken Table and it is grouped by the chefs with the unique dish count being equal to unique dessert count in the OrdersTaken table.


*/

