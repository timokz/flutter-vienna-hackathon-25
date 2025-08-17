BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "vote" DROP COLUMN "quote";

--
-- MIGRATION VERSION FOR wien_talks
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wien_talks', '20250816214717668', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250816214717668', "timestamp" = now();

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
