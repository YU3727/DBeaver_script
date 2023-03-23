SELECT * FROM ALL_USERS ;
SELECT * FROM TAB;

PURGE RECYCLEBIN;

COMMIT;
ROLLBACK;

----------------------------------------------------------------------------------
--TABLE 생성, 조회, 삭제
CREATE TABLE MEMBER(
	ID VARCHAR2(400),
	PW VARCHAR2(400),
	NAME VARCHAR2(400),
	PHONE VARCHAR2(400),
	EMAIL VARCHAR2(400),
	ROLENAME VARCHAR2(400) --회원등급
);
DROP TABLE MEMBER;

CREATE TABLE ADDRESS(
	ADDRESSNUM NUMBER, --주소번호
	ID VARCHAR2(400),
	ADDRESSNAME VARCHAR2(400), --배송지이름
	ADDRESS VARCHAR2(400), --주소
	ADDRESSDETAIL VARCHAR2(400), --상세주소
	POSTCODE NUMBER --우편번호
);
DROP TABLE ADDRESS;

----------
CREATE TABLE NOTICE(
	NUM NUMBER,
	WRITER VARCHAR2(400),
	TITLE VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	HIT NUMBER
);
DROP TABLE NOTICE;

CREATE TABLE NOTICEFILES(
	FILENUM NUMBER,
	NUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);
DROP TABLE NOTICEFILES;

CREATE TABLE QNA(
	NUM NUMBER,
	WRITER VARCHAR2(400),
	TITLE VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	HIT NUMBER
);
DROP TABLE QNA;

CREATE TABLE QNAFILES(
	FILENUM NUMBER,
	NUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);
DROP TABLE QNAFILES;

CREATE TABLE QNACOMMENT(
	COMMENTNUM NUMBER,
	NUM NUMBER,
	WRITER VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	REF NUMBER,
	STEP NUMBER,
	DEPTH NUMBER
);
DROP TABLE QNACOMMENT;

CREATE TABLE STORY(
	NUM NUMBER,
	WRITER VARCHAR2(400),
	TITLE VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	HIT NUMBER
);
DROP TABLE STORY;

CREATE TABLE STORYFILES(
	FILENUM NUMBER,
	NUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);
DROP TABLE STORYFILES;

CREATE TABLE STORYCOMMENT(
	COMMENTNUM NUMBER,
	NUM NUMBER,
	WRITER VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	REF NUMBER,
	STEP NUMBER,
	DEPTH NUMBER
);
DROP TABLE STORYCOMMENT;

