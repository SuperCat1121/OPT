DROP SEQUENCE MEMBERSEQ;
DROP TABLE OPT_MEMBER CASCADE CONSTRAINT PURGE;

CREATE SEQUENCE MEMBERSEQ;      --회원번호 시퀀스

CREATE TABLE OPT_MEMBER(                                    --회원테이블
    OPT_NO_SEQ  NUMBER          PRIMARY KEY,                --회원번호
    OPT_ID      VARCHAR2(100)   NOT NULL    UNIQUE,         --아이디
    OPT_PW      VARCHAR2(100)   NOT NULL,                   --비밀번호
    OPT_NAME    VARCHAR2(100)   NOT NULL,                   --이름   
    OPT_BIRTH   VARCHAR2(500)   NOT NULL,                   --생년월일
    OPT_ADDR    VARCHAR2(500)   NOT NULL,                   --주소
    OPT_PHONE   VARCHAR2(500)   NOT NULL,                   --전화번호
    OPT_EMAIL   VARCHAR2(500)   NOT NULL    UNIQUE,         --이메일
    OPT_ENABLED VARCHAR2(2)     NOT NULL    CONSTRAINT enabled_ck CHECK (OPT_ENABLED IN('Y','N')),     --가입여부
    OPT_GENDER  VARCHAR2(10)    NOT NULL,                   --성별
    OPT_ROLE    VARCHAR2(100)   NOT NULL,                   --등급
    OPT_POINT   NUMBER          NOT NULL,                   --포인트
    OPT_REGDATE DATE            NOT NULL                    --가입일자
);


INSERT INTO OPT_MEMBER VALUES(
    MEMBERSEQ.NEXTVAL,
    'admin',
    'admin',
    '관리자',
    '1987/01/14',
    '서울시 관악구 청룡동 1536-4',
    '010-2662-5393',
    'last@gmail.com',
    'Y',
    'male',
    'admin',
    10000,
    SYSDATE
);

INSERT INTO OPT_MEMBER VALUES(
    MEMBERSEQ.NEXTVAL,
    'admin1234',
    'admin1234',
    '관리자1234',
    '1987/02/14',
    '서울시 관악구 청룡동 1536-4',
    '010-1234-5393',
    'ABCtjap@gmail.com',
    'Y',
    'male',
    'admin',
    10000,
    SYSDATE
);

INSERT INTO OPT_MEMBER VALUES(
    MEMBERSEQ.NEXTVAL,
    'user1',
    'user1',
    '유저1',
    '1991/02/16',
    '서울시 관악구 쑥고개로 57-1',
    '010-8787-5454',
    'newborn14@naver.com',
    'Y',
    'male',
    'user',
    0,
    SYSDATE
);


INSERT INTO OPT_MEMBER VALUES(
    MEMBERSEQ.NEXTVAL,
    'ijw9209',
    '123123',
    '이재웅',
    '1992/09/01',
    '경기도 고양시 덕양구',
    '010-1234-5678',
    'ijw9209@naver.com',
    'Y',
    'male',
    'user',
    500,
    SYSDATE
);

INSERT INTO OPT_MEMBER VALUES(
    MEMBERSEQ.NEXTVAL,
    'user2',
    'user2',
    '유저2',
    '1991/02/16',
    '인천시',
    '010-4427-3576',
    'user2@naver.com',
    'Y',
    'female',
    'user',
    0,
    SYSDATE
);

INSERT INTO OPT_MEMBER VALUES(
    MEMBERSEQ.NEXTVAL,
    'user3',
    'user3',
    '유저3',
    '1991/02/16',
    '여수시',
    '010-6671-8464',
    'user3@naver.com',
    'Y',
    'female',
    'user',
    0,
    SYSDATE
);

INSERT INTO OPT_MEMBER VALUES(
    MEMBERSEQ.NEXTVAL,
    'user4',
    'user4',
    '유저4',
    '1991/02/16',
    '부산시',
    '010-7210-1971',
    'user4@naver.com',
    'Y',
    'male',
    'user',
    0,
    SYSDATE
);

INSERT INTO OPT_MEMBER VALUES(
    MEMBERSEQ.NEXTVAL,
    'user5',
    'user5',
    '유저5',
    '1991/02/16',
    '일산시',
    '010-5602-7842',
    'user5@naver.com',
    'Y',
    'male',
    'user',
    0,
    SYSDATE
);

