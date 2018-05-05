-- start transaction
start transaction;

-- spawn database
create database mancala;

-- use new database
use mancala;

-- make users table
create table users 
(
    id int(6) unsigned auto_increment primary key,
    username varchar(100) not null,
    password varchar(512) not null,
    firstname varchar(30) not null,
    lastname varchar(30) not null,
    email varchar(50),
    reg_date timestamp
);

-- make trial account
insert into users 
( 
    username, 
    password, 
    firstname, 
    lastname, 
    email
) 
values 
( 
    "test_user", 
    "test_user", 
    "Test", 
    "User", 
    "test@email.com"
);

-- make hole type table
create table hole_type 
(
    id int(6) unsigned auto_increment primary key,
    name varchar(256) not null
);

-- insert basic mancala hole types
insert into hole_type 
( 
    name
) 
values 
( 
    "divot"
);

insert into hole_type 
( 
    name
) 
values 
( 
    "pot"
);

-- make hole table
create table hole
(
    id int(6) unsigned auto_increment primary key,
    name varchar(256) not null,
    type int (6) unsigned not null
);

-- insert all mancala holes into the structure
insert into hole
( 
    name,
    type
) 
values 
(
    "p1_hole_0",
    2
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p1_hole_1",
    1
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p1_hole_2",
    1
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p1_hole_3",
    1
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p1_hole_4",
    1
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p1_hole_5",
    1
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p1_hole_6",
    1
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p2_hole_0",
    2
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p2_hole_1",
    1
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p2_hole_2",
    1
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p2_hole_3",
    1
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p2_hole_4",
    1
);

insert into hole
( 
    name,
    type
) 
values 
(
    "p2_hole_5",
    1
);

insert into hole
( 
    name,
    type
)
values 
(
    "p2_hole_6",
    1
);

-- make game_config table
create table game_config
(
    id int(6) unsigned auto_increment primary key,
    color_1_player_1 int (6) unsigned not null,
    color_2_player_1 int (6) unsigned not null,
    color_1_player_2 int (6) unsigned not null,
    color_2_player_2 int (6) unsigned not null
);

-- insert default game_config
insert into game_config
( 
    color_1_player_1,
    color_2_player_1,
    color_1_player_2,
    color_2_player_2
) 
values 
(
    "000000",
    "A020F0",
    "0000FF",
    "00FF00"
);

-- make game table
create table game
(
    id int(6) unsigned auto_increment primary key,
    game_config_id int (6) unsigned not null,
    active int (6) unsigned not null,
    user_id_player_1 int (6) unsigned not null,
    user_id_player_2 int (6) unsigned not null,
    turn_number int (6) unsigned not null,
    last_played_hole_id int (6) unsigned not null,
    last_played_user_id int (6) unsigned not null,
    last_played_timestamp timestamp,
    bonus_moves_player_1 int (6) unsigned not null,
    bonus_moves_player_2 int (6) unsigned not null
);

-- make game_state table
create table game_state_relation
(
    game_id int (6) unsigned not null,
    hole_id int (6) unsigned not null,
    gem_count int (6) unsigned not null
);

-- commit transactions
commit;