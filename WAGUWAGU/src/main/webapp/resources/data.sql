-- 사용자 테이블 (user) 데이터 삽입
INSERT INTO `user` (userId, userPassword, userEmail, userName, userGender) VALUES
('user01', 'pw01', 'user01@email.com', '홍길동', '남성'),
('user02', 'pw02', 'user02@email.com', '김영희', '여성'),
('user03', 'pw03', 'user03@email.com', '박철수', '남성'),
('user04', 'pw04', 'user04@email.com', '이민정', '여성'),
('user05', 'pw05', 'user05@email.com', '최강찬', '알 수 없음');


-- 비디오 테이블 (video) 데이터 삽입
INSERT INTO video (
  videoTitle, videoUrl, videoImgUrl, videoLevel, videoCat,
  videoRegDate, videoOwner, videoViewCnt
) VALUES
("[종이컵계랑] 수건 케이크 만들기!", 
 "https://youtu.be/MdXgupban2o?si=bWqlOl0E4eFrND7L", 
 "https://img.youtube.com/vi/MdXgupban2o/0.jpg", 
 "중", "디저트", "2023-12-24", "한세 HANSE", 1325),

("[어남선생 레시피] 떡볶이는 이제 평생 이 간단 레시피면 끝! ★평생 떡볶이★", 
 "https://youtu.be/xtW8mjglyfY?si=D2ZizeEnBc3m-Orp", 
 "https://img.youtube.com/vi/xtW8mjglyfY/0.jpg", 
 "하", "한식", "2024-01-03", "KBS Entertain", 4210),

("👏난리난 화제의 레시피👏 팔아도 되는 역대급 맛! 도시락싸기 추천메뉴 스팸마요주먹밥 만들기 korea riceball", 
 "https://youtu.be/9cGWDBYaL2o?si=sZU-IG-1f7wtCMOC", 
 "https://img.youtube.com/vi/9cGWDBYaL2o/0.jpg", 
 "하", "한식", "2022-06-14", "은주리리", 2870),

("우런니 일주일 출근길 샌드위치 호다닥 도시락 part.9", 
 "https://youtu.be/laoYdHn--lc?si=6-kup2YaW1y7RIsb", 
 "https://img.youtube.com/vi/laoYdHn--lc/0.jpg", 
 "상", "양식", "2021-11-02", "Cream Park", 1630),

("작장면 炸醬麵", 
 "https://youtu.be/cWMs1UH774A?si=5c8BHK0j64-kT_el", 
 "https://img.youtube.com/vi/cWMs1UH774A/0.jpg", 
 "상", "중식", "2020-08-19", "최강록 Ultra Taste Diary", 3890),

("김치나베돈까스/ Pork cutlet kimchi nabe", 
 "https://youtu.be/qp_kMDWdE2c?si=FBEqIWWKe-RcWEvY", 
 "https://img.youtube.com/vi/qp_kMDWdE2c/0.jpg", 
 "상", "일식", "2023-03-27", "최강록 Ultra Taste Diary", 2120),

("귤로 귤잼을 만들어서 게장을 담가보자!", 
 "https://youtu.be/_ki2hryKfs0?si=W2KjAN8x5fxfQXhd", 
 "https://img.youtube.com/vi/_ki2hryKfs0/0.jpg", 
 "상", "한식", "2022-09-10", "수빙수tv sooBingsoo", 1580),

("피스타치오 티라미수 Pistachio Tiramisu", 
 "https://youtu.be/onBeq5ltBOo?si=6SRZ6VrN5unJh05C", 
 "https://img.youtube.com/vi/onBeq5ltBOo/0.jpg", 
 "중", "디저트", "2021-01-20", "하루한끼 one meal a day", 940),

("초간단 들기름 막국수", 
 "https://youtu.be/bzTRWZwVg8I?si=UYz5z9H-ApJ0BH4o", 
 "https://img.youtube.com/vi/bzTRWZwVg8I/0.jpg", 
 "하", "한식", "2024-04-01", "하루한끼 one meal a day", 1105),

("얼얼함도 맵기도 내가 조절한다! DIY 마라탕 레시피", 
 "https://youtu.be/IaMreOyefvI?si=1TsiUcpOBhhw2539", 
 "https://img.youtube.com/vi/IaMreOyefvI/0.jpg", 
 "중", "중식", "2023-07-07", "쭈야공키친JJUYAGONG", 1780),

("지옥에서 온 계란, 에그인헬: EGGS IN HELL (SIMPLE SHAKSHUKA) : 꿀키", 
 "https://youtu.be/F5ESmoCh77k?si=u4B7Jw7a1phdf3-k", 
 "https://img.youtube.com/vi/F5ESmoCh77k/0.jpg", 
 "상", "양식", "2020-10-31", "꿀키honeykki", 2685),

("홈메이드 미소라멘 : 일본 전국 1위 라멘집의 레시피! 세상 가장 녹진하고 농후한 국물에 대감동했습니다... (味噌ラーメン)", 
 "https://youtu.be/qfB7idZnZWE?si=o_8YmNKUiKsFG1az", 
 "https://img.youtube.com/vi/qfB7idZnZWE/0.jpg", 
 "상", "일식", "2022-01-15", "육식맨 YOOXICMAN", 1950);


-- 비디오 찜 (videoPick) 데이터 삽입
INSERT INTO `videoPick` (userId, videoId) VALUES
('user01', 1),
('user02', 2),
('user03', 3),
('user04', 4),
('user05', 5);

-- 리뷰 테이블 (review) 데이터 삽입
INSERT INTO `review` (reviewTitle, reviewContent, reviewWriter, reviewViewCnt, videoId) VALUES
('정말 맛있어요!', '영상 덕분에 요리를 성공했어요.', 'user01', 5, 1),
('레시피가 쉬워요', '처음 해봤는데 쉽게 따라했어요.', 'user02', 3, 1),
('한식 입문에 좋아요', '간단하게 맛있는 한식 가능!', 'user03', 4, 1),
('추천합니다', '어르신도 좋아하셨어요.', 'user04', 6, 1),
('깔끔한 설명 최고!', '설명 천천히 해줘서 이해가 쉬워요.', 'user05', 2, 1),
('맛있고 건강해요', '채소 조합이 정말 좋네요.', 'user01', 5, 2),
('초보자도 가능!', '이탈리안 요리가 이렇게 쉬울 줄이야.', 'user02', 3, 3),
('쿠키가 바삭해요', '온도랑 시간 설명이 좋았어요.', 'user03', 4, 3),
('중식 처음인데 성공', '불맛은 못 냈지만 만족!', 'user04', 6, 4),
('된장찌개 굿굿', '집밥 느낌 제대로 납니다.', 'user05', 2, 5);