UPDATE OPT_MEMBER SET OPT_ENABLED='Y' WHERE OPT_NO_SEQ=2;

DELETE FROM OPT_MEMBER WHERE OPT_NO_SEQ = 22;
SELECT * FROM OPT_MEMBER;

--------------------------------------------------------------------------------------------------------------------------------

DROP SEQUENCE VIDEOCLIPSEQ;
DROP TABLE OPT_VIDEO_CLIP CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE VIDEOCLIPSEQ;       --동영상 글번호 시퀀스

CREATE TABLE OPT_VIDEO_CLIP(                                 --동영상 게시판 테이블
    OPT_NO_SEQ      NUMBER          REFERENCES  OPT_MEMBER,  --회원테이블 회원번호 참조키
    VIDEO_NO_SEQ    NUMBER          PRIMARY KEY,             --동영상 글번호
    VIDEO_URL       VARCHAR2(1000)  NOT NULL,                --동영상 url
    VIDEO_TITLE     VARCHAR2(100)   NOT NULL,                --제목
    VIDEO_CONTENT   VARCHAR2(4000)  NOT NULL,                --내용
    VIDEO_REGDATE   DATE            NOT NULL,                --등록일  
    VIDEO_VIEWS_NO  NUMBER          NOT NULL                 --조회수    
);

DELETE FROM OPT_VIDEO_CLIP WHERE VIDEO_NO_SEQ =5;

INSERT INTO OPT_VIDEO_CLIP VALUES(
    3,
    VIDEOCLIPSEQ.NEXTVAL,
    'https://www.youtube.com/embed/XsX3ATc3FbA?list=RD2BlwXXVCAFM',
    '방탄소년단1',
    '작은것들의 시',
    SYSDATE,
    0
);

INSERT INTO OPT_VIDEO_CLIP VALUES(
    3,
    VIDEOCLIPSEQ.NEXTVAL,
    'https://www.youtube.com/embed/ml_0KpFAEhY?list=RD2BlwXXVCAFM',
    '아이즈원2',
    '비올레타',
    SYSDATE,
    0
);

SELECT * FROM OPT_VIDEO_CLIP;

--------------------------------------------------------------------------------------------------------------------------------

DROP SEQUENCE VIDEOCOMMENTSEQ;
DROP TABLE OPT_VIDEO_COMMENT PURGE;

CREATE SEQUENCE VIDEOCOMMENTSEQ;        --동영상 댓글번호 시퀀스

CREATE TABLE OPT_VIDEO_COMMENT(
    OPT_NO_SEQ          NUMBER       REFERENCES  OPT_MEMBER,
    --회원테이블 회원번호 참조키
    VIDEO_NO_SEQ        NUMBER       REFERENCES  OPT_VIDEO_CLIP,
    --동영상게시판 게시글번호 참조키
    VIDEO_COMMENT_SEQ   NUMBER          PRIMARY KEY,        --댓글번호
    VIDEO_REPLE         VARCHAR2(2000)  NOT NULL,           --댓글내용
    VIDEO_COMMENT_DATE   DATE            NOT NULL            --댓글작성시간
);

DELETE FROM OPT_VIDEO_COMMENT
WHERE VIDEO_NO_SEQ = 

INSERT INTO OPT_VIDEO_COMMENT VALUES(
    1,
    2,
    VIDEOCOMMENTSEQ.NEXTVAL,
    '좋은 게시물 감사합니다 ^^',
    SYSDATE    
);

INSERT INTO OPT_VIDEO_COMMENT VALUES(
    2,
    1,
    VIDEOCOMMENTSEQ.NEXTVAL,
    '보니까 운동 열심히 해야겟다고 생각드네용',
    SYSDATE    
);

SELECT * FROM OPT_VIDEO_COMMENT;

--------------------------------------------------------------------------------------------------------------------------------

DROP SEQUENCE CUSTOMERSEQ;
DROP TABLE OPT_CUSTOMER_SERVICE CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE CUSTOMERSEQ;            --고객센터 글 번호 시퀀스

