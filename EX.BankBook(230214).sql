SELECT * FROM TAB;

PURGE RECYCLEBIN;

ROLLBACK;
COMMIT;


--TABLE 생성
CREATE TABLE PRODUCT(
	PRODUCTNUM NUMBER,
	PRODUCTNAME VARCHAR2(200),
	PRODUCTDETAIL CLOB,
	PRODUCTSCORE NUMBER(2,1)
)

CREATE TABLE PRODUCTOPTION(
	OPTIONNUM NUMBER,
	PRODUCTNUM NUMBER,
	OPTIONNAME VARCHAR2(200),
	OPTIONPRICE NUMBER,
	OPTIONSTOCK NUMBER
)

CREATE TABLE COMMENTARY(
	COMMENTNUM NUMBER,
	PRODUCTNUM NUMBER,
	ID VARCHAR2(200),
	COMMENTSCORE NUMBER(2,1),
	COMMENTDATE DATE,
	COMMENTARY VARCHAR2(500)
)

CREATE TABLE MEMBER(
	ID VARCHAR2(200),
	PW VARCHAR2(200),
	MEMBERNAME VARCHAR2(200),
	MEMBERPHONE VARCHAR2(200),
	EMAIL VARCHAR2(200)
)

/*CREATE TABLE ADDRESS(
	ADDRESSNUM NUMBER,
	ID VARCHAR2(200),
	ADDRESS VARCHAR2(200),
	ADDRESSPHONE VARCHAR2(200),
	ADDRESSNAME VARCHAR2(200)
)*/

CREATE TABLE ROLE(
	ROLENUM NUMBER,
	ROLENAME VARCHAR2(200)
)

CREATE TABLE MEMBER_ROLE(
	ID VARCHAR2(200),
	ROLENUM NUMBER
)

CREATE TABLE BANKBOOK(
	BOOKNUMBER NUMBER,
	BOOKNAME VARCHAR2(200),
	BOOKRATE NUMBER(2,1),
	BOOKSALE NUMBER,
	BOOKDETAIL VARCHAR2(200)
)


---
CREATE TABLE ACCOUNT(
	ACCOUNTNUM NUMBER,
	ID VARCHAR2(200),
	BOOKNUMBER NUMBER,
	ACCOUNTDATE DATE,
	ACCOUNTBALANCE NUMBER
)

CREATE TABLE TRADE(
	TRADENUM NUMBER,
	ACCOUNTNUM NUMBER,
	TRADEBALANCE NUMBER,
	TRADETABLE DATE,
	TRADEIO NUMBER,
	TRADEAMOUNT VARCHAR2(200)
)

CREATE TABLE BANKBOOKIMG(
	FILENUM NUMBER,
	BOOKNUMBER NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
)


--조회
SELECT * FROM USER_SEQUENCES;
SELECT * FROM USER_CONSTRAINTS;

SELECT * FROM TAB;
SELECT * FROM BANKBOOK;
SELECT * FROM MEMBER;
SELECT * FROM ROLE;
SELECT * FROM MEMBER_ROLE;
SELECT * FROM ACCOUNT;
SELECT * FROM TRADE;

DROP TABLE PRODUCTOPTION ;
DROP TABLE COMMENTARY;
DROP TABLE PRODUCT;
DROP TABLE MEMBER_ROLE;
DROP TABLE "ROLE" ;
DROP TABLE TRADE;
DROP TABLE ACCOUNT;
DROP TABLE MEMBER;
DROP TABLE BANKBOOK;


TRUNCATE TABLE ACCOUNT;
ALTER TABLE ACCOUNT MODIFY ACCOUNTNUM NUMBER;

--CONSTRAINT
ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_PNUM_PK PRIMARY KEY (PRODUCTNUM);

ALTER TABLE PRODUCTOPTION ADD CONSTRAINT POPTION_OPNUM_PK PRIMARY KEY (OPTIONNUM);
ALTER TABLE PRODUCTOPTION ADD CONSTRAINT POPTION_PNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT (PRODUCTNUM) ON DELETE CASCADE; 

ALTER TABLE COMMENTARY ADD CONSTRAINT COMMENTARY_CNUM_PK PRIMARY KEY (COMMENTNUM);
ALTER TABLE COMMENTARY ADD CONSTRAINT COMMENTARY_PNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT (PRODUCTNUM) ON DELETE CASCADE;
ALTER TABLE COMMENTARY ADD CONSTRAINT COMMENTARY_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER (ID) ON DELETE CASCADE;

ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_ID_PK PRIMARY KEY (ID);

--ALTER TABLE ADDRESS ADD CONSTRAINT ADDRESS_ANUM_PK PRIMARY KEY (ADDRESSNUM);
--ALTER TABLE ADDRESS ADD CONSTRAINT ADDRESS_IN_FK FOREIGN KEY (ID) REFERENCES MEMBER (ID) ON DELETE CASCADE;

ALTER TABLE ROLE ADD CONSTRAINT ROLE_RNUM_PK PRIMARY KEY (ROLENUM);

ALTER TABLE MEMBER_ROLE ADD CONSTRAINT MROLE_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER (ID) ON DELETE CASCADE;
ALTER TABLE MEMBER_ROLE ADD CONSTRAINT MROLE_RNUM_FK FOREIGN KEY (ROLENUM) REFERENCES ROLE (ROLENUM) ON DELETE CASCADE;

ALTER TABLE BANKBOOK ADD CONSTRAINT BANKBOOK_BNUM_PK PRIMARY KEY (BOOKNUMBER);

ALTER TABLE ACCOUNT ADD CONSTRAINT ACCOUNT_ANUM_PK PRIMARY KEY (ACCOUNTNUM);
ALTER TABLE ACCOUNT ADD CONSTRAINT ACCOUNT_BNUM_FK FOREIGN KEY (BOOKNUMBER) REFERENCES BANKBOOK (BOOKNUMBER) ON DELETE CASCADE;
ALTER TABLE ACCOUNT ADD CONSTRAINT ACCOUNT_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER (ID) ON DELETE CASCADE;

ALTER TABLE TRADE ADD CONSTRAINT TRADE_TNUM_PK PRIMARY KEY (TRADENUM);
ALTER TABLE TRADE ADD CONSTRAINT TRADE_ANUM_FK FOREIGN KEY (ACCOUNTNUM) REFERENCES ACCOUNT (ACCOUNTNUM) ON DELETE CASCADE;

ALTER TABLE BANKBOOKIMG ADD CONSTRAINT BBIMG_FNUM_PK PRIMARY KEY (FILENUM);
ALTER TABLE BANKBOOKIMG ADD CONSTRAINT BBIMG_BNUM_FK FOREIGN KEY (BOOKNUMBER) REFERENCES BANKBOOK (BOOKNUMBER);

--SEQUENCE
SELECT * FROM USER_SEQUENCES;
CREATE SEQUENCE PRODUCTNUM_SEQ;
CREATE SEQUENCE OPTIONNUM_SEQ;
CREATE SEQUENCE COMMENTNUM_SEQ;
CREATE SEQUENCE ROLE_SEQ;
CREATE SEQUENCE BANKNUM_SEQ;
CREATE SEQUENCE TRADENUM_SEQ;
CREATE SEQUENCE ACCOUNTNUM_SEQ;


--Script
INSERT INTO "MEMBER" 
VALUES('user01')