----------
CREATE TABLE CAMPINFO(
	CAMPNUM NUMBER,
	NAME VARCHAR2(400),
	PHONE VARCHAR2(400),
	ADDRESS VARCHAR2(400),
	LINEINTRO VARCHAR2(800),
	INTRO CLOB,
	FEATURE VARCHAR2(800),
	INDUTY VARCHAR2(400),
	DO VARCHAR2(400),
	SIGUNGU VARCHAR2(400),
	MAPX VARCHAR2(400),
	MAPY VARCHAR2(400),
	GLAMPFACILITY VARCHAR2(400),
	CARAVFACILITY VARCHAR2(400),
	SERVICE VARCHAR2(400),
	POSBLFACILITY VARCHAR2(400),
	THEME VARCHAR2(400),
	PETALLOW VARCHAR2(400),
	HOMEPAGE VARCHAR2(400),
	THUMBNAIL VARCHAR2(400),
	REGDATE VARCHAR2(400),
	MODIDATE VARCHAR2(400),
	HIT NUMBER
);
DROP TABLE CAMPINFO;
ALTER TABLE CAMPINFO DROP COLUMN CONTENTS;
ALTER TABLE CAMPINFO ADD LINEINTRO VARCHAR2(800);
ALTER TABLE CAMPINFO ADD INTRO CLOB;
ALTER TABLE CAMPINFO ADD FEATURE VARCHAR2(800);
ALTER TABLE CAMPINFO ADD INDUTY VARCHAR2(400);
ALTER TABLE CAMPINFO ADD DO VARCHAR2(400);
ALTER TABLE CAMPINFO ADD SIGUNGU VARCHAR2(400);
ALTER TABLE CAMPINFO ADD MAPX NUMBER(7, 4);
ALTER TABLE CAMPINFO ADD MAPY NUMBER(7, 5);
ALTER TABLE CAMPINFO ADD GLAMPFACILITY VARCHAR2(400);
ALTER TABLE CAMPINFO ADD CARAVFACILITY VARCHAR2(400);
ALTER TABLE CAMPINFO ADD SERVICE VARCHAR2(400);
ALTER TABLE CAMPINFO ADD POSBLFACILITY VARCHAR2(400);
ALTER TABLE CAMPINFO ADD THEME VARCHAR2(400);
ALTER TABLE CAMPINFO ADD PETALLOW VARCHAR2(400);
ALTER TABLE CAMPINFO ADD HOMEPAGE VARCHAR2(400);
ALTER TABLE CAMPINFO ADD THUMBNAIL VARCHAR2(400);
ALTER TABLE CAMPINFO ADD REGDATE DATE;
ALTER TABLE CAMPINFO ADD MODIDATE DATE;
ALTER TABLE CAMPINFO MODIFY REGDATE VARCHAR2(400);
ALTER TABLE CAMPINFO MODIFY MODIDATE VARCHAR2(400);
ALTER TABLE CAMPINFO MODIFY FEATURE VARCHAR2(800);
ALTER TABLE CAMPINFO RENAME COLUMN DO TO DONAME;
ALTER TABLE CAMPINFO RENAME COLUMN SIGUNGU TO SIGUNGUNAME;
ALTER TABLE CAMPINFO ADD HIT NUMBER;

--컬럼 순서바꾸기
ALTER TABLE CAMPINFO MODIFY THUMBNAIL INVISIBLE;
ALTER TABLE CAMPINFO MODIFY REGDATE INVISIBLE;
ALTER TABLE CAMPINFO MODIFY MODIDATE INVISIBLE;
ALTER TABLE CAMPINFO MODIFY CONTENTID INVISIBLE;
ALTER TABLE CAMPINFO MODIFY HIT INVISIBLE;

ALTER TABLE CAMPINFO MODIFY THUMBNAIL VISIBLE;
ALTER TABLE CAMPINFO MODIFY REGDATE VISIBLE;
ALTER TABLE CAMPINFO MODIFY MODIDATE VISIBLE;
ALTER TABLE CAMPINFO MODIFY CONTENTID VISIBLE;
ALTER TABLE CAMPINFO MODIFY HIT VISIBLE;
SELECT * FROM CAMPINFO ORDER BY CAMPNUM ASC;
TRUNCATE TABLE CAMPINFO;

CREATE TABLE CAMPFILES(
	FILENUM NUMBER,
	CAMPNUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);
DROP TABLE CAMPFILES;
SELECT * FROM CAMPFILES;
TRUNCATE TABLE CAMPFILES;

--CREATE TABLE CAMPTYPE(
--	OPTIONNUM NUMBER,
--	CAMPNUM NUMBER,
--	CAMPTYPE VARCHAR2(400)
--);
--DROP TABLE CAMPTYPE;

CREATE TABLE CAMPSITE(
	AREANUM NUMBER,
	CAMPNUM NUMBER,
	SIZEINFO VARCHAR2(400),
	PRICE NUMBER,
	STATUS VARCHAR2(400), --예약상태
	SITENAME VARCHAR2(400)
);
DROP TABLE CAMPSITE;
ALTER TABLE CAMPSITE ADD (SITENAME VARCHAR2(400));
SELECT * FROM CAMPSITE;
TRUNCATE TABLE CAMPSITE;


CREATE TABLE CAMPORDER(
	NUM NUMBER,
	AREANUM NUMBER,
	ID VARCHAR2(400),
	INDEXCODE NUMBER,
	ORDERNUM NUMBER,
	PRICE NUMBER,
	REGDATE DATE, --예약날짜
	STARTDATE DATE, --사용시작일
	LASTDATE DATE, --사용종료일
	ACCOUNT VARCHAR2(400), --계좌번호
	STATUS VARCHAR2(400) --결제상태(진행전/진행중/결제완료)
);
DROP TABLE CAMPORDER;

