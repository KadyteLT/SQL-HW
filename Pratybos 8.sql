-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018 m. Spa 19 d. 09:48
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Books`
--

-- --------------------------------------------------------
-- Sukurta duomenų struktūra lentelei `authors_books`
--

DROP TABLE IF EXISTS `authors_books`;
CREATE TABLE IF NOT EXISTS `authors_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Kopijuojame `authorId`, `bookId`  duomenis į lentele authors_books`
--


INSERT INTO authors_books (`authorId`, `bookId` ) 
SELECT `authorId`, bookId 
FROM `books` 
WHERE `authorId` IS NOT NULL;


--
-- Ištriname  `authorId` stulpelį is books lenteles
--

ALTER TABLE books 
DROP COLUMN `authorId`;

--
-- Nustatome authors lenteleje CHARACTER SET utf8 COLLATE utf8_GENERAL_ci;
--

ALTER TABLE authors MODIFY `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_GENERAL_ci;

--
-- Nustatome books lenteleje CHARACTER SET utf8 COLLATE utf8_GENERAL_ci;
--

ALTER TABLE books MODIFY `title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_GENERAL_ci;

--
-- Pridedame autorius
--
INSERT INTO `authors` (`authorId`, `name`) VALUES (11, 'Rimantas Belevičius'), (12, 'Saulius Valentinavičius');


--
-- Pridedame knygą
--

INSERT INTO `books` (`bookId`, `title`, `year`) VALUES (12, 'Programavimas C++', '2015');


--
-- Pridedame realiaciją `authors_books` leneteleje
--
INSERT INTO `authors_books` (`id`, `authorId`, `bookId`) VALUES (NULL, '11', '12'), (NULL, '12', '12');