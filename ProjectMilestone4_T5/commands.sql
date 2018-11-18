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
CREATE TABLE "gcSchema".users
(
    id integer NOT NULL DEFAULT nextval('"gcSchema".users_id_seq'::regclass),
    username character varying(64) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    hashpass character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "pictureURL" text COLLATE pg_catalog."default",
    "aboutMe" text COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "gcSchema".users
    OWNER to postgres;
COMMENT ON TABLE "gcSchema".users
    IS 'table for storing user information';

--Game Ratings
CREATE TABLE "gcSchema"."Game Ratings"
(
    username character varying(64) NOT NULL,
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
    CONSTRAINT "Game Ratings_pkey" PRIMARY KEY ("username"),
    CONSTRAINT "Game Ratings_fkey" FOREIGN KEY ("username")
    REFERENCES "gcSchema".users ("username")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "gcSchema"."Game Ratings"
    OWNER to postgres;
COMMENT ON TABLE "gcSchema"."Game Ratings"
    IS 'table for storing game ratings';

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
    IS 'A table with information about the games';


--Applying additional constraints
ALTER TABLE "gcSchema".users
    ADD CONSTRAINT users_username_key UNIQUE (username);

ALTER TABLE "gcSchema".users
    ADD CONSTRAINT users_email_key UNIQUE (email);

--Some scripts to add some table data
INSERT INTO "gcSchema".users(username, email, hashpass)
VALUES ('scramble_campbell', 'scramble_campbell@gmail.com', '1234');

INSERT INTO "gcSchema"."Game Ratings" (username, game_a, game_c, game_w)
VALUES ('scramble_campbell', 5, 5, 5);

INSERT INTO "gcSchema".users(username, email, hashpass)
VALUES ('martin_the_carton', 'martin_the_carton@outlook.com', '1234');

INSERT INTO "gcSchema"."Game Ratings" (username, game_b, game_x, game_y)
VALUES ('martin_the_carton', 1, 3, 4);

INSERT INTO "gcSchema"."Game Info" ("gameName", "gameDescription")
VALUES ('game_b', 'Ever wanted to play a video game all about the letter b?
    \nneither did we, but we went ahead and made one anyway!');