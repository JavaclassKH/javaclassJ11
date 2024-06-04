

-- 회원가입(member) 테이블 설계
/*  
		회원레벨별 사용가능 기능 
		준회원(1) : 출석체크,소개,응원법
		정회원(2) : 준회원기능+ 게시판,자료실
		관리자(0) : 전부 + 관리자메뉴

*/
create table member (
idx int not null auto_increment,        /* 회원 고유번호(PK) */
name varchar(30) not null,              /* 회원 이름 */
mid varchar(30) not null,               /* 회원 아이디 */
pwd varchar(250) not null,               /* 회원 비밀번호 */
nickName varchar(50) not null,          /* 회원 닉네임 */
contact varchar(20) not null,           /* 회원 전화번호 */
email varchar(60) not null,             /* 회원 이메일 */
joinDate datetime default now(),        /* 회원가입 일자 */ 
visitCnt int default 0,                 /* 총 방문 횟수 */
memLevel int default 1,          /* 회원레벨(관리자:0 , 준회원:1 , 정회원:2 , 탈퇴진행회원: 999) */ 
primary key(idx),
unique (mid)
);

drop table member;
desc member;
select * from member;


insert into member values (default,'관리자','admin','1234','관리자','010-5283-0623','kh980614@naver.com',default,default,0);

insert into member values (default,'유소나','sona123','1234','운영자','010-1122-3333','sona123@naver.com',default,default,0);

insert into member values (default,'테스트1','test1','1234','테스터1','010-9876-5432','test1@naver.com',default,default,0);

/* 출석체크(방명록) 테이블 설계 */
/*
 1. 고유번호를 통해 글 관리
 2. member 테이블의 mid를 참조
 3. 출석체크는 하루에 한번 가능 (did 값이 'O'일때는 출석을 한 것이니 글 작성 불가)
*/
create table visitCheck (
idx int not null auto_increment,                   /* 출석체크 글 고유번호 */
mid varchar(30) not null,                          /* 출석체크 글 작성자 아이디 */
nickName varchar(60) not null,                     /* 출석체크 글 작성자 닉네임 */
content varchar(80) not null,												 /* 출석체크 글 내용 */
checkDate datetime default now(),                  /* 출석체크 글 작성 날짜 */
primary key(idx),
foreign key(mid) references member(mid)
);

insert into visitCheck values (default,'sona123','운영자','출석체크 테스트(더미1)',default);
insert into visitCheck values (default,'admin','관리자','출석체크 테스트(더미2)',default);
insert into visitCheck values (default,'sona123','운영자','출석체크 테스트2(더미3)',default);
insert into visitCheck values (default,'admin','관리자','출석체크 테스트2(더미4)',default);
insert into visitCheck values (default,'sona123','운영자','실제 출석체크 테스트 1',default);



select * from visitCheck;
drop table visitCheck;

-- 메세지 테이블 설계 
/* 
	1. 발신 메세지, 수신 메세지 2개로 하기
  2. 보내면 테이블 두 곳에 다 저장
  3. 발신 이후엔 두 곳에서 따로 관리
  4. 두 테이블 모두에서 삭제한 메세지 목록은 관리자에게만 보이고 
		 주기적으로 관리자가 직접 삭제. 
	※ 메세지 저장은 메세지 보낼 때 send와 receive 모두에 동시 저장
*/ 
create table sendMsg (
idx int not null auto_increment,            /* 보낸메세지 고유번호 */
sendMid varchar(30) not null,               /* 발신자 아이디 */
receiveMid varchar(30) not null,            /* 수신자 아이디 */
sDate datetime default now(),               /* 메시지 발신 날짜 */
message text not null,                      /* 메세지 내용 */
isRead char(2) default 'N',                 /* 메시지 읽음 여부 */
checked char(8) default 'here',             /* 메시지 상태확인(보유:'here' / 휴지통: 'erase' / 완전삭제: 'delete') */
primary key(idx),
foreign key(sendMid) references member(mid),
foreign key(receiveMid) references member(mid)
);

create table receiveMsg (
idx int not null auto_increment,            /* 받은메세지 고유번호 */
sendMid varchar(30) not null,               /* 발신자 아이디 */
receiveMid varchar(30) not null,            /* 수신자 아이디 */
sDate datetime default now(),               /* 메시지 발신 날짜 */
message text not null,                      /* 메세지 내용 */
isRead char(2) default 'N',                 /* 메시지 읽음 여부 */
checked char(8) default 'here',             /* 메시지 상태확인(보유:'here' / 휴지통: 'erase' / 완전삭제: 'delete') */
primary key(idx),
foreign key(sendMid) references member(mid),
foreign key(receiveMid) references member(mid)
);

desc sendMsg;
desc receiveMsg;

insert into sendMsg values (default,'admin','sona123',default,'실시간 채팅 테스트1(더미)',default,default);
insert into receiveMsg values (default,'admin','sona123',default,'실시간 채팅 테스트1(더미)',default,default);









