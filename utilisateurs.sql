--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `taille` int(11) NOT NULL,
  PRIMARY KEY (`iduser`)
);

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`iduser`, `nom`, `prenom`, `age`, `taille`) VALUES
(1, 'Bendaoud', 'Youness', 20, 180),
(2, 'Leveque', 'Tom', 20, 175);