CREATE TABLE OPT_CUSTOMER_SERVICE(      --고객센터 테이블
    OPT_NO_SEQ          NUMBER          REFERENCES  OPT_MEMBER (OPT_NO_SEQ),
    --회원테이블 회원번호 참조키
    CUSTOMER_NO_SEQ     NUMBER          PRIMARY KEY,  --고객센터 글 번호                
    CUSTOMER_TITLE      VARCHAR2(500)   NOT NULL,     --글 제목
    CUSTOMER_CONTENT    VARCHAR2(4000)  NOT NULL,     --글 내용
    CUSTOMER_REGDATE    DATE            NOT NULL      --글 작성일 
);

INSERT INTO OPT_CUSTOMER_SERVICE VALUES(
    2,
    CUSTOMERSEQ.NEXTVAL,
    '도시락 금방오는편인가요??',
    '늦어도 모레까지는 받아야하는데 오늘 아침에 사면 언제쯤오나요?',
    SYSDATE
);

SELECT * FROM OPT_CUSTOMER_SERVICE;

--------------------------------------------------------------------------------------------------------------------------------

DROP SEQUENCE ADMINANSWERSEQ;
DROP TABLE OPT_ADMIN_ANSWER PURGE;

CREATE SEQUENCE ADMINANSWERSEQ;     --고객센터 관리자 댓글 글 번호 시퀀스

CREATE TABLE OPT_ADMIN_ANSWER(      --고객센터 관리자댓글
    CUSTOMER_NO_SEQ         NUMBER          REFERENCES  OPT_CUSTOMER_SERVICE,
    --고객센터 테이블 글번호 참조키
    OPT_NO_SEQ              NUMBER          REFERENCES  OPT_MEMBER,
    --회원테이블 회원번호 참조키(admin 회원번호)
    ADMIN_ANSWER_NO_SEQ     NUMBER          PRIMARY KEY,    --관리자댓글 글번호    
    ADMIN_ANSWER_CONTENT    VARCHAR2(4000)  NOT NULL,       --관리자댓글 내용
    ADMIN_ASNWER_REGDATE    DATE            NOT NULL        --작성일
);

INSERT INTO OPT_ADMIN_ANSWER VALUES(
    1,
    1,
    ADMINANSWERSEQ.NEXTVAL,
    '오전에 주문하시면 내일안으로 배송완료 됩니다~ 감사합니다',
    SYSDATE
);

SELECT * FROM OPT_ADMIN_ANSWER;


--------------------------------------------------------------------------------------------------------------------------------


--------------일정관리-----------------
DROP SEQUENCE CALENDARSEQ;
DROP TABLE OPT_CALENDAR  CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE CALENDARSEQ;
CREATE TABLE OPT_CALENDAR(
    OPT_NO_SEQ NUMBER REFERENCES OPT_MEMBER (OPT_NO_SEQ),   --회원번호
    CALENDAR_NO_SEQ NUMBER PRIMARY KEY,                     --일정번호
    CALENDAR_TITLE VARCHAR2(100) NOT NULL,                  --일정제목
    CALENDAR_STARTDAY VARCHAR2(100) NOT NULL,                        --일정시작일 			--***일단 문자열로 수정****
    CALENDAR_ENDDATE VARCHAR2(100) NOT NULL,                         --일정완료일
    CALENDAR_URL VARCHAR2(500),                             --일정URL
    CALENDAR_REGDATE DATE NOT NULL                          --일정등록일
);

INSERT INTO OPT_CALENDAR VALUES(3,CALENDARSEQ.NEXTVAL, '일정1' ,'2019-07-20','2019-07-24', NULL,SYSDATE);
INSERT INTO OPT_CALENDAR VALUES(3,CALENDARSEQ.NEXTVAL, '일정2' ,'2019-06-25','2019-06-28', NULL,SYSDATE);
INSERT INTO OPT_CALENDAR VALUES(3,CALENDARSEQ.NEXTVAL, '일정3' ,'2019-06-01','2019-06-17', 'https://www.naver.com' ,SYSDATE);
SELECT TO_DATE(REPLACE(CALENDAR_ENDDATE,'-',''))+1 FROM OPT_CALENDAR;

SELECT TO_DATE(REPLACE(CALENDAR_ENDDATE,'-','')) - TO_DATE(REPLACE(CALENDAR_STARTDAY,'-','')) as count, 
(TO_DATE(REPLACE(CALENDAR_ENDDATE,'-',''))+1) as nextDate , CALENDAR_ENDDATE, CALENDAR_STARTDAY, title, id
FROM OPT_CALENDAR;

