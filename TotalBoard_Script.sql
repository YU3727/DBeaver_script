SELECT * FROM TAB;

PURGE RECYCLEBIN;

COMMIT;
ROLLBACK;


SELECT * FROM PRODUCT ORDER BY PRODUCTNUM DESC;
SELECT * FROM PRODUCTOPTION ORDER BY OPTIONNUM DESC;
SELECT * FROM COMMENTARY;

SELECT * FROM MEMBER;
--SELECT * FROM ADDRESS;
SELECT * FROM ROLE;
SELECT * FROM MEMBER_ROLE;

SELECT * FROM BANKBOOK;
SELECT * FROM ACCOUNT ORDER BY DESC;
SELECT * FROM TRADE ORDER BY TRADENUM DESC;
SELECT * FROM BANKBOOKIMG ORDER BY FILENUM DESC;
SELECT * FROM BANKBOOKCOMMENT ORDER BY NUM DESC;

SELECT * FROM NOTICE ORDER BY NUM DESC;
SELECT * FROM NOTICEFILES ORDER BY FILENUM DESC;
SELECT * FROM QNA ORDER BY NUM DESC;
SELECT * FROM QNAFILES ORDER BY FILENUM DESC;


SELECT * FROM USER_SEQUENCES;
DROP SEQUENCE NOTOCE_SEQ;
DROP SEQUENCE QNAA_SEQ;

--Script
INSERT INTO "MEMBER" 
VALUES('user01');

SELECT * FROM BANKBOOK b 
WHERE BOOKNUMBER = 251;

SELECT * FROM BANKBOOKIMG
WHERE BOOKNUMBER = 251;

--JOIN으로 BANKBOOK과 BANKBOOKIMG에 있는 모든 정보를 공통컬럼 BOOKNUMBER로 조회하는 것
--SELECT (원하는 COLUMN명) FROM (TABLE 명) 은 무조건 들어가야 하는 정보이다
SELECT B.*, I.*
FROM BANKBOOK B
	LEFT OUTER JOIN --Data가 없을수도 있으면 OUTER JONG, 쓸 떄 Data가 있는 방향을 적어줘야함(위쪾 left, 아래쪽 right)
	BANKBOOKIMG I
	ON(B.BOOKNUMBER = I.BOOKNUMBER)
WHERE B.BOOKNUMBER = 251;

SELECT *
FROM BANKBOOK B
	INNER JOIN --INNER JOIN으로 하면 둘중 하나라도 데이터가 없는 경우 전체 데이터 조회가 불가능하다
	BANKBOOKIMG I
	USING (BOOKNUMBER)
WHERE BOOKNUMBER = 251;


--Script
SELECT * FROM BANKBOOK ORDER BY BOOKNUMBER DESC;
SELECT * FROM BANKBOOKCOMMENT;

INSERT INTO BANKBOOKCOMMENT 
VALUES(BANKBOOKCOMMENT_SEQ.NEXTVAL, 385, '이거 좋아요?', SYSDATE, 'Christopher');


--특정 글의 전체 댓글을 보는 쿼리
SELECT * FROM BANKBOOKCOMMENT
WHERE BOOKNUMBER = 385;

--특정 글의 전체 댓글 갯수를 알아내는 쿼리
SELECT COUNT(NUM) FROM BANKBOOKCOMMENT
WHERE BOOKNUMBER = 385;

--검색기능까지 포함하는 쿼리
SELECT * FROM BANKBOOKCOMMENT
WHERE BOOKNUMBER = 385;

SELECT COUNT(NUM) FROM BANKBOOKCOMMENT
WHERE BOOKNUMBER = 385 AND CONTENTS LIKE '%?%';

SELECT COUNT(NUM) FROM BANKBOOKCOMMENT
WHERE BOOKNUMBER = 385 AND WRITER LIKE '%U%';

------------------


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

--ROWNUM을 TABLE에 포함시키기
SELECT ROWNUM R, N.* FROM
(SELECT * FROM NOTICE
ORDER BY NOTICENUM DESC) N;

--ROWNUM을 포함시킨 TABLE을 사용한 조회.(Page 처리의 기본 쿼리)
SELECT * FROM
	(
	SELECT ROWNUM R, N.* FROM
		(SELECT * FROM NOTICE
		ORDER BY NOTICENUM DESC) N)
WHERE R BETWEEN 1 AND 10;



--COUNT
SELECT COUNT(NOTICENUM) FROM NOTICE;
SELECT COUNT(NUM) FROM NOTICE;


--OUTER JOIN은 데이터가 있는쪽을 기준으로 방향을 잡아줘야 있는 데이터를 조회해온다.
--없는 쪽을 기준으로 잡으면 모두 NULL이 됨.
SELECT N.*, F.*
FROM NOTICE N
	LEFT OUTER JOIN
	NOTICEFILE F
	ON(N.NOTICENUM = F.NOTICENUM)
WHERE N.NOTICENUM = 50;

INSERT INTO NOTICEFILE 
VALUES(NOTICEFILE_SEQ.NEXTVAL, 20, 'ASD', 'ASD');

INSERT INTO QNA 
VALUES(QNA_SEQ.NEXTVAL, 'title6', 'contents6', 'winter', sysdate, 0, 0, 0, 0);

SELECT * FROM QNA
ORDER BY NUM DESC;


--REF, STEP, DEPTH NULL값 업데이트
UPDATE QNA SET REF = NUM WHERE REF IS NULL;
UPDATE QNA SET STEP=0, DEPTH=0 WHERE STEP IS NULL;


SELECT * FROM QNA ORDER BY NUM DESC;
SELECT * FROM QNAFILES ORDER BY NUM DESC;

DELETE QNA WHERE NUM = 180;


--230227 test
SELECT * FROM QNA Q
LEFT OUTER JOIN
QNAFILES F
ON(Q.NUM = F.NUM)
WHERE Q.NUM = 193;


SELECT * FROM NOTICE ORDER BY NUM DESC;
SELECT * FROM NOTICEFILES ORDER BY NUM DESC;

SELECT * FROM NOTICE N
	LEFT OUTER JOIN
	NOTICEFILES NF
	ON(N.NUM = NF.NUM)
WHERE N.NUM=86;

DELETE NOTICE WHERE NUM=85;