-- create database petminddb;
use petminddb;

CREATE TABLE dogs_breed (
    breed_id INT PRIMARY KEY,
    name VARCHAR(100),
    image_url VARCHAR(255),
    description TEXT
);

CREATE TABLE users (
    user_id CHAR(36) PRIMARY KEY,
    email VARCHAR(100),
    password VARCHAR(100),
    is_verified BOOLEAN,
    created_at DATETIME,
    is_deleted BOOLEAN,
    deleted_at DATETIME
);

CREATE TABLE dogs_profile (
    dog_id INT PRIMARY KEY,
    breed_id INT NOT NULL,
    user_id CHAR(36) NOT NULL,
    name VARCHAR(100),
    breed_name VARCHAR(100),
    age INT,
    gender ENUM('남아', '여아'),
    neutered ENUM('완료','미완료','모름'),
    medical_history TEXT,
    living_period ENUM('1년 미만', '1년 이상 ~ 3년 미만', '3년 이상 ~ 10년 미만', '10년 이상'),
    residence_type ENUM('아파트','단독주택','빌라/다세대','기타'),
    image_url VARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME
);

CREATE TABLE chats (
    chat_id INT PRIMARY KEY,
    dog_id INT NOT NULL,
    title TEXT,
    created_at DATETIME
);

CREATE TABLE messages (
    message_id INT PRIMARY KEY,
    chat_id INT,
    sender ENUM('user', 'bot'),
    body TEXT,
    created_at DATETIME
);

CREATE TABLE contents (
    content_id INT PRIMARY KEY,
    title VARCHAR(200),
    body TEXT,
    image_url VARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME,
    source_url VARCHAR(200)
);

CREATE TABLE content_recommendations (
    content_id INT,
    chat_id INT,
    PRIMARY KEY (content_id, chat_id),
    FOREIGN KEY (content_id) REFERENCES contents(content_id),
    FOREIGN KEY (chat_id) REFERENCES chats(chat_id)
);

CREATE TABLE user_review (
    review_id INT PRIMARY KEY,
    chat_id INT,
    rating INT,
    review TEXT,
    created_at DATETIME
);

-- db 삭제
DROP DATABASE petminddb;
CREATE DATABASE petminddb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use petminddb;
select * from user_user;
select * from dogs_dogprofile;
select * from dogs_dogbreed;

INSERT INTO dogs_dogbreed (id, breed_name, image_url, characteristic) values
(101,'비글','https://dogs.beagle','비글이다'),
(102,'푸들','https://dogs.poodle','푸들이다');

INSERT INTO dogs_dogprofile (
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