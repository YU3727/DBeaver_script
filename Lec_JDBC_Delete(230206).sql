--DBeaver에서 작업하고 Spring으로 넘어가서 작업하기 위해서는 Transaction을 종료해줘야 한다.
--java에서 쿼리문 실행을 했는데 멈춰있는거같이 보인다 -> 트랜젝션을 종료해야함.
COMMIT;
ROLLBACK;

SELECT * FROM PRODUCT;

DELETE PRODUCT WHERE PRODUCTNUM = 15;