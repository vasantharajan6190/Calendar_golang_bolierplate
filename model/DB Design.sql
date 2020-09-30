CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "event" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "user_id" int,
  "event_type" enum,
  "all_day_remainder" boolean,
  "start_date" date NOT NULL,
  "end_date" date,
  "start_time" varchar,
  "end_time" varchar,
  "meet_link" varchar,
  "location" varchar,
  "description" varchar,
  "time_slot_duration" varchar,
  "slot_single_slot" boolean,
  "message_for_out_of_office" varchar,
  "automate_decline_all_meetings" boolean,
  "repeat_for_every" varchar,
  "repeat_on" varchar,
  "repeat_end_on" varchar,
  "status_of_user" enum,
  "data_visibility" enum
);

CREATE TABLE "guest" (
  "id" SERIAL PRIMARY KEY,
  "guest_name" varchar,
  "email" varchar,
  "event_id" int NOT NULL,
  "color" varchar,
  "attending_status" enum
);

CREATE TABLE "attachment" (
  "id" SERIAL PRIMARY KEY,
  "attachment_path" varchar,
  "user_id" int NOT NULL,
  "event_id" int NOT NULL
);

CREATE TABLE "notification" (
  "id" SERIAL PRIMARY KEY,
  "notification" varchar,
  "user_id" int NOT NULL,
  "event_id" int NOT NULL,
  "date_before" varchar,
  "days" varchar
);

CREATE TABLE "guest_permission" (
  "id" SERIAL PRIMARY KEY,
  "event_id" int NOT NULL,
  "modify_event" boolean,
  "invite_others" boolean,
  "see_guest_list" boolean
);

CREATE TABLE "common_holiday" (
  "holiday_id" SERIAL PRIMARY KEY,
  "name" varchar,
  "date_of_holiday" varchar,
  "month_of_holiday" varchar
);

ALTER TABLE "user" ADD FOREIGN KEY ("id") REFERENCES "event" ("user_id");

ALTER TABLE "event" ADD FOREIGN KEY ("id") REFERENCES "guest" ("event_id");

ALTER TABLE "user" ADD FOREIGN KEY ("id") REFERENCES "attachment" ("user_id");

ALTER TABLE "event" ADD FOREIGN KEY ("id") REFERENCES "attachment" ("event_id");

ALTER TABLE "user" ADD FOREIGN KEY ("id") REFERENCES "notification" ("user_id");

ALTER TABLE "event" ADD FOREIGN KEY ("id") REFERENCES "notification" ("event_id");

ALTER TABLE "event" ADD FOREIGN KEY ("id") REFERENCES "guest_permission" ("event_id");

ALTER TABLE "user" ADD FOREIGN KEY ("id") REFERENCES "event" ("id");
