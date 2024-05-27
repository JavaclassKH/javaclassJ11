
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
checkDate datetime default now(),                  /* 출석체크 글 작성 시간 */
hostIp varchar(50) not null,                       /* 출석체크 글 작성자 IP */
did char(3) default 'X',                           /* 출석체크 여부 확인('O'는 출석함, 'X'는 출석 안함) */
primary key(idx),
foreign key(mid) references member(mid)
);