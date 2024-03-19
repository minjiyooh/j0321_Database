show tables;

-- 기본키 (primary key) : 테이블을 대표하는 키, 중복을 허용하지 않는다. 기본키는 여러개 올 수 있다.
create table test1(
	idx int not null auto_increment primary key, 
	name varchar(20) not null,
	age int default 20,
	address varchar(50)
);
desc test1;
insert into test1 value (default,'홍길동',default,'서울');
insert into test1 value (default,'김말숙',25,'서울');
insert into test1 value (1,'소나무',55,'제주');
select * from test1;


create table test2(
	idx int not null auto_increment primary key, 
	name varchar(20) not null,
	age int default 20,
	test2code varchar(10)not null
	/*primary key(idx, test2Code)	*/
);



desc test2;
drop table test2;
insert into test2 values (default, '이기자', 25,'aaa');
insert into test2 values (default, '김길자', 33,'bbb');
insert into test2 value (1,'소나무',55,'ccc'); -- o,x
insert into test2 value (default,'소나무',55,'bbb'); -- x
select * from test2;

--unique key: 중복불허를 위해 설정하는 키 (primary key대신해서 중복을 불허시키고자할 때 사용한다.)
 
create table test3(
	idx int not null auto_increment , 
	name varchar(20) not null,
	age int default 20,
	job varchar(10) not null,
	address varchar(20) not null,
	test3code varchar(10)not null,
	primary key(idx),
	unique key(test3code)
);

desc test3;
drop table test3;
insert into test3 values (default, '소나무', 25,'학생','서울','ccc');
insert into test3 values (default, '대나무', 33,'회사원','청주','eee');
insert into test3 values (default, '사과나무', 27,'군인','대전','ggg');
insert into test3 values (1, '감나무', 19,'fff');   --  x 
insert into test3 values (default, '감나무', 55,'eee');   -- x
select * from test3;


/* 외래키 (foreign key)
  하나의 테이블에서 다른 테이블의 정보를 찾기 위해 연결해주는 역할을 할 때 지정하는 키이다.
 	조건, 현재 테이블의 필드에 외래키로 설정하려한다면? 
 	반드시 상대쪽 테이블의 해당 필드는 primary key 이거나 unique key 로 등록되어 있어야 한다.
 	또한, 외래키로 지정하려는 필드는 상대쪽 테이블의 해당 필드속성과 같아야 한다.
 */

create table test4(
	idx		 				int not null auto_increment primary key , 
	gender 				char(2) default '남자',
  test2idx 		  int not null,
	test3Code		  varchar(10)not null,
	foreign key 	(test2idx) references test2(idx),
	foreign key		(test3code) references test3 (test3Code)
);

desc test4;
drop table test4;
insert into test4 values (default, default, 1, 'ggg' );
insert into test4 values (default, default, 1, 'ccc' );

select * from test4;
--select 필드명 from 테이블명 where 조건식 옵션;
select * from test3, test4; --크로스조인

select test3.* ,gender from test3, test4; 
-- *이 앞에있을땐 앞기준 gender 왜 안붙였냐 ? gender은 test3번과 4번에 중복되지않음 이럴땐 그냥써도 됨 명확하게하려면 test4.gender
select test4.idx,gender from test3, test4;
select t3.idx as 고유번호, t4.gender as 성별 from test3  t3, test t4;


select t3.*, t4.gender from test3 t3, test4 t4 where t3.test3code = t4.test3code; -- inner 조인
