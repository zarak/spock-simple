DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS elements;
DROP TABLE IF EXISTS timers;
DROP TABLE IF EXISTS notes;

CREATE TABLE users
  ( id SERIAL PRIMARY KEY NOT NULL UNIQUE
  , session_id TEXT NOT NULL UNIQUE
  );

CREATE TABLE elements
  ( id SERIAL PRIMARY KEY NOT NULL UNIQUE
  , user_id INT NOT NULL
  , elem_type TEXT NOT NULL
  , CONSTRAINT "fk_elements_users" FOREIGN KEY (user_id) REFERENCES users (id)
  );

CREATE TABLE timers
  ( id SERIAL PRIMARY KEY NOT NULL UNIQUE
  , name TEXT NULL
  , duration BIGINT NOT NULL  -- seconds; can't use INTERVAL because this is a fixed duration
  , triggered_time TIMESTAMP WITH TIME ZONE NULL
  );

CREATE TABLE notes
  ( id SERIAL PRIMARY KEY NOT NULL UNIQUE
  , text TEXT NOT NULL
  );

