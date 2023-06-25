--------------------------------------------------------------------------------
--                         MEMBER(회원)
--------------------------------------------------------------------------------
CREATE TABLE "MEMBER" (
	"M_ID"	    VARCHAR2(50)		NOT NULL,
	"M_PWD"	    VARCHAR2(50)		NOT NULL,
	"M_NAME"	VARCHAR2(30)		NOT NULL,
	"M_BIRTH"	VARCHAR2(6)		    NOT NULL,
	"M_CREATE"	DATE		        NOT NULL,
	"M_TEL" 	NUMBER		        NOT NULL,
	"M_ADDR"	VARCHAR2(300)		NOT NULL,
	"M_EMAIL"	VARCHAR2(100)		NOT NULL,
	"M_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	"ADMIN" 	NUMBER	    DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."M_ID" IS '회원ID';
COMMENT ON COLUMN "MEMBER"."M_PWD" IS '비밀번호';
COMMENT ON COLUMN "MEMBER"."M_NAME" IS '이름';
COMMENT ON COLUMN "MEMBER"."M_BIRTH" IS '생년월일, 민번 앞자리 6';
COMMENT ON COLUMN "MEMBER"."M_CREATE" IS '회원가입일,  SYSDATE';
COMMENT ON COLUMN "MEMBER"."M_TEL" IS '전화번호, ONLY 숫자만';
COMMENT ON COLUMN "MEMBER"."M_ADDR" IS '주소';
COMMENT ON COLUMN "MEMBER"."M_EMAIL" IS '이메일';
COMMENT ON COLUMN "MEMBER"."M_STATUS" IS '회원탈퇴유무(탈퇴시 N)';       
COMMENT ON COLUMN "MEMBER"."ADMIN" IS '관리자인지, 회원 : 0 관리자 :1';

--------------------------------------------------------------------------------
--                         ITEM(상품)
--------------------------------------------------------------------------------
CREATE TABLE "ITEM" (
	"I_NO"	    NUMBER		        NOT NULL,
	"I_NAME"	VARCHAR2(50)		NOT NULL,
	"I_PRICE"	NUMBER		        NOT NULL,
	"I_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"I_LOCAL"	VARCHAR2(60)		NOT NULL,
	"I_COUNT"	NUMBER		        NULL,
	"I_PAC"	    NUMBER	DEFAULT 0	NOT NULL,
	"D_NAME"	VARCHAR2(60)		NULL
);

COMMENT ON COLUMN "ITEM"."I_NO" IS '상품 고유번호';
COMMENT ON COLUMN "ITEM"."I_NAME" IS '상품명';
COMMENT ON COLUMN "ITEM"."I_PRICE" IS '상품가격';
COMMENT ON COLUMN "ITEM"."I_CONTENT" IS '상품설명';
COMMENT ON COLUMN "ITEM"."I_LOCAL" IS '상품지역';
COMMENT ON COLUMN "ITEM"."I_COUNT" IS '재고량';
COMMENT ON COLUMN "ITEM"."I_PAC" IS '패키지상품인지 아닌지를 확인';
COMMENT ON COLUMN "ITEM"."D_NAME" IS '패키지가 "Y"인 경우에만 필요함';

--------------------------------------------------------------------------------
--                         CART(장바구니)
--------------------------------------------------------------------------------
CREATE TABLE "CART" (
	"C_NO"	    NUMBER		    NOT NULL,
	"M_ID"	    VARCHAR2(50)	NOT NULL,
	"I_NO"	    NUMBER		    NOT NULL,
	"C_COUNT"	NUMBER		    NOT NULL,
	"C_PRICE"	NUMBER		    NOT NULL
);

COMMENT ON COLUMN "CART"."C_NO" IS '장바구니 고유번호';
COMMENT ON COLUMN "CART"."M_ID" IS '회원ID';
COMMENT ON COLUMN "CART"."I_NO" IS '상품고유번호';
COMMENT ON COLUMN "CART"."C_COUNT" IS '상품수량';
COMMENT ON COLUMN "CART"."C_PRICE" IS '금액';

--------------------------------------------------------------------------------
--                         ORDER(주문)
--------------------------------------------------------------------------------
CREATE TABLE "ORDER" (
	"O_NO"	        VARCHAR(255)		NOT NULL,
	"M_ID"	        VARCHAR2(50)		NOT NULL,
	"O_PRICE"	    NUMBER		        NULL,
	"O_DATE"	    DATE		        NULL,
	"O_POSITION"	VARCHAR2(30)	    NULL,
	"O_NAME"	    VARCHAR2(30)		NOT NULL,
	"ZIPCODE"	    NUMBER		        NOT NULL,
	"O_ADDR"	    VARCHAR2(300)	    NOT NULL,
	"O_DETAIL"	    VARCHAR2(100)		NOT NULL,
	"O_TEL"	        NUMBER	            NOT NULL,
	"O_REQ"	        VARCHAR2(100)		NULL,
	"O_COUNT"	    NUMBER		        NOT NULL
);

COMMENT ON COLUMN "ORDER"."O_NO" IS '주문 번호';
COMMENT ON COLUMN "ORDER"."M_ID" IS '회원 ID';
COMMENT ON COLUMN "ORDER"."O_PRICE" IS '총 결제금액';
COMMENT ON COLUMN "ORDER"."O_DATE" IS '주문날짜';
COMMENT ON COLUMN "ORDER"."O_POSITION" IS '상세보기페이지';
COMMENT ON COLUMN "ORDER"."O_NAME" IS '받는분성함';
COMMENT ON COLUMN "ORDER"."ZIPCODE" IS '우편번호';
COMMENT ON COLUMN "ORDER"."O_ADDR" IS '받는 주소 변경 가능(default 주문자주소)';
COMMENT ON COLUMN "ORDER"."O_DETAIL" IS '상세주소';
COMMENT ON COLUMN "ORDER"."O_TEL" IS '받는사람전화번호, 변경 가능(default 주문자전화번호)';
COMMENT ON COLUMN "ORDER"."O_REQ" IS '배송요청사항';
COMMENT ON COLUMN "ORDER"."O_COUNT" IS '주문상품개수';

--------------------------------------------------------------------------------
--                         ORDER_DETAIL(주문상세)
--------------------------------------------------------------------------------
CREATE TABLE "ORDER_DETAIL" (
	"OD_NO"	    NUMBER		    NOT NULL,
	"O_NO"	    VARCHAR(255)	NOT NULL,
	"I_NO"	    NUMBER		    NOT NULL,
	"OD_PRICE"	NUMBER		    NOT NULL,
	"OD_COUNT"	NUMBER		    NOT NULL
);

COMMENT ON COLUMN "ORDER_DETAIL"."OD_NO" IS '주문상세 고유번호';
COMMENT ON COLUMN "ORDER_DETAIL"."O_NO" IS '주문번호';
COMMENT ON COLUMN "ORDER_DETAIL"."I_NO" IS '상품 고유번호';
COMMENT ON COLUMN "ORDER_DETAIL"."OD_PRICE" IS '가격';
COMMENT ON COLUMN "ORDER_DETAIL"."OD_COUNT" IS '개수';

--------------------------------------------------------------------------------
--                         BOARD(게시판)
--------------------------------------------------------------------------------
CREATE TABLE "BOARD" (
	"B_NO"	    NUMBER		        NOT NULL,
	"B_WRITER"	VARCHAR2(50)		NOT NULL,
	"B_TAG"	    VARCHAR2(15)      	NOT NULL,
	"B_TITLE"	VARCHAR2(50)	    NOT NULL,
	"B_CONTENT"	VARCHAR2(300)		NOT NULL,
	"B_CREATE"	DATE		        NOT NULL,
	"B_COUNT"	NUMBER	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "BOARD"."B_NO" IS '게시글 번호';
COMMENT ON COLUMN "BOARD"."B_WRITER" IS '회원ID';
COMMENT ON COLUMN "BOARD"."B_TAG" IS '공지사항, 문의';
COMMENT ON COLUMN "BOARD"."B_TITLE" IS '게시글 제목';
COMMENT ON COLUMN "BOARD"."B_CONTENT" IS '게시글 내용';
COMMENT ON COLUMN "BOARD"."B_CREATE" IS '게시글 작성일, SYSDATE';
COMMENT ON COLUMN "BOARD"."B_COUNT" IS '게시글 카운트';

--------------------------------------------------------------------------------
--                         FARM(농장)
--------------------------------------------------------------------------------
CREATE TABLE "FARM" (
	"F_NO"	    NUMBER		    NOT NULL,
	"F_NAME"	VARCHAR2(60)	NOT NULL,
	"F_ZONE"	VARCHAR2(20)	NOT NULL,
	"F_COUNT"	NUMBER		    NOT NULL,
	"F_CONTENT"	VARCHAR2(3000)	NOT NULL,
	"F_ITEM"	VARCHAR2(100)	NOT NULL
);

COMMENT ON COLUMN "FARM"."F_NO" IS '농장번호';
COMMENT ON COLUMN "FARM"."F_NAME" IS '농장이름';
COMMENT ON COLUMN "FARM"."F_ZONE" IS '농장의 위치';
COMMENT ON COLUMN "FARM"."F_COUNT" IS '대여 구역 수';
COMMENT ON COLUMN "FARM"."F_CONTENT" IS '농장 설명 내용';
COMMENT ON COLUMN "FARM"."F_ITEM" IS '재배 가능 작물';

--------------------------------------------------------------------------------
--                         RESERVATION(농장 예약)
--------------------------------------------------------------------------------
CREATE TABLE "RESERVATION" (
	"F_NUM"	    NUMBER		        NOT NULL,
	"MEM_ID"	VARCHAR2(50)		NOT NULL,
	"FARM_NO"	NUMBER		        NOT NULL,
	"R_ZONE"	VARCHAR(10)		    NULL,
	"R_STATUS"	NUMBER	DEFAULT 0	NOT NULL,
	"R_START"	NUMBER		        NULL,
	"R_PRICE"	NUMBER		        NULL,
	"R_ITEM"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "RESERVATION"."F_NUM" IS '예약 번호';
COMMENT ON COLUMN "RESERVATION"."MEM_ID" IS '회원 ID';
COMMENT ON COLUMN "RESERVATION"."FARM_NO" IS '농장 번호';
COMMENT ON COLUMN "RESERVATION"."R_ZONE" IS '예약구역';
COMMENT ON COLUMN "RESERVATION"."R_STATUS" IS '0: 예약가능 1: 대기 2:에약 -- 관리자만 가능';
COMMENT ON COLUMN "RESERVATION"."R_START" IS '예약 시작일 1(3~5), 2(6~8),3(9~11)';
COMMENT ON COLUMN "RESERVATION"."R_PRICE" IS '총 금액';
COMMENT ON COLUMN "RESERVATION"."R_ITEM" IS '키울 작물';

--------------------------------------------------------------------------------
--                         SECTOR(농장 구역)
--------------------------------------------------------------------------------
CREATE TABLE "SECTOR" (
	"Key"	    VARCHAR(255)	NOT NULL,
	"FARM_NO"	NUMBER		    NOT NULL,
	"S_NAME"	VARCHAR2(60)	NOT NULL,
	"S_PRICE"	NUMBER		    NULL,
	"S_ITEM"	VARCHAR2(10)	NULL,
	"S_SCHDULE"	NUMBER		    NULL,
	"S_STATUS"	NUMBER		    NOT NULL
);

COMMENT ON COLUMN "SECTOR"."Key" IS '섹터 번호';
COMMENT ON COLUMN "SECTOR"."FARM_NO" IS '농장번호';
COMMENT ON COLUMN "SECTOR"."S_NAME" IS '섹터명';
COMMENT ON COLUMN "SECTOR"."S_PRICE" IS '대여 금액';
COMMENT ON COLUMN "SECTOR"."S_ITEM" IS '키우고 있는 작물';
COMMENT ON COLUMN "SECTOR"."S_SCHDULE" IS '예약기간, 1(3~5), 2(6~8),3(9~11)';
COMMENT ON COLUMN "SECTOR"."S_STATUS" IS '0: 예약가능 1: 대기 2:에약';

--------------------------------------------------------------------------------
--                         REPLY(댓글)
--------------------------------------------------------------------------------
CREATE TABLE "REPLY" (
	"R_NO"	    NUMBER	    	NOT NULL,
	"B_NO"  	NUMBER	    	NOT NULL,
	"R_WRITER"	VARCHAR2(50)	NOT NULL,
	"R_CONTENT"	VARCHAR2(100)	NOT NULL,
	"R_CREATE"	DATE		    NOT NULL
);

COMMENT ON COLUMN "REPLY"."R_NO" IS '댓글번호';
COMMENT ON COLUMN "REPLY"."B_NO" IS '게시글번호';
COMMENT ON COLUMN "REPLY"."R_WRITER" IS '작성자';
COMMENT ON COLUMN "REPLY"."R_CONTENT" IS '내용';
COMMENT ON COLUMN "REPLY"."R_CREATE" IS '작성일, SYSDATE';

--------------------------------------------------------------------------------
--                         REVIEW(상품 리뷰)
--------------------------------------------------------------------------------
CREATE TABLE "REVIEW" (
	"R_NO"	    NUMBER		    NOT NULL,
	"I_NO"	    NUMBER		    NOT NULL,
	"R_WRITER"	VARCHAR2(50)	NOT NULL,
	"R_CONTENT"	VARCHAR2(100)	NOT NULL,
	"R_CREATE"	DATE		    NOT NULL
);

COMMENT ON COLUMN "REVIEW"."R_NO" IS '상품리뷰 댓글번호';
COMMENT ON COLUMN "REVIEW"."I_NO" IS '상품고유번호';
COMMENT ON COLUMN "REVIEW"."R_WRITER" IS '리뷰 작성자';
COMMENT ON COLUMN "REVIEW"."R_CONTENT" IS '리뷰내용';
COMMENT ON COLUMN "REVIEW"."R_CREATE" IS '리뷰 작성일 SYSDATE';

--------------------------------------------------------------------------------
--                         외래키 설정
--------------------------------------------------------------------------------
ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"M_ID"
);

ALTER TABLE "ITEM" ADD CONSTRAINT "PK_ITEM" PRIMARY KEY (
	"I_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "PK_CART" PRIMARY KEY (
	"C_NO"
);

ALTER TABLE "ORDER" ADD CONSTRAINT "PK_ORDER" PRIMARY KEY (
	"O_NO"
);

ALTER TABLE "ORDER_DETAIL" ADD CONSTRAINT "PK_ORDER_DETAIL" PRIMARY KEY (
	"OD_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"B_NO"
);

ALTER TABLE "FARM" ADD CONSTRAINT "PK_FARM" PRIMARY KEY (
	"F_NO"
);

ALTER TABLE "RESERVATION" ADD CONSTRAINT "PK_RESERVATION" PRIMARY KEY (
	"F_NUM"
);

ALTER TABLE "SECTOR" ADD CONSTRAINT "PK_SECTOR" PRIMARY KEY (
	"Key"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"R_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"R_NO"
);