SELECT * FROM OPT_CALENDAR;
INSERT INTO OPT_CALENDAR 
		VALUES(2,CALENDARSEQ.NEXTVAL,'메롱','2019-08-01','2019-08-02',null,SYSDATE);
SELECT * FROM OPT_CALENDAR
WHERE CALENDAR_NO_SEQ = 3

UPDATE OPT_CALENDAR SET CALENDAR_TITLE = '하이111',  CALENDAR_STARTDAY = '2019-08-08' , CALENDAR_ENDDATE = '2019-08-09' ,CALENDAR_REGDATE =SYSDATE
WHERE CALENDAR_NO_SEQ = 2

UPDATE OPT_CALENDAR SET CALENDAR_STARTDAY = '2019-08-08' , CALENDAR_ENDDATE = '2019-08-09' ,CALENDAR_REGDATE =SYSDATE
WHERE CALENDAR_NO_SEQ = 2

DELETE FROM OPT_CALENDAR 
WHERE CALENDAR_NO_SEQ = 7;

------------------쿠폰--------------------------
----------------쿠폰테이블 수정 PK를 쿠폰번호로잡아서 똑같은 번호가 안들어감 그래서 PK시퀀스 추가-----------
DROP SEQUENCE COUPONSEQ;
DROP TABLE OPT_COUPON CASCADE CONSTRAINTS PURGE;


CREATE SEQUENCE COUPONSEQ;
CREATE TABLE OPT_COUPON(
    OPT_NO_SEQ NUMBER REFERENCES OPT_MEMBER,  --회원번호
    COUPON_NO_SEQ NUMBER PRIMARY KEY,		   --쿠폰시퀀스
    COUPON_NO NUMBER,		                   --쿠폰번호(쿠폰 종류를 나눌수잇는 고유번호)
    COUPON_NAME VARCHAR2(100) NOT NULL,       --쿠폰이름
    COUPON_CONTENT VARCHAR2(1000) NOT NULL,   --쿠폰내용
    COUPON_DATE VARCHAR2(100) NOT NULL,       --유효기간
    COUPON_SALE VARCHAR2(100) NOT NULL        --할인가격
);

SELECT R,COUPON_NO_SEQ,COUPON_NO,COUPON_NAME,COUPON_CONTENT,COUPON_DATE,COUPON_SALE 
FROM(SELECT ROWNUM AS R ,COUPON_NO_SEQ,COUPON_NO,COUPON_NAME,COUPON_CONTENT,COUPON_DATE,COUPON_SALE 		
FROM(SELECT COUPON_NO_SEQ,COUPON_NO,COUPON_NAME,COUPON_CONTENT,COUPON_DATE,COUPON_SALE
FROM OPT_COUPON WHERE OPT_NO_SEQ = 2
ORDER BY COUPON_DATE))
WHERE R BETWEEN 1 AND 5


SELECT R,COUPON_NO_SEQ,COUPON_NO,COUPON_NAME,COUPON_CONTENT,COUPON_DATE,COUPON_SALE 
FROM(SELECT ROWNUM AS R ,COUPON_NO_SEQ,COUPON_NO,COUPON_NAME,COUPON_CONTENT,COUPON_DATE,COUPON_SALE 		
FROM(SELECT COUPON_NO_SEQ,COUPON_NO,COUPON_NAME,COUPON_CONTENT,COUPON_DATE,COUPON_SALE
FROM OPT_COUPON WHERE OPT_NO_SEQ = 2
ORDER BY COUPON_DATE))
WHERE R BETWEEN 1 AND 5

INSERT INTO OPT_COUPON VALUES(3,COUPONSEQ.NEXTVAL,111111,'회원가입쿠폰','회원가입시 1000원 쿠폰','2019-08-16','1000');
INSERT INTO OPT_COUPON VALUES(3,COUPONSEQ.NEXTVAL,111112,'3000원 할인쿠폰','고객감사 3000원 할인 쿠폰','2019-08-12','1000');
INSERT INTO OPT_COUPON VALUES(3,COUPONSEQ.NEXTVAL,111113,'배송비무료쿠폰',' 배송비 무료 쿠폰','2019-08-11','1000');




