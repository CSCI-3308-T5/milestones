--creating the database
CREATE DATABASE "gconnect0.1"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "gconnect0.1"
    IS 'test database for game connect project';

--creating the schema
CREATE SCHEMA "gcSchema"
	AUTHORIZATION postgres;

--user table
CREATE TABLE "gcSchema"."User Table"
(
    username character varying(40) COLLATE pg_catalog."default" NOT NULL,
    "loginID" integer NOT NULL,
    "gameID" integer NOT NULL,
    "aboutMe" text COLLATE pg_catalog."default",
    "pictureURL" text COLLATE pg_catalog."default",
    CONSTRAINT "User Table_pkey" PRIMARY KEY (username)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "gcSchema"."User Table"
    OWNER to postgres;
COMMENT ON TABLE "gcSchema"."User Table"
    IS 'the first iteration of the user table';

--Login Table:

CREATE TABLE "gcSchema"."Login Table"
(
    "LoginID" integer NOT NULL,
    email character varying(50) COLLATE pg_catalog."default" NOT NULL,
    salt character(128) COLLATE pg_catalog."default" NOT NULL,
    phash character varying(64) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Login Table_pkey" PRIMARY KEY ("LoginID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "gcSchema"."Login Table"
    OWNER to postgres;
COMMENT ON TABLE "gcSchema"."Login Table"
    IS 'First iteration of the login table';

--Game Ratings
CREATE TABLE "gcSchema"."Game Ratings"
(
    "gamesID" integer NOT NULL,
    game_a smallint,
    game_b smallint,
    game_c smallint,
    game_d smallint,
    game_e smallint,
    game_f smallint,
    game_g smallint,
    game_h smallint,
    game_i smallint,
    game_j smallint,
    game_k smallint,
    game_l smallint,
    game_m smallint,
    game_n smallint,
    game_o smallint,
    game_p smallint,
    game_q smallint,
    game_r smallint,
    game_s smallint,
    game_t smallint,
    game_u smallint,
    game_v smallint,
    game_w smallint,
    game_x smallint,
    game_y smallint,
    game_z smallint,
    CONSTRAINT "Game Ratings_pkey" PRIMARY KEY ("gamesID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "gcSchema"."Game Ratings"
    OWNER to postgres;
COMMENT ON TABLE "gcSchema"."Game Ratings"
    IS 'first iteration of game ratings table';

--Game Info
CREATE TABLE "gcSchema"."Game Info"
(
    "gameName" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "gameDescription" text COLLATE pg_catalog."default",
    "pictureURL" text COLLATE pg_catalog."default",
    CONSTRAINT "Game Info_pkey" PRIMARY KEY ("gameName")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "gcSchema"."Game Info"
    OWNER to postgres;
COMMENT ON TABLE "gcSchema"."Game Info"
    IS 'first iteration of game info table';

--TODO Set Up Foriegn Keys