create table articles (
id int AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
content MEDIUMTEXT NOT NULL,
content_summary VARCHAR(255) NOT NULL,
img_s3 VARCHAR(255),
created_at DATETIME default current_timestamp NOT NULL,
updated_at timestamp default current_timestamp on update current_timestamp NOT NULL,
PRIMARY KEY(id)
);

create table article_categories (
id int AUTO_INCREMENT,
article_id int NOT NULL,
category_id int NOT NULL,
PRIMARY KEY(id)
);

create table categories (
id int AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);
