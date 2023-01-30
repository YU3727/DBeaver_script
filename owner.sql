--table 만들기
--owner
SELECT * FROM TAB;

CREATE TABLE PRODUCT (
	PRODUCTNUM NUMBER CONSTRAINT PRODUCT_NUM_PK PRIMARY KEY,
	PRODUCTNAME VARCHAR2(200),
	PRODUCTDETAIL CLOB,
	PRODUCTSCORE NUMBER(2, 1)
);


CREATE TABLE PRODUCTOPTION (
	OPTIONNUM NUMBER CONSTRAINT PRODUCTOPTION_NUM_PK PRIMARY KEY,
	PRODUCTNUM NUMBER,
	OPTIONNAME VARCHAR2(200),
	OPTIONPRICE NUMBER,
	OPTIONSTOCK NUMBER
);
DROP TABLE PRODUCTOPTION;


CREATE TABLE COMMENTARY(
	COMMENTNUM NUMBER CONSTRAINT COMMENT_NUM_PK PRIMARY KEY,
	PRODUCTNUM NUMBER,
	ID VARCHAR2(200),
	COMMENTSCORE NUMBER(2, 1),
	COMMENTDATE DATE,
	COMMENTARY VARCHAR2(500)
);
DROP TABLE COMMENTARY;


SELECT * FROM USER_CONSTRAINTS;
ROLLBACK;
COMMIT;

--PRODUCT 작업
SELECT * FROM PRODUCT;


--PRODUCTOPTION 작업
SELECT * FROM PRODUCTOPTION;
ALTER TABLE PRODUCTOPTION ADD CONSTRAINT POPTION_OPNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT (PRODUCTNUM) ON DELETE CASCADE;

ALTER TABLE PRODUCTOPTION DROP CONSTRAINT POPTION_OPNUM_FK;

--COMMENTARY 작업
SELECT * FROM COMMENTARY;
ALTER TABLE COMMENTARY ADD CONSTRAINT COMMENTARY_PNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT (PRODUCTNUM) ON DELETE CASCADE;
ALTER TABLE COMMENTARY ADD CONSTRAINT COMMENTARY_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER (ID) ON DELETE CASCADE;

ALTER TABLE COMMENTARY DROP CONSTRAINT COMMENTARY_PNUM_FK;
ALTER TABLE COMMENTARY DROP CONSTRAINT COMMENTARY_ID_FK;

--TEST용

CREATE SEQUENCE COMMENTARY_SEQ;
INSERT INTO PRODUCT 
VALUES (PRODUCT_SEQ.NEXTVAL, '123', '12345', 5.5);
SELECT * FROM PRODUCT p ;

TRUNCATE TABLE PRODUCT;
SELECT * FROM RECYCLEBIN;


--230127 1교시 ROLE, MEMBER_ROLE 만들기
SELECT * FROM TAB; --내가 가진 모든 TABLE을 보여준다
SELECT * FROM USER_CONSTRAINTS; --내가 가진 모든 제약조건을 보여준다

CREATE TABLE ROLE(
	ROLENUM NUMBER,
	ROLENAME VARCHAR2(50)
)

ALTER TABLE ROLE ADD CONSTRAINT ROLE_RNUM_PK PRIMARY KEY (ROLENUM);


--MEMBER_ROLE에는 PK가 있어도 문제이다.
--ID, ROLENUM 둘 다 FK이기 때문. 또한 M:N 관계를 풀기위한 중간TABLE이므로, 중복된 값이 들어올 필요가 있다.
--두개의 COLUMN 이상을 묶은 복합키(슈퍼키)로 생각하면 중복이 되지 않는다.
CREATE TABLE MEMBER_ROLE(
	ID VARCHAR2(50),
	ROLENUM NUMBER
)
--ID, ROLENUM을 외래키로 지정해서 쓰는법
ALTER TABLE MEMBER_ROLE ADD CONSTRAINT MR_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER (ID);
ALTER TABLE MEMBER_ROLE ADD CONSTRAINT MR_RNUM_FK FOREIGN KEY (ROLENUM) REFERENCES ROLE; --자식TABLE과 부모TABLE의 COLUMN명이 같으면 뒤에거 생략 가능
ALTER TABLE MEMBER_ROLE DROP CONSTRAINT MR_ID_FK;
ALTER TABLE MEMBER_ROLE DROP CONSTRAINT MR_RNUM_FK;

--ID, ROLENUM을 동시에(복합키) PK로 지정해서 쓰는법
ALTER TABLE MEMBER_ROLE ADD CONSTRAINT MR_PK PRIMARY KEY (ID, ROLENUM);

INSERT INTO MEMBER
VALUES ('ID1', 'PW1', 'NAME1', 'PHONE1', 'EMAIL1');

INSERT INTO MEMBER
VALUES ('ID2', 'PW2', 'NAME2', 'PHONE2', 'EMAIL2');

CREATE SEQUENCE ROLE_SEQ;

INSERT INTO ROLE
VALUES (ROLE_SEQ.NEXTVAL, 'MEMBER');

INSERT INTO MEMBER_ROLE 
VALUES ('ID1', 1); -- ID1은 ADMIN 권한을 가진다
INSERT INTO MEMBER_ROLE 
VALUES ('ID1', 2); -- ID1은 MANAGER 권한을 가진다

SELECT * FROM MEMBER_ROLE;

INSERT INTO MEMBER_ROLE 
VALUES ('ID1', 2); -- 같은걸 한번 더 쓰면 복합키를 PK로 제약조건을 걸어뒀으므로 에러가 뜨면서 안들어가진다
INSERT INTO MEMBER_ROLE 
VALUES ('ID2', 2);

INSERT INTO MEMBER_ROLE 
VALUES ('ID3', -5); --ID3과 5번권한은 없는데 복합키 제약조건이 PK만 있으므로, 이런 문제는 JAVA 프로그램에서 해결해야한다.

SELECT * FROM MEMBER_ROLE
WHERE ROLENUM > 0;


CREATE TABLE TEST(
	ID NUMBER,
	PW NUMBER
);

ALTER TABLE TEST MODIFY ID NOT NULL;
ALTER TABLE TEST 
ALTER TABLE TEST ADD CONSTRAINT TEST_ID_U UNIQUE (ID);


--230130 5교시
SELECT MAX(PRODUCTNUM) FROM PRODUCTOPTION;

--product
SELECT * FROM PRODUCT;
CREATE SEQUENCE PRODUCT_SEQ;
INSERT INTO PRODUCT 
VALUES(PRODUCT_SEQ.NEXTVAL, '1번상품', '좋아요', 5);
INSERT INTO PRODUCT 
VALUES(PRODUCT_SEQ.NEXTVAL, '2번상품', '깨끗해요', 4);
TRUNCATE TABLE PRODUCT;

--productoption
SELECT * FROM PRODUCTOPTION;
CREATE SEQUENCE PRODUCTOPTION_SEQ;
INSERT INTO PRODUCTOPTION 
VALUES(PRODUCTOPTION_SEQ.NEXTVAL, 21, '옵션1', 11111, 1);
INSERT INTO PRODUCTOPTION 
VALUES(PRODUCTOPTION_SEQ.NEXTVAL, 22, '옵션2', 22222, 2);

COMMIT;
ROLLBACK;

