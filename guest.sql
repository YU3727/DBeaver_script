--석주가 OWNER, 내가 GUEST로 접속
--MEMBER, ADDRESS 만들기

CREATE TABLE MEMBER(
	ID VARCHAR2(50) CONSTRAINT MEMBER_ID_PK PRIMARY KEY,
	PW VARCHAR2(50),
	PHONE VARCHAR2(50),
	EMAIL VARCHAR2(50),
	NAME VARCHAR2(50)
);


CREATE TABLE DELIVERY(
	DELIVERYNUM NUMBER CONSTRAINT DELIVERY_DNUM_PK PRIMARY KEY,
	ID VARCHAR2(40),
	ADDRESS VARCHAR2(200),
	PHONE VARCHAR2(50),
	NAME VARCHAR2(50)
);


SELECT * FROM USER_CONSTRAINTS;
ROLLBACK;
COMMIT;

--MEMBER 작업
SELECT * FROM MEMBER;
DROP TABLE MEMBER;
--ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_PW_NN NOT NULL (PW);
ALTER TABLE MEMBER MODIFY PW NOT NULL;
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_PHONE_U UNIQUE (PHONE);


--DELIVERY 작업
SELECT * FROM DELIVERY;
ALTER TABLE DELIVERY ADD CONSTRAINT DELIVERY_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER (ID) ON DELETE SET NULL;

--TEST용
CREATE SEQUENCE DELIVERY_SEQ;
CREATE SEQUENCE MEMBER_SEQ;
DROP SEQUENCE MEMBER_SEQ;

INSERT INTO MEMBER 
VALUES ('iu', 'PW1', '0102935', 'IU@gmail.com', 'kim');

INSERT INTO DELIVERY 
VALUES (DELIVERY_SEQ.NEXTVAL, 'iu', 'ASDQWE', '0102345', 'IU');

SELECT * FROM PRODUCT;