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


CREATE TABLE ADDRESS(
	ADDRESSNUM NUMBER, --주소번호
	ID VARCHAR2(400),
	ADDRESSNAME VARCHAR2(400), --배송지이름
	ADDRESS VARCHAR2(400), --주소
	ADDRESSDETAIL VARCHAR2(400), --상세주소
	POSTCODE NUMBER --우편번호
);


CREATE TABLE KAKAO(
	KAKAONUM NUMBER,
	KAKAONAME VARCHAR2(400),
	KAKAOEMAIL VARCHAR2(400)
);


----------
CREATE TABLE NOTICE(
	NUM NUMBER,
	WRITER VARCHAR2(400),
	TITLE VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	HIT NUMBER
);


CREATE TABLE NOTICEFILES(
	FILENUM NUMBER,
	NUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);


CREATE TABLE QNA(
	NUM NUMBER,
	WRITER VARCHAR2(400),
	TITLE VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	HIT NUMBER
);


CREATE TABLE QNAFILES(
	FILENUM NUMBER,
	NUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);


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


CREATE TABLE STORY(
	NUM NUMBER,
	WRITER VARCHAR2(400),
	TITLE VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	HIT NUMBER,
	BOARDID NUMBER
);


CREATE TABLE STORYFILES(
	FILENUM NUMBER,
	NUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);


CREATE TABLE STORYCOMMENT(
	COMMENTNUM NUMBER,
	NUM NUMBER,
	WRITER VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	REF NUMBER,
	STEP NUMBER,
	DEPTH NUMBER,
	BOARDID NUMBER
);


CREATE TABLE BOARDTYPE (
   BOARDID NUMBER,
   BOARDNAME VARCHAR2(400)
);


CREATE TABLE REPORT(
	REPORTNUM VARCHAR2(400),
	NUM NUMBER,
	COMMENTNUM NUMBER,
	BOARDID NUMBER,
	REPORTER VARCHAR2(400),
	REPORTCONTENTS CLOB,
	REPORTDATE DATE,
	REPORTRESULT NUMBER,
	REPORTEDUSER VARCHAR2(400),
	REPORTEDCONTENTS CLOB,
	REPORTTYPE VARCHAR2(400)
);


----------
CREATE TABLE CAMPINFO(
	CAMPNUM NUMBER,
	CAMPNAME VARCHAR2(400),
	PHONE VARCHAR2(400),
	ADDRESS VARCHAR2(400),
	LINEINTRO VARCHAR2(800),
	INTRO CLOB,
	FEATURE VARCHAR2(800),
	INDUTY VARCHAR2(400),
	DONAME VARCHAR2(400),
	SIGUNGUNAME VARCHAR2(400),
	GLAMPFACILITY VARCHAR2(400),
	CARAVFACILITY VARCHAR2(400),
	SERVICE VARCHAR2(400),
	POSBLFACILITY VARCHAR2(400),
	PETALLOW VARCHAR2(400),
	USEINFO CLOB,
	HOMEPAGE VARCHAR2(400),
	THUMBNAIL VARCHAR2(400),
	REGDATE VARCHAR2(400),
	MODIDATE VARCHAR2(400),
	CONTENTID NUMBER,
	HIT NUMBER
);


CREATE TABLE CAMPFILES(
	FILENUM NUMBER,
	CAMPNUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);


CREATE TABLE THUMBNAIL(
	THUMBNUM NUMBER,
	CAMPNUM NUMBER,
	THUMBNAME VARCHAR2(400)
);


CREATE TABLE LAYOUT(
	LAYOUTNUM NUMBER,
	CAMPNUM NUMBER,
	LAYOUTNAME VARCHAR2(400)
);


