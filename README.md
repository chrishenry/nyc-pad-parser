# pad
Ruby gem to parse and import NYC PAD Data

# Might be easier to just use mysql to import the txt file, which is really a
csv

### MySQL Server Container
docker run -it --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=yes --rm mysql --secure-file-priv=

### MySQL Client Container
docker run -it --name mysql-client --link mysql:mysql --rm -v /Users/chrishenry/Desktop/pad16a:/opt/paddata mysql /bin/bash

mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot

create database padnyc;
use database padnyc;

CREATE TABLE bobaddr (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  boro TINYINT,
  block MEDIUMINT ZEROFILL UNSIGNED,
  lot MEDIUMINT ZEROFILL UNSIGNED,
  bin MEDIUMINT ZEROFILL UNSIGNED,
  lhnd MEDIUMINT ZEROFILL UNSIGNED,
  lhns MEDIUMINT ZEROFILL UNSIGNED,
  lcontpar MEDIUMINT ZEROFILL UNSIGNED,
  lsos MEDIUMINT ZEROFILL UNSIGNED,
  hhnd INT ZEROFILL UNSIGNED,
  hhns MEDIUMINT ZEROFILL UNSIGNED,
  hcontpar MEDIUMINT ZEROFILL UNSIGNED,
  hsos MEDIUMINT ZEROFILL UNSIGNED,
  scboro MEDIUMINT ZEROFILL UNSIGNED,
  sc5 TINYINT ZEROFILL UNSIGNED,
  sclgc TINYINT ZEROFILL UNSIGNED,
  stname VARCHAR(32),
  addrtype TINYINT ZEROFILL UNSIGNED,
  realb7sc MEDIUMINT ZEROFILL UNSIGNED,
  validlgcs MEDIUMINT ZEROFILL UNSIGNED,
  parity TINYINT ZEROFILL UNSIGNED,
  b10sc MEDIUMINT ZEROFILL UNSIGNED,
  segid MEDIUMINT ZEROFILL UNSIGNED,
  zipcode CHAR(5)
);

LOAD DATA LOCAL INFILE '/opt/paddata/bobaddr-spring.txt' INTO TABLE bobaddr IGNORE 1 LINES;
