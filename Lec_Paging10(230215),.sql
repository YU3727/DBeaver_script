
SELECT S.BOOKNAME FROM
(SELECT BOOKNUMBER, BOOKNAME FROM BANKBOOK
ORDER BY BOOKNUMBER ASC) S;



--rownum
--select 결과물을 뿌려줄 때 왼쪽에 생기는 번호
--table의 결과는 ResultSet에 보관되고, ResultSet의 결과물을 보여주는 화면을 View라고 한다


--rownum은 paging 처리 할 떄 쓸수있을까?

--그냥 rownum을 쓰면 1번부터 검색을 해야한다. 아니면 결과값이 안나옴
--이름을 줘야 쓸 수 있는데, 별칭을 줘서 가상의 테이블로 만드는식으로 처리하자
SELECT * FROM BANKBOOK
WHERE ROWNUM BETWEEN 1 AND 10
ORDER BY BOOKNUMBER DESC;

SELECT * FROM BANKBOOK
WHERE ROWNUM BETWEEN 11 AND 20
ORDER BY BOOKNUMBER DESC;


--ROWNUM을 테이블에 집어넣기위해 가상의 테이블 B로 설정하고 완성된 테이블에 rownum R이 들어와있으므로 이 테이블을 사용한다.
--서브쿼리를 이용해서 10개씩 조회하자
SELECT * FROM
(
SELECT ROWNUM R, B.* FROM
	(SELECT * FROM BANKBOOK
	ORDER BY BOOKNUMBER DESC) B)
WHERE R BETWEEN 1 AND 10;

SELECT * FROM
(
SELECT ROWNUM R, B.* FROM
	(SELECT * FROM BANKBOOK
	ORDER BY BOOKNUMBER DESC) B)
WHERE R BETWEEN 11 AND 20;


--페이징 처리의 마지막 단계
--몇개의 게시물이 남아있는지
SELECT COUNT(BOOKNUMBER) FROM 
(
SELECT ROWNUM R, B.* FROM
	(SELECT * FROM BANKBOOK
	ORDER BY BOOKNUMBER DESC) B);