CREATE TABLE CAMPSITE(
	AREANUM NUMBER,
	CAMPNUM NUMBER,
	SITENAME VARCHAR2(400),
	SITESIZE VARCHAR2(400),
	OFFWEEKDAYSPRICE NUMBER, --비수기/주중 요금
	OFFWEEKENDSPRICE NUMBER, --비수기/주말 요금
	PEAKWEEKDAYSPRICE NUMBER, --성수기/주중 요금
	PEAKWEEKENDSPRICE NUMBER, --성수기/주말 요금
	STARTDATE DATE,
	LASTDATE DATE,
	STATUS VARCHAR2(400) --예약상태
);


CREATE TABLE CAMPBOOK(
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
	STATUS VARCHAR2(400), --결제상태(진행전/진행중/결제완료)
	SITENAME VARCHAR2(400), --예약한 사이트의 이름
	NAME VARCHAR2(400) --예약자 이름
);


CREATE TABLE CAMPREVIEW(
	NUM NUMBER,
	CAMPNUM NUMBER,
	WRITER VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	MARK NUMBER
);


CREATE TABLE CAMPREVIEWFILES(
	FILENUM NUMBER,
	NUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);


----------
CREATE TABLE PRODUCT(
	PRODUCTNUM NUMBER,
	NAME VARCHAR2(400),
	CONTENTS CLOB,
	STATUS VARCHAR2(400), --대여상태
	SUMMARY VARCHAR2(400)
);


CREATE TABLE PRODUCTFILES(
	FILENUM NUMBER,
	PRODUCTNUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);


CREATE TABLE PRODUCTGRADE(
	GRADENUM NUMBER,
	PRODUCTNUM NUMBER,
	GRADESTOCK NUMBER,
	GRADENAME VARCHAR2(400),
	PRICE NUMBER
);


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


CREATE TABLE PRODUCTREVIEW(
	NUM NUMBER,
	PRODUCTNUM NUMBER,
	WRITER VARCHAR2(400),
	CONTENTS CLOB,
	REGDATE DATE,
	MARK NUMBER
);


CREATE TABLE PRODUCTREVIEWFILES(
	FILENUM NUMBER,
	NUM NUMBER,
	FILENAME VARCHAR2(400),
	ORINAME VARCHAR2(400)
);


CREATE TABLE CART(
	CARTNUM NUMBER,
	ID VARCHAR2(400),
	GRADENUM NUMBER,
	NAME VARCHAR2(400),
	AMOUNT NUMBER,
	PRICE NUMBER,
	ORDERER VARCHAR2(400),
	STARTDATE DATE,
	LASTDATE DATE,
	INDEXCODE NUMBER
);


----------
CREATE TABLE ORDERINDEX(
	INDEXCODE NUMBER,
	CODENAME VARCHAR2(400),
	EXPLANATION VARCHAR2(400)
);


CREATE TABLE ORDERS(
	ORDERNUM NUMBER
);


CREATE TABLE PAYMENT(
	PAYNUM NUMBER,
	ORDERNUM NUMBER,
	PAYMETHOD VARCHAR2(400),
	PAYDATE DATE
);


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
ALTER TABLE STORYCOMMENT ADD CONSTRAINT SCOMMENT_CNUM_NUM_PK PRIMARY KEY (COMMENTNUM, NUM); -- 신고처리용 복합고유키
ALTER TABLE BOARDTYPE ADD CONSTRAINT BOARDTYPE_BID_PK PRIMARY KEY (BOARDID);
ALTER TABLE REPORT ADD CONSTRAINT REPORT_RNUM_PK PRIMARY KEY(REPORTNUM);

