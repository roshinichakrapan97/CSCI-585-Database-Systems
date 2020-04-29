DROP TABLE ProjectsTrack;

CREATE TABLE ProjectsTrack (ProjectID VARCHAR(20) NOT NULL, Step INTEGER NOT NULL, Status CHAR(2) NOT NULL);

INSERT INTO ProjectsTrack (ProjectID, Step, Status) VALUES('P100',0,'C'),('P100',1,'W'),('P100',2,'W'),('P201',0,'C'),('P201',1,'C'),('P333',0,'W'),('P333',1,'W'),('P333',2,'W'),('P333',3, 'W');

SELECT * FROM ProjectsTrack;

/*
+-----------+------+--------+
| ProjectID | Step | Status |
+-----------+------+--------+
| P100      |    0 | C      |
| P100      |    1 | W      |
| P100      |    2 | W      |
| P201      |    0 | C      |
| P201      |    1 | C      |
| P333      |    0 | W      |
| P333      |    1 | W      |
| P333      |    2 | W      |
| P333      |    3 | W      |
+-----------+------+--------+
*/

SELECT ProjectID FROM ProjectsTrack as pt1 
WHERE Step = 0 AND Status = 'C'
AND 'W' = ALL ( SELECT Status 
FROM ProjectsTrack AS pt2 
WHERE Step <> 0 
AND pt1.ProjectID = pt2.ProjectID);


/*
+-----------+
| ProjectID |
+-----------+
| P100      |
+-----------+
*/

