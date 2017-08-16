
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  author_id INTEGER NOT NULL,
  FOREIGN KEY(author_id) REFERENCES users(id)
);

/*
every user - question combination is listed in the joined table below
below is how to create a join table
*/

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

/*
foreign keys can point to the same table
the parent reply id is self referencing id.
this is because replies can be to a question and also to other replies.
If replying to other replies, it has a reference to that other reply
THINK facebook
*/

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

/*
like question_follow, but keeps track of likes instead of follows
*/

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Kenta', 'Kodama'),
  ('Betty', 'Lam');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Unexplained rash', 'I found a rash. I don''t know what to do',
    (SELECT id FROM users WHERE fname = 'Kenta' AND lname = 'Kodama')),
  ('Vacation Hotspots', 'Where is a popular destination in Canada',
    (SELECT id FROM users WHERE fname = 'Betty' AND lname = 'Lam'));

INSERT INTO
  question_follows(question_id, user_id)
VALUES
  (1, 2),
  (2, 1);


INSERT INTO
  replies(question_id, parent_reply_id, user_id, body)
VALUES
  (1, NULL, 2, 'I had that last week!'),
  (1, 1, 1, 'walk it off!');

INSERT INTO
  question_likes(question_id, user_id)
VALUES
  (1, 2),
  (2, 1);
