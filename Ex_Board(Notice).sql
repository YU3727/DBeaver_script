SELECT * FROM TAB;

COMMIT;
ROLLBACK;

DROP TABLE NOTICE;

CREATE TABLE NOTICE(
	NOTICENUM NUMBER,
	NOTICETITLE VARCHAR2(400),
	NOTICEDETAIL CLOB,
	NOTICEWRITER VARCHAR2(400),
	NOTICEDATE DATE,
	NOTICEHITS NUMBER
)

CREATE SEQUENCE NOTICE_SEQ;


SELECT * FROM NOTICE;
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_SEQUENCES ;


ALTER TABLE NOTICE ADD CONSTRAINT NOTICE_NNUM_PK PRIMARY KEY (NOTICENUM);

INSERT INTO NOTICE
VALUES(NOTICE_SEQ.NEXTVAL, 'NOTICE1', 'DETAIL1', 'ADMIN1', sysdate, 0);

INSERT INTO NOTICE
VALUES(NOTICE_SEQ.NEXTVAL, 'NOTICE2', 'DETAIL2', 'ADMIN1', sysdate, 0);

INSERT INTO NOTICE
VALUES(NOTICE_SEQ.NEXTVAL, 'NOTICE3', 'DETAIL3', 'ADMIN1', sysdate, 0);

INSERT INTO NOTICE(NOTICENUM, NOTICETITLE, NOTICEDETAIL, NOTICEWRITER, NOTICEDATE, NOTICEHITS)
VALUES(NOTICE_SEQ.NEXTVAL, 'NOTICE4', 'DETAIL4', 'ADMIN1', sysdate, 0);

SELECT NOTICE_SEQ.NEXTVAL FROM DUAL;
SELECT * FROM NOTICE ORDER BY NOTICENUM DESC;
SELECT * FROM NOTICE WHERE NOTICENUM = 3;

UPDATE NOTICE
SET NOTICETITLE='modititle1', NOTICEDETAIL='modidetail1', NOTICEWRITER='ADMIN2'
WHERE NOTICENUM=1;

DELETE NOTICE WHERE NOTICENUM=1;

--ROWNUM
SELECT * FROM NOTICE
ORDER BY NOTICENUM DESC;

SELECT ROWNUM R, N.* FROM
(SELECT * FROM NOTICE
ORDER BY NOTICENUM DESC) N;

SELECT * FROM
	(
	SELECT ROWNUM R, N.* FROM
		(SELECT * FROM NOTICE
		ORDER BY NOTICENUM DESC) N)
WHERE R BETWEEN 1 AND 10;

--COUNT
SELECT COUNT(NOTICENUM) FROM NOTICE;