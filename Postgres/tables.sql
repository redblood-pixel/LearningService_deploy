create table if not exists user (
    user_id serial primary key,
    username varchar(255) not null unique,
    email varchar(255) not null unique,
    password_hash varchar(255) not null
);

CREATE TABLE if not exists token (
    token_id UUID PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    issued_at TIMESTAMP NOT NULL,
    expired_at TIMESTAMP NOT NULL
);

create table if not exists group_user (
    group_user_id serial primary key,
    group_id int REFERENCES groups(id) ON DELETE CASCADE,
    user_id int REFERENCES users(id) ON DELETE CASCADE
);

create table if not exists group (
    group_id serial primary key,
    name_group varchar(255) not null unique
);

create table if not exists word (
    word_id serial primary key,
    rus_word varchar(255) not null,
    translation varchar(255) not null
);

create table if not exists group_word (
    group_word_id serial primary key,
    group_id int REFERENCES groups(id) ON DELETE CASCADE,
    word_id int REFERENCES words(id) ON DELETE CASCADE
);