-- db 삭제
DROP DATABASE petminddb;
CREATE DATABASE petminddb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


use petminddb;
select * from user_user;
select * from dogs_dogprofile; -- 없는 테이블
select * from dogs_profile;
select * from dogs_dogbreed;

INSERT INTO dogs_dogbreed (id, breed_name, image_url, characteristic) values
(101,'비글','https://dogs.beagle','비글이다'),
(102,'푸들','https://dogs.poodle','푸들이다');

INSERT INTO dogs_profile (
    id, breed_id, user_id, name, breed_name, age, gender, neutered,
    disease_history, living_period, housing_type, profile_image_url,
    created_at, updated_at
) VALUES 
(
    1, 101, '21a235c1a8c942ad9b3710bcea3866af', '마루', '비글', 24, '여아', '완료',
    '슬개골 탈구 수술 이력 있음', '3년 이상 ~ 10년 미만', '아파트', '',
    NOW(), NOW()
),
(
    2, 102, '21a235c1a8c942ad9b3710bcea3866af', '모카', '푸들', 3, '남아', '미완료',
    '알러지 있음', '1년 이상 ~ 3년 미만', '빌라/다세대', 'https://via.placeholder.com/80',
    NOW(), NOW()
);

INSERT INTO dogs_profile (
    id, breed_id, user_id, name, breed_name, age, gender, neutered,
    disease_history, living_period, housing_type, profile_image_url,
    created_at, updated_at
) VALUES
(1, 101, '9fc5d51731314737b7681105da6d1414', '하늘', '비글', 28, '여아', '완료',
 '슬개골 탈구 수술 이력 있음', '1년 이상 ~ 3년 미만', '아파트', '/media/profile_image/img107.jpg',
 NOW(), NOW()),
(2, 102, '9fc5d51731314737b7681105da6d1414', '도연', '푸들', 27, '남아', '미완료',
 '알레르기 있음', '3년 이상 ~ 10년 미만', '빌라/다세대', '/media/profile_image/img102.jpg',
 NOW(), NOW()),
(3, 102, '9fc5d51731314737b7681105da6d1414', '다인', '푸들', 26, '여아', '완료',
 '', '1년 미만', '기타', '/media/profile_image/img123.jpg',
 NOW(), NOW()),
(4, 101, '9fc5d51731314737b7681105da6d1414', '수연', '비글', 10, '남아', '완료',
 '이전 감염병 완치 이력 있음', '10년 이상', '단독주택', '/media/profile_image/img414.jpg',
 NOW(), NOW());