ALTER TABLE CAMPINFO ADD CONSTRAINT CINFO_CNUM_PK PRIMARY KEY (CAMPNUM);
ALTER TABLE CAMPFILES ADD CONSTRAINT CFILES_FNUM_PK PRIMARY KEY (FILENUM);
ALTER TABLE THUMBNAIL ADD CONSTRAINT THUMBNAIL_TNUM_PK PRIMARY KEY (THUMBNUM);
ALTER TABLE LAYOUT ADD CONSTRAINT LAYOUT_LNUM_PK PRIMARY KEY (LAYOUTNUM);
ALTER TABLE CAMPSITE ADD CONSTRAINT CSITE_ANUM_PK PRIMARY KEY (AREANUM);
ALTER TABLE CAMPBOOK ADD CONSTRAINT CBOOK_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE CAMPREVIEW ADD CONSTRAINT CREVIEW_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE CAMPREVIEWFILES ADD CONSTRAINT CRFILES_FNUM_PK PRIMARY KEY (FILENUM);

ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_PNUM_PK PRIMARY KEY (PRODUCTNUM);
ALTER TABLE PRODUCTFILES ADD CONSTRAINT PFILES_FNUM_PK PRIMARY KEY (FILENUM);
ALTER TABLE PRODUCTGRADE ADD CONSTRAINT PGRADE_GNUM_PK PRIMARY KEY (GRADENUM);
ALTER TABLE PRODUCTORDER ADD CONSTRAINT PORDER_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE PRODUCTREVIEW ADD CONSTRAINT PREVIEW_NUM_PK PRIMARY KEY (NUM);
ALTER TABLE PRODUCTREVIEWFILES ADD CONSTRAINT PRFILES_FNUM_PK PRIMARY KEY (FILENUM);
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
ALTER TABLE STORY ADD CONSTRAINT STORY_BID_FK FOREIGN KEY (BOARDID) REFERENCES BOARDTYPE(BOARDID); 
ALTER TABLE STORYFILES ADD CONSTRAINT SFILES_NUM_FK FOREIGN KEY (NUM) REFERENCES STORY(NUM) ON DELETE CASCADE;
ALTER TABLE STORYCOMMENT ADD CONSTRAINT SCOMMENT_NUM_FK FOREIGN KEY (NUM) REFERENCES STORY(NUM) ON DELETE CASCADE;
ALTER TABLE REPORT ADD CONSTRAINT REPORT_NUM_CNUM_FK FOREIGN KEY (NUM, COMMENTNUM) REFERENCES STORYCOMMENT(NUM, COMMENTNUM); -- 복합 외래키

ALTER TABLE CAMPFILES ADD CONSTRAINT CFILES_CNUM_FK FOREIGN KEY (CAMPNUM) REFERENCES CAMPINFO(CAMPNUM) ON DELETE CASCADE;
ALTER TABLE THUMBNAIL ADD CONSTRAINT THUMBNAIL_CNUM_FK FOREIGN KEY (CAMPNUM) REFERENCES CAMPINFO(CAMPNUM) ON DELETE CASCADE;
ALTER TABLE LAYOUT ADD CONSTRAINT LAYOUT_CNUM_FK FOREIGN KEY (CAMPNUM) REFERENCES CAMPINFO(CAMPNUM) ON DELETE CASCADE;
ALTER TABLE CAMPSITE ADD CONSTRAINT CSITE_CNUM_FK FOREIGN KEY (CAMPNUM) REFERENCES CAMPINFO(CAMPNUM) ON DELETE CASCADE;
ALTER TABLE CAMPBOOK ADD CONSTRAINT CBOOK_ANUM_FK FOREIGN KEY (AREANUM) REFERENCES CAMPSITE(AREANUM) ON DELETE CASCADE;
ALTER TABLE CAMPBOOK ADD CONSTRAINT CBOOK_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID) ON DELETE CASCADE;
ALTER TABLE CAMPBOOK ADD CONSTRAINT CBOOK_INDEXCODE_FK FOREIGN KEY (INDEXCODE) REFERENCES ORDERINDEX(INDEXCODE) ON DELETE CASCADE;
ALTER TABLE CAMPBOOK ADD CONSTRAINT CBOOK_ONUM_FK FOREIGN KEY (ORDERNUM) REFERENCES ORDERS(ORDERNUM) ON DELETE CASCADE;
ALTER TABLE CAMPREVIEW ADD CONSTRAINT CREVIEW_CNUM_FK FOREIGN KEY (CAMPNUM) REFERENCES CAMPINFO(CAMPNUM) ON DELETE CASCADE;
ALTER TABLE CAMPREVIEW ADD CONSTRAINT CREVIEW_WRITER_FK FOREIGN KEY (WRITER) REFERENCES MEMBER(ID) ON DELETE CASCADE; --WRITER/ID
ALTER TABLE CAMPREVIEWFILES ADD CONSTRAINT CRFILES_NUM_FK FOREIGN KEY (NUM) REFERENCES CAMPREVIEW(NUM) ON DELETE CASCADE;

