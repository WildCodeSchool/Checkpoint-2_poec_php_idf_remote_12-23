-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 26 Octobre 2017 à 13:53
-- Version du serveur :  5.7.19-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET
  time_zone = "+00:00";
  /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
  /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
  /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
  /*!40101 SET NAMES utf8mb4 */;
--
  -- Base de données :  `simple-mvc`
  --
  -- --------------------------------------------------------
  --
  -- Structure de la table `item`
  --
  CREATE TABLE `item` (
    `id` int(11) UNSIGNED NOT NULL,
    `title` varchar(255) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
  -- Contenu de la table `item`
  --
INSERT INTO
  `item` (`id`, `title`)
VALUES
  (1, 'Stuff'),
  (2, 'Doodads');
--
  -- Index pour les tables exportées
  --
  --
  -- Index pour la table `item`
  --
ALTER TABLE
  `item`
ADD
  PRIMARY KEY (`id`);
--
  -- AUTO_INCREMENT pour les tables exportées
  --
  --
  -- AUTO_INCREMENT pour la table `item`
  --
ALTER TABLE
  `item`
MODIFY
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;
  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

  -- Create the accessory table
CREATE TABLE IF NOT EXISTS `accessory` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

-- Create the cupcake table
CREATE TABLE IF NOT EXISTS `cupcake` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `color1` CHAR(7) NOT NULL,
    `color2` CHAR(7),
    `color3` CHAR(7),
    `accessory_id` INT,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`accessory_id`) REFERENCES `accessory`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;


-- Insert data into the accessory table
INSERT INTO `accessory` (`name`, `url`) VALUES
('Sprinkles', 'https://example.com/sprinkles'),
('Chocolate chips', 'https://example.com/chocolate-chips'),
('Frosting', 'https://example.com/frosting');

-- Insert data into the cupcake table
INSERT INTO `cupcake` (`name`, `color1`, `color2`, `color3`, `accessory_id`, `created_at`) VALUES
('Vanilla Cupcake', '#ffffff', '#ffcc00', '#ff99cc', 1, NOW()),
('Chocolate Cupcake', '#663300', '#cc6600', '#996633', 2, NOW()),
('Strawberry Cupcake', '#ff99cc', '#ffcccc', '#cc0033', 3, NOW());