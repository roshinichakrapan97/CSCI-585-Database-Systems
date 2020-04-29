DROP TABLE StudentGrades;

CREATE TABLE StudentGrades (SID INTEGER NOT NULL , ClassName VARCHAR(15) NOT NULL, Grade CHAR(3) NOT NULL);

INSERT INTO StudentGrades (SID, ClassName, Grade) VALUES (123, 'ARCH201', 'A'), (123, 'QUAN432', 'B'), (662, 'AMER352', 'B'), (662, 'ECON966', 'A'), (662, 'QUAN432', 'B'), (345, 'QUAN432', 'A'), (345, 'ECON966', 'D');

SELECT * FROM StudentGrades;

/*
+-----+-----------+-------+
| SID | ClassName | Grade |
+-----+-----------+-------+
| 123 | ARCH201   | A     |
| 123 | QUAN432   | B     |
| 662 | AMER352   | B     |
| 662 | ECON966   | A     |
| 662 | QUAN432   | B     |
| 345 | QUAN432   | A     |
| 345 | ECON966   | D     |
+-----+-----------+-------+
*/

SELECT ClassName, Count(*) AS Total FROM StudentGrades GROUP BY ClassName ORDER BY Total DESC, ClassName ASC;

/*
+-----------+-------+
| ClassName | Total |
+-----------+-------+
| QUAN432   |     3 |
| ECON966   |     2 |
| AMER352   |     1 |
| ARCH201   |     1 |
+-----------+-------+

*/