ALTER TABLE PRODUCTFILES ADD CONSTRAINT PFILES_PNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTGRADE ADD CONSTRAINT PGRADE_PNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTORDER ADD CONSTRAINT PORDER_GNUM_FK FOREIGN KEY (GRADENUM) REFERENCES PRODUCTGRADE(GRADENUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTORDER ADD CONSTRAINT PORDER_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID) ON DELETE CASCADE;
ALTER TABLE PRODUCTORDER ADD CONSTRAINT PORDER_INDEXCODE_FK FOREIGN KEY (INDEXCODE) REFERENCES ORDERINDEX(INDEXCODE) ON DELETE CASCADE;
ALTER TABLE PRODUCTORDER ADD CONSTRAINT PORDER_ONUM_FK FOREIGN KEY (ORDERNUM) REFERENCES ORDERS(ORDERNUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTREVIEW ADD CONSTRAINT PREVIEW_PNUM_FK FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM) ON DELETE CASCADE;
ALTER TABLE PRODUCTREVIEW ADD CONSTRAINT PREVIEW_WRITER_FK FOREIGN KEY (WRITER) REFERENCES MEMBER(ID) ON DELETE CASCADE; --WRITER/ID
ALTER TABLE PRODUCTREVIEWFILES ADD CONSTRAINT PRFILES_NUM_FK FOREIGN KEY (NUM) REFERENCES PRODUCTREVIEW(NUM) ON DELETE CASCADE;
ALTER TABLE CART ADD CONSTRAINT CART_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID) ON DELETE CASCADE;
ALTER TABLE CART ADD CONSTRAINT CART_GNUM_FK FOREIGN KEY (GRADENUM) REFERENCES PRODUCTGRADE(GRADENUM) ON DELETE CASCADE;

ALTER TABLE PAYMENT ADD CONSTRAINT PAYMENT_ONUM_FK FOREIGN KEY (ORDERNUM) REFERENCES ORDERS(ORDERNUM) ON DELETE CASCADE;


----------------------------------------------------------------------------------
--SEQUENCE 생성, 조회, 삭제
SELECT * FROM USER_SEQUENCES;

CREATE SEQUENCE MEMBERSEQ;
CREATE SEQUENCE ADDRESSSEQ;
CREATE SEQUENCE KAKAOSEQ;
CREATE SEQUENCE REPORTSEQ;
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






----------------------------------------------------------------------------------

--삭제된 테이블
--CREATE TABLE CAMPREVIEWCOMMENT(
--	COMMENTNUM NUMBER,
--	NUM NUMBER,
--	WRITER VARCHAR2(400),
--	CONTENTS CLOB,
--	REGDATE DATE,
--	REF NUMBER,
--	STEP NUMBER,
--	DEPTH NUMBER
--);

--CREATE TABLE PRODUCTREVIEWCOMMENT(
--	COMMENTNUM NUMBER,
--	NUM NUMBER,
--	WRITER VARCHAR2(400),
--	CONTENTS CLOB,
--	REGDATE DATE,
--	REF NUMBER,
--	STEP NUMBER,
--	DEPTH NUMBER
--);


--데이터 삭제
--TRUNCATE TABLE CAMPINFO;


