create table user (
	user_id smallint auto_increment primary key,
    email varchar(50) unique,
	password varchar(20),
    birthday varchar(20),
    nickname varchar(20) unique,
    board_color varchar(10) default '323232'
);

create table memo (
	user_id smallint,
    foreign key(user_id) references user(user_id) on delete cascade,
	memo_imemod smallint auto_increment primary key,
    writer varchar(20) default '익명',
	bg_color varchar(20) default 'ffffff',
    font_color varchar(20) default '000000',
    type varchar(20) default 'textcard',
    photo varchar(100) default 'no',
    content varchar(5000),
    created_at datetime,
    is_hidden boolean default 0,
    pos_x smallint default 0,
    pos_y smallint default 0,
    font_family varchar(50)
);
