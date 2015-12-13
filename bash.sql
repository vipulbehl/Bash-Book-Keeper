-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 12, 2015 at 03:47 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bash`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(250) DEFAULT NULL,
  `book_name` varchar(100) DEFAULT NULL,
  `author_name` varchar(100) DEFAULT NULL,
  `publication_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `isbn`, `book_name`, `author_name`, `publication_year`) VALUES
(1, '12345', 'Harry Potter', 'Ruskin Bond', 2008),
(2, '9780195799163', 'Harry Potter and the Philosopher''s Stone', 'J. K. Rowling', 1997),
(3, '9780195799164', 'Harry Potter and the Chamber of Secrets', 'J. K. Rowling', 1998),
(4, '9780195799165', 'Harry Potter and the Prisoner of Azkaban', 'J. K. Rowling', 1999),
(5, '9780195799166', 'Harry Potter and the Goblet of Fire', 'J. K. Rowling', 2000),
(6, '9780195799167', 'Harry Potter and the Order of the Phoenix', 'J. K. Rowling', 2003),
(7, '9780195799168', 'Harry Potter and the Half-Blood Prince', 'J. K. Rowling', 2005),
(8, '9780195799169', 'Harry Potter and the Deathly Hallows', 'J. K. Rowling', 2007),
(9, '9780195799170', 'The Room on the Roof', 'Ruskin Bond', 1956),
(10, '9780195799171', 'The Blue Umbrella', 'Ruskin Bond', 1974),
(11, '9780195799172', 'The night train at Deoli and other stories', 'Ruskin Bond', 1988),
(12, '9780195799173', 'A Flight of Pigeons', 'Ruskin Bond', 2003),
(13, '9780195799174', 'Our trees still grow in Dehra', 'Ruskin Bond', 1991),
(14, '9780195799175', 'Rain in the Mountains', 'Ruskin Bond', 1993),
(15, '9780195799176', 'Delhi is not far', 'Ruskin Bond', 1994),
(16, '9780195799177', 'The Eyes Have It', 'Ruskin Bond', 1953),
(22, '9780195799178', 'Harry Potter and the Philosopher''s Stone', 'J. K. Rowling', 1997),
(23, '9780195799179', 'Harry Potter and the Chamber of Secrets', 'J. K. Rowling', 1998),
(24, '9780195799180', 'Harry Potter and the Prisoner of Azkaban', 'J. K. Rowling', 1999),
(25, '9780195799181', 'Harry Potter and the Goblet of Fire', 'J. K. Rowling', 2000),
(26, '9780195799182', 'Harry Potter and the Order of the Phoenix', 'J. K. Rowling', 2003),
(27, '9780195799183', 'Harry Potter and the Half-Blood Prince', 'J. K. Rowling', 2005),
(28, '9780195799184', 'Harry Potter and the Deathly Hallows', 'J. K. Rowling', 2007),
(29, '9780195799185', 'The Room on the Roof', 'Ruskin Bond', 1956),
(30, '9780195799186', 'The Blue Umbrella', 'Ruskin Bond', 1974),
(31, '9780195799187', 'The night train at Deoli and other stories', 'Ruskin Bond', 1988),
(32, '9780195799188', 'A Flight of Pigeons', 'Ruskin Bond', 2003),
(33, '9780195799189', 'Our trees still grow in Dehra', 'Ruskin Bond', 1991),
(34, '9780195799190', 'Rain in the Mountains', 'Ruskin Bond', 1993),
(35, '9780195799191', 'Delhi is not far', 'Ruskin Bond', 1994),
(36, '2147483647', 'The Eyes Have It', 'Ruskin Bond', 1953);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `full_name`, `password`, `user_type`) VALUES
(1, 'vipulbehl94@gmail.com', 'Vipul Behl', 'qwerty', 'normal'),
(2, 'immortalchaity@gmail.com', 'Chaitanya', 'qwerty', 'admin'),
(17, 'vipul@gmail.com', 'Vipul Behl', 'qwerty', 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
