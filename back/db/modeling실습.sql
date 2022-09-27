-- create table 
CREATE TABLE test.group_code (
  group_code CHAR(3) NOT NULL,
  group_code_name VARCHAR(50) NULL,
  PRIMARY KEY (group_code));


CREATE TABLE test.code (
  group_code CHAR(3) NOT NULL,
  code CHAR(3) NOT NULL,
  code_name VARCHAR(50) NULL,
  use_yn CHAR(1) NULL,
  PRIMARY KEY (group_code, code));

CREATE TABLE test.user (
  user_id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  user_clsf CHAR(3) NULL,
  PRIMARY KEY (user_id));
  
  	
INSERT INTO test.group_code (group_code, group_code_name) VALUES ('001', '회원 구분');
  
	
INSERT INTO code VALUES 
  ('001','001','일반화원','Y'),
  ('001','002','준회원','Y');

INSERT INTO code VALUES 
  ('001','003','14세 미만 회원','Y');
 


insert into test.user ( user_name, user_clsf) values ('삐따기', '001');
insert into test.user  (user_name, user_clsf) values ('홍길동', '002');
insert into test.user  (user_name, user_clsf) values ('김대섭', '001');
  
-- 회원가입 회원 구분 코드, 코드명이 필요하다. 

  select * FROM test.group_code WHERE GROUP_CODE_NAME LIKE '%회원%';
  
  SELECT CODE, CODE_NAME FROM TEST.CODE WHERE GROUP_CODE = '001' AND USE_YN='Y';

-- SELECT CODE, CODE_NAME FROM TEST.CODE WHERE GROUP_CODE = ? AND USE_YN='Y';
-- DB에선 이렇게 

-- 회원 1명 개인 정보 조회
SELECT U.USER_ID, U.USER_NAME, U.USER_CLSF, C.CODE_NAME
 FROM USER U, CODE C
 WHERE U.USER_ID = 2
	AND C.GROUP_CODE = '001'
    AND U.USER_CLSF = C.CODE
    LIMIT 10;
  
  
  SELECT USER_ID, USER_NAME, USER_CLSF, 
		fun_code('001', SUB.USER_CLSF ) USER_CLSF_NM
-- 매우 복잡한 조인 
-- ( SELECT C.CODE_NAME FROM CODE C WHERE C.GROUP_CODE = '001' AND U.USER_CLSF = C.CODE ) USER_CLSF_NM
 FROM ( 
 SELECT U.USER_ID, U.USER_NAME, U.USER_CLSF
 FROM USER U
 WHERE U.USER_ID = fun_code
 LIMIT 10
 ) SUB;
 
  
INSERT INTO test.group_code (group_code, group_code_name) VALUES ('002', '주문 상태');

INSERT INTO code VALUES
  ('002','001','결제 대기','Y'),
  ('002','002','주문 완료','Y'),
  ('002','003','배송중','Y'),
  ('002','004','배송 완료','Y'),
  ('002','005','구매 확정','Y'),
  ('002','006','반품','Y');
  
  
  SET GLOBAL log_bin_trust_function_creators = 1; 
  
  SELECT fun_code('001', '002');
  
    SELECT code_name 
    FROM code
     WHERE group_code  = '001'
         AND code = '002';
  
  
-- 고객 ID, 고객 이름, 고객의 최근 일년동안 구매한 총 금액
SELECT customer_id, customer_nm, fun_year_total_amount(customer_id)
	FROM test.customer;

  select * from group_code;

  select * from code;
  
  select * from user;
  
  
  