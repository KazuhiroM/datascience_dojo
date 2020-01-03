-- create user
create user padawan password 'padawan12345';

-- calender
drop table if exists calender;
create table calender(
  ymd	            DATE,
  year	          VARCHAR(4),
  quater	        VARCHAR(6),
  half_period     VARCHAR(6),
  ym              VARCHAR(6),
  year_weeki	    VARCHAR(6),
  month           SMALLINT,
  day             SMALLINT,
  day_of_the_week	VARCHAR(2)
);

COPY calender FROM '/tmp/data/calender.csv'
WITH CSV HEADER
;

-- customer
drop table if exists customer;
create table customer(
  customer_id     VARCHAR(14),
  surname         VARCHAR(20),
  first_name      VARCHAR(20),
  surname_kana    VARCHAR(20),
  first_name_kana VARCHAR(20),
  gender_cd       VARCHAR(1),
  birth_day       DATE,
  prefecture_cd   VARCHAR(2),
  post_cd         VARCHAR(8),
  address         VARCHAR(128),
  address_kana    VARCHAR(128),
  tel_no          VARCHAR(20),
  join_store_cd   VARCHAR(6),
  join_date       DATE
);
COPY customer FROM '/tmp/data/customer.csv'
WITH CSV HEADER
;

-- gender
drop table if exists gender;
create table gender(
gender_cd     VARCHAR(1),
gender_label  VARCHAR(2)
);
COPY gender FROM '/tmp/data/gender.csv'
WITH CSV HEADER
;

-- prefecture
drop table if exists prefecture;
create table prefecture(
pref_cd   VARCHAR(2),
pref_name VARCHAR(4)
);
COPY prefecture FROM '/tmp/data/prefecture.csv'
WITH CSV HEADER
;

-- product
drop table if exists product;
create table product(
  product_cd            VARCHAR(10),
  product_name          VARCHAR(128),
  category_major_cd     VARCHAR(2),
  category_major_name   VARCHAR(32),
  category_medium_cd    VARCHAR(4),
  category_medium_name	VARCHAR(32),
  category_small_cd	    VARCHAR(6),
  category_small_name	  VARCHAR(32),
  jan_cd                VARCHAR(13),
  unit_price            INTEGER,
  unit_cost             INTEGER
);
COPY product FROM '/tmp/data/product.csv'
WITH CSV HEADER
;

-- receipt
drop table if exists receipt;
create table receipt(
  sales_ymd       DATE,
  store_cd        VARCHAR(6),
  product_cd      VARCHAR(10),
  customer_id     VARCHAR(14),
  receipt_no      SMALLINT,
  receipt_sub_no  SMALLINT,
  amount          INTEGER,
  quantity        INTEGER
);

COPY receipt FROM '/tmp/data/receipt.csv'
WITH CSV HEADER
;

-- store
drop table if exists store;
create table store(
  store_cd      VARCHAR(6),
  store_name    VARCHAR(128),
  prefecture_cd VARCHAR(2),
  address       VARCHAR(128),
  address_kana  VARCHAR(128),
  tel_no        VARCHAR(20),
  latitude      NUMERIC,
  longitude     NUMERIC
);

COPY store FROM '/tmp/data/store.csv'
WITH CSV HEADER
;

grant all on database dsdojo_db to padawan;
grant all on all tables in schema public to padawan;
