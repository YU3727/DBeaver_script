COMMIT;
ROLLBACK;

SELECT * FROM BANKBOOK;
SELECT * FROM USER_SEQUENCES;

SELECT * FROM BANKBOOK WHERE BOOKNUMBER = 1;

DELETE BANKBOOK WHERE BOOKNUMBER = 100;


UPDATE BANKBOOK SET BOOKNAME = '시퀀스 성공', BOOKRATE = '3.3', BOOKSALE = '0', BOOKDETAIL = '성공함' WHERE BOOKNUMBER = 38;