CREATE TABLE CAMPREVIEW(
	NUM NUMBER,
	CAMPNUM NUMBER,
	WRITER VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
);
DROP TABLE CAMPREVIEW;
ALTER TABLE CAMPREVIEW DROP COLUMN TITLE;
ALTER TABLE CAMPREVIEW DROP COLUMN HIT;
SELECT * FROM CAMPREVIEW;

CREATE TABLE CAMPREVIEWFILES(
	FILENUM NUMBER,
	NUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);
DROP TABLE CAMPREVIEWFILES;

CREATE TABLE CAMPREVIEWCOMMENT(
	COMMENTNUM NUMBER,
	NUM NUMBER,
	WRITER VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	REF NUMBER,
	STEP NUMBER,
	DEPTH NUMBER
);
DROP TABLE CAMPREVIEWCOMMENT;

----------
CREATE TABLE PRODUCT(
	PRODUCTNUM NUMBER,
	NAME VARCHAR2(400),
	CONTENTS CLOB,
	STATUS VARCHAR2(400), --대여상태
	SUMMARY VARCHAR2(400)
);
DROP TABLE PRODUCT;
ALTER TABLE PRODUCT ADD (SUMMARY VARCHAR2(400));
SELECT * FROM PRODUCT;

CREATE TABLE PRODUCTFILES(
	FILENUM NUMBER,
	PRODUCTNUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);
DROP TABLE PRODUCTFILES;

CREATE TABLE PRODUCTGRADE(
	GRADENUM NUMBER,
	PRODUCTNUM NUMBER,
	GRADESTOCK NUMBER,
	GRADENAME VARCHAR2(400),
	PRICE NUMBER
);
DROP TABLE PRODUCTGRADE;
ALTER TABLE PRODUCTGRADE ADD (PRICE NUMBER);
ALTER TABLE PRODUCTGRADE MODIFY GRADESTOCK NUMBER;
SELECT * FROM PRODUCTGRADE;

CREATE TABLE PRODUCTORDER(
	NUM NUMBER,
	GRADENUM NUMBER,
	ID VARCHAR2(400),
	INDEXCODE NUMBER,
	ORDERNUM NUMBER,
	PRICE NUMBER,
	REGDATE DATE, --계약날짜
	STARTDATE DATE, --사용시작일
	LASTDATE DATE, --사용종료일
	ACCOUNT VARCHAR2(400), --계좌번호
	AMOUNT NUMBER, --수량
	ADDRESS VARCHAR2(400),
	STATUS VARCHAR2(400), --결제상태
	ORDERER VARCHAR2(400),
	NAME VARCHAR2(400)
);
DROP TABLE PRODUCTORDER;
ALTER TABLE PRODUCTORDER ADD (ORDERER VARCHAR2(400));
ALTER TABLE PRODUCTORDER ADD (NAME VARCHAR2(400));
SELECT * FROM PRODUCTORDER;

CREATE TABLE PRODUCTREVIEW(
	NUM NUMBER,
	PRODUCTNUM NUMBER,
	WRITER VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
);
DROP TABLE PRODUCTREVIEW;
ALTER TABLE PRODUCTREVIEW DROP COLUMN TITLE;
ALTER TABLE PRODUCTREVIEW DROP COLUMN HIT;
SELECT * FROM PRODUCTREVIEW;

CREATE TABLE PRODUCTREVIEWFILES(
	FILENUM NUMBER,
	NUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);
DROP TABLE PRODUCTREVIEWFILES;

CREATE TABLE PRODUCTREVIEWCOMMENT(
	COMMENTNUM NUMBER,
	NUM NUMBER,
	WRITER VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	REF NUMBER,
	STEP NUMBER,
	DEPTH NUMBER
);
DROP TABLE PRODUCTREVIEWCOMMENT;

