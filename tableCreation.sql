-- Table: public.base

-- DROP TABLE public.base;

CREATE TABLE public.base
(
    internal_id serial primary key,
    time_stamp double precision,
    x double precision,
    y double precision,
    z double precision,
    roll double precision,
    pitch double precision,
    yaw double precision,
    geom2d geometry(Point, 6527)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.base
    OWNER to postgres;

CREATE TABLE CR634 ( like base including all);
CREATE TABLE I295 ( like base including all);
CREATE TABLE NJ31 ( like base including all);
CREATE TABLE NJ31_CR518 ( like base including all);
CREATE TABLE SR571 ( like base including all);
CREATE TABLE US130_SR571 ( like base including all);

copy public.CR634 (time_stamp, x, y, z, roll, pitch, yaw) FROM 'C:\AppDev\HyRoad Data\Trajectory Files\Base\CR634.txt' DELIMITER ',' CSV HEADER;
copy public.I295 (time_stamp, x, y, z, roll, pitch, yaw) FROM 'C:\AppDev\HyRoad Data\Trajectory Files\Base\I295.txt' DELIMITER ',' CSV HEADER;
copy public.NJ31 (time_stamp, x, y, z, roll, pitch, yaw) FROM 'C:\AppDev\HyRoad Data\Trajectory Files\Base\NJ31.txt' DELIMITER ',' CSV HEADER;
copy public.NJ31_CR518 (time_stamp, x, y, z, roll, pitch, yaw) FROM 'C:\AppDev\HyRoad Data\Trajectory Files\Base\NJ31_CR518.txt' DELIMITER ',' CSV HEADER;
copy public.SR571 (time_stamp, x, y, z, roll, pitch, yaw) FROM 'C:\AppDev\HyRoad Data\Trajectory Files\Base\SR571.txt' DELIMITER ',' CSV HEADER;
copy public.US130_SR571 (time_stamp, x, y, z, roll, pitch, yaw) FROM 'C:\AppDev\HyRoad Data\Trajectory Files\Base\US130_SR571.txt' DELIMITER ',' CSV HEADER;

UPDATE CR634 SET geom2d = ST_SetSRID(ST_MakePoint(x, y), 6527);
UPDATE I295 SET geom2d = ST_SetSRID(ST_MakePoint(x, y), 6527);
UPDATE NJ31 SET geom2d = ST_SetSRID(ST_MakePoint(x, y), 6527);
UPDATE NJ31_CR518 SET geom2d = ST_SetSRID(ST_MakePoint(x, y), 6527);
UPDATE SR571 SET geom2d = ST_SetSRID(ST_MakePoint(x, y), 6527);
UPDATE US130_SR571 SET geom2d = ST_SetSRID(ST_MakePoint(x, y), 6527);