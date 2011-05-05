DROP TABLE IF EXISTS "users";
CREATE TABLE "users" ("id" integer primary key autoincrement not null, "username" varchar(255), "crypted_password" varchar(255), "password_salt" varchar(255), "persistence_token" varchar(255), "login_count" integer DEFAULT 0 NOT NULL, "failed_login_count" integer DEFAULT 0 NOT NULL, "last_request_at" datetime, "current_login_at" datetime, "last_login_at" datetime, "current_login_ip" varchar(255), "last_login_ip" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "users" VALUES(1,'admin','16ead44da718a80ba56de33daf9602b2584633603c2b4fd6d0093be4e7f240cacd09fc12ca72dbcbbc5a3c64820e6e334bd3337379394a99fb9fda72bb7cd610','53tBnmdUHk3o58Qm1Tly','135172f9d8cd93dccb02b163b5f05fe464d5d16a36a4ab386f1a9d28fdd80b5d6945d7569179f656e29341122af0f25fab3d7cdd11d79cc89d4353b9cb029872',24,0,'2011-05-04 01:23:10.000000','2011-05-04 01:16:33.187000','2011-04-22 13:05:35.203000','127.0.0.1','127.0.0.1','2011-04-08 15:34:19.500000','2011-05-04 01:23:10.000000');
INSERT INTO "users" VALUES(2,'user','39deeae89358edf5d2c303ee117c08d3474376d30ee83fa178ca7ad3dd6ce60bdc1e4d32d647798f8701ec3769b56e31e04c458a86b9828457b96106ab932fba','dJSTTstVshvDIllfC0cv','6f209060a076949279c586eeb2fafe6eacf771fd84ccd5d1cec0ee68201103dfa11a06be62c1a022caccc32eacd12150d06b466a05eb119b655603fce62c3b1d',5,0,'2011-04-18 22:31:53.546000','2011-04-18 21:37:34.203000','2011-04-18 21:37:16.953000','127.0.0.1','127.0.0.1','2011-04-08 15:34:58.171000','2011-04-18 22:31:53.562000');
