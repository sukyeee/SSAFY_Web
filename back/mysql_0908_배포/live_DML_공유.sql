
use ssafydb;

-- 회원 정보 table 생성.
-- table name : ssafy_member
-- column
-- idx			int			auto_increments		PK
-- userid		varchar(16)	not null
-- username		varchar(20)
-- userpwd		varchar(16)
-- emailid		varchar(20)
-- emaildomain	varchar(50)
-- joindate		timestamp	default	current_timestamp
create table ssafy_member 
(

	idx int auto_increment,
    userid varchar(16) not null,
    username varchar(20),
    userpwd varchar(16),
    gender char(1) check (gender in ('m','f')),
    emailid varchar(20),
    emaildomain varchar(50),
    joindate timestamp default current_timestamp,
    constraint ssafy_member_idx_pk primary key (idx) 

);



-- 회원 정보 등록
-- 'kimssafy', '김싸피', '1234', 'kimssafy', 'ssafy.com' 등록시간



-- '김싸피', 'kimssafy', '1234'



-- '이싸피', 'leessafy', '1234'
-- '박싸피', 'parkssafy', '9876'



-- userid가 kimssafy인 회원의 비번을 9876, 이메일 도메인을 ssafy.com으로 변경.



-- userid가 kimssafy 회원 탈퇴
