create database maco;

use maco;

create table role(
	id int auto_increment primary key,
    description varchar(255) not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table user(
	id int auto_increment primary key,
    name varchar(255) not null,
    cpf varchar(30) not null unique, 
    email varchar(255) not null unique,
    ra varchar(255) not null unique,
    password varchar(255) not null,
    role int not null,
    status bool not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key(role) REFERENCES role(id)    
);

create table course(
	id int auto_increment primary key,
    name varchar(255) not null unique,   
    description text,     
    image varchar(45) not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP    
);

create table user_course(
	id int auto_increment primary key,
    user int not null, 
    course int not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key(user) REFERENCES user(id),
    foreign key(course) REFERENCES course(id)    
);

create table article_status(
	id int auto_increment primary key,
    name varchar(255) not null,
    description text,     
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP   
);

create table article(
	id int auto_increment primary key,    
    event int not null,
    title varchar(255) not null,    
    advisors varchar(999) not null,
    co_advisors varchar(999),    
    keywords varchar(255) not null,
    summary text not null,
    status int not null, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key(status) REFERENCES article_status(id),    
    foreign key(event) REFERENCES event_settings(id)
);

create table article_authors(
	id int auto_increment primary key, 
    article int not null,
	user int not null,
    course int not null,    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key(article) REFERENCES article(id),    
    foreign key(user) REFERENCES user(id),
    foreign key(course) REFERENCES course(id)
);

create table article_comments(
	id int auto_increment primary key,
    user int not null,
    article int not null,
    comment text,     
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key(user) REFERENCES user(id),
    foreign key(article) REFERENCES article(id)
);

create table events(
	id int auto_increment primary key,
    name varchar(255) not null,
    start datetime not null,
    end datetime not null,
    number_characters int,
    status boolean not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);