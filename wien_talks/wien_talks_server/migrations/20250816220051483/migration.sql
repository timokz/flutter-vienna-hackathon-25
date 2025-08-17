BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "health" (
    "id" bigserial PRIMARY KEY,
    "createdAt" timestamp without time zone NOT NULL,
    "note" text
);

--
-- ACTION DROP TABLE
--
DROP TABLE "vote" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "vote" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "quoteId" bigint NOT NULL,
    "upvote" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR wien_talks
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wien_talks', '20250816220051483', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250816220051483', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
