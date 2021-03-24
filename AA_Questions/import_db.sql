CREATE TABLE users (
id INTEGER PRIMARY KEY,
fname TEXT NOT NULL,
lname TEXT NOT NULL
); 

CREATE TABLE questions (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
body TEXT NOT NULL,
author_id INTEGER NOT NULL,

FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
id INTEGER PRIMARY KEY,
questions_id INTEGER NOT NULL,
users_id INTEGER NOT NULL,

FOREIGN KEY (questions_id) REFERENCES questions(id),
FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE replies (
id INTEGER PRIMARY KEY,
questions_id INTEGER NOT NULL,
parent_id INTEGER NOT NULL,

FOREIGN KEY (questions_id) REFERENCES questions(id),
FOREIGN KEY (parent_id) REFERENCES replies(id)
);


