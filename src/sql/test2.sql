show tables;

CREATE TABLE insarok (
	idx 		INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 	 /* 고유번호 */
	buser 	VARCHAR(10) NOT NULL,											 /* 부서명 */
	name    VARCHAR(20) NOT NULL,											 /* 부서명(성명) */
	jikwi   VARCHAR(20) NOT NULL DEFAULT '사원', 			 /* 부서명(성명) */
	gender  CHAR(2) NOT NULL DEFAULT '남자',				     /* 성별 */
	age     INT DEFAULT 25,													   /* 나이 */
	ipsail  DATETIME NOT NULL DEFAULT NOW(),					 /* 입사일(기본값:오늘날짜) */
	address VARCHAR(50)																 /* 주소(공백허용) */
	/* primary key(idx) */
);

desc insarok;
--drop table insarok;
											
insert into insarok values (default,'인사과','홍길동','과장',default,38,'1995-1-5','서울');
insert into insarok values (default,'총무과','김말숙','부장',default,45,'1990-11-5','청주');
insert into insarok values (default,'영업과','이기자','사원',default,28,'2015-4-15','부산');
insert into insarok values (default,'자재과','강감찬','대리',default,30,'2010-10-5','청주');
insert into insarok values (default,'인사과','소나무','사원',default,29,'2020-11-5','서울');
insert into insarok values (default,'총무과','오하늘','사원',default,26,'2022-2-2','청주');
insert into insarok values (default,'영업과','탁민아','대리',default,31,'2018-3-3','서울');
insert into insarok values (default,'자재과','이재희','대리',default,29,'2017-4-4','인천');
insert into insarok values (default,'인사과','김기자','대리',default,32,'2016-5-10','부산');
insert into insarok values (default,'인사과','이순신','사원',default,30,'2019-6-6','서울');
insert into insarok values (default,'자재과','고인돌','부장',default,47,'1990-7-7','인천');
insert into insarok values (default,'영업과','나도야','과장',default,39,'1999-8-8','청주');
insert into insarok values (default,'영업과','홍길자','대리',default,35,'2016-9-9','서울');
insert into insarok values (default,'인사과','가나다','사원',default,30,'2023-10-10','서울');
insert into insarok values (default,'총무과','나다라','과장',default,40,'2010-11-11','서울');
insert into insarok values (default,'총무과','다라마','부장',default,49,'1992-12-12','청주');
insert into insarok values (default,'자재과','대나무','사원',default,27,'2020-1-21','제주');
insert into insarok values (default,'영업과','최민영','사원',default,25,'2021-2-22','인천');
insert into insarok values (default,'영업과','조현서','사원',default,20,'2022-3-23','부산');
insert into insarok values (default,'영업과','이규혁','과장',default,38,'2000-4-24','청주');
insert into insarok values (default,'자재과','손흥민','부장',default,48,'1996-5-25','서울');
insert into insarok values (default,'인사과','홍길동','사원',default,28,'2024-6-26','청주');

	
	
select * from insarok;

--insarok 테이블의 성명/직위/주소 필드만 모든 자료 표시?
select name, jikwi, address from insarok;

--홍길동 레코드만 출력?
select * from insarok where name= '홍길동';

--서울에 사는 홍길동 레코드만 출력?
select * from insarok where address ='서울' and name = '홍길동';

--홍길동 사원만 출력?
select * from insarok where name ='홍길동' and jikwi= '사원';

--'서울' 에 사는 모든 사람?
select * from insarok where address ='서울';

--입사년도가 2000년 이전에 입사한 직원을 보여주시오?
select * from insarok where ipsail<'2000-1-1';

--입사년도가 2000~2010년에 입사한 직원을 보여주시오?
select * from insarok where ipsail >='2000-1-1' and ipsail <= '2010-12-31';
--앞의 범위 연산자 대신에 between~and 변경 가능 
select * from insarok where ipsail between '2000-1-1' and '2010-12-31';

--30대 회사원 출력?
select * from insarok where age >=30 and age <=39;
select * from insarok where age between 30  and  39;

--서울/부산에 사는 직원?
select * from insarok where address = '서울' or address = '부산';
--앞의 or 연산자는 in()으로 변경가능
select * from insarok where address in ('서울','부산');

-- 서울/부산에 사는 사원만 출력?
select * from insarok where jikwi = '사원'  and address in ('서울','부산');

-- '김'씨만 출력?
select * from insarok where name like '홍%';

--'나무'로 끝나는 이름을 가진 직원 출력?
select * from insarok where name like '%나무';

--'이규혁' 을 '이재혁'으로 이름 변경?
update insarok set name = '이재혁' where name = '이규혁'
update insarok set name = '가재다' where name = '가나다'
update insarok set name = '재다라' where name = '나다라'

--'서울'에 살지 않는 직원?
select * from insarok where address !='서울';
select * from insarok where address <> '서울';

--이름중에서 '재'란 글자를 포함한 직원의 직급을 '과장' 으로 변경하시오?
select * from insarok where name like '%재%';
update insarok set jikwi = '과장' where name like '%재%';

--이중 2번째 글자가 '나'인 직원은?
select * from insarok where name like '_나%';

--이름중에서 '재'란 글자를 포함한 직원 중에서 '서울'에 사는 직원의 이름과 입사일과 주소 ?
select name, ipsail, address from insarok where name like '%재%' and address = '서울';

--이름중에서 '재란'글자를 포함한 직원 중에서 '서울에'사는 직원을 퇴사시키시오?
select name,ipsail,address from insarok where name like '%재%' and address = '서울';

--이름중에서 '재'란 글자를 포함한 직원중에서 '서울'에 사는 직원중 나이가 40이상인 직원을 퇴사시키시오?
select  *  from insarok where name like '%재%' and address = '서울';
delete from insarok where name like '%재%' and address = '서울' and age >= 40;

--'이재희' 성별을 '여자로' 변경?
update insarok set gender = '여자' where name ='이재희';

--이름 오름차순으로 출력? (순서 : order by~~ , 오름차순: asc (생략가능), 내림차순 : desc)
select * from insarok order by name;
select * from insarok order by name desc;


--남자인 자료중에서 나이 오름차순으로 출력?
select * from insarok where gender = '남자' order by age ;

--남자인 자료중에서 나이 오름차순으로 출력, 같은 나이면 입사일 내림차순 출력?
select * from insarok where gender = '남자' order by age , ipsail desc;

--전체자료중에서 5면망 출력하시오 (입력순서중 앞에서 5개)
select * from insarok limit 5;

--뒤에서 5명 (나중에 입력한 회원)만 출력?
select * from insarok order by idx desc limit 5;

--남자 회원 5명만 나이 내림차순으로 보여주시오. (limit 출력개수)
select * from insarok where gender = '남자' order by age desc limit 5;

-- 남자 회원중에서 앞에서 2명빼고, 5명만 출력하시오? (limit 인덱스번호, 출력개수)
select * from insarok where gender = '남자' order by idx  desc limit 2,5;