CREATE TABLE CART(
	CARTNUM NUMBER,
	ID VARCHAR2(400),
	PRODUCTNUM NUMBER,
	NAME VARCHAR2(400),
	AMOUNT NUMBER,
	COST NUMBER
);
DROP TABLE CART;

----------
CREATE TABLE ORDERINDEX(
	INDEXCODE NUMBER,
	CODENAME VARCHAR2(400),
	EXPLANATION VARCHAR2(400)
);
DROP TABLE ORDERINDEX;
SELECT * FROM ORDERINDEX;

CREATE TABLE ORDERS(
	ORDERNUM NUMBER,
	--INDEXCODE NUMBER
);
DROP TABLE ORDERS;
ALTER TABLE ORDERS DROP COLUMN INDEXCODE;
SELECT * FROM ORDERS;


CREATE TABLE PAYMENT(
	PAYNUM NUMBER,
	ORDERNUM NUMBER,
	PAYMETHOD VARCHAR2(400),
	PAYDATE DATE
);
DROP TABLE PAYMENT;


----------------------------------------------------------------------------------
--CONSTRAINT 생성 및 전체조회
SELECT * FROM USER_CONSTRAINTS;


--PK CONSTRAINT
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_ID_PK PRIMARY KEY (ID);
ALTER TABLE ADDRESS ADD CONSTRAINT ADDRESS_ANUM_PK PRIMARY KEY (ADDRESSNUM);

ALTER TABLE NOTICE ADD CONSTRAINT NOTICE_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE NOTICEFILES ADD CONSTRAINT NFILES_FNUM_PK PRIMARY KEY (FILENUM);
ALTER TABLE QNA ADD CONSTRAINT QNA_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE QNAFILES ADD CONSTRAINT QFILES_FNUM_PK PRIMARY KEY (FILENUM);
ALTER TABLE QNACOMMENT ADD CONSTRAINT QCOMMENT_CNUM_PK PRIMARY KEY (COMMENTNUM);
ALTER TABLE STORY ADD CONSTRAINT STORY_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE STORYFILES ADD CONSTRAINT SFILES_FNUM_PK PRIMARY KEY (FILENUM);
ALTER TABLE STORYCOMMENT ADD CONSTRAINT SCOMMENT_CNUM_PK PRIMARY KEY (COMMENTNUM);

ALTER TABLE CAMPINFO ADD CONSTRAINT CINFO_CNUM_PK PRIMARY KEY (CAMPNUM);
ALTER TABLE CAMPFILES ADD CONSTRAINT CFILES_FNUM_PK PRIMARY KEY (FILENUM);
ALTER TABLE CAMPTYPE ADD CONSTRAINT CTYPE_ONUM_PK PRIMARY KEY (OPTIONNUM);
ALTER TABLE CAMPSITE ADD CONSTRAINT CSITE_ANUM_PK PRIMARY KEY (AREANUM);
ALTER TABLE CAMPORDER ADD CONSTRAINT CORDER_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE CAMPREVIEW ADD CONSTRAINT CREVIEW_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE CAMPREVIEWFILES ADD CONSTRAINT CRFILES_FNUM_PK PRIMARY KEY (FILENUM);
ALTER TABLE CAMPREVIEWCOMMENT ADD CONSTRAINT CRCOMMENT_CNUM_PK PRIMARY KEY (COMMENTNUM);

ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_PNUM_PK PRIMARY KEY (PRODUCTNUM);
ALTER TABLE PRODUCTFILES ADD CONSTRAINT PFILES_FNUM_PK PRIMARY KEY (FILENUM);
ALTER TABLE PRODUCTGRADE ADD CONSTRAINT PGRADE_GNUM_PK PRIMARY KEY (GRADENUM);
ALTER TABLE PRODUCTORDER ADD CONSTRAINT PORDER_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE PRODUCTREVIEW ADD CONSTRAINT PREVIEW_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE PRODUCTREVIEWFILES ADD CONSTRAINT PRFILES_FNUM_PK PRIMARY KEY (FILENUM);
ALTER TABLE PRODUCTREVIEWCOMMENT ADD CONSTRAINT PRCOMMENT_CNUM_PK PRIMARY KEY (COMMENTNUM);
ALTER TABLE CART ADD CONSTRAINT CART_CNUM_PK PRIMARY KEY (CARTNUM);

