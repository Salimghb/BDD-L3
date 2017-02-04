-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mer 25 Janvier 2017 à 07:20
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tp_psi2`
--

-- --------------------------------------------------------

--
-- Structure de la table `cartebancaire`
--

CREATE TABLE `cartebancaire` (
  `numCB` varchar(16) NOT NULL,
  `numClientDetenteur` varchar(10) NOT NULL,
  `codeTypeCB` varchar(2) NOT NULL,
  `numCCSupport` varchar(10) NOT NULL,
  `dateExpiration` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cartebancaire`
--

INSERT INTO `cartebancaire` (`numCB`, `numClientDetenteur`, `codeTypeCB`, `numCCSupport`, `dateExpiration`) VALUES
('MC860313', '860313', 'MC', 'CCHQ860313', '2018-12-01'),
('VS860313', '860313', 'VS', 'CCHQ860313', '2019-07-01'),
('MC921026', '921026', 'MC', 'CCHQ921026', '2018-11-01'),
('VS970212', '970212', 'VS', 'CCHQ970212', '2017-12-01'),
('MC890101', '890101', 'MC', 'CCHQ890101', '2018-10-01');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `numClient` varchar(6) NOT NULL,
  `nomClient` varchar(32) NOT NULL,
  `prenomClient` varchar(32) DEFAULT NULL,
  `adresse` varchar(128) NOT NULL,
  `numTelephone` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`numClient`, `nomClient`, `prenomClient`, `adresse`, `numTelephone`) VALUES
('860313', 'Azevedo', 'Léo', 'rue du Père Nöel 45590 ST CYR EN VAL', '0638880001'),
('921026', 'Duperey', 'Anny', 'rue du Cinéma 45000 ORLEANS', '0238630002'),
('970212', 'Dupont', 'Patrick', 'rue des Planches 45160 OLIVET', '0238630003'),
('890101', 'Duteuil', 'Yves', 'rue de la Gratte 45400 FLEURY LES AUBRAY', '0238630004');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `numCompte` varchar(10) NOT NULL,
  `numClient` varchar(6) NOT NULL,
  `dateOuverture` date NOT NULL,
  `depotInitial` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`numCompte`, `numClient`, `dateOuverture`, `depotInitial`) VALUES
('CCHQ860313', '860313', '2001-01-01', '1000.00'),
('LIVA860313', '860313', '2001-07-01', '1500.00'),
('CEPL860313', '860313', '2003-07-01', '1500.00'),
('CCHQ921026', '921026', '2002-01-01', '1000.00'),
('LIVA921026', '921026', '2002-07-01', '1500.00'),
('CCHQ970212', '970212', '2001-07-01', '1000.00'),
('LIVA970212', '970212', '2003-01-01', '1000.00'),
('CCHQ890101', '890101', '2004-01-01', '1000.00');

-- --------------------------------------------------------

--
-- Structure de la table `comptecourant`
--

