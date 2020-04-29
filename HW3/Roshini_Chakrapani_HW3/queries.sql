create table polygonplot(name VARCHAR(30), count varchar(2)  PRIMARY KEY, coord geometry);

insert into polygonplot(name, count, coord) values ('Century Apts', '1', ST_GeomFromText('POINT(-118.28953 34.026288)'));
insert into polygonplot(name, count, coord) values ('Uytengsu AC', '2', ST_GeomFromText('POINT(-118.28846 34.022247)'));
insert into polygonplot(name, count, coord) values ('Annenberg Hall', '3', ST_GeomFromText('POINT(-118.286045 34.020237)'));
insert into polygonplot(name, count, coord) values ('SGM 123', '4', ST_GeomFromText('POINT(-118.289162 34.021225)'));
insert into polygonplot(name, count, coord) values ('Residential Clg', '5', ST_GeomFromText('POINT(-118.290087 34.019177)'));
insert into polygonplot(name, count, coord) values ('Rock Reilly', '6', ST_GeomFromText('POINT(-118.284268 34.024277)'));
insert into polygonplot(name, count, coord) values ('Mudd Hall', '7', ST_GeomFromText('POINT(-118.2862 34.019064)'));
insert into polygonplot(name, count, coord) values ('USC Hotel', '8', ST_GeomFromText('POINT(-118.281460 34.019176)'));
insert into polygonplot(name, count, coord) values ('Popovich Hall', '9', ST_GeomFromText('POINT(-118.283872 34.018608)'));
insert into polygonplot(name, count, coord) values ('Amy King', '10', ST_GeomFromText('POINT(-118.283803 34.022277)'));
insert into polygonplot(name, count, coord) values ('Galen Center', '11', ST_GeomFromText('POINT(-118.280614 34.021615)'));
insert into polygonplot(name, count, coord) values ('Spot Home', '12', ST_GeomFromText('POINT(-118.280154 34.026482)'));

select st_astext(ST_ConvexHull(ST_Collect(coord::geometry))) As polygon FROM polygonplot;
/*
POLYGON((-118.283872 34.018608,-118.285446 34.018699,-118.290359 34.019156,-118.28953 34.026288,-118.280154 34.026482,-118.280614 34.021615,-118.28146 34.019176,-118.283872 34.018608))
*/

select *, ST_Distance(coord, 'POINT(-118.280154 34.026482)'::geometry) AS dist FROM polygonplot order by polygonplot.coord <-> 'POINT(-118.280154 34.026482)'::geometry limit 5;

/*
     name     | count |                   coord                    |        dist         
--------------+-------+--------------------------------------------+---------------------

 Spot Home    | 12    | 0101000000FDF50A0BEE915DC062F71DC363034140 |                   0

 Rock Reilly  | 6     | 010100000028D3687231925DC0C2853C821B034140 |  0.0046676569068459

 Galen Center | 11    | 01010000002F336C94F5915DC0300DC347C4024140 | 0.00488868990630889

 Amy King     | 10    | 01010000006EE00ED429925DC0FC3905F9D9024140 |  0.0055675152447087

 USC Hotel    | 8     | 010100000075C8CD7003925DC01E6FF25B74024140 | 0.00742181056077263



 */

