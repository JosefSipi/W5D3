PRAGMA foreign_keys = ON;

DROP IF EXISTS question_likes;
DROP IF EXISTS replies;
DROP IF EXISTS question_follows;
DROP IF EXISTS questions;
DROP IF EXISTS users;

CREATE TABLE users (
id INTEGER PRIMARY KEY,
fname TEXT NOT NULL,
lname TEXT NOT NULL
); 
INSERT INTO 
    users(fname, lname)
VALUES
    ('Joseph', 'Sipiorski'),
    ('Alex', 'Kerpelman');


CREATE TABLE questions (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
body TEXT NOT NULL,
author_id INTEGER NOT NULL,

FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO 
    questions(title, body, author_id)
VALUES
    ('Flex?', 'What is flex?', (SELECT id FROM users WHERE lname = 'Sipiorski')),
    ('CSS?', 'What is CSS?', (SELECT id FROM users WHERE lname = 'Kerpelman'));

CREATE TABLE question_follows (
id INTEGER PRIMARY KEY,
questions_id INTEGER NOT NULL,
users_id INTEGER NOT NULL,

FOREIGN KEY (questions_id) REFERENCES questions(id),
FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO
    quesetion_follows(questions_id, users_id)
VALUES

((SELECT id ...), (SELECT id ...)),

CREATE TABLE replies (
id INTEGER PRIMARY KEY,
questions_id INTEGER NOT NULL,
parent_id INTEGER   ,
users_id INTEGER NOT NULL,
body TEXT NOT NULL,

FOREIGN KEY (questions_id) REFERENCES questions(id),
FOREIGN KEY (parent_id) REFERENCES replies(id),
FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
id INTEGER PRIMARY KEY,
users_id INTEGER NOT NULL,
questions_id INTEGER NOT NULL,

FOREIGN KEY (users_id) REFERENCES users(id),
FOREIGN KEY (questions_id) REFERENCES questions(id),
)

