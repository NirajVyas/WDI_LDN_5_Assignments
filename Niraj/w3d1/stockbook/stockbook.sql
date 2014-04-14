create table categories (
  id serial4 primary key,
  name varchar(255) not null
);

create table portfolios (
  id serial4 primary key,
  name varchar(255) not null,
  description text,
  category_id integer
);