--더 이상 안쓰는 코드
--PK
--ALTER TABLE CAMPTYPE ADD CONSTRAINT CTYPE_ONUM_PK PRIMARY KEY (OPTIONNUM);
--ALTER TABLE CAMPREVIEWCOMMENT ADD CONSTRAINT CRCOMMENT_CNUM_PK PRIMARY KEY (COMMENTNUM);
--ALTER TABLE PRODUCTREVIEWCOMMENT ADD CONSTRAINT PRCOMMENT_CNUM_PK PRIMARY KEY (COMMENTNUM);
--ALTER TABLE STORYCOMMENT ADD CONSTRAINT SCOMMENT_CNUM_PK PRIMARY KEY (COMMENTNUM);

--FK
--ALTER TABLE CAMPTYPE ADD CONSTRAINT CTYPE_CNUM_FK FOREIGN KEY (CAMPNUM) REFERENCES CAMPINFO(CAMPNUM) ON DELETE CASCADE;
--ALTER TABLE CAMPREVIEWCOMMENT ADD CONSTRAINT CRCOMMENT_NUM_FK FOREIGN KEY (NUM) REFERENCES CAMPREVIEW(NUM) ON DELETE CASCADE;
--ALTER TABLE PRODUCTREVIEWCOMMENT ADD CONSTRAINT RECOMMENT_NUM_FK FOREIGN KEY (NUM) REFERENCES PRODUCTREVIEW(NUM) ON DELETE CASCADE;
--ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_INDEXCODE_FK FOREIGN KEY (INDEXCODE) REFERENCES ORDERINDEX(INDEXCODE) ON DELETE CASCADE;

--DROP CONSTRAINT
--ALTER TABLE ADDRESS DROP CONSTRAINT ADDRESS_ID_FK;




----------------------------------------------------------------------------------
--DROP CONSTRAINT 예시
--ALTER TABLE CAMPORDER DROP CONSTRAINT CORDER_ANUM_FK;


--테이블 수정에 사용한 코드들
--ALTER TABLE STORY ADD (BOARDID NUMBER);
--ALTER TABLE STORYCOMMENT ADD (BOARDID NUMBER);

--ALTER TABLE CAMPINFO DROP COLUMN CONTENTS;
--ALTER TABLE CAMPINFO ADD LINEINTRO VARCHAR2(800);
--ALTER TABLE CAMPINFO ADD INTRO CLOB;
--ALTER TABLE CAMPINFO ADD FEATURE VARCHAR2(800);
--ALTER TABLE CAMPINFO ADD INDUTY VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD DO VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD SIGUNGU VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD MAPX NUMBER(7, 4);
--ALTER TABLE CAMPINFO ADD MAPY NUMBER(7, 5);
--ALTER TABLE CAMPINFO ADD GLAMPFACILITY VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD CARAVFACILITY VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD SERVICE VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD POSBLFACILITY VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD THEME VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD PETALLOW VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD HOMEPAGE VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD THUMBNAIL VARCHAR2(400);
--ALTER TABLE CAMPINFO ADD REGDATE DATE;
--ALTER TABLE CAMPINFO ADD MODIDATE DATE;
--ALTER TABLE CAMPINFO MODIFY REGDATE VARCHAR2(400);
--ALTER TABLE CAMPINFO MODIFY MODIDATE VARCHAR2(400);
--ALTER TABLE CAMPINFO MODIFY FEATURE VARCHAR2(800);
--ALTER TABLE CAMPINFO RENAME COLUMN DO TO DONAME;
--ALTER TABLE CAMPINFO RENAME COLUMN SIGUNGU TO SIGUNGUNAME;
--ALTER TABLE CAMPINFO ADD HIT NUMBER;
--ALTER TABLE CAMPINFO ADD USEINFO CLOB;
--ALTER TABLE CAMPINFO ADD LAYOUT VARCHAR2(400);
--ALTER TABLE CAMPINFO RENAME COLUMN NAME TO CAMPNAME;
--ALTER TABLE CAMPINFO DROP COLUMN MAPX;
--ALTER TABLE CAMPINFO DROP COLUMN MAPY;
--ALTER TABLE CAMPINFO DROP COLUMN THEME;
--ALTER TABLE CAMPINFO DROP COLUMN LAYOUT;

