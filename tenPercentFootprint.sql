CREATE TABLE footprint ( like base including all);

INSERT INTO footprint (time_stamp, x, y, z, roll, pitch, yaw, geom2d)
SELECT time_stamp, x, y, z, roll, pitch, yaw, geom2d FROM (

SELECT time_stamp, x, y, z, roll, pitch, yaw, geom2d
FROM (SELECT *, row_number() OVER(ORDER BY time_stamp ASC) AS row FROM cr634) t
WHERE t.row % 10 = 0

union all

SELECT time_stamp, x, y, z, roll, pitch, yaw, geom2d
FROM (SELECT *, row_number() OVER(ORDER BY time_stamp ASC) AS row FROM I295) t
WHERE t.row % 10 = 0
union all

SELECT time_stamp, x, y, z, roll, pitch, yaw, geom2d
FROM (SELECT *, row_number() OVER(ORDER BY time_stamp ASC) AS row FROM NJ31) t
WHERE t.row % 10 = 0
union all

SELECT time_stamp, x, y, z, roll, pitch, yaw, geom2d
FROM (SELECT *, row_number() OVER(ORDER BY time_stamp ASC) AS row FROM nj31_cr518) t
WHERE t.row % 10 = 0

union all

SELECT time_stamp, x, y, z, roll, pitch, yaw, geom2d
FROM (SELECT *, row_number() OVER(ORDER BY time_stamp ASC) AS row FROM sr571) t
WHERE t.row % 10 = 0

union all

SELECT time_stamp, x, y, z, roll, pitch, yaw, geom2d
FROM (SELECT *, row_number() OVER(ORDER BY time_stamp ASC) AS row FROM us130_sr571) t
WHERE t.row % 10 = 0
) as foo