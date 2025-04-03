CREATE DATABASE IF NOT EXISTS waguwagu;
USE waguwagu;
 
 CREATE TABLE IF NOT EXISTS `user`(
 `userId` 	VARCHAR(40) PRIMARY KEY NOT NULL, 
 `userPassword` VARCHAR(60) NOT NULL, 
 `userEmail` VARCHAR(100) NOT NULL,
 `userName` VARCHAR(40) NOT NULL,
 `userGender` ENUM('여성', '남성', '알 수 없음') NOT NULL
 );
 
 CREATE TABLE IF NOT EXISTS `video`(
 `videoId` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 `videoTitle` VARCHAR(255) NOT NULL,
 `videoUrl` VARCHAR(255) NOT NULL, 
 `videoImgUrl` VARCHAR(255) NOT NULL,
 `videoLevel` ENUM('상', '중', '하') NOT NULL,
 `videoCat` ENUM('디저트', '양식', '중식', '한식', '일식') NOT NULL,
 `videoViewCnt` INT NOT NULL DEFAULT 0,
 `videoRegDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `videoOwner` VARCHAR(40) NOT NULL
 );
 
 CREATE TABLE IF NOT EXISTS `videoPick`(
 `userId` VARCHAR(40) NOT NULL,
 `videoId` INT NOT NULL,
 PRIMARY KEY(userId, videoId),
 FOREIGN KEY (userId) REFERENCES user(userId),
 FOREIGN KEY (videoId) REFERENCES video(videoId)
 );
 
 CREATE TABLE IF NOT EXISTS `review`(
 `reviewId` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 `reviewTitle` VARCHAR(255) NOT NULL,
 `reviewContent` TEXT NOT NULL,
 `reviewWriter` VARCHAR(40) NOT NULL, 
 `reviewViewCnt` INT NOT NULL,
 `reviewRegDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `reviewUpdateAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `videoId` INT NOT NULL,
 FOREIGN KEY (reviewWriter) REFERENCES user(userId),
 FOREIGN KEY (videoId) REFERENCES video(videoId)
 );
