/* 게시판 테이블 설계 */

-- 1. 정회원(2) 이상부터 게시판 사용 가능 
-- 2. 필수출력값: 작성자, 작성일자, 작성내용, 조회수, 좋아요 수, 댓글 개수
-- 3. 필수동작: 수정,삭제,돌아가기 / 글 내용 스크랩, 답글, 북마크 
-- 4. 기타: 

create table board (
idx int not null auto_increment,             /* 게시글의 고유번호*/
mid varchar(30) not null,                    /* 게시글 작성자 아이디 */
nickName varchar(20) not null,               /* 게시글 작성자 닉네임 */
title varchar(100) not null,                 /* 게시글 제목 */
content text not null,                       /* 글 내용 */
readNum int default 0,                       /* 글 조회수 */
hostIp varchar(40) not null,                 /* 글 작성자 IP */
wDate datetime default now(),                /* 글 작성 날짜 */
good int default 0,                          /* 좋아요 수 */
bad int default 0,                           /* 싫어요 수 */
complain char(6) default 'NO',						   /* 게시글 신고여부(신고:'YES' / 미신고:'NO') */
primary key(idx),                            /* 기본 키 : 고유번호 */
foreign key(mid) references member(mid)      /* 외래 키 : 아이디 */ 
); 

desc board;
select * from board;

insert into board values (default,'admin','관리자','게시판 테스트1(더미)','게시판 테스트용 첫 글입니다(더미)',default,'192.168.50.64',default,default,default,default);
insert into board values (default,'sona123','운영자','게시판 테스트2(더미)','게시판 테스트용 두번째 글입니다(더미)',default,'192.168.50.64',default,default,default,default);
insert into board values (default,'test1','test1','게시판 테스트3(더미)','게시판 테스트용 세번째 글입니다(더미)',default,'192.168.50.64',default,default,default,default);


insert into board values (default,?,?,?,?,default,?,default,default,default,default);
