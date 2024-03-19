
/*
 19. 아래와 같은 구조로 테이블을 설계하시오. 테이블명 : hoewon
 아이디(mid)  : 가변길이(15) , 널값불허
 비밀번호(pwd) : 가변길이(15) , 널값불허
 성명(name)   : 가변길이(20) , 널값불허
 나이(age)    : 정수형, 기본값은 20
 성별(sex)    : 고정길이문자(2), 기본값(남자)
 입사일(ipsail)  : 날짜타입, 기본값은 'now()'로 지정한다.
 주소(address) : 가변길이(50)
*/;
CREATE TABLE hoewon (  
  
   mid 		   VARCHAR(15) NOT NULL,                 /* 아이디 */
   pwd 		   VARCHAR(15) NOT NULL,                /* 비밀번호 */
	 name 	   varchar(20) not null,    						/* 이름 */
   sex       VARCHAR(2) DEFAULT '남자',            /* 성별 */
   ipsail    DATETIME NOT NULL DEFAULT NOW(),      /* 직업 */
   address   VARCHAR(50)                           /* 주소 */
);

drop table singsang;
drop table hoewon;
delete from hoewon;
desc hoewon;
alter table hoewon rename singsang;
show tables;
alter table singsang add column content text;
-- 26. sinsang테이블에 content 필드를 soge필드로 변경하시오. 타입은 똑같은 text타입이다.
alter table singsang change column content soge text;
-- 27. sinsang테이블의 soge필드의 타입을 가변길이 100Byte로 변경하시오.(null값은 허용한다)
alter table singsang modify column soge varchar(100);
-- 28. sinsang테이블에 content 필드를 삭제하시오.(실제로 삭제하지는 말고 명령어만 사용하시오. 만약 삭제하였다면 새롭게 content필드를 가변길이 100Byte로 추가하시오)
alter table singsang drop column content;
-- 29. sinsang테이블 구조보기
desc singsang
-- 30. sinsang테이블의 sex필드명을 gender필드명으로 변경하시오.(고정길이문자(2), 기본값(여자))
alter table singsang change column sex gender char(20) default '여자';
-- 31. sinsang테이블 구조보기
desc singsang;
/* 32. 아래와 같은 자료를 입력시키시오.(순서는 '아이디/비밀번호/성명/나이/성별/입사일/주소') - 입력되는 내용은 복사해서 추가하시오.
'hong','1234','홍길동',25,'남자','1990-10-05','서울'
'kim','1234','김말숙',33,'여자','1997-12-3','부산'
'lee','1234','이순자',24,'여자','1985-7-25','광주'
'lee1','1234','이기자',40,'남자','1999-10-3','울산'
'park','1234','박찬호',32,'남자','1980-6-08','대전'
'bae','1234','배은숙',19,'여자','1993-11-22','마산'
'son','1234','손기정',45,'남자','1987-12-15','제주';
'kim1','1234','김영숙',36,'여자','2002-10-5','부천'
'kim2','1234','김영철',39,'남자','1988-10-05','인천'
'lee2','1234','이겨라',29,'남자','2000-10-09','서울'
'son2','1234','손오공',23,'남자','2005-12-15','서울'
*/

insert into singsang values ('hong','1234','홍길동',25,'남자','1990-10-05','서울',default);
insert into singsang values ('kim','1234','김말숙',33,'여자','1997-12-3','부산',default);
insert into singsang values ('lee','1234','이순자',24,'여자','1985-7-25','광주',default);
insert into singsang values ('lee1','1234','이기자',40,'남자','1999-10-3','울산',default);
insert into singsang values ('park','1234','박찬호',32,'남자','1980-6-08','대전',default);
insert into singsang values ('bae','1234','배은숙',19,'여자','1993-11-22','마산',default);
insert into singsang values ('son','1234','손기정',45,'남자','1987-12-15','제주',default);
insert into singsang values ('kim1','1234','김영숙',36,'여자','2002-10-5','부천',default);
insert into singsang values ('kim2','1234','김영철',39,'남자','1988-10-05','인천',default);
insert into singsang values ('lee2','1234','이겨라',29,'남자','2000-10-09','서울',default);
insert into singsang values ('son2','1234','손오공',23,'남자','2005-12-15','서울',default);

alter table singsang add column age int default 20; 
-- 33. sinsang테이블의 입력된 모든자료의 내용을 출력하시오.
select * from singsang;

-- 34. 32번에서 입력한 모든 자료를 삭제시키는 명령어를 기술하시오.(실제로 실행시키지는 말고 명령어만 기술하시오. 만약 삭제했으면 32번을 다시 실행해서 추가되도록 하시오.)
--delete from singsang;
-- 35. sinsang테이블의 입력된 모든자료의 내용을 출력하시오.(자료가 없으면 다시 입력후 작업할것)
select * from singsang;
-- 36. 아이디가 'kim'인 자료를 보여주시오.
select * from singsang where mid = 'kim';
-- 37. 성별이 남자만 보여주시오.
select * from singsang where gender = '남자';
-- 38. 주소가 '서울'을 보여주시오
select * from singsang where address = '서울';

-- 39. 주소가 '서울'과 '인천'을 보여주시오
select * from singsang where address = '서울' or '인천';

-- 40. '서울'에 살고있는 '남자'들을 출력하시오.
select * from singsang where address = '서울' and gender = '남자';
-- 41. sinsang테이블에 'point' 필드를 추가하시오(타입:int, 기본값:1000)
alter table singsang add column point int default 1000;
-- 42. sinsang 테이블 구조확인?
desc singsang;
-- 43. sinsang 테이블 내용(모든 레코드) 확인?
select * from singsang;
-- 44. 여자회원들에 대하여 모두 100 포인씩 추가지급한다.
update singsang set point = point +100 where gender = '여자';
-- 45. sinsang 테이블 내용 확인(모든 레코드)?
select * from singsang;