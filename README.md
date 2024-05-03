# cosmetic
## 화장품 사이트 - 이름: 에덴
-----

### 기능


1. 상품리스트
	1) 상품사진
	2) 가격
	3) 찜
	4) 상품이름
	5) 장바구니 버튼



2. 상품디테일
	1) 상품사진
	2) 가격
	3) 찜
	4) 상품이름
	5) 장바구니 버튼
	6) 바로구매
	7) 구매수량
	8) 상품설명
	9) 리뷰
		9-1) 리뷰내용
		9-2) 리뷰점수
		9-3) 신고
	10) Q&A
		10-1) Q&A작성
		10-2) 답변
		


3. 마이페이지
 	1) 주문/배송조회
 	2) 취소/반품/교환 내역
 	3) 장바구니
 	4) 좋아요
 	5) 쿠폰
 	6) 리뷰
	7) 회원정보수정
	8) 회원탈퇴



4. 헤더
	1) 검색
	2) 로그인/로그아웃
	3) 마이페이지
	4) 장바구니
	5) 주문배송
	6) 고객센터



5. 메인화면
	1) 카테고리
	2) 광고 사진
	3) 인기상품(판매수량 기준)
	4) 주목받는상품(좋아요 기준)



6. 카테고리
	6-1) 아이
	싱글섀도우,아이팔레트,마스카라,아이라이너,아이브라우	
	6-2) 립
	립스틱, 틴트, 글로스, 립펜슬, 립케어
	6-3) 페이스
	베이스-프라이머,쿠션-파운데이션,BB컨실러,팩트-파우더, 컨투어링-하이라이터, 블러셔
	6-4) 네일
	네일컬러, 네일케어, 네일리무버
	6-5) 스킨케어
	토너-패드, 에멀전, 에센스-세럼,크림-밤,미스트,선케어,세트
	6-6) 마스크.팩
	시트마스크, 페이셜팩, 패치
	6-7) 클렌저
	페이셜 클렌징, 메이크업 클렌징, 필링-스크럽
	6-8) 바디
	워시, 보습, 핸드-풋
	6-9) 헤어
	컬러-스타일링, 헤어케어
	6-10) 툴
	브러쉬, 퍼프, 화장솜-면봉, 속눈썹,헤어도구,기타	

-----


**4/24** 시작


**4/25** 데이터베이스 설계 및 로그인 구현, 회원가입 진행중


**4/29** 회원가입구현 및 카테고리 창 생성, 대분류, 소분류, 상품리스트 진행중


**4/30** 카테고리 대분류 진행중, 소분류, 상품리스트, 상품디테일 구현 중

**5/02** 상품 찜하기 진행중중, 페이지 번호 css 수정, 상품디테일 구현 중

-----
<MySql>consmetic table
USE cosmetic;

#회원  테이블
CREATE TABLE MEMBER(
userid varchar(100) not null PRIMARY KEY,
passwd VARCHAR(100) NOT NULL,
NAME VARCHAR(100) NOT NULL,
nickname VARCHAR(100) NOT NULL,
email VARCHAR(100),
birth INT NOT NULL,
address1 VARCHAR(100),
address2 VARCHAR(100),
zipcode VARCHAR(100),
phone VARCHAR(100),
DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
skin  VARCHAR(100),
LEVEL int DEFAULT 0,
POINT int DEFAULT 0);

INSERT INTO MEMBER (userid,passwd,NAME,nickname,birth) VALUES('1','1','일','일일','1');

SELECT * FROM MEMBER;
#-------------------------------------------------------------------------------#
#상품  테이블
CREATE TABLE product(
p_id INT AUTO_INCREMENT	not null PRIMARY KEY, #상품 번호
p_name  VARCHAR(100) NOT NULL, #상품명
p_price  int NOT NULL, #상품가격
p_stock INT,#상품 재고
p_img1 VARCHAR(1000), #대표이미지
p_img2 VARCHAR(1000), #이미지
p_img3 VARCHAR(1000), #이미지
p_detail VARCHAR(1000),#상품 설명(이미지)
p_date DATETIME DEFAULT CURRENT_TIMESTAMP,
p_delivery INT, #상품 배송(배송 테이블과 연결)
p_hit INT DEFAULT 0, # 상품 조회수
p_sell INT DEFAULT 0, #팔린 상품 갯수
p_cate INT # 카테고리 테이블 연결
)
#-------------------------------------------------------------------------------#
#배송 테이블
CREATE TABLE delivery(
d_num INT,
d_info VARCHAR(100)
);

INSERT INTO delivery VALUES(0,'무료');
INSERT INTO delivery VALUES(1,'일반');
INSERT INTO delivery VALUES(2,'당일');

SELECT * FROM delivery;
SELECT * FROM product;

#-------------------------------------------------------------------------------#
#카테고리 테이블
CREATE TABLE ctg(
ctg_idx INT NOT NULL, #카테고리 코드
ctg_big VARCHAR(100) NOT NULL, #대분류
ctg_b_no INT NOT NULL,
ctg_small  VARCHAR(100) NOT NULL, #소분류
ctg_s_no INT NOT NULL
);

# 립
INSERT INTO ctg (ctg_idx, ctg_big, ctg_b_no, ctg_small, ctg_s_no) VALUES
(1, '립', 10, '립스틱', 11),
(2, '립', 10, '틴트', 12),
(3, '립', 10, '글로스', 13),
(4, '립', 10, '립펜슬', 14),
(5, '립', 10, '립케어', 15);

