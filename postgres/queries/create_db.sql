CREATE TABLE "user" (
  "username" TEXT PRIMARY KEY NOT NULL,
  "password" TEXT
);

CREATE TABLE "user_profile" (
  "id" SERIAL PRIMARY KEY,
  "username" TEXT NOT NULL,
  "first_name" TEXT,
  "last_name" TEXT
);

CREATE TABLE "price_category" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL
);

CREATE TABLE "item_category" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL
);

CREATE TABLE "advertisement" (
  "id" SERIAL PRIMARY KEY,
  "title" TEXT NOT NULL,
  "description" TEXT,
  "latitude" REAL NOT NULL,
  "longitude" REAL NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "owner" INT NOT NULL,
  "price_category" INT
);

CREATE TABLE "advertisement_image" (
  "id" SERIAL PRIMARY KEY,
  "url" TEXT NOT NULL,
  "advertisement" INT NOT NULL
);

CREATE TABLE "advertisement_match" (
  "id" SERIAL PRIMARY KEY,
  "advertisement_one" INT NOT NULL,
  "advertisement_two" INT NOT NULL
);

CREATE TABLE "advertisement_like" (
  "id" SERIAL PRIMARY KEY,
  "user" INT NOT NULL,
  "advertisement" INT NOT NULL
);

CREATE TABLE "advertisement_item_category" (
  "id" SERIAL PRIMARY KEY,
  "advertisement" INT NOT NULL,
  "item_category" INT NOT NULL
);

CREATE TABLE "message" (
  "id" SERIAL PRIMARY KEY,
  "content" TEXT NOT NULL,
  "advertisement_match" INT NOT NULL,
  "sender" INT NOT NULL,
  "receiver" INT NOT NULL,
  "created_at" TIMESTAMP NOT NULL
);

ALTER TABLE "user" ADD FOREIGN KEY ("username") REFERENCES "user_profile" ("id");

ALTER TABLE "advertisement" ADD FOREIGN KEY ("owner") REFERENCES "user_profile" ("id");

ALTER TABLE "price_category" ADD FOREIGN KEY ("id") REFERENCES "advertisement" ("price_category");

ALTER TABLE "advertisement" ADD FOREIGN KEY ("id") REFERENCES "advertisement_image" ("advertisement");

ALTER TABLE "advertisement" ADD FOREIGN KEY ("id") REFERENCES "advertisement_match" ("advertisement_one");

ALTER TABLE "advertisement" ADD FOREIGN KEY ("id") REFERENCES "advertisement_match" ("advertisement_two");

ALTER TABLE "user_profile" ADD FOREIGN KEY ("id") REFERENCES "advertisement_like" ("user");

ALTER TABLE "advertisement" ADD FOREIGN KEY ("id") REFERENCES "advertisement_like" ("advertisement");

ALTER TABLE "advertisement_item_category" ADD FOREIGN KEY ("advertisement") REFERENCES "advertisement" ("id");

ALTER TABLE "advertisement_item_category" ADD FOREIGN KEY ("item_category") REFERENCES "item_category" ("id");

ALTER TABLE "message" ADD FOREIGN KEY ("advertisement_match") REFERENCES "advertisement_match" ("id");

ALTER TABLE "message" ADD FOREIGN KEY ("sender") REFERENCES "user_profile" ("id");

ALTER TABLE "message" ADD FOREIGN KEY ("receiver") REFERENCES "user_profile" ("id");
