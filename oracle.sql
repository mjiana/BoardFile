-- �ڷ�� �Խ��ǿ� ���̺� ����(2021.05.27)
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
-- sequence : �ڵ�������ȣ�� �����ϴ� ��ü
create sequence boardup_idx_seq increment by 1 start with 1;

-- �����Ҷ� 
drop table boardup;
drop sequence boardup_idx_seq;
--------------------------------------------------------------------
-- select
select * from boardup;



-- ���̺� ��� ����ϱ�
select * from tab;
-- ������ ��� ����ϱ�
select * from seq;