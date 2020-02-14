-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 17 Janvier 2020 à 13:09
-- Version du serveur :  5.7.28-0ubuntu0.18.04.4
-- Version de PHP :  7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tests4`
--

-- --------------------------------------------------------

--
-- Structure de la table `cpu`
--

CREATE TABLE `cpu` (
  `idCpu` int(11) NOT NULL,
  `idHote` int(11) NOT NULL,
  `frequence` int(11) DEFAULT NULL,
  `frequenceMax` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `cpu`
--

INSERT INTO `cpu` (`idCpu`, `idHote`, `frequence`, `frequenceMax`, `type`) VALUES
(1, 145, 2131, 3000, 'x86_64'),
(2, 14515, 2439, 3200, 'x86_64'),
(3, 1451, 2439, 3500, 'x86_64'),
(4, 1459, 2439, 4200, 'x86_64'),
(5, 14597, 2439, 3800, 'x86_64'),
(6, 3, 800, 1600, 'x86_64'),
(7, 4, 885, 2400, 'x86_64'),
(8, 5, 919, 2100, 'x86_64');

-- --------------------------------------------------------

--
-- Structure de la table `disque`
--

CREATE TABLE `disque` (
  `idDisque` int(11) NOT NULL,
  `idHote` int(11) NOT NULL,
  `memoireTotal` bigint(20) DEFAULT NULL,
  `memoireLibre` bigint(11) DEFAULT NULL,
  `memoireOccupe` bigint(11) DEFAULT NULL,
  `buffer` int(11) DEFAULT NULL,
  `cache` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `disque`
--

INSERT INTO `disque` (`idDisque`, `idHote`, `memoireTotal`, `memoireLibre`, `memoireOccupe`, `buffer`, `cache`) VALUES
(1, 1451, 16705642496, 8352821248, 4176410624, 2088205312, 1044102656),
(2, 1459, 16705642496, 8352821248, 4176410624, 2088205312, 1044102656),
(3, 14597, 16705642496, 8352821248, 4176410624, 2088205312, 1044102656),
(4, 3, 16705642496, 8352821248, 4176410624, 2088205312, 1044102656),
(5, 4, 16705642496, 8352821248, 4176410624, 2088205312, 1044102656),
(6, 5, 16705642496, 8352821248, 4176410624, 2088205312, 1044102656);

-- --------------------------------------------------------

--
-- Structure de la table `hote`
--

CREATE TABLE `hote` (
  `idHote` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OS` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uptime` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noyaux` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `hote`
--

INSERT INTO `hote` (`idHote`, `nom`, `OS`, `uptime`, `noyaux`) VALUES
(3, 'rt-s111-pc', 'Linux', 'up 0 jours, 2:53', '4.15.0-74-generic'),
(4, 'rt-s111-pc', 'Linux', 'up 0 jours, 0:21', '4.15.0-74-generic'),
(5, 'rt-s111-pc', 'Linux', 'up 0 jours, 0:21', '4.15.0-74-generic'),
(145, 'rt-s111-pc', 'Linux', 'up 0 jours, 2:47', '4.15.0-74-generic'),
(1451, 'rt-s111-pc', 'Linux', 'up 0 jours, 3:50', '4.15.0-74-generic'),
(1459, 'rt-s111-pc', 'Linux', 'up 0 jours, 3:50', '4.15.0-74-generic'),
(14515, 'rt-s111-pc', 'Linux', 'up 0 jours, 3:50', '4.15.0-74-generic'),
(14597, 'rt-s111-pc', 'Linux', 'up 0 jours, 3:50', '4.15.0-74-generic'),
(14598, '', '', '', ''),
(14599, '', '', '', ''),
(14600, 'rt-s111-pc@192.168.2.5', '', '', ''),
(14601, 'rt-s111-pc@192.168.2.10', '', '', ''),
(14602, 'rt-s111-pc@192.168.2.15', 'Linux', 'up 0 jours, 3:47', '4.15.0-74-generic'),
(14603, 'rt-s111-pc@192.168.2.25', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `idService` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`idService`, `nom`) VALUES
(1, 'web'),
(2, 'firewall'),
(3, 'https'),
(4, 'web'),
(5, 'web'),
(6, 'web');

-- --------------------------------------------------------

--
-- Structure de la table `servicehote`
--

