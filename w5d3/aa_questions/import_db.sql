PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  parent_id INTEGER,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Charis', 'Ginn'),
  ('Jack', 'Egbert');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('this is my first question!', 'how do I install the sqlite3 gem?', (SELECT id FROM users WHERE fname = 'Charis')),
  ('A New Topic', 'what is the meaning of ruby?', (SELECT id FROM users WHERE fname = 'Jack'));

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  (1, 1),
  (2, 2);

INSERT INTO
  replies (question_id, user_id, body)
VALUES
  (1, 2, 'Ask Walker');

INSERT INTO
  replies (parent_id, question_id, user_id, body)
VALUES
  (1, 1, 1, 'Thanks Jack Will do');

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (1, 2);
