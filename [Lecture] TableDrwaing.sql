-- 테이블 만들고 제약조건 등 걸때 사용할 스크립트파일


-- 테이블의 구성 확인
SHOW TABLES; -- 전체 테이블 조회
DESC NOTICE; -- 테이블의 구성이 제대로 되어있는지 확인
DESC QNA;
DESC MEMBER;

COMMIT;
ROLLBACK;

CREATE TABLE NOTICE(
	NUM INT AUTO_INCREMENT PRIMARY KEY,
	TITLE VARCHAR(400),
	CONTENTS LONGTEXT,
	WRITER VARCHAR(400),
	REGDATE DATE,
	HIT INT
);

CREATE TABLE QNA(
	NUM INT AUTO_INCREMENT PRIMARY KEY,
	TITLE VARCHAR(400),
	CONTENTS LONGTEXT,
	WRITER VARCHAR(400),
	REGDATE DATE,
	HIT INT,
	REF INT,
	STEP INT,
	DEPTH INT
);

CREATE TABLE NOTICEFILES(
	FILENUM INT AUTO_INCREMENT PRIMARY KEY,
	NUM INT,
	FILENAME VARCHAR(400),
	ORINAME VARCHAR(400)
);

CREATE TABLE QNAFILES(
	FILENUM INT AUTO_INCREMENT PRIMARY KEY,
	NUM INT,
	FILENAME VARCHAR(400),
	ORINAME VARCHAR(400)
);

CREATE TABLE MEMBER(
	USERNAME VARCHAR(255),
	PASSWORD VARCHAR(255),
	NAME VARCHAR(255),
	EMAIL VARCHAR(255),
	BIRTH DATE,
	ENABLED BIT(1)
);

CREATE TABLE ROLE( -- 권한정보 저장
	NUM INT AUTO_INCREMENT PRIMARY KEY,
	ROLENAME VARCHAR(255)
);
DROP TABLE ROLE;

CREATE TABLE MEMBER_ROLE( -- PK를 복합키로 만들 예정
	USERNAME VARCHAR(255),
	NUM INT,
	-- 복합키 PK PRIMARY KEY(USERNAME, NUM)
	-- CONSTRAINT MR_PK PRIMARY KEY (USERNAME, NUM),
	-- CONSTRAINT MR_UNAME_FK FOREIGN KEY (USERNAME) REFERENCES MEMBER (USERNAME),
	-- CONSTRAINT MR_NUM_FK FOREIGN KEY (NUM) REFERENCES ROLE (NUM)
);
DROP TABLE MEMBER_ROLE;



-- CONSTRAINT
-- PK
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_UNAME_PK PRIMARY KEY (USERNAME);
ALTER TABLE ROLE ADD CONSTRAINT ROLE_NUM_PK PRIMARY KEY (NUM);

-- 복합키로 PK 만들기
ALTER TABLE MEMBER_ROLE ADD CONSTRAINT MR_PK PRIMARY KEY (USERNAME, NUM);


-- FK
ALTER TABLE NOTICEFILES ADD CONSTRAINT NFILES_NUM_FK FOREIGN KEY (NUM) REFERENCES NOTICE (NUM);
ALTER TABLE QNAFILES ADD CONSTRAINT QFILES_NUM_FK FOREIGN KEY (NUM) REFERENCES QNA (NUM);

ALTER TABLE MEMBER_ROLE ADD CONSTRAINT MR_UNAME_FK FOREIGN KEY (USERNAME) REFERENCES MEMBER (USERNAME);
ALTER TABLE MEMBER_ROLE ADD CONSTRAINT MR_NUM_FK FOREIGN KEY (NUM) REFERENCES ROLE (NUM);

-- 제약조건 확인
SELECT * FROM information_schema.TABLE_CONSTRAINTS tc;


-- Time_Zone 확인(UTC로 뜨는걸 KST로 바꿔야 한다.)
SELECT @@GLOBAL.time_zone, @@SESSION.time_zone;
SELECT now();


-- table 수정
ALTER TABLE MEMBER ADD LASTTIME DATETIME;


--
COMMIT;
SELECT * FROM ROLE;
SELECT * FROM MEMBER;
SELECT * FROM MEMBER_ROLE;


-- 데이터 세팅
INSERT INTO MEMBER
VALUES('id1', 'pw1', 'name1', 'id1@gmail.com', '2000-01-01', 1);

INSERT INTO `ROLE` 
VALUES(NULL, 'ROLE_ADMIN');
INSERT INTO `ROLE` 
VALUES(NULL, 'ROLE_MANAGER');
INSERT INTO `ROLE` 
VALUES(NULL, 'ROLE_MEMBER');

INSERT INTO MEMBER_ROLE 
VALUES('id1', 1);
INSERT INTO MEMBER_ROLE 
VALUES('id1', 2);
INSERT INTO MEMBER_ROLE 
VALUES('id1', 3);