ALTER TABLE ORDERINDEX ADD CONSTRAINT OINDEX_INDEXCODE_PK PRIMARY KEY(INDEXCODE);
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_ONUM_PK PRIMARY KEY (ORDERNUM);
ALTER TABLE PAYMENT ADD CONSTRAINT PAYMENT_PNUM_PK PRIMARY KEY (PAYNUM);


--FK CONSTRAINT // ON DELETE CASCADE
ALTER TABLE ADDRESS ADD CONSTRAINT ADDRESS_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID) ON DELETE CASCADE;

ALTER TABLE NOTICE ADD CONSTRAINT NOTICE_WRITER_FK FOREIGN KEY (WRITER) REFERENCES MEMBER(ID) ON DELETE CASCADE; --WRITER/ID
ALTER TABLE NOTICEFILES ADD CONSTRAINT NFILES_NUM_FK FOREIGN KEY (NUM) REFERENCES NOTICE(NUM) ON DELETE CASCADE;
ALTER TABLE QNA ADD CONSTRAINT QNA_WRITER_FK FOREIGN KEY (WRITER) REFERENCES MEMBER(ID) ON DELETE CASCADE; --WRITER/ID
ALTER TABLE QNAFILES ADD CONSTRAINT QFILES_NUM_FK FOREIGN KEY (NUM) REFERENCES QNA(NUM) ON DELETE CASCADE;
ALTER TABLE QNACOMMENT ADD CONSTRAINT QCOMMENT_NUM_FK FOREIGN KEY (NUM) REFERENCES QNA(NUM) ON DELETE CASCADE;
ALTER TABLE STORY ADD CONSTRAINT STORY_WRITER_FK FOREIGN KEY (WRITER) REFERENCES MEMBER(ID) ON DELETE CASCADE; --WRITER/ID
ALTER TABLE STORYFILES ADD CONSTRAINT SFILES_NUM_FK FOREIGN KEY (NUM) REFERENCES STORY(NUM) ON DELETE CASCADE;
ALTER TABLE STORYCOMMENT ADD CONSTRAINT SCOMMENT_NUM_FK FOREIGN KEY (NUM) REFERENCES STORY(NUM) ON DELETE CASCADE;

ALTER TABLE CAMPFILES ADD CONSTRAINT CFILES_CNUM_FK FOREIGN KEY (CAMPNUM) REFERENCES CAMPINFO(CAMPNUM) ON DELETE CASCADE;
ALTER TABLE CAMPTYPE ADD CONSTRAINT CTYPE_CNUM_FK FOREIGN KEY (CAMPNUM) REFERENCES CAMPINFO(CAMPNUM) ON DELETE CASCADE;
ALTER TABLE CAMPSITE ADD CONSTRAINT CSITE_CNUM_FK FOREIGN KEY (CAMPNUM) REFERENCES CAMPINFO(CAMPNUM) ON DELETE CASCADE;
ALTER TABLE CAMPORDER ADD CONSTRAINT CORDER_ANUM_FK FOREIGN KEY (AREANUM) REFERENCES CAMPSITE(AREANUM) ON DELETE CASCADE;
ALTER TABLE CAMPORDER ADD CONSTRAINT CORDER_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID) ON DELETE CASCADE;
ALTER TABLE CAMPORDER ADD CONSTRAINT CORDER_INDEXCODE_FK FOREIGN KEY (INDEXCODE) REFERENCES ORDERINDEX(INDEXCODE) ON DELETE CASCADE;
ALTER TABLE CAMPORDER ADD CONSTRAINT CORDER_ONUM_FK FOREIGN KEY (ORDERNUM) REFERENCES ORDERS(ORDERNUM) ON DELETE CASCADE;
ALTER TABLE CAMPREVIEW ADD CONSTRAINT CREVIEW_CNUM_FK FOREIGN KEY (CAMPNUM) REFERENCES CAMPINFO(CAMPNUM) ON DELETE CASCADE;
ALTER TABLE CAMPREVIEW ADD CONSTRAINT CREVIEW_WRITER_FK FOREIGN KEY (WRITER) REFERENCES MEMBER(ID) ON DELETE CASCADE; --WRITER/ID
ALTER TABLE CAMPREVIEWFILES ADD CONSTRAINT CRFILES_NUM_FK FOREIGN KEY (NUM) REFERENCES CAMPREVIEW(NUM) ON DELETE CASCADE;
ALTER TABLE CAMPREVIEWCOMMENT ADD CONSTRAINT CRCOMMENT_NUM_FK FOREIGN KEY (NUM) REFERENCES CAMPREVIEW(NUM) ON DELETE CASCADE;

