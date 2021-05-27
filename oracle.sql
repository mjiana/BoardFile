-- 자료실 게시판용 테이블 생성(2021.05.27)
create table boardup (
	idx int primary key,
	name varchar(30), 
	email varchar(50),
	homepage varchar(50),
	title varchar(50),
	content varchar(2000),
	pwd varchar(10),
	wdate date,
	filename varchar(50) default null,
	filesize int  default null, 
	hit int 
); 
-- sequence : 자동증가번호를 생성하는 객체
create sequence boardup_idx_seq increment by 1 start with 1;

-- 삭제할때 
drop table boardup;
drop sequence boardup_idx_seq;
--------------------------------------------------------------------
-- select
select * from boardup;



-- 테이블 목록 출력하기
select * from tab;
-- 시퀀스 목록 출력하기
select * from seq;