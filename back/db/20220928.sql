-- create table 

CREATE TABLE my_house.group_code (
  group_code CHAR(3) NOT NULL,
  group_code_name VARCHAR(50) NULL,
  PRIMARY KEY (group_code));

CREATE TABLE my_house.code (
  group_code CHAR(3) NOT NULL,
  code CHAR(3) NOT NULL,
  code_name VARCHAR(50) NULL,
  use_yn CHAR(1) NULL,
  PRIMARY KEY (group_code, code));


ALTER TABLE users ADD COLUMN USER_CLSF CHAR(3) NULL;

INSERT INTO my_house.group_code (group_code, group_code_name) VALUES ('001', '회원 구분');
  
INSERT INTO code VALUES 
  ('001','001','19세 이상 회원','Y'),
  ('001','002','19세 미만 회원','Y');


delete from users;
select* from users;