SELECT * FROM OPT_COUPON;

SELECT COUNT(*) 
FROM OPT_COUPON C, OPT_MEMBER M
WHERE C.OPT_NO_SEQ = M.OPT_NO_SEQ
AND C.OPT_NO_SEQ = 2;

		
----------------장바구니-------------------------
DROP SEQUENCE BASKETSEQ;
DROP TABLE OPT_BASKET CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE BASKETSEQ;

CREATE TABLE OPT_BASKET(
    OPT_NO_SEQ NUMBER REFERENCES OPT_MEMBER,  --회원번호
    BASKET_NO_SEQ NUMBER PRIMARY KEY,         --장바구니 순서
    BASKET_ITEM_NO NUMBER NOT NULL,	      --상품 번호
    BASKET_ITEM_URL VARCHAR2(200) NOT NULL,   --상품 이미지
    BASKET_ITEM_NAME VARCHAR2(200) NOT NULL,  --상품 이름	
    BASKET_ITEM_COUNT NUMBER NOT NULL,        --장바구니 수량
    BASKET_ITEM_PRICE NUMBER NOT NULL         --상품가격
);

SELECT * FROM OPT_BASKET;


--------------상품리스트-------------------------
DROP SEQUENCE ITEM_NUM_SEQ;
DROP TABLE OPT_ITEM CASCADE CONSTRAINTS PURGE;
CREATE SEQUENCE ITEM_NUM_SEQ;
CREATE TABLE OPT_ITEM(
    ITEM_NUM_SEQ NUMBER PRIMARY KEY,    --상품번호
    ITEM_NAME VARCHAR2(100) NOT NULL,   --상품이름
    ITEM_PRICE NUMBER NOT NULL,  		--상품가격
    ITEM_VIEWS_NO NUMBER NOT NULL,      --조회수
    ITEM_CONTENT VARCHAR2(1000),         --상품설명
    ITEM_URL VARCHAR2(100),             --상품이미지URL
    ITEM_COUNT NUMBER DEFAULT 1,        --상품 개수
    ITEM_ENABLED VARCHAR2(2) NOT NULL CONSTRAINT item_enabled_ck CHECK (ITEM_ENABLED IN('Y','N')) -- 판매 여부
);

INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'순식단 식물성단백질 28개입', 49000, 0, '맛있는 식이조절 식단이 필요하시다면, 간편한 식사대용품이 필요하다면 순식단으로 선택하세요','image/item_img01.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'밀스원 바디케어 도시락 10팩', 37900, 0, '칼로리는 낮지만 매일매일 질리지 않고 맛있는 식사를 위해 맛, 영양, 식감까지 고려한 최적의 하모니~','image/item_img02.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'비타북스 2주 완성 식단', 11700, 0, '2주 완성, 살이 쭉쭉 빠지는 저칼로리 식단 하루 세 끼, 든든히 먹으면서 뺀다!','image/item_img03.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'포르미 한입도시락 10종 20팩', 54900, 0, '간편하게 한입! 바쁜 출근시간에 2분30초만 전자렌지에 돌려서 드세요 적은 칼로리로 야식이 땡길때도 한입 도시락으로!!','image/item_img04.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'나마시떼 도시락 8팩', 29900, 0, '식이섬유가 풍부한 갓 지은 영양밥으로 만든 맞춤 도시락 ','image/item_img05.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'포켓샐러드 6팩 패키지', 31800, 0, '매일 먹어도 질리지 않는 취향따라 기분따라 골라먹는 3가지맛!! 풍부한 식이섬유가 포함된 샐러드로 건강을 챙겨보세요!','image/item_img06.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'비타할로 다이어트 쉐이크', 12300, 0, '아직도 굶으면서 다이어트 하시나요? 칼로리 걱정 없이 맛있는 한끼 비타할로 가볍게 한끼 다이어트 쉐이크로 균형잡힌 다이어트 하세요!!','image/item_img07.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'칼로리발란스 치즈 10개입', 10650, 0, '당신을 위한 맞춤영양 밸런스! 굶지말고 간단하게 식사대용으로 드세요~','image/item_img08.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'밥이곤약 곤약 즉석밥 10개입', 18340, 0, '흰쌀은 한 톨도 넣지 않았어요 현미 3: 귀리 3: 곤약 4의 황금비율로 밥을 지어 잡곡밥 특유의 거칠함 없이 기분좋은 식감을 느껴보세요!','image/item_img09.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'이훈 현미밥식단 4종 12팩', 41900, 0, '더욱 다양해진 현미밥 식단으로 건강관리 하세요! 각기 다른 4종의 도시락으로 질리지않습니다!','image/item_img10.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'에스앤씨 닭가슴살 샐러드 6팩', 16900, 0, '단백질이 풍부한 닭가슴살과 식이섬유가 풍부한 각종 채소를 넣은 건강한 혼닭 닭가슴살 샐러드예요.','image/item_img11.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'허닭 닭가슴살 스테이크 5팩', 18900, 0, '삼시세끼 먹고 탄탄하고 빛나는 바디라인을 만들고 싶다면! 허닭 스테이크 도시락 5종!!','image/item_img12.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'칼로바이 파워쉐이크 14개입', 32400, 0, '간편하고 맛있고 건강한 재료를 사용한 단백질 쉐이크! 황금비율 배합비가 적용된 프리미엄 단백질로 선택하세요!!','image/item_img13.png', DEFAULT, 'Y');
INSERT INTO OPT_ITEM VALUES(ITEM_NUM_SEQ.NEXTVAL,'땡스귀리 도시락 6개입', 24000, 0, '포만감이 풍부한 삶은 귀리, 식이섬유가 풍부한 4색 콩과 각종 야채의 만남으로 채소의 영양을 그대로 섭취하실수 있는 다이어트 도시락입니다','image/item_img14.png', DEFAULT, 'Y');






