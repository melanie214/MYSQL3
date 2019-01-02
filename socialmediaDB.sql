

create database if not exists socialmedia;

use socialmedia; 

drop table if exists comments; 
drop table if exists posts; 
drop table if exists users; 

CREATE TABLE users (
    user_id int (11) not null auto_increment,
    username varchar (25) not null,
    first_name varchar (20) not null, 
    last_name varchar (20) not null, 
    state char (2) not null, 
    email varchar (25) not null,
    password varchar (10) not null,  
    primary key (user_id)

);


CREATE TABLE posts (
    posts_id int (11) auto_increment, 
    user_id int(11) not null, 
    content varchar (250), 
    post_time datetime default current_timestamp,
    primary key (posts_id),
    foreign key (user_id) references users(user_id)
    

);

CREATE TABLE comments (
    comment_id int (11) not null auto_increment, 
    content varchar (250),
    user_id int(11) not null,
    posts_id int(11) not null,
    comment_time datetime default current_timestamp, 
    primary key (comment_id),
    foreign key (user_id) references users(user_id),
    foreign key (posts_id) references posts(posts_id)
    
);