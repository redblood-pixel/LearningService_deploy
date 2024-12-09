create table if not exists users (
    user_id serial primary key,
    username varchar(255) not null unique,
    email varchar(255) not null unique,
    password_hash varchar(255) not null
);

create table if not exists tokens (
    token_id UUID PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id) ON DELETE CASCADE,
    issued_at TIMESTAMP NOT NULL,
    expired_at TIMESTAMP NOT NULL
);

create table if not exists groups (
    group_id serial primary key,
    name_group varchar(255) not null unique
);

create table if not exists words (
    word_id serial primary key,
    rus_word varchar(255) not null,
    translation varchar(255) not null
);

create table if not exists groups_users (
    group_user_id serial primary key,
    group_id int REFERENCES groups(group_id) ON DELETE CASCADE,
    user_id int REFERENCES users(user_id) ON DELETE CASCADE
);

create table if not exists groups_words (
    group_word_id serial primary key,
    group_id int REFERENCES groups(group_id) ON DELETE CASCADE,
    word_id int REFERENCES words(word_id) ON DELETE CASCADE
);