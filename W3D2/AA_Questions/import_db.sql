DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY(author_id) REFERENCES users(id)
);


CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  subject_question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY(subject_question_id) REFERENCES questions(id),
  FOREIGN KEY(parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  liker_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(liker_id) REFERENCES users(id)
);


INSERT INTO
  users(fname, lname)
VALUES
  ('Nathan', 'Rice'),
  ('Jess', 'Li');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('How do you SQL', 'But for real, how do you SQL',
    (SELECT id FROM users WHERE fname = 'Nathan' AND lname = 'Rice'));

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Jess' AND lname = 'Li'),
    (SELECT id FROM questions WHERE title = 'How do you SQL'));

INSERT INTO
  replies(subject_question_id, parent_reply_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'How do you SQL'),
    NULL,
    (SELECT id FROM users WHERE fname = 'Jess' AND lname = 'Li'),
    'Yay');

INSERT INTO
  question_likes(question_id, liker_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'How do you SQL'),
  (SELECT id FROM users WHERE fname = 'Nathan' AND lname = 'Rice'));