--ALTER TABLE THUMBNAIL RENAME COLUMN FILENUM TO THUMBNUM;
--ALTER TABLE THUMBNAIL RENAME COLUMN FILENAME TO THUMBNAME;
--ALTER TABLE THUMBNAIL DROP COLUMN ORINAME;
--ALTER TABLE THUMBNAIL ADD ORINAME VARCHAR2(400);

--ALTER TABLE CAMPSITE ADD (SITENAME VARCHAR2(400));
--ALTER TABLE CAMPSITE RENAME COLUMN PEAKWEEKENDPRICE TO PEAKWEEKENDSPRICE;
--ALTER TABLE CAMPSITE ADD STARTDATE DATE;
--ALTER TABLE CAMPSITE ADD LASTDATE DATE;
--ALTER TABLE CAMPSITE MODIFY STATUS INVISIBLE;
--ALTER TABLE CAMPSITE MODIFY STATUS VISIBLE;
--ALTER TABLE CAMPSITE ADD NAME VARCHAR2(400);
--ALTER TABLE CAMPSITE DROP COLUMN NAME;

--ALTER TABLE CAMPORDER RENAME TO CAMPBOOK;
--ALTER TABLE CAMPBOOK ADD DAYINFO NUMBER;
--ALTER TABLE CAMPBOOK MODIFY STATUS INVISIBLE;
--ALTER TABLE CAMPBOOK MODIFY STATUS VISIBLE;
--ALTER TABLE CAMPBOOK DROP COLUMN DAYINFO;
--ALTER TABLE CAMPBOOK ADD SITENAME VARCHAR2(400);
--ALTER TABLE CAMPBOOK ADD NAME VARCHAR2(400);

--ALTER TABLE CAMPREVIEW DROP COLUMN TITLE;
--ALTER TABLE CAMPREVIEW DROP COLUMN HIT;
--ALTER TABLE CAMPREVIEW ADD MARK NUMBER;

--ALTER TABLE PRODUCT ADD (SUMMARY VARCHAR2(400));

--ALTER TABLE PRODUCTGRADE ADD (PRICE NUMBER);
--ALTER TABLE PRODUCTGRADE MODIFY GRADESTOCK NUMBER;

--ALTER TABLE PRODUCTORDER ADD (ORDERER VARCHAR2(400));
--ALTER TABLE PRODUCTORDER ADD (NAME VARCHAR2(400));

--ALTER TABLE PRODUCTREVIEW DROP COLUMN TITLE;
--ALTER TABLE PRODUCTREVIEW DROP COLUMN HIT;
--ALTER TABLE PRODUCTREVIEW ADD MARK NUMBER;

--ALTER TABLE ORDERS DROP COLUMN INDEXCODE;





--컬럼 순서바꾸기
--ALTER TABLE CAMPINFO MODIFY HOMEPAGE INVISIBLE;
--ALTER TABLE CAMPINFO MODIFY THUMBNAIL INVISIBLE;
--ALTER TABLE CAMPINFO MODIFY REGDATE INVISIBLE;
--ALTER TABLE CAMPINFO MODIFY MODIDATE INVISIBLE;
--ALTER TABLE CAMPINFO MODIFY CONTENTID INVISIBLE;
--ALTER TABLE CAMPINFO MODIFY HIT INVISIBLE;

--ALTER TABLE CAMPINFO MODIFY HOMEPAGE VISIBLE;
--ALTER TABLE CAMPINFO MODIFY THUMBNAIL VISIBLE;
--ALTER TABLE CAMPINFO MODIFY REGDATE VISIBLE;
--ALTER TABLE CAMPINFO MODIFY MODIDATE VISIBLE;
--ALTER TABLE CAMPINFO MODIFY CONTENTID VISIBLE;
--ALTER TABLE CAMPINFO MODIFY HIT VISIBLE;