SELECT * FROM OPT_ITEM;
-------------상품댓글-------------------
DROP SEQUENCE ITEMCOMMENTSEQ;
DROP TABLE OPT_ITEM_COMMENT CASCADE CONSTRAINTS PURGE;
CREATE SEQUENCE ITEMCOMMENTSEQ;
CREATE TABLE OPT_ITEM_COMMENT(
	OPT_NO_SEQ NUMBER REFERENCES OPT_MEMBER,		-- 회원번호 참조키
	ITEM_NUM_SEQ NUMBER REFERENCES OPT_ITEM,		-- 상품번호 참조키
	ITEM_COMMENT_NO_SEQ NUMBER PRIMARY KEY,			-- 댓글번호
	ITEM_COMMENT_CONTENT VARCHAR2(1000) NOT NULL,	-- 댓글내용
	ITEM_COMMENT_DATE VARCHAR2(1000) NOT NULL		-- 댓글작성시간
)
SELECT * FROM OPT_ITEM_COMMENT;

INSERT INTO OPT_ITEM_COMMENT
VALUES(3, 1, ITEMCOMMENTSEQ.NEXTVAL, '굿굿', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));

SELECT OPT_ID, OPT_NO_SEQ, ITEM_NUM_SEQ, ITEM_COMMENT_NO_SEQ, ITEM_COMMENT_CONTENT, ITEM_COMMENT_DATE
FROM (SELECT M.OPT_ID, I.OPT_NO_SEQ, I.ITEM_NUM_SEQ, I.ITEM_COMMENT_NO_SEQ, I.ITEM_COMMENT_CONTENT, I.ITEM_COMMENT_DATE
FROM OPT_ITEM_COMMENT I, OPT_MEMBER M
WHERE I.OPT_NO_SEQ = M.OPT_NO_SEQ
AND ITEM_NUM_SEQ = 1);




-------------결제-----------------------
DROP SEQUENCE PAYSEQ;
DROP TABLE OPT_PAYMENT CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE PAYSEQ;
CREATE TABLE OPT_PAYMENT(
    OPT_NO_SEQ NUMBER REFERENCES OPT_MEMBER,            --회원번호FK
    ITEM_NUM_SEQ NUMBER REFERENCES OPT_ITEM (ITEM_NUM_SEQ), --상품번호FK
    PAY_SEQ NUMBER PRIMARY KEY,        					--결제번호PK
    PAY_RECIPIENT_NAME VARCHAR2(100) NOT NULL,          --수령인
    PAY_PLACE VARCHAR2(1000) NOT NULL,                  --배송주소
    PAY_PHONE VARCHAR2(100) NOT NULL,                   --배송지 전화번호
    PAY_MEMO VARCHAR2(3000),                            --배송 요청사항
    PAY_COUNT NUMBER NOT NULL,                          --상품수량
    PAY_DATE DATE NOT NULL,								--결제일
    PAY_TOTAL NUMBER NOT NULL								--총 결제금액
);