CREATE TABLE `comptecourant` (
  `numCompte` varchar(10) NOT NULL,
  `decouvert` decimal(10,2) NOT NULL,
  `dateOuverture` date DEFAULT NULL,
  `depotInitial` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `comptecourant`
--

INSERT INTO `comptecourant` (`numCompte`, `decouvert`, `dateOuverture`, `depotInitial`) VALUES
('CCHQ860313', '1000.00', NULL, NULL),
('CCHQ921026', '1500.00', NULL, NULL),
('CCHQ970212', '2000.00', NULL, NULL),
('CCHQ890101', '2500.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `compteepargne`
--

CREATE TABLE `compteepargne` (
  `numCompte` varchar(10) NOT NULL,
  `tauxInteret` decimal(4,0) DEFAULT NULL,
  `soldePlancher` decimal(10,2) DEFAULT NULL,
  `dateOuverture` date DEFAULT NULL,
  `depotInitial` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compteepargne`
--

INSERT INTO `compteepargne` (`numCompte`, `tauxInteret`, `soldePlancher`, `dateOuverture`, `depotInitial`) VALUES
('LIVA860313', '1', '100', NULL, NULL),
('CEPL860313', '1', '200', NULL, NULL),
('LIVA921026', '1', '100', NULL, NULL),
('LIVA970212', '1', '100', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `mois`
--

CREATE TABLE `mois` (
  `debutMois` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE `operation` (
  `codeOperation` varchar(30) NOT NULL,
  `numCB` varchar(16) DEFAULT NULL,
  `numComptePivot` varchar(10) NOT NULL,
  `dateOperation` date NOT NULL,
  `libelleOperation` varchar(32) NOT NULL,
  `montantOperation` decimal(10,2) NOT NULL,
  `typeOperation` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `operation`
--

INSERT INTO `operation` (`codeOperation`, `numCB`, `numComptePivot`, `dateOperation`, `libelleOperation`, `montantOperation`, `typeOperation`) VALUES
('OP01__-->CCHQ860313', NULL, 'CCHQ860313', '2016-12-02', 'Virement Remboursement', '250.00', 'Crédit'),
('OP02__-->LIVA970212', NULL, 'CCHQ970212', '2016-12-03', 'Virement Permanent', '100.00', 'Débit immédiat'),
('OP03__-->LIVA860313', NULL, 'LIVA860313', '2016-12-05', 'Virement Permanent', '100.00', 'Débit immédiat'),
('OP04__CCHQ860313-->', 'MC860313', 'CCHQ860313', '2016-12-07', 'Picard', '100.00', 'Débit différé'),
('OP05__-->CCHQ860313', NULL, 'CCHQ860313', '2016-11-10', 'Remboursement Mutuelle', '200.00', 'Crédit'),
('OP06__CCHQ860313-->', 'MC860313', 'CCHQ860313', '2016-12-11', 'Retrait DAB Olivet', '100.00', 'Débit immédiat'),
('OP07__CCHQ860313-->', 'VS860313', 'CCHQ860313', '2016-12-13', 'Retrait DAB St Cyr en Val', '200.00', 'Débit immédiat'),
('OP08__CCHQ970212->', 'VS970212', 'CCHQ970212', '2016-12-02', 'Retrait DAB Olivet', '300.00', 'Débit immédiat'),
('OP10__LIVA970212-->', NULL, 'LIVA970212', '2016-12-04', 'Retrait Guichet', '500.00', 'Débit immédiat'),
('OP11__CCHQ860313->', 'MC860313', 'CCHQ860313', '2016-11-28', 'Retrait DAB St Cyr en Val', '900.00', 'Débit immédiat'),
('OP13__-->CCHQ860313', NULL, 'CCHQ860313', '2016-12-14', 'Chèque N° 3425678', '500.00', 'Crédit'),
('OP20__CCHQ860313-->', NULL, 'CCHQ860313', '2016-12-08', 'Prélèvement EDF', '800.00', 'Débit immédiat'),
('OP21__CCHQ860313-->', 'MC860313', 'CCHQ860313', '2016-12-05', 'Auchan Olivet', '400.00', 'Débit différé'),
('OP30__CCHQ921026-->', 'MC921026', 'CCHQ921026', '2016-12-03', 'Retrait DAB Orléans Sud', '300.00', 'Débit immédiat'),
('OP31__CCHQ890101-->', NULL, 'CCHQ890101', '2016-12-08', 'Virement Occasionnel', '300.00', 'Débit immédiat'),
('OP32__-->CCHQ860313', NULL, 'CCHQ860313', '2016-12-09', 'Virement Occasionnel', '200.00', 'Crédit'),
('OP15__CCHQ860313-->', 'MC860313', 'CCHQ860313', '2016-12-09', 'SNCF Internet', '150.00', 'Débit différé'),
('OP23__CCHQ860313-->', 'MC860313', 'CCHQ860313', '2016-11-25', 'SNCF Internet', '120.00', 'Débit différé'),
('OP17__CCHQ860313-->', 'VS860313', 'CCHQ860313', '2016-12-11', 'Carrefour', '150.00', 'Débit différé');

-- --------------------------------------------------------

--
-- Structure de la table `soldeccdebutmois`
--

CREATE TABLE `soldeccdebutmois` (
  `debutMois` date NOT NULL,
  `numCompte` varchar(10) NOT NULL,
  `soldeAReporter` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `soldeccdebutmois`
--

INSERT INTO `soldeccdebutmois` (`debutMois`, `numCompte`, `soldeAReporter`) VALUES
('2016-11-01', 'CCHQ860313', '1750.00'),
('2016-12-01', 'CCHQ860313', '2500.00'),
('2016-11-01', 'CCHQ921026', '1500.00'),
('2016-12-01', 'CCHQ921026', '-750.00'),
('2016-11-01', 'CCHQ970212', '1000.00'),
('2016-12-01', 'CCHQ970212', '2000.00'),
('2016-11-01', 'CCHQ890101', '1500.00'),
('2016-12-01', 'CCHQ890101', '2500.00');

-- --------------------------------------------------------

--
-- Structure de la table `typecb`
--

CREATE TABLE `typecb` (
  `codeTypeCB` varchar(2) NOT NULL,
  `libelleTypeCB` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `typecb`
--

INSERT INTO `typecb` (`codeTypeCB`, `libelleTypeCB`) VALUES
('MC', 'MasterCard'),
('MG', 'MasterCard Gold'),
('VS', 'Visa');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `cartebancaire`
--
ALTER TABLE `cartebancaire`
  ADD PRIMARY KEY (`numCB`),
  ADD KEY `FK_CarteBanquaire_Client` (`numClientDetenteur`),
  ADD KEY `FK_CarteBanquaire_TypeCB` (`codeTypeCB`),
  ADD KEY `FK_CarteBanquaire_CompteCourant` (`numCCSupport`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`numClient`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`numCompte`),
  ADD KEY `FK_Compte_Client` (`numClient`);

--
-- Index pour la table `comptecourant`
--
ALTER TABLE `comptecourant`
  ADD PRIMARY KEY (`numCompte`);

--
-- Index pour la table `compteepargne`
--
ALTER TABLE `compteepargne`
  ADD PRIMARY KEY (`numCompte`);

--
-- Index pour la table `mois`
--
ALTER TABLE `mois`
  ADD PRIMARY KEY (`debutMois`);

--
-- Index pour la table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`codeOperation`),
  ADD KEY `FK_Operation_CarteBanquaire` (`numCB`),
  ADD KEY `FK_Operation_Compte` (`numComptePivot`);

--
-- Index pour la table `soldeccdebutmois`
--
ALTER TABLE `soldeccdebutmois`
  ADD PRIMARY KEY (`debutMois`,`numCompte`),
  ADD KEY `FK_SoldeCCDebutMois_CompteCourant` (`numCompte`);

--
-- Index pour la table `typecb`
--
ALTER TABLE `typecb`
  ADD PRIMARY KEY (`codeTypeCB`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
