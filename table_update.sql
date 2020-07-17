-- DROP TABLE public.run_coverage_sans_id;

ALTER TABLE run_coverage RENAME TO run_coverage_sans_id;

CREATE TABLE public.run_coverage
(
    internal_id serial primary key,
	record text,
    geom geometry
)

TABLESPACE pg_default;

ALTER TABLE public.run_coverage_sans_id
    OWNER to postgres;
	
INSERT INTO run_coverage (record,geom) SELECT record, geom FROM run_coverage_sans_id
