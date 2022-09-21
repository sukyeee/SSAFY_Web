SELECT * FROM test_db.book;

INSERT INTO book(isbn, name, author, price) VALUES('1111', 'jdbc', 'ssafy', 50000);
INSERT INTO book(isbn, name, author, price) VALUES('3333', 'c++', 'ssafy', 10000);
INSERT INTO book(isbn, name, author, price) VALUES('4444', 'c#', 'ssafy', 20000);
INSERT INTO book(isbn, name, author, price) VALUES('5555', 'c', 'ssafy', 30000);
INSERT INTO book(isbn, name, author, price) VALUES('6666', 'python', 'ssafy', 40000);

INSERT INTO book(isbn, author) VALUES('7777', 'ssafy');

use board;
select * from users;

select * from board;
select count(*) from board.board;

select b.board_id, b.user_seq, u.user_name, u.user_profile_image_url, b.title, b.content, b.reg_dt, b.read_count
from BOARD b, USERS u
where b.user_seq = u.user_seq
order by b.board_id desc
limit 5 offset 2
-- limit 5, 2 -- offset 생략하면 순서가 반대
;



/*
	private int boardId;
	private int userSeq;
	private String userName;
	private String userProfileImageUrl;
	private String title;
	private String content;
	private LocalDateTime regDt;
	private int readCount; // 현재는 처리하지 않음.

*/

INSERT INTO `board`.`users` (`USER_NAME`, `USER_PASSWORD`, `USER_EMAIL`) VALUES ( 'sk', 'sk@com','1234');