SELECT R , PAY_DATE , NAME , PAY_ALL
FROM(SELECT ROWNUM R, PAY_DATE ,I.ITEM_NAME NAME, I.ITEM_PRICE * P.PAY_COUNT PAY_ALL
FROM OPT_PAYMENT P , OPT_ITEM I , OPT_MEMBER M
WHERE M.OPT_NO_SEQ = P.OPT_NO_SEQ
AND P.ITEM_NUM_SEQ = I.ITEM_NUM_SEQ
AND M.OPT_NO_SEQ = 2)
ORDER BY R DESC;


SELECT * FROM OPT_PAYMENT;

SELECT COUNT(*) 
FROM OPT_PAYMENT P, OPT_MEMBER M
WHERE P.OPT_NO_SEQ = M.OPT_NO_SEQ
AND P.OPT_NO_SEQ = 2;

SELECT E.ENAME , E.DEPTNO , D.DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO = D.DEPTNO;
-----------------배송조회--------------
DROP TABLE PURCHASE_DELIVERY;

CREATE TABLE PURCHASE_DELIVERY(
    PAY_SEQ NUMBER REFERENCES OPT_PAYMENT (PAY_SEQ),    --결제번호FK
    DELIVERY_CODE VARCHAR2(100) NOT NULL,               --택배사코드
    DELIVERY_NUMBER VARCHAR2(100)                       --운송장번호
);

INSERT INTO PURCHASE_DELIVERY VALUES(1,17,1234567);

SELECT * FROM PURCHASE_DELIVERY;


---------------쪽지함-----------------------

DROP SEQUENCE POSTSEQ;
DROP TABLE OPT_POSTBOX CASCADE CONSTRAINTS PURGE;


CREATE SEQUENCE POSTSEQ;

CREATE TABLE OPT_POSTBOX(
     OPT_NO_SEQ 		NUMBER 			REFERENCES	OPT_MEMBER,           	--회원번호FK (보낸사람)
     POST_NO_SEQ 		NUMBER 			PRIMARY KEY,        	            --쪽지번호PK
     POST_RECIVE_ID 	VARCHAR2(100) 	NOT NULL,   		    		    --받는사람ID
     POST_TITLE			VARCHAR2(200)	NOT NULL,							--쪽지제목
     POST_CONTENT 		VARCHAR2(2000)	NOT NULL,							--쪽지내용
     POST_SEND_DATE 	VARCHAR2(200)	NOT NULL,							--보낸시간
     POST_RECIVE_READ 	VARCHAR2(2)		CONSTRAINT read_ck CHECK (POST_RECIVE_READ IN('Y','N')),	--쪽지확인여부
     POST_READ_DATE		VARCHAR2(200)	NOT NULL,							--쪽지확인시간
     POST_SEND_DEL 		VARCHAR2(2)		CONSTRAINT sendDel_ck CHECK (POST_SEND_DEL IN('Y','N')),	--보낸쪽지 삭제여부
     POST_READ_DEL 		VARCHAR2(2)		CONSTRAINT reciveDel_ck CHECK (POST_READ_DEL IN('Y','N'))	--받은쪽지 삭제여부						--받은쪽지 삭제여부
);

INSERT INTO OPT_POSTBOX VALUES(
	1, POSTSEQ.NEXTVAL, 'user1', '환영합니다', '사이트 이용가이드를 참고하세요', 
	TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI'), 'N', TO_CHAR(SYSDATE, 'YYYY-MM-DD-HH24-MI'), 'N', 'N'
);

INSERT INTO OPT_POSTBOX VALUES(
	2, POSTSEQ.NEXTVAL, 'admin', '감사합니다', '가입인사 드립니다~', 
	TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI'), 'N', TO_CHAR(SYSDATE, 'YYYY-MM-DD-HH24-MI'), 'N', 'N'
);



SELECT * FROM OPT_POSTBOX;