ALTER TABLE PRODUCTFILES ADD CONSTRAINT PFILES_PNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTGRADE ADD CONSTRAINT PGRADE_PNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTORDER ADD CONSTRAINT PORDER_GNUM_FK FOREIGN KEY (GRADENUM) REFERENCES PRODUCTGRADE(GRADENUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTORDER ADD CONSTRAINT PORDER_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID) ON DELETE CASCADE;
ALTER TABLE PRODUCTORDER ADD CONSTRAINT PORDER_INDEXCODE_FK FOREIGN KEY (INDEXCODE) REFERENCES ORDERINDEX(INDEXCODE) ON DELETE CASCADE;
ALTER TABLE PRODUCTORDER ADD CONSTRAINT PORDER_ONUM_FK FOREIGN KEY (ORDERNUM) REFERENCES ORDERS(ORDERNUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTREVIEW ADD CONSTRAINT PREVIEW_PNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTREVIEW ADD CONSTRAINT PREVIEW_WRITER_FK FOREIGN KEY (WRITER) REFERENCES MEMBER(ID) ON DELETE CASCADE; --WRITER/ID
ALTER TABLE PRODUCTREVIEWFILES ADD CONSTRAINT PRFILES_NUM_FK FOREIGN KEY (NUM) REFERENCES PRODUCTREVIEW(NUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTREVIEWCOMMENT ADD CONSTRAINT RECOMMENT_NUM_FK FOREIGN KEY (NUM) REFERENCES PRODUCTREVIEW(NUM) ON DELETE CASCADE;
ALTER TABLE CART ADD CONSTRAINT CART_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID) ON DELETE CASCADE;
ALTER TABLE CART ADD CONSTRAINT CART_PNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM) ON DELETE CASCADE;

--ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_INDEXCODE_FK FOREIGN KEY (INDEXCODE) REFERENCES ORDERINDEX(INDEXCODE) ON DELETE CASCADE;
ALTER TABLE PAYMENT ADD CONSTRAINT PAYMENT_ONUM_FK FOREIGN KEY (ORDERNUM) REFERENCES ORDERS(ORDERNUM) ON DELETE CASCADE;


----------------------------------------------------------------------------------
--DROP CONSTRAINT 예시
--ALTER TABLE ADDRESS DROP CONSTRAINT ADDRESS_ID_FK;


----------------------------------------------------------------------------------
--SEQUENCE 생성, 조회, 삭제
SELECT * FROM USER_SEQUENCES;

CREATE SEQUENCE MEMBERSEQ;
CREATE SEQUENCE BOARDSEQ;
CREATE SEQUENCE CAMPSEQ;
CREATE SEQUENCE PRODUCTSEQ;
CREATE SEQUENCE PAYMENTSEQ;


--SEQUENCE값 한번에 증가시키기
DROP SEQUENCE CAMPSEQ;
CREATE SEQUENCE CAMPSEQ;
ALTER SEQUENCE CAMPSEQ INCREMENT BY 499;
SELECT CAMPSEQ.NEXTVAL FROM DUAL;
ALTER SEQUENCE CAMPSEQ INCREMENT BY 1;

--DROP SEQUENCE ROLE_SEQ;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

