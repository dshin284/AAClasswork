DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname STRING NOT NULL,
    lname STRING NOT NULL
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title STRING NOT NULL,
    body STRING NOT NULL,
    author INTEGER NOT NULL,
    FOREIGN KEY (author) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    reply_id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,   /* reference a question */
    replier_id INTEGER NOT NULL,    /* reference a user */
    parent_reply_id INTEGER NOT NULL,/* reference replies */
    body STRING NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (replier_id) REFERENCES users(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    users(fname,lname)
VALUES
    ('Dave','Shin'),
    ('Lisa','Lam');


INSERT INTO
    questions(title, body, author)

VALUES
    ('Meaning of Life','What is the meaning of life?',(SELECT id FROM users WHERE fname = 'Lisa')),
    /*(SELECT id FROM users WHERE fname = 'Lisa') will generate the foreign key*/
    ('Best Basketball Team','Is the New York Knicks better than Lakers?', (SELECT id  FROM users WHERE fname = 'Dave'));
    
INSERT INTO     
    question_follows(question_id,user_id)
VALUES
    (2,2),
    (1,1);