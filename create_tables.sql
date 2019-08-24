--
--DROP DATABASE IF EXISTS "toronto_library_db"
--
--CREATE DATABASE "toronto_library_db"
--    WITH 
--    OWNER = postgres
--    ENCODING = 'UTF8'
--    LC_COLLATE = 'English_Canada.1252'
--    LC_CTYPE = 'English_Canada.1252'
--    TABLESPACE = pg_default
--    CONNECTION LIMIT = -1;

CREATE TABLE "nbhd" (
    "id" int   NOT NULL,
    "name" varchar(100)   NULL,
    CONSTRAINT "pk_nbhd" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "ward_region" (
    "id" int   NOT NULL,
    "name" varchar(100)   NULL,
    CONSTRAINT "pk_ward_region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "branch" (
    "id" varchar(4)   NOT NULL,
    "name" varchar(50)   NULL,
    "tier" char(2)   NULL,
    "address" varchar(60)   NULL,
    "contact_no" varchar(15)   NULL,
    "postal_code" char(7)   NULL,
    "fsa" char(3)   NULL,
    "nbhd_no" int   NULL,
    "ward_no" int   NULL,
    CONSTRAINT "pk_branch" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "age_group" (
    "id" int   NOT NULL,
    "name" varchar(10)   NULL,
    CONSTRAINT "pk_age_group" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "active_cardholders" (
    "age_group_id" int   NOT NULL,
    "branch_id" varchar(4)   NOT NULL,
    "year" char(4)   NOT NULL,
    "value" int   NULL,
    CONSTRAINT "pk_active_cardholders" PRIMARY KEY (
        "age_group_id","branch_id","year"
     )
);

CREATE TABLE "annual_visits" (
    "branch_id" varchar(4)   NOT NULL,
    "year" char(4)   NOT NULL,
    "value" int   NULL,
    CONSTRAINT "pk_annual_visits" PRIMARY KEY (
        "branch_id","year"
     )
);

CREATE TABLE "catchment_population" (
    "branch_id" varchar(4)   NOT NULL,
    "year" char(4)   NOT NULL,
    "value" int   NULL,
    CONSTRAINT "pk_catchment_population" PRIMARY KEY (
        "branch_id","year"
     )
);

CREATE TABLE "collection_size" (
    "branch_id" varchar(4)   NOT NULL,
    "year" char(4)   NOT NULL,
    "value" int   NULL,
    CONSTRAINT "pk_collection_size" PRIMARY KEY (
        "branch_id","year"
     )
);

CREATE TABLE "hours_of_operation" (
    "branch_id" varchar(4)   NOT NULL,
    "day" varchar(10)   NULL,
    "duration" varchar(5)   NULL,
    "hours" varchar(20)   NULL,
    CONSTRAINT "pk_hours_of_operation" PRIMARY KEY (
        "branch_id","day"
     )
);

CREATE TABLE "new_registrations" (
    "branch_id" varchar(4)   NOT NULL,
    "year" char(4)   NULL,
    "value" int   NULL,
    CONSTRAINT "pk_new_registrations" PRIMARY KEY (
        "branch_id","year"
     )
);

CREATE TABLE "registered_cardholders" (
    "age_group_id" int   NOT NULL,
    "branch_id" varchar(4)   NOT NULL,
    "year" char(4)   NOT NULL,
    "value" int   NULL,
    CONSTRAINT "pk_registered_cardholders" PRIMARY KEY (
        "age_group_id","branch_id","year"
     )
);

CREATE TABLE "circulation" (
    "age_group_id" int   NOT NULL,
    "branch_id" varchar(4)   NOT NULL,
    "year" char(4)   NOT NULL,
    "value" int   NULL,
    CONSTRAINT "pk_circulation" PRIMARY KEY (
        "age_group_id","branch_id","year"
     )
);

CREATE TABLE "workstations" (
    "branch_id" varchar(4)   NOT NULL,
    "value" int   NULL,
    CONSTRAINT "pk_workstations" PRIMARY KEY (
        "branch_id"
     )
);

CREATE TABLE "workstation_users" (
    "branch_id" varchar(4)   NOT NULL,
    "year" char(4)   NULL,
    "value" int   NULL,
    CONSTRAINT "pk_workstation_users" PRIMARY KEY (
        "branch_id","year"
     )
);

CREATE TABLE "events" (
    "id" int   NOT NULL,
    "title" varchar(250)   NULL,
    "date" varchar(50)   NULL,
    "time" varchar(10)   NULL,
    "enddate" varchar(50)   NULL,
    "description" text   NULL,
    "library" varchar(50)   NULL,
    "link" text   NULL,
    "date1" date   NULL,
    "age_group" varchar(100)   NULL,
    CONSTRAINT "pk_events" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "branch_wiki_data" (
    "id" varchar(4)   NOT NULL,
	"name" varchar(50)   NULL,
	"neighbourhood" varchar(50)   NULL,
	"year_built" char(4) NULL,
	"year_opened" char(4) NULL,
	"collection_size" int NULL,
	"note" text NULL,
    "year" char(4)   NULL,
    CONSTRAINT "pk_workstation_users" PRIMARY KEY (
        "id"
     )
);


ALTER TABLE "branch" ADD CONSTRAINT "fk_branch_nbhd_no" FOREIGN KEY("nbhd_no")
REFERENCES "nbhd" ("id");

ALTER TABLE "branch" ADD CONSTRAINT "fk_branch_ward_no" FOREIGN KEY("ward_no")
REFERENCES "ward_region" ("id");

ALTER TABLE "active_cardholders" ADD CONSTRAINT "fk_active_cardholders_age_group_id" FOREIGN KEY("age_group_id")
REFERENCES "age_group" ("id");

ALTER TABLE "active_cardholders" ADD CONSTRAINT "fk_active_cardholders_branch_id" FOREIGN KEY("branch_id")
REFERENCES "branch" ("id");

ALTER TABLE "annual_visits" ADD CONSTRAINT "fk_annual_visits_branch_id" FOREIGN KEY("branch_id")
REFERENCES "branch" ("id");

ALTER TABLE "catchment_population" ADD CONSTRAINT "fk_catchment_population_branch_id" FOREIGN KEY("branch_id")
REFERENCES "branch" ("id");

ALTER TABLE "collection_size" ADD CONSTRAINT "fk_collection_size_branch_id" FOREIGN KEY("branch_id")
REFERENCES "branch" ("id");

ALTER TABLE "hours_of_operation" ADD CONSTRAINT "fk_hours_of_operation_branch_id" FOREIGN KEY("branch_id")
REFERENCES "branch" ("id");

ALTER TABLE "new_registrations" ADD CONSTRAINT "fk_new_registrations_branch_id" FOREIGN KEY("branch_id")
REFERENCES "branch" ("id");

ALTER TABLE "registered_cardholders" ADD CONSTRAINT "fk_registered_cardholders_age_group_id" FOREIGN KEY("age_group_id")
REFERENCES "age_group" ("id");

ALTER TABLE "registered_cardholders" ADD CONSTRAINT "fk_registered_cardholders_branch_id" FOREIGN KEY("branch_id")
REFERENCES "branch" ("id");

ALTER TABLE "circulation" ADD CONSTRAINT "fk_circulation_age_group_id" FOREIGN KEY("age_group_id")
REFERENCES "age_group" ("id");

ALTER TABLE "circulation" ADD CONSTRAINT "fk_circulation_branch_id" FOREIGN KEY("branch_id")
REFERENCES "branch" ("id");

ALTER TABLE "workstations" ADD CONSTRAINT "fk_workstations_branch_id" FOREIGN KEY("branch_id")
REFERENCES "branch" ("id");

ALTER TABLE "workstation_users" ADD CONSTRAINT "fk_workstation_users_branch_id" FOREIGN KEY("branch_id")
REFERENCES "branch" ("id");