# 아이
INSERT INTO ctg (ctg_idx, ctg_big, ctg_b_no, ctg_small, ctg_s_no) VALUES
(6, '아이', 20, '싱글섀도우', 21),
(7, '아이', 20, '아이팔레트', 22),
(8, '아이', 20, '마스카라', 23),
(9, '아이', 20, '아이라이너', 24),
(10, '아이', 20, '아이브라우', 25);

# 페이스
INSERT INTO ctg (ctg_idx, ctg_big, ctg_b_no, ctg_small, ctg_s_no) VALUES
(11, '페이스', 30, '베이스-프라이머', 31),
(12, '페이스', 30, '쿠션-파운데이션', 32),
(13, '페이스', 30, 'BB컨실러', 33),
(14, '페이스', 30, '팩트-파우더', 34),
(15, '페이스', 30, '컨투어링-하이라이터', 35),
(16, '페이스', 30, '블러셔', 36);

# 네일
INSERT INTO ctg (ctg_idx, ctg_big, ctg_b_no, ctg_small, ctg_s_no) VALUES
(17, '네일', 40, '네일컬러', 41),
(18, '네일', 40, '네일케어', 42),
(19, '네일', 40, '네일리무버', 43);

# 스킨케어
INSERT INTO ctg (ctg_idx, ctg_big, ctg_b_no, ctg_small, ctg_s_no) VALUES

(20, '스킨케어',50,'토너-패드', 51),
(21, '스킨케어', 50, '에멀전', 52),
(22, '스킨케어', 50, '에센스-세럼', 53),
(23, '스킨케어', 50, '크림-밤', 54),
(24, '스킨케어', 50, '미스트', 55),
(25, '스킨케어', 50, '선케어', 56),
(26, '스킨케어', 50, '세트',57);

# 마스크.팩

INSERT INTO ctg (ctg_idx, ctg_big, ctg_b_no, ctg_small, ctg_s_no) VALUES
(27, '마스크.팩', 60, '시트마스크', 61),
(28, '마스크.팩', 60, '페이셜팩', 62),
(29, '마스크.팩', 60, '패치', 63);

# 클렌저
INSERT INTO ctg (ctg_idx, ctg_big, ctg_b_no, ctg_small, ctg_s_no) VALUES
(30, '클렌저', 70, '페이셜 클렌징', 71),
(31, '클렌저', 70, '메이크업 클렌징', 72),
(32, '클렌저', 70, '필링-스크럽', 73);

# 바디
INSERT INTO ctg (ctg_idx, ctg_big, ctg_b_no, ctg_small, ctg_s_no) VALUES
(33, '바디', 80, '워시', 81),
(34, '바디', 80, '보습', 82),
(35, '바디', 80, '핸드-풋', 83);

# 헤어
INSERT INTO ctg (ctg_idx, ctg_big, ctg_b_no, ctg_small, ctg_s_no) VALUES
(36, '헤어', 90, '컬러-스타일링', 91),
(37, '헤어', 90, '헤어케어', 92);

# 툴
INSERT INTO ctg (ctg_idx, ctg_big, ctg_b_no, ctg_small, ctg_s_no) VALUES
(38, '툴', 100, '브러쉬', 101),
(39, '툴', 100, '퍼프', 102),
(40, '툴', 100, '화장솜-면봉', 103),
(41, '툴', 100, '속눈썹', 104),
(42, '툴', 100, '헤어도구', 105),
(43, '툴', 100, '기타', 106);

--옵션 테이블--
create table product_option(
o_id INT AUTO_INCREMENT	not null PRIMARY KEY, #옵션 번호, product 테이블 p_id와 연결
o_name varchar(100), #색깔 또는 상품명
p_id int, #부모 번호
o_price INT, #가격 
o_amount INT
);

INSERT INTO product_option VALUES ('1','롱앤컬','1','18000',10);
INSERT INTO product_option VALUES ('2','볼륨앤컬','1','18000',10);

INSERT INTO product_option VALUES ('3','블랙','2','15100',10);
INSERT INTO product_option VALUES ('4','브라운','2','15100',10);
INSERT INTO product_option VALUES ('5','그레이브라운','2','15100',10);

INSERT INTO product_option VALUES ('6','또렷컬','3','17400',10);
INSERT INTO product_option VALUES ('7','롱컬링','3','17400',10);
INSERT INTO product_option VALUES ('8','볼륨컬링','3','17400',10);
INSERT INTO product_option VALUES ('9','깔끔픽싱','3','17400',10);

INSERT INTO product_option VALUES ('10','블랙','5','7700',10);
INSERT INTO product_option VALUES ('11','브라운','5','7700',10);
INSERT INTO product_option VALUES ('12','블랙 브라운','5','7700',10);
INSERT INTO product_option VALUES ('13','다크 브라운','5','7700',10);
INSERT INTO product_option VALUES ('14','애쉬 브라운','5','7700',10);
INSERT INTO product_option VALUES ('15','바닐라 베이지','5','7700',10);
INSERT INTO product_option VALUES ('16','크리미 아이보리','5','7700',10);
--찜 목록--
CREATE TABLE zzim( 
idx INT AUTO_INCREMENT	not null PRIMARY KEY,
userid VARCHAR(100),
z_id INT,
p_name VARCHAR(100),
p_price INT,
p_img1 VARCHAR(100)
);

INSERT INTO zzim (userid,z_id) VALUES ('1', '1');
INSERT INTO zzim (userid,z_id) VALUES ('1', '2');
INSERT INTO zzim (userid,z_id) VALUES ('1', '3');

