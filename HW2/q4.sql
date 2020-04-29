DROP TABLE JunkMail;

CREATE TABLE JunkMail (Name VARCHAR(25) NOT NULL, Address CHAR(2) NOT NULL, ID INTEGER NOT NULL, SameFam INTEGER);

INSERT INTO JunkMail (Name, Address, ID, SameFam) VALUES ('Alice', 'A',10, NULL), ('Bob', 'B', 15, NULL), ('CARMEN', 'C' , 22, NULL), ('DIEGO', 'A', 9, 10), ('ELLA', 'B',3,15),('FARKHAD', 'D',11, NULL);

SELECT * FROM JunkMail;
/*
+---------+---------+----+---------+
| Name    | Address | ID | SameFam |
+---------+---------+----+---------+
| Alice   | A       | 10 |    NULL |
| Bob     | B       | 15 |    NULL |
| CARMEN  | C       | 22 |    NULL |
| DIEGO   | A       |  9 |      10 |
| ELLA    | B       |  3 |      15 |
| FARKHAD | D       | 11 |    NULL |
+---------+---------+----+---------+
*/


DELETE row_data
FROM JunkMail row_data
INNER JOIN JunkMail row_data1
ON row_data.ID = row_data1.SameFam
AND row_data.SameFam IS NULL;

SELECT * FROM JunkMail;