CREATE TABLE `servicehote` (
  `idHote` int(11) NOT NULL,
  `idService` int(11) NOT NULL,
  `etat` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `servicehote`
--

INSERT INTO `servicehote` (`idHote`, `idService`, `etat`) VALUES
(14597, 1, 1),
(14597, 2, 1),
(14597, 3, 0),
(3, 4, 0),
(4, 5, 0),
(5, 6, 0);

-- --------------------------------------------------------

--
-- Structure de la table `typepartition`
--

CREATE TABLE `typepartition` (
  `idTypePartition` int(11) NOT NULL,
  `idDisque` int(11) NOT NULL,
  `available` bigint(20) DEFAULT NULL,
  `fileSystem` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mounted` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pourcentage` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `used` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `typepartition`
--

INSERT INTO `typepartition` (`idTypePartition`, `idDisque`, `available`, `fileSystem`, `mounted`, `pourcentage`, `size`, `used`) VALUES
(1, 3, 55865929728, '/dev/sda7', '/', '24.7', 78205652992, 18322972672),
(2, 3, 68143104, '/dev/sda2', '/boot/efi', '32.3', 100663296, 32520192),
(3, 3, 5119950848, '/dev/sdf1', '/media/rt/LAURAPER', '66.9', 15463923712, 10343972864),
(4, 4, 54892982272, '/dev/sda7', '/', '26.0', 78205652992, 19295920128),
(5, 4, 68143104, '/dev/sda2', '/boot/efi', '32.3', 100663296, 32520192),
(6, 5, 54246289408, '/dev/sda7', '/', '26.9', 78205652992, 19942612992),
(7, 5, 68143104, '/dev/sda2', '/boot/efi', '32.3', 100663296, 32520192),
(8, 6, 54246289408, '/dev/sda7', '/', '26.9', 78205652992, 19942612992),
(9, 6, 68143104, '/dev/sda2', '/boot/efi', '32.3', 100663296, 32520192);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `cpu`
--
ALTER TABLE `cpu`
  ADD PRIMARY KEY (`idCpu`),
  ADD KEY `cpu_ibfk_1` (`idHote`);

--
-- Index pour la table `disque`
--
ALTER TABLE `disque`
  ADD PRIMARY KEY (`idDisque`),
  ADD KEY `disque_ibfk_1` (`idHote`);

--
-- Index pour la table `hote`
--
ALTER TABLE `hote`
  ADD PRIMARY KEY (`idHote`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`idService`);

--
-- Index pour la table `servicehote`
--
ALTER TABLE `servicehote`
  ADD KEY `idHote` (`idHote`),
  ADD KEY `idService` (`idService`);

--
-- Index pour la table `typepartition`
--
ALTER TABLE `typepartition`
  ADD PRIMARY KEY (`idTypePartition`),
  ADD KEY `typePartition_ibfk_1` (`idDisque`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `cpu`
--
ALTER TABLE `cpu`
  MODIFY `idCpu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `disque`
--
ALTER TABLE `disque`
  MODIFY `idDisque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `hote`
--
ALTER TABLE `hote`
  MODIFY `idHote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14604;
--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `idService` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `typepartition`
--
ALTER TABLE `typepartition`
  MODIFY `idTypePartition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `cpu`
--
ALTER TABLE `cpu`
  ADD CONSTRAINT `cpu_ibfk_1` FOREIGN KEY (`idHote`) REFERENCES `hote` (`idHote`);

--
-- Contraintes pour la table `disque`
--
ALTER TABLE `disque`
  ADD CONSTRAINT `disque_ibfk_1` FOREIGN KEY (`idHote`) REFERENCES `hote` (`idHote`);

--
-- Contraintes pour la table `servicehote`
--
ALTER TABLE `servicehote`
  ADD CONSTRAINT `serviceHote_ibfk_1` FOREIGN KEY (`idHote`) REFERENCES `hote` (`idHote`),
  ADD CONSTRAINT `serviceHote_ibfk_2` FOREIGN KEY (`idService`) REFERENCES `service` (`idService`);

--
-- Contraintes pour la table `typepartition`
--
ALTER TABLE `typepartition`
  ADD CONSTRAINT `typePartition_ibfk_1` FOREIGN KEY (`idDisque`) REFERENCES `disque` (`idDisque`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
