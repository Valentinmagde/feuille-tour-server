-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 10 oct. 2019 à 14:53
-- Version du serveur :  10.1.37-MariaDB
-- Version de PHP :  7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `asa`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE `action` (
  `id_action` int(11) NOT NULL,
  `code_action` varchar(20) NOT NULL,
  `denomination_action` text NOT NULL,
  `indicateur_action` longtext NOT NULL,
  `id_programme` int(11) NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `date_action` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archive` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `action`
--

INSERT INTO `action` (`id_action`, `code_action`, `denomination_action`, `indicateur_action`, `id_programme`, `id_responsable`, `date_action`, `archive`) VALUES
(9, 'A01', 'I.1.Renforcement de la  filière normale', 'Pourcentage de personnels enseignants formés par an par rapport aux besoins exprimés par le MINESEC', 23, 0, '2019-09-14 22:29:41', 0),
(10, 'A02', ' I.2. Renforcement de la filière médicale', 'Nombre de personnels de santé humaine et animale formés par an et par habitant\n', 23, 0, '2019-09-14 22:30:22', 0),
(11, 'A03', 'I.3. Renforcement des établissements technologiques      ', 'Nombre d’ingénieurs et de techniciens supérieurs formés par an', 23, 0, '2019-09-14 22:31:17', 0),
(12, 'A04', 'I.4. Renforcement des établissements professionnels du secteur tertiaire ', 'Nombre d’ingénieurs et de techniciens supérieurs du secteur tertiaire formés par an', 23, 0, '2019-09-14 23:33:26', 0),
(13, 'A05', 'I.5. Renforcement de la filière agronomique', 'Nombre d’ingénieurs agronomes et de techniciens supérieurs agricoles formés par an', 23, 0, '2019-09-14 23:34:07', 0),
(14, 'A06', 'I.6.Renforcement dans les filières des Industries Culturelles et Touristiques', 'Nombre de professionnels formés dans les domaines concernés par an', 23, 0, '2019-09-14 23:34:40', 0),
(15, 'A07', 'I.8. Coordination de l\'unité de gestion du  PRO-ACTP', 'Nombre de rapports trimestriels élaborés', 23, 0, '2019-09-14 23:38:39', 0),
(16, 'A11', 'II.1. Diversification de l’offre de formation et des formes alternatives d’enseignement', 'Nombre de filières professionnelles homologuées par an', 24, 0, '2019-10-04 20:24:01', 0),
(17, 'A12', 'II.3. Modernisation des infrastructures et des équipements facultaires', 'Nombre et type d’infrastructures réhabilitées / construites, adaptées aux exigences de l’enseignement professionnel par an', 24, 0, '2019-10-04 20:25:49', 0),
(18, 'A13', 'II.4. Renforcement du système d’information et d’orientation universitaire et professionnelle', 'Nombre d’étudiants orientés dans chaque filière accréditée par an', 24, 0, '2019-10-04 20:26:44', 0),
(19, 'A14', 'II.5. Gouvernance et gestion des filières professionnelles', 'Nombre de contrats de performance signés entre les établissements et les milieux socioprofessionnels', 24, 0, '2019-10-04 20:28:33', 0),
(20, 'A21', 'III.1. Structuration de la recherche universitaire', '-	Nombre de structures de recherche habilitées ; -	Schéma des centres de recherche et leur hiérarchisation', 25, 0, '2019-10-04 20:30:37', 0),
(21, 'A22', 'III.2. Renforcement du système d’information de la recherche', '-	Nombre de mises à jour hebdomadaire des infos de recherche  et d’innovations dans les sites des institutions universitaires ; -	Nombre de structures de l’ES qui disposent d’un site web fonctionnel offrant une information sur la recherche, l’innovation cyber accessible', 25, 0, '2019-10-04 20:31:56', 0),
(22, 'A23', 'III.4. Développement de la coopération et des partenariats universitaires', 'Nombre d’accords de coopération et de partenariats signés et agréés', 25, 0, '2019-10-04 20:33:00', 0),
(23, 'A24', 'III.5. Gouvernance de la recherche et de la coopération universitaire', 'Nombre de rapports trimestriels élaborés', 25, 0, '2019-10-04 20:34:04', 0),
(24, 'A31', 'IV.1. Coordination et suivi des activités des services du MINESUP', 'Niveau de mise en place du dispositif de pilotage axé sur la performance', 26, 0, '2019-10-04 21:33:38', 0),
(25, 'A32', 'IV.2. Etudes stratégiques et planification', 'Pourcentage d’atteinte des objectifs fixés', 26, 0, '2019-10-04 21:34:25', 0),
(26, 'A33', 'IV.3. Gestion financière et budgétaire', 'Taux d’exécution financière et physique ', 26, 0, '2019-10-04 21:35:47', 0),
(27, 'A34', 'IV.4. Développement du système d’information statistique', 'Annuaire statistique produit annuellement ', 26, 0, '2019-10-04 21:36:24', 0),
(28, 'A35', 'IV.5. Amélioration du cadre de travail', 'Proportion de personnels disposant d’un poste de\ntravail fixé', 26, 0, '2019-10-04 21:37:12', 0),
(29, 'A36', 'IV.6. Développement des ressources humaines', 'Nombre de personnels qualifiés, promus, recrutés et/ou recyclés par an.  ', 26, 0, '2019-10-04 21:37:56', 0),
(30, 'A37', 'IV.7. Développement des TIC', 'Taux de mise en œuvre du schéma directeur\ninformatique', 26, 0, '2019-10-04 21:38:34', 0),
(31, 'A37', 'IV.8. Contrôle et audit interne', 'Nombre de rapports d’évaluation produits par an ', 26, 0, '2019-10-04 21:39:28', 0),
(32, 'A38', 'IV.9. Conseil juridique au MINESUP', '-	Nombre d’actes juridiques signés ;\n-	Nombre d’Affaires défendues par an\n', 26, 0, '2019-10-04 21:40:53', 0),
(33, 'A38', 'IV.10. Communication et relations publique', '-	Nombre d’activités ayant fait l’objet d’une\ncouverture médiatique ;\n-	 Nombre de documents et textes traduit dans les deux langues officielles\n', 26, 0, '2019-10-04 21:41:31', 0),
(34, 'A39', 'IV.11. Gestion des ressources documentaire', 'Proportion de services disposant d’un système d’archivage fonctionnel', 26, 0, '2019-10-04 21:42:12', 0);

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `id_activite` int(11) NOT NULL,
  `code_activite` varchar(20) NOT NULL,
  `denomination_activite` text NOT NULL,
  `descriptif_activite` longtext,
  `id_indicateur` int(11) DEFAULT NULL,
  `id_action` int(11) NOT NULL,
  `date_activite` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `statutj_activite` int(11) NOT NULL DEFAULT '0',
  `evolutionj_activite` int(11) NOT NULL DEFAULT '0',
  `commentairej_activite` text,
  `statutd_activite` int(11) NOT NULL DEFAULT '0',
  `evolutiond_activite` int(11) NOT NULL DEFAULT '0',
  `commentaired_activite` text,
  `resultatj_activite` text NOT NULL,
  `resultatd_activite` text NOT NULL,
  `mois_realisation` int(11) NOT NULL DEFAULT '0',
  `archive` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`id_activite`, `code_activite`, `denomination_activite`, `descriptif_activite`, `id_indicateur`, `id_action`, `date_activite`, `statutj_activite`, `evolutionj_activite`, `commentairej_activite`, `statutd_activite`, `evolutiond_activite`, `commentaired_activite`, `resultatj_activite`, `resultatd_activite`, `mois_realisation`, `archive`) VALUES
(17, 'ACT001', 'Construction et équipement de la HTTC de l\'Université de Bamenda : Finalisation des travaux d\'aménagement des VRD et acquisition des équipements de laboratoires', '', 0, 9, '2019-09-14 15:05:04', 1, 0, '', 0, 0, '', 'Procédures de réattribution du marché bouclées', 'Procédures de réattribution du marché bouclées', 1, 0),
(18, 'ACT002', 'Construction et équipement  de l’ENSET de l’UY 1 à Ebolowa : Travaux de Construction d\'un bloc pédagogique de l\'ENSET', NULL, NULL, 9, '2019-09-14 23:00:13', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de construction de la première phase portés à 100%', 10, 0),
(19, 'ACT003', 'Construction de l’ENS de l’université de Maroua : Aménagement des VRD et Acquisition des équipements mobiliers et fixes', NULL, NULL, 9, '2019-09-14 23:02:14', 0, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Equipements livrés', 0, 0),
(20, 'ACT004', 'Réhabilitation et équipements de l’ENSET de l’université de Douala : Acquisition des équipements de laboratoires', NULL, NULL, 9, '2019-09-14 23:03:13', 0, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Equipements livrés', 0, 0),
(21, 'ACT005', 'Réhabilitation et équipement de l\'ENS de UY1 : Acquisition des équipements de laboratoires et ateliers', NULL, NULL, 9, '2019-09-14 23:05:32', 2, 10, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Equipements livrés', 7, 0),
(22, 'ACT011', 'Construction et équipement de la Faculty of Health Sciences de l\'Université de Buea : Equipement de laboratoires et ateliers', NULL, NULL, 10, '2019-09-14 23:18:17', 0, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'denomination', 0, 0),
(23, 'ACT012', 'Constructions et équipements de la Faculty of Health Sciences de l\'Université de Bamenda : Travaux de Construction d\'un bloc administratif et pédagogique', NULL, NULL, 10, '2019-09-14 23:19:34', 1, 0, NULL, 0, 0, NULL, 'Travaux de construction portés à 10%', 'Travaux de construction portés à 50%', 5, 0),
(24, 'ACT013', 'Réhabilitation, extension et équipements de la FMSB de Yaoundé I : Acquisition des équipements de laboratoires', NULL, NULL, 10, '2019-09-14 23:20:29', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Equipements livrés', 7, 0),
(25, 'ACT014', 'Construction et équipement de la Faculté de médecine et des sciences pharmaceutique de l\'Université de Douala : Acquisition des équipements de laboratoires', NULL, NULL, 10, '2019-09-14 23:21:11', 0, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Equipements livrés', 0, 0),
(26, 'ACT015', 'Construction  et équipement de la Faculté de Médecine et des Sciences Pharmaceutiques de l\'Université de Dschang : Etudes préalables pour la construction de la FMSP', NULL, NULL, 10, '2019-09-14 23:22:04', 2, 20, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Rapport d’étude livré', 5, 0),
(27, 'ACT016', 'Etudes, Travaux et Equipement de l’ESMV de l\'Université de Ngaoundéré : Travaux de Construction de l’Amphi 500', NULL, NULL, 10, '2019-09-14 23:23:17', 0, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de la première phase portés à 100%', 0, 0),
(28, 'ACT021', 'Construction et équipement de la  Faculty of Engineering and Technology (FET) – Buea : Phase 2 des travaux de construction d\'un bloc pédagogique et administratif', NULL, NULL, 11, '2019-09-14 23:24:23', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de la deuxième phase portés à 30%', 10, 0),
(29, 'ACT022', 'Construction et équipement de l\'Ecole de Géologie et d\'Exploitation Minière  (EGEM) de l\'Université de Ngaoundéré : Travaux de construction d\'un bloc administratif combiné', NULL, NULL, 11, '2019-09-14 23:25:03', 2, 30, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de la première phase portés à 100%', 3, 0),
(30, 'ACT023', 'Constructions et équipements de la Faculté de Génie Industriel de l’université de Douala : Acquisition des équipements de laboratoires', NULL, NULL, 11, '2019-09-14 23:26:05', 0, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Equipements livrés', 0, 0),
(31, 'ACT024', 'Construction et équipements de la Faculté des des Mines et des Industries Pétrolières de l\'Université de Maroua : Etudes préalables pour la de construction', NULL, NULL, 11, '2019-09-14 23:26:50', 0, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Rapport d’étude livré', 0, 0),
(32, 'ACT025', 'Réhabilitation et équipements de l’IUT-FV de l’université de Dschang : Travaux de Construction d\'un bloc pédagogique', NULL, NULL, 11, '2019-09-14 23:27:39', 2, 40, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de la première phase portés à 100%', 8, 0),
(33, 'ACT026', 'Constructions et équipements de l’IUT de l\'université de Douala : Constructions d\'un bloc pédagogique de 06 salles de classes, d’un Amphi  et Acquisition des équipements de laboratoires', NULL, NULL, 11, '2019-09-14 23:30:51', 2, 45, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées et travaux porté à 30%', 'Travaux de construction portés à 100%', 4, 0),
(34, 'ACT027', 'Construction  et équipement du National Higher Polytechnic\nInstitute  de l\'université de Bamenda : Travaux de Construction d\'un bloc administratif et pédagogique à la NAHPI.\n', NULL, NULL, 11, '2019-09-14 23:31:33', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de la première phase portés à 100%', 4, 0),
(35, 'ACT028', 'Construction et équipement de la FAVM de l\'Université de Buea : Travaux de construction d\'un bloc pédagogique et administratif', NULL, NULL, 11, '2019-09-14 23:32:30', 0, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de la première phase portés à 30%', 0, 0),
(36, 'ACT031', 'Construction de l’ESSTIC de l’Université de Yaoundé 2 : Travaux de réhabilitation de l\'ESSTIC', NULL, NULL, 12, '2019-09-14 23:41:12', 2, 20, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de réhabilitions portés à 100%', 11, 0),
(37, 'ACT032', 'Construction and equipment of HICM of University of Bamenda : Travaux de construction du bloc administratif et pédagogique ', NULL, NULL, 12, '2019-09-14 23:41:50', 0, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de la première phase portés à 30%', 0, 0),
(38, 'ACT033', 'Réhabilitation et équipement de l\'ESSEC de l\'Université de Douala : Réhabilitation du mobilier et des équipements ', NULL, NULL, 12, '2019-09-14 23:42:50', 2, 45, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de construction portés à 100%', 7, 0),
(39, 'ACT041', 'Réhabilitation, extension et équipement de la FASA de l’université de Dschang : Travaux de réhabilitation du Centre d\'enseignement à distance', NULL, NULL, 13, '2019-09-14 23:43:25', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de réhabilitation portés à 100%', 8, 0),
(40, 'ACT042', 'Travaux  de construction et d\'équipement de l’Institut des Sciences Halieutiques de Yabassi : Travaux de construction d\'un bloc administratif et Achèvement de constructions du bloc pédagogique de 1200 places', NULL, NULL, 13, '2019-09-14 23:44:15', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de construction portés à 100%', 2, 0),
(41, 'ACT051', 'Construction et équipement de l\' ASTI de l’université de Buea : Construction des VRD et acquisition des équipements mobiliers et fixes', NULL, NULL, 14, '2019-09-14 23:45:06', 1, 0, NULL, 0, 0, NULL, 'Travaux de la deuxième phase portés à 90%', 'Travaux de la deuxième phase portés à 100%', 5, 0),
(42, 'ACT052', 'Construction  et équipement de l’Institut des Beaux Arts de Foumban université de Dschang : Travaux de construction de l\'Amphi 500', NULL, NULL, 14, '2019-09-14 23:46:03', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Travaux de construction portés à ', 5, 0),
(43, 'ACT053', 'Construction  et équipement de l’Institut des Beaux Arts de Nkongsamba université de Douala : Réhabilitation des locaux et construction d\'un bâtiment administratif et pédagogique', NULL, NULL, 14, '2019-09-14 23:46:42', 1, 0, NULL, 0, 0, NULL, 'Travaux de réhabilitation portés à 80%', 'Travaux de réhabilitation portés à 100%', 2, 0),
(44, 'ACT054', 'Extension des infrastructures de l’IRIC : Acquisition des équipements mobiliers et fixes', NULL, NULL, 14, '2019-09-14 23:47:30', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Equipements livrés', 1, 0),
(45, 'ACT061', 'Etudes et réformes institutionnelles du PRO-ACTP : Préparation et tenue du Comité de Pilotage du PRO ACTP', NULL, NULL, 15, '2019-09-14 23:48:06', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Rapport d’Etude réceptionné', 3, 0),
(46, 'ACT062', 'Implémentation des programmes harmonisés de la composante normale', NULL, NULL, 15, '2019-09-14 23:48:41', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Rapport d’Etude réceptionné', 5, 0),
(47, 'ACT063', 'Etude du système national d\'accréditation dans les Ecoles d\'ingénieur', NULL, NULL, 15, '2019-09-14 23:49:24', 1, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Rapport d’Etude réceptionné', 8, 0),
(48, 'ACT064', 'Cadrage juridique de la professionnalisation de l\'enseignement universitaire', NULL, NULL, 15, '2019-09-14 23:50:01', 0, 0, NULL, 0, 0, NULL, 'Procédures d’attribution bouclées', 'Rapport d’Etude réceptionné', 0, 0),
(49, 'ACT101', 'Adaptation des programmes d\'enseignement au développement économique : Elaboration et validation des programmes d\'enseignement en nutrition', NULL, NULL, 16, '2019-10-05 18:40:09', 1, 0, NULL, 0, 0, NULL, 'Programmes des niveaux Bac  2 et Bac  3 élaborés', 'Programmes es cycles licence et master en nutrition élaborés et validés', 5, 0),
(50, 'ACT102', 'Adaptation des programmes d\'enseignement au développement économique : mise en œuvre du cadre national de qualification de l’enseignement supérieur', NULL, NULL, 16, '2019-10-05 18:41:29', 1, 0, NULL, 0, 0, NULL, 'Tenue d’un séminaire sur l’élaboration de l’offre de formation des universités d’Etat', 'Organisation d’un séminaire de validation du répertoire des offres de formations', 8, 0),
(51, 'ACT103', 'Assises nationales de validation des programmes universitaires : Organisation des assises des programmes des filières professionnelles des facultés classiques', NULL, NULL, 16, '2019-10-05 18:42:17', 1, 0, NULL, 0, 0, NULL, 'Tenue d’un séminaire de validation et d’homologation du fichier des filières professionnelles des Facultés classiques', 'Edition d’un répertoire des filières professionnelles existantes dans les Facultés classiques', 9, 0),
(52, 'ACT104', 'Homologation et habilitation des filières professionnelles des facultés classiques : Finalisation du processus de modernisation et de professionnalisation des programmes des établissements facultaires classiques', NULL, NULL, 16, '2019-10-05 18:43:10', 1, 0, NULL, 0, 0, NULL, 'Tenue d’un séminaire de professionnalisation des programmes des établissements facultaires classiques', 'Organisation du séminaire de cadrage des programmes des filières professionnelles des établissements facultaires classiques', 1, 0),
(53, 'ACT105', 'Elaboration et révision des textes régissant l\'Enseignement Supérieur Privé : Elaboration du projet de texte sur les classes préparatoires', NULL, NULL, 16, '2019-10-05 18:43:57', 0, 0, NULL, 0, 0, NULL, 'Finalisation de l’étude sur les classes préparatoires', 'Textes signés et publiés', 0, 0),
(54, 'ACT106', 'Création, suivi  et contrôles des activités des  IPES : Actualisation et publication du répertoire des IPES\n', NULL, NULL, 16, '2019-10-05 18:44:55', 0, 0, NULL, 0, 0, NULL, 'Travaux préparatoires de la 24e CNESP', 'Tenue de la 24e CNESP', 0, 0),
(55, 'ACT111', 'Construction of Faculty of Law and Political Sciences of the University of Bamenda : Etude architecturale et d\'ingénierie pour la construction des Facultés de Droit et des Sciences Politiques de l’Université de Bamenda', NULL, NULL, 17, '2019-10-05 18:46:50', 1, 0, NULL, 0, 0, NULL, 'Début des études', 'Etudes disponibles', 6, 0),
(56, 'ACT112', 'Modernisation des infrastructures et équipements de l\'Université de Buéa : Equipement des amphithéâtres de la Faculté de Sciences', NULL, NULL, 17, '2019-10-05 18:48:20', 1, 0, NULL, 0, 0, NULL, '-	DAO prêt ;\n-	Publication de l’Appel d’Offre ;\n-	Marché attribué\n', '-	Marché exécuté, livré et réceptionné\n-	PV de la réception provisoire disponible\n', 4, 0),
(57, 'ACT113', 'Modernisation des infrastructures et équipements de l\'Université de Douala : Achèvement des constructions d\'un bloc pédagogique de R 3 et travaux de construction d\'un bâtiment R 2 devant servir de salles de cours aux filières professionnelles au campus II', NULL, NULL, 17, '2019-10-05 18:49:52', 1, 0, NULL, 0, 0, NULL, '-	R 3-1 : Bâtiment achevé\n-	Marché des équipements attribués\nR 2 : Bâtiment couvert (charpente   toiture)', 'Bâtiment équipé pour la tranche ferme\nPV de réception provisoire  des équipements disponible\nBâtiment achevé', 2, 0),
(58, 'ACT114', 'Modernisation des infrastructures et équipements de l\'Université de Dschang : Travaux de constructions de deux blocs pédagogiques à la FLSH et la FSEG', NULL, NULL, 17, '2019-10-05 18:51:04', 1, 0, NULL, 0, 0, NULL, '-	Fondation du bloc pédagogique R 1 de la FSEG achevée\n-	marché pour l’élévation du RDC lancé\n-	Fondation du bloc pédagogique de la  FLSH achevé\n-	marché pour l’élévation du RDC lancé\n', 'Fin de des travaux de la fondation et de l’élévation du RDC de la FSEG\nFin de des travaux de la fondation et de l’élévation du RDC et du 1er étage de la FLSH', 11, 0),
(59, 'ACT115', 'Modernisation des infrastructures et équipements de l\'Université de Yaoundé 2 : Réhabilitation des bâtiments administratifs et des amphis (500, 700,1000, 1001,1500) et des salles de cours (NB1 à NB12', NULL, NULL, 17, '2019-10-05 18:51:56', 1, 0, NULL, 0, 0, NULL, 'Marchés signés', '-	Travaux exécutés à 100%\n-	Réception des travaux effectuées\n', 7, 0),
(60, 'ACT121', 'Opérationnalisation de l\'observatoire des Métiers : Tenue des sessions du Comité de pilotage de l\'Observatoire des Métiers (OMDES) et organisation du Forum Universités-Entreprises', NULL, NULL, 18, '2019-10-05 18:54:54', 1, 0, NULL, 0, 0, NULL, '-	Meilleur fonctionnement des activités d’orientation dans l’Enseignement Supérieur ;\n-	Elaboration d’un cahier de charges des Conseillers d’Orientation dans l’Enseignement Supérieur \n-	Harmoniser les activités d’orientation dans les Universités\n-	Développer une plate-forme numérique\n', '-	Tenue des 2èmes assises de l’Orientation au Cameroun ;\n-	Plate-forme numérique réalisée  \n', 9, 0),
(61, 'ACT122', 'Organisation du Salon de l\'Orientation Académique et Professionnelle et Participation aux fora (Salon de l\'action gouvernementale, Promote et FETUC)', NULL, NULL, 18, '2019-10-05 18:56:29', 1, 0, NULL, 0, 0, NULL, '-	Sensibilisation des étudiants et élèves du secondaire sur le choix des études ;\n-	Intégration socio-économique des diplômés universitaires ;\n-	Meilleure information sur le marché de l’emploi ;\n-	Meilleure lisibilité du système d’Enseignement Supérieur\n', '-	Salon de l’Orientation Académique et Professionnelle tenu ;\n-	Rapport du SOAP disponible\n', 1, 0),
(62, 'ACT123', 'Organisation du FETUC', NULL, NULL, 18, '2019-10-05 18:57:13', 0, 0, NULL, 1, 0, NULL, '-	TDR validés et signés\n-	FETUC tenu\n', 'Actes du FETUC produits et disponibles', 0, 0),
(63, 'ACT124', 'Renforcement des capacités des services en charge de l\'accueil et de l\'Orientation : Tenue des Assises du Comité d\'appui à la mobilité des enseignants et étudiants', NULL, NULL, 18, '2019-10-05 18:57:58', 0, 0, NULL, 0, 0, NULL, '-	TDR et Décisions portant création, organisation et fonctionnement du Comité signés ;\n-	 Décisions portant constatation, de la composition du Comité signés ;\n-	Comité tenu\n', '-	Rapports\n-	Décision de paiement signée et disponible\n', 0, 0),
(64, 'ACT125', 'Revue des services en charge de l\'orientation : Suivi des appuis à la mobilité des étudiants et des enseignants', NULL, NULL, 18, '2019-10-05 18:58:51', 0, 0, NULL, 1, 0, NULL, 'Missions de suivi des appuis effectuées dans les Universités d’Etat (UDla/UDs/UN/UMa) et de préparation de l’édition 2019', 'Missions de suivi effectuées dans les Universités d’Etat (UYII/UYI/UN/UMa)', 0, 0),
(65, 'ACT126', 'Orientation Universitaire et Professionnelle : Réactualisation et traduction du guide des études supérieures au Cameroun', NULL, NULL, 18, '2019-10-05 18:59:43', 0, 0, NULL, 0, 0, NULL, 'Cabinet de Consultants sélectionné pour effectuer l’étude', 'Guide des études supérieures au Cameroun  édité', 0, 0),
(66, 'ACT131', 'Suivi-évaluation des projets du programme ', NULL, NULL, 19, '2019-10-05 19:01:30', 1, 0, NULL, 0, 0, NULL, 'Missions effectuées dans les Universités d’Etat ', '-	Missions effectuées dans les Universités d’Etat ;\n\n-	Recueil des formations professionnelles dans les établissements facultaires classiques  disponible ; \n\n-	Document du Programme rédigé\n', 3, 0),
(67, 'ACT201', 'Elaboration du Plan Directeur de la Recherche Universitaire : Etat des lieux des structures de recherche (Finalisation de l\'inventaire) et Edition du document final', NULL, NULL, 20, '2019-10-05 20:21:28', 0, 0, NULL, 0, 0, NULL, '-	Données collectées ;\n-	Fiche de collecte des données\n', '-	Rapport général rédigé ;\n-	Document en version numérique et physique\n', 0, 0),
(68, 'ACT211', 'Elaboration du fichier national des Thèses et Mémoires : Analyse des données et édition du fichier physique des Thèses et Mémoires', NULL, NULL, 21, '2019-10-05 20:23:45', 1, 0, NULL, 0, 0, NULL, '-	Données collectées ainsi que le draft du document issu de cette collecte validé par toutes les parties prenantes ;\n\n-	Rapport de l’atelier de validation du répertoire des thèses et mémoires\n', '-	Un document de fichier est validé ;\n\n-	il y a une meilleure maîtrise de la production des thèses et mémoires dans les universités d’Etat ;\n\n-	Document physique disponible\n', 8, 0),
(69, 'ACT221', 'Construction du siège du Rectorat de l\'Université Panafricaine : Travaux de construction du siège du Rectorat', NULL, NULL, 22, '2019-10-05 20:25:12', 0, 0, NULL, 0, 0, NULL, 'archés pluriannuels attribués pour :\n-	Travaux de construction ;\n-	Maîtrise d’œuvre ;\n-	Contrôle technique', 'Travaux de construction, maîtrise d’œuvre, contrôle technique de la phase 1 et relevant de la tranche ferme réalisés', 0, 0),
(70, 'ACT222', 'Université Inter-Etats  Cameoun-Congo à Sangmélima : démarrage effectif des cours', NULL, NULL, 22, '2019-10-05 20:26:17', 0, 0, NULL, 0, 0, NULL, 'Préparatifs diplomatiques, juridiques et infrastructurels achevés', 'Les enseignements de la première formation ont démarré à Sangmélima', 0, 0),
(71, 'ACT223', 'Promotion de la coopération : Participation aux commissions mixtes, Mise à jour du recueil des accords et convention de la coopération universitaires et production de la Note de Conjoncture.', NULL, NULL, 22, '2019-10-05 20:27:38', 0, 0, NULL, 0, 0, NULL, '-	Données collectées\n-  Fiche de présence et compte- rendu de réunions\n-  Rapport de missions\n', 'Recueil des accords disponible ;\n- Note de conjoncture disponible ;\n- Rapports des Commissions mixtes disponibles\n- Documents en version numérique et physique\n', 0, 0),
(72, 'ACT231', 'Mise en place des activités de gouvernance du programme', NULL, NULL, 23, '2019-10-05 20:30:17', 0, 0, NULL, 0, 0, NULL, 'Données collectées pour élaboration des rapports\n- appropriation des mécanismes de gouvernance de la recherche par les Acteurs de la recherche \n', 'Données collectées pour produire 03 rapports (2 trimestriels et 1 général)               ', 0, 0),
(73, 'ACT232', 'Vulgarisation du document du programme', NULL, NULL, 23, '2019-10-05 20:31:27', 0, 0, NULL, 0, 0, NULL, 'Projet de document du programme validé par les experts.', 'Document du programme validé et présenté lors d’une cérémonie officielle', 0, 0),
(74, 'ACT301', 'Accueil et information des usagers : Installation du pool d’accueil, Adressage des portes, Fabrication et installation des oriflammes', NULL, NULL, 24, '2019-10-05 20:34:42', 1, 0, NULL, 0, 0, NULL, '-	Pool d’accueil installé, couloirs du MINESUP désengorgés ;\n-	Collecte des données en vue de l’adressage des portes effectuée\n-	Maquettes pour la fabrication des oriflammes conçues et transmises à la hiérarchie pour validation\n', '-	Meilleure connaissance des structures par les usagers ;\n\n-	Plaques d’adressage installées ;\n\n-	Oriflammes finalisés et installés\n', 6, 0),
(75, 'ACT302', 'Promotion de la solidarité universitaire : Aides et Assistance aux personnels de l\'Enseignement Supérieur et des Universités ', NULL, NULL, 24, '2019-10-05 20:36:04', 1, 0, NULL, 0, 0, NULL, '-	Organisation d’un séminaire MINESUP/AXA visant l’augmentation de la couverture médicale des membres de la Communauté Universitaire\n-	Révision et adoption de la convention MINESUP/AXA \n', '-	Augmentation du nombre d’enseignants ayant souscrits à la police d’assurance avec AXA (1500)\n-	Prise en charge médicale des enseignements du supérieur\n-	Modification de la convention entre les différentes parties MINESUP/AXA\n', 6, 0),
(76, 'ACT303', 'Gestion des crises et médiation dans les Universités : Organisation des réunions pour l\'amélioration du climat social, sensibilisation dans les établissements et mise en place des équipes de veille pour le renforcement de la capacité de résolution des conflits au sein des campus.', NULL, NULL, 24, '2019-10-05 20:37:51', 1, 0, NULL, 0, 0, NULL, '-	Organisation des rencontres avec les partenaires au conflit\n-	Prise en charge des déplacements et/ou séjours des Leaders syndicaux, des Enseignant, des Personnels d’Appui et des Etudiants\n-	Suivi de l’application du décret N°2014/2217/PM du 24/07/2014 portant revalorisation du SMIG  à 36 270 FCFA\n-	Elaboration des textes d’application du décret N°2011/119 du 18 mai 2011 fixant les dispositions communes applicables aux Personnels d’Appui des UE, relativement au profil de carrière du Personnel d’Appui\n-	Amélioration et gestion du climat social dans les UE\n-	Création des Centres d’écoute dans les DCOU des UE\n-	Mise sur pied d’une équipe de veille permanente au sein de la DPDSU\n', 'Campus pacifiés', 8, 0),
(77, 'ACT304', 'Œuvres Universitaires : Octroi des compléments et arriérés de bourses et Allocation d\'aides individuelles et collectives aux étudiants camerounais', NULL, NULL, 24, '2019-10-05 20:40:09', 0, 0, NULL, 0, 0, NULL, '------', '------', 0, 0),
(78, 'ACT305', 'Organisation des emplois à temps partiel au profit des étudiants des universités d\'Etat : Work Study Program et Stages Pratiques de Vacances aux Etudiants.', NULL, NULL, 24, '2019-10-05 20:41:28', 1, 0, NULL, 0, 0, NULL, '-------', '------', 2, 0),
(79, 'ACT311', 'Elaboration des documents de prospective : Finalisation de la note de conjoncture 2018 : « les nouvelles offres de formation dan les Universités d’Etat »', NULL, NULL, 25, '2019-10-05 20:43:04', 0, 0, NULL, 0, 0, NULL, 'Draft 0 rédigé', 'Note de conjoncture édité et disponible', 0, 0),
(80, 'ACT312', 'Elaboration du système d’information universitaire du MINESUP (Identification des besoins et définition de l\'architecture du système d\'information statistique)', NULL, NULL, 25, '2019-10-05 20:44:07', 0, 0, NULL, 0, 0, NULL, '-	TDR du séminaire \n-	Questionnaires,\n-	Guide d’entretien\n-	Rapport de missions\n', 'Séminaire organisé, rapport disponible ', 0, 0),
(81, 'ACT313', 'Actualisation de la carte Universitaire.', NULL, NULL, 25, '2019-10-05 20:45:52', 0, 0, NULL, 0, 0, NULL, 'Rapport des missions disponibles.', 'Rapport final des résultats de l’étude disponible.', 0, 0),
(82, '', '', NULL, NULL, 0, '2019-10-05 20:46:05', 0, 0, NULL, 0, 0, NULL, '', '', 0, 0),
(83, '', '', NULL, NULL, 0, '2019-10-05 20:46:05', 0, 0, NULL, 0, 0, NULL, '', '', 0, 0),
(84, '', '', NULL, NULL, 0, '2019-10-05 20:46:21', 0, 0, NULL, 0, 0, NULL, '', '', 0, 0),
(85, 'ACT321', 'Suivi et exécution du budget (Tenues de la Commission  interministérielle de Suivi-évaluation du BIP (Revue trimestrielle du Budget du MINESUP)', NULL, NULL, 26, '2019-10-05 20:48:36', 1, 0, NULL, 0, 0, NULL, 'Organisation de la première session du BIP', 'Tenue des deux sessions programmées au moins', 4, 0),
(86, 'ACT322', 'Inventaire des biens mobiliers et immobiliers du MINESUP (Finalisation et édition du document du premier inventaire des équipements universitaires)', NULL, NULL, 26, '2019-10-05 20:49:34', 1, 0, NULL, 0, 0, NULL, 'Dépouillement effectif des données recueillies', 'Inventaire des biens mobiliers et immobiliers du MINESUP disponible', 4, 0),
(87, 'ACT323', 'Préparation et suivi de l\'exécution du budget (Élaboration du Programme d\'actions prioritaires (PAP) ; Élaboration du Cadre de Dépenses à Moyen Terme (CDMT) ; Elaboration du Rapport Annuel de Performance (RAP))', NULL, NULL, 26, '2019-10-05 20:50:24', 1, 0, NULL, 0, 0, NULL, '--------', '--------', 5, 0),
(88, 'ACT331', 'Elaboration et traitement des statistiques : Production et diffusion de l’annuaire statistique 2017/2018 ', NULL, NULL, 27, '2019-10-05 20:52:11', 1, 0, NULL, 0, 0, NULL, '-	Missions de collecte des données effectuées dans les Universités\n-	Rapport disponible.\n', 'Annuaire  statistique 2017/2018 disponible', 2, 0),
(89, 'ACT332', 'Finalisation et diffusion  de la  nomenclature des formations dans les secteurs prioritaires du DSCE.', NULL, NULL, 27, '2019-10-05 20:53:42', 0, 0, NULL, 0, 0, NULL, 'Draft 0 rédigé et en relecture', 'Documentation sur la nomenclature des formations dans les secteurs prioritaires du DSCE disponible.', 0, 0),
(90, 'ACT341', 'Œuvres Universitaires (Organisation des Jeux universitaires et UNIFAC)', NULL, NULL, 28, '2019-10-05 20:54:55', 0, 0, NULL, 0, 0, NULL, '--------', '---------', 0, 0),
(91, 'ACT342', 'Organisation du Génie et Talents de l\'Etudiant Camerounais (GETEC)', NULL, NULL, 28, '2019-10-05 20:55:46', 0, 0, NULL, 0, 0, NULL, '---------', '-------', 0, 0),
(92, 'ACT343', 'Prise en charge médicale et psycho-sociale des étudiants (Elaboration et mise en œuvre d\'une stratégie sectorielle de lutte contre la culture, le tabac et la consommation du canabis en milieu universitaire)', NULL, NULL, 28, '2019-10-05 20:56:38', 0, 0, NULL, 0, 0, NULL, '---------', '---------', 0, 0),
(93, 'ACT344', 'Développement des ressources matérielles dans les Services Centraux du MINESUP (Réhabilitation de la salle de réunions de la DAOU ; Acquisition des équipements informatiques des services centraux ; Acquisition des mobiliers et autres logistiques des services centraux)', NULL, NULL, 28, '2019-10-05 20:58:18', 0, 0, NULL, 0, 0, NULL, 'Marchés attribués pour :\n-	La réhabilitation de la salle de réunions de la DAOU\n-	L’acquisition des équipements informatiques des Services Centraux\n-	  L’acquisition des mobiliers et autres logistiques des Services Centraux\n-	L’acquisition des véhicules\n', 'Salle de réunions de la DAOU réhabilitée\n-	Equipements informatiques, mobiliers, véhicules et autres logistiques réceptionnés et redistribués sur la base des besoins exprimés et des moyens disponibles\n', 0, 0),
(94, 'ACT351', 'Amélioration de la prise en charge socio-sanitaire des personnels (Ré-ouverture de l\'infirmirie ; Dépistage du cancer du sein de l\'hypertension artérielle et du diabète)', NULL, NULL, 29, '2019-10-05 20:59:09', 1, 0, NULL, 0, 0, NULL, '-	Contrat avec une infirmière élaboré\n-	Dépistage effectué\n', 'Responsable de l’infirmerie recruté et infirmerie fonctionnelle', 7, 0),
(95, 'ACT352', 'Développement des actions sociales (Formation en secourisme)', NULL, NULL, 29, '2019-10-05 20:59:55', 1, 0, NULL, 0, 0, NULL, 'TDR élaborés', 'Formation effectuée', 6, 0),
(96, 'ACT353', 'Extension du SIGIPES dans les Universités d\'Etat (Renforcement des capacités des administrateurs et utilisateurs ; Missions de suivi-Evaluation des sites SIGIPES des huit universités d\'Etat)', NULL, NULL, 29, '2019-10-05 21:00:52', 1, 0, NULL, 0, 0, NULL, '-	TDR élaborés ;\n-	  Constitution des équipes et programmation des missions dans les huit universités\n', 'Missions effectuées dans les huit sites SIGIPES des Universités ', 9, 0),
(97, 'ACT354', 'Gestion et suivi de la carrière  des personnels enseignant (Organisation annuelle de deux sessions du CCIU', NULL, NULL, 29, '2019-10-05 21:01:45', 1, 0, NULL, 0, 0, NULL, 'Première session du CCIU tenue', 'Deuxième session du CCIU tenue', 4, 0),
(98, 'ACT355', 'Recrutement spécial des enseignants titulaires du Doctorat et/ou du PhD dans les Universités d’Etat (phase1 : processus de recrutement de 1000 enseignants en 2019)', NULL, NULL, 29, '2019-10-05 21:02:35', 0, 0, NULL, 0, 0, NULL, 'Publication de la liste des candidats définitivement retenus (1000 enseignants)', 'Enseignants effectivement affectés et exerçant dans leur poste de travail', 0, 0),
(99, 'ACT361', 'Conduite de l\'élaboration et suivi de la mise en œuvre du schéma directeur informatique', NULL, NULL, 30, '2019-10-05 21:03:39', 0, 0, NULL, 0, 0, NULL, 'Diagnostic fait', 'Scénari de solutions et plan d’informatisation élaborés ', 0, 0),
(100, 'ACT362', 'Réhabilitation des réseaux dans les campus principaux', NULL, NULL, 30, '2019-10-05 21:04:24', 0, 0, NULL, 0, 0, NULL, 'Réseaux réhabilités dans les Universités d’Etat', 'Réseaux réhabilités fonctionnels dans les Universités d’Etat', 0, 0),
(101, 'ACT363', 'Développement du système harmonisé de gestion  de l’Enseignement Supérieur du Cameroun', NULL, NULL, 30, '2019-10-05 21:05:16', 0, 0, NULL, 0, 0, NULL, 'Système réceptionné et déployé dans les Universités d’Etat', 'Système exploité dans les Universités d’Etat', 0, 0),
(102, 'ACT364', 'Projet E National Higher Education Network: Construction des Centres de Développement du Numérique Universitaire dans les Universités d’Etat et à l’UIECC à Sangmélima', NULL, NULL, 30, '2019-10-05 21:05:53', 1, 0, NULL, 0, 0, NULL, 'Cinq (05) livrés : MINESUP, Universités de Yaoundé I, Yaoundé II, Douala et Inter-Etats', 'Deux (02) nouveaux Centres réceptionnés', 1, 0),
(103, 'ACT365', 'Projet E National Higher Education Network : Parachèvement de l’opération de distribution des ordinateurs offerts par le Président de la République aux Etudiants', NULL, NULL, 30, '2019-10-05 21:06:45', 1, 0, NULL, 0, 0, NULL, 'Tous les ordinateurs stockés à la base navale distribués aux étudiants', 'La totalité des 500 000 ordinateurs du Don présidentiel livrés par la partie chinoise et distribués aux étudiants', 3, 0),
(104, 'ACT371', 'Contrôle et évaluation des activités des services (Evaluation de la gouvernance sociale, financière et administrative)', NULL, NULL, 31, '2019-10-05 21:08:19', 1, 0, NULL, 0, 0, NULL, 'Quatre (04) Universités  d’Etat (UDo, UN, UYII, UB) contrôlées et évaluées\nQuatre (04) Structures Centrales contrôlées et évaluées', 'Quarante (40) IPES contrôlés\nTrois (03) Services Culturels placés auprès des Ambassades contrôlés', 12, 0),
(105, 'ACT372', 'Mise en œuvre de la stratégie de lutte contre la corruption (Tenue des sessions d\'arbitrage des cas de corruption ; Missions d\'évaluation des antennes universitaires)', NULL, NULL, 31, '2019-10-05 21:08:58', 1, 0, NULL, 0, 0, NULL, 'Trois (03) documents de synthèse produits et édités au 1er semestre', 'Quatre (04) documents de synthèse et de Suivi des activités 2019 produits et édités au 2nd semestre', 1, 0),
(106, 'ACT373', 'Organisation des Contrôles et des audits académiques des universités et des IPES (Evaluation des filières courtes en santé (BTS, HND) ; Audits et inspection académiques des Universités et des IPES sous tutelles)', NULL, NULL, 31, '2019-10-05 21:09:45', 0, 0, NULL, 0, 0, NULL, 'Deux missions biennales d’évaluation thématiques achevées', 'TDR des missions d’inspection académiques de la biennale 2019-2020 élaborés', 0, 0),
(107, 'ACT374', 'Dissémination des rapports d’audits et Renforcement des capacités des acteurs à la gouvernance académique de l’Enseignement Supérieur', NULL, NULL, 31, '2019-10-05 21:10:47', 0, 0, NULL, 0, 0, NULL, 'Contenu et matériel de formation des responsables des IPES à la mise en œuvre des objectifs de développement de l’Enseignement Supérieur Privé à l’horizon 2025 (ODESP 2025) élaborés', '50 responsables des IPES formés à la mise en œuvre des objectifs de développement de l’Enseignement Supérieur privé à l’horizon 2025 (ODESP 2025)', 0, 0),
(108, 'ACT375', 'Evaluation et validation des cursus de formation (Tenue des assises du Comité d\'homologation des diplômes ; Tenue de quatre assises de la CNE', NULL, NULL, 31, '2019-10-05 21:11:54', 1, 0, NULL, 0, 0, NULL, 'Projet de décret instituant la Commission Nationale d’Homologation au PM ;\n-	Production des PV, listes, arrêté et extraits d’arrêté relatifs à la 91ème session de la CNE\n', '-	Projet de décret instituant la Commission Nationale d’Homologation au signé ;\n-	Production des PV, listes, arrêtés et extraits d’arrêtés relatifs à la 92ème, 93ème, 94ème session  de la CNE.\n', 4, 0),
(109, 'ACT376', 'Suivi des activités académiques (Organisation de 2 assises par an de la CCU et suivi des résolutions)', NULL, NULL, 31, '2019-10-05 21:12:27', 1, 0, NULL, 0, 0, NULL, 'Tenue des assises de  la Commission de Coordination Universitaire (CCU)\n- Descente sur le terrain relatif à l’ ‘état de l’exécution du calendrier académique.\n', 'Assises de la deuxième Commission de Coordination Universitaire (CCU) tenues', 3, 0),
(110, 'ACT377', 'Suivi des examens nationaux et gestion post-opératoire (Délivrance des parchemins (relevés de notes, attestations de réussite et des diplômes)', NULL, NULL, 31, '2019-10-05 21:14:07', 1, 0, NULL, 0, 0, NULL, '-	Production et délivrance des relevés de notes 2019 ;\n-	Production et délivrance des attestations de réussite 2019 ;\n-	Apurement progressif du passif  des diplômes des années antérieures à 2008\n', '-	Production et délivrance des relevés de notes 2019 ;\n-	Production et délivrance des attestations de réussite 2019 ;\n-	Finalisation du processus de confection des diplômes 2019 ;\n-	Apurement du passif des diplômes des années antérieures à 2008.\n', 9, 0),
(111, 'ACT378', 'Suivi de la diplômation dans les universités d\'Etat (Vérification des dossiers de diplômation et Authentification des diplômes)', NULL, NULL, 31, '2019-10-05 21:16:16', 0, 0, NULL, 0, 0, NULL, '-	Délivrance des parchemins dans toutes les universités d’Etat ;\n-	Désignation des points focaux pour l’authentification des diplômes dans les universités d’Etat ;\n-	Organisation de la Commission Technique ad-hoc chargée des opérations de délivrance des diplômes\n', '-	Rapport missions d’évaluation sur le terrain ;\n-	Rapports séminaire et atelier sur le processus de diplômation ;\n-	Référentiel pour l’évaluation du passif en matière de diplômation par Université d’Etat ;\n-	Compte-rendu des Assises de la Commission.\n', 0, 0),
(112, 'ACT379', 'Elaboration des normes académiques (Homologation des programmes d\'enseignement de la filière technologique et professionnelle ; Etat des lieux des normes spécifiques ; Elaboration des procédures d\'accréditation des filières professionnelles)', NULL, NULL, 31, '2019-10-05 21:17:50', 0, 0, NULL, 0, 0, NULL, '70% : recueil des normes universitaires spécifiques en matière de professionnalisation', '100% : recueil des normes universitaires spécifiques en matière de professionnalisation', 0, 0),
(113, 'ACT3710', 'Elaboration des référentiels de comparaison entre les systèmes universitaires (Production du cadre méthodologique et référentiels des formations à l\'étranger ; Production des indicateurs de comparabilité de performance des universités camerounaises)', NULL, NULL, 31, '2019-10-05 21:18:36', 0, 0, NULL, 0, 0, NULL, '00% : production de la cartographie des diplômes délivrés dans l’Enseignement supérieur camerounais', '100% : production de la cartographie des diplômes délivrés dans l’Enseignement supérieur camerounais', 0, 0),
(114, 'ACT3711', 'Gestion de l\'assurance qualité (Elaboration du référentiel et du cadre d\'application de la VAE et de l\'HDTP ; Séminaire d\'élaboration et validation d\'un plan stratégique de démarche qualité à l\'Enseignement Supérieur ; Mise en place des structures de démarche qualité)', NULL, NULL, 31, '2019-10-05 21:19:54', 0, 0, NULL, 0, 0, NULL, 'Tenue effective d’au moins une session des six groupes de travail\n70% : évaluation et classement des établissements d’enseignement supérieur\nRédaction de l’avant-projet de texte portant création de l’Agence Nationale d’Assurance Qualité ou des Commissions Nationales d’Accréditation et d’Assurance Qualité', '100% : niveau d’exécution des recommandations des différentes sessions\n100% : évaluation et classement des EES\nRelecture éventuelle des projets de textes', 0, 0),
(115, 'ACT3712', 'Gestion des examens et concours (Programmation des examens et concours ; Révision du manuel de procédures des examens nationaux)', NULL, NULL, 31, '2019-10-05 21:20:37', 0, 0, NULL, 0, 0, NULL, '90% des concours et examens nationaux lancés', '-	100% des textes d’ouverture des différents concours et examens nationaux élaborés\n-	100% des concours nationaux lancés\n', 0, 0),
(116, 'ACT3713', 'Gestion des formations médicales (Tenue des assises de la commission nationale de la formation médicale, pharmaceutique, odontostomatologique et vétérinaires ; Tenue de l\'examen national  de synthèse clinique et thérapeutique)', NULL, NULL, 31, '2019-10-05 21:22:36', 0, 0, NULL, 0, 0, NULL, '100% des examens et concours de la formation médicale lancés', '100% des examens et concours de la formation médicale lancés', 0, 0),
(117, 'ACT381', 'Elaboration, finalisation et mise en forme des actes juridiques (Révision du cadre juridique de l\'Enseignement Supérieur ; Edition et production 3000 exemplaires du Recueil de textes du MINESUP (2000 en français et 1000 en anglais) ; Relecture, finalisation et mise en forme des actes juridiques ;', NULL, NULL, 32, '2019-10-05 21:23:34', 0, 0, NULL, 0, 0, NULL, 'Appel d’offre élaboré (DAO)', '-	Exécution du marché,\n-	Recueil de textes disponibles\n', 0, 0),
(118, 'ACT382', 'Représentation et défense des intérêts du MINESUP devant les instances juridictionnelles (Production des mémoires en défense', NULL, NULL, 32, '2019-10-05 21:24:36', 0, 0, NULL, 0, 0, NULL, 'Mémoires en défense rédigés', 'Rapports et mémoires en défense des affaires défendues disponibles', 0, 0),
(119, 'ACT383', 'Vulgarisation des textes et gestion du contentieux (Etude et mise en forme des conventions et accords ; Encadrement juridique des Centres et Laboratoires de Recherche)', NULL, NULL, 32, '2019-10-05 21:25:20', 0, 0, NULL, 0, 0, NULL, 'Projets de décrets (ESSITC/IRIC) élaborés', 'Projets de décrets (ESSITC/IRIC) transmis aux services du PM', 0, 0),
(120, 'ACT384', 'Vulgarisation de la culture juridique (Production des supports de vulgarisation  de la culture juridique dans l\'Enseignement Supérieur)', NULL, NULL, 32, '2019-10-05 21:26:25', 0, 0, NULL, 0, 0, NULL, 'Préparation des séminaires', 'Séminaires organisés', 0, 0),
(121, 'ACT391', 'Mise en œuvre de la stratégie de la Communication\ngouvernementale au MINESUP (Rédaction et publication du journal SUP Info et d\'autres supports de communication ; Mise en place d\'une plateforme numérique du MINESUP sur les réseaux sociaux)\n', NULL, NULL, 33, '2019-10-05 21:32:23', 0, 0, NULL, 0, 0, NULL, '-	Publication de 15 oriflammes\n-	Conférences de presse\n-	Actualisation du site internet interactif\n-	Insertion des publiscopies dans Cameroon Tribune\n', 'Publication de tous les outils de communication institutionnelle annoncée : Objectif : embellie de l’image de l’institution', 0, 0),
(122, 'ACT392', 'Traduction des textes (Français et Anglais) et contrôle de la qualité des traductions courantes des documents', NULL, NULL, 33, '2019-10-05 21:33:14', 0, 0, NULL, 0, 0, NULL, '90% des textes sollicitant la traduction en Français et/ou en  Anglais traduits. Les 10% restants constituent la marge de manœuvre que nous nous octroyons pour les documents volumineux nécessitant un temps de travail conséquent', '90% des textes sollicitant la traduction en Français et/ou en  Anglais traduits. Les 10% restants constituent la marge de manœuvre que nous nous octroyons pour les documents volumineux nécessitant un temps de travail conséquent', 0, 0),
(123, 'ACT3101', 'Acquisition des ressources documentaires (Acquisition des documents et abonnements presses)', NULL, NULL, 34, '2019-10-05 21:35:31', 0, 0, NULL, 0, 0, NULL, 'Nouveaux ouvrages (50 à 60) disponibles au centre de documentation', 'Ouvrages disponibles', 0, 0),
(124, 'ACT3102', 'Acquisition et traitement des documents et des archives (Vulgarisation du plan de classement des archives)', NULL, NULL, 34, '2019-10-05 21:36:26', 1, 0, NULL, 0, 0, NULL, 'Plan de classement disponible dans les deux langues officielles (Français et Anglais)', 'Formation tenue avec les personnes en charge des archives dans les structures', 0, 0),
(125, 'ACT3103', 'Rédaction et actualisation des outils de gestion des archives (Elaboration et édition du calendrier de conservation et d\'élimination des archives).', NULL, NULL, 34, '2019-10-05 21:37:11', 1, 0, NULL, 0, 0, NULL, 'Comité de travail pour l’élaboration du calendrier de conservation et de versement des archives du Minesup mis sur pied', 'Calendrier de conservation et de versement disponible', 0, 0),
(126, 'ACT3104', 'Vulgarisation pour assimilation des outils de gestion des archives (Séminaire de formation des personnels impliqués dans la gestion des documents des universités)', NULL, NULL, 34, '2019-10-05 21:37:51', 1, 0, NULL, 0, 0, NULL, '-	Missions d’évaluation de la  gestion des archives dans les Universités  d’Etat effectuées ;\n\n-	Séminaire sur la tenue des archives dans les Université d’Etat en cours de préparation\n', '-	Etat des lieux sur la gestion des archives dans les Universités d’Etat et le MINESUP disponible ;\n\n-	Séminaire sur la tenue des archives avec les personnes en charge des archives dans les Universités d’Etat organisé \n', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `administration`
--

CREATE TABLE `administration` (
  `id_administration` int(11) NOT NULL,
  `code_administration` varchar(20) NOT NULL,
  `denomination_administration` varchar(200) NOT NULL,
  `descriptif_administration` longtext NOT NULL,
  `date_administration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `administration`
--

INSERT INTO `administration` (`id_administration`, `code_administration`, `denomination_administration`, `descriptif_administration`, `date_administration`) VALUES
(1, 'MINESUP', 'MINESUP', 'MINESUP', '2018-11-18 19:03:21'),
(2, 'MINFOPRA', 'MINFOPRA', 'MINFOPRA', '2018-11-18 19:03:21');

-- --------------------------------------------------------

--
-- Structure de la table `dietetique`
--

CREATE TABLE `dietetique` (
  `id_die` int(11) NOT NULL,
  `matricule` varchar(20) NOT NULL,
  `DIE10` varchar(20) NOT NULL,
  `DIE11` varchar(20) NOT NULL,
  `DIE12` varchar(20) NOT NULL,
  `DIE13` varchar(20) NOT NULL,
  `DIE14` varchar(20) NOT NULL,
  `DIE15` varchar(20) NOT NULL,
  `DIE16` varchar(20) NOT NULL,
  `DIE17` varchar(20) NOT NULL,
  `DIE18` varchar(20) NOT NULL,
  `DIE19` varchar(20) NOT NULL,
  `DIE20` varchar(20) NOT NULL,
  `DIE21` varchar(20) NOT NULL,
  `DIE22` varchar(20) NOT NULL,
  `DIE23` varchar(20) NOT NULL,
  `DIE24` varchar(20) NOT NULL,
  `total` float NOT NULL,
  `moyenne` float NOT NULL,
  `decision` varchar(20) NOT NULL,
  `observation` varchar(200) NOT NULL,
  `id_annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evolution_action`
--

CREATE TABLE `evolution_action` (
  `id_evolution_action` int(11) NOT NULL,
  `id_action` int(11) NOT NULL,
  `id_niveau_evolution` int(11) NOT NULL,
  `commentaire_evolution_action` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evolution_activite`
--

CREATE TABLE `evolution_activite` (
  `id_evolution_activite` int(11) NOT NULL,
  `id_activite` int(11) NOT NULL,
  `id_niveau_evolution` int(11) NOT NULL,
  `commentaire_evolution_activite` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evolution_programme`
--

CREATE TABLE `evolution_programme` (
  `id_evolution_programme` int(11) NOT NULL,
  `id_programme` int(11) NOT NULL,
  `id_niveau_evolution` int(11) NOT NULL,
  `commentaire_evolution_programme` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `indicateur`
--

CREATE TABLE `indicateur` (
  `id_indicateur` int(11) NOT NULL,
  `code_indicateur` varchar(20) NOT NULL,
  `denomination_indicateur` varchar(200) NOT NULL,
  `descriptif_indicateur` longtext NOT NULL,
  `valeur_indicateur` varchar(20) NOT NULL,
  `eval_mipar__indicateur` longtext NOT NULL,
  `date_indicateur` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `indicateur`
--

INSERT INTO `indicateur` (`id_indicateur`, `code_indicateur`, `denomination_indicateur`, `descriptif_indicateur`, `valeur_indicateur`, `eval_mipar__indicateur`, `date_indicateur`) VALUES
(3, 'INDIC3', 'INDIC3', 'INDIC3', '50', '10', '2019-06-22 06:27:20'),
(4, 'INDIC4', 'INDIC4', 'INDIC4', '50', '10', '2019-06-22 06:27:20'),
(5, 'INDIC5555555', 'INDIC5', 'INDIC5', '50', '10', '2019-06-22 06:27:20');

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id_notif` int(11) NOT NULL,
  `sujet_notif` text NOT NULL,
  `contenu_notif` text NOT NULL,
  `id_emetteur` int(11) NOT NULL,
  `id_recepteur` int(11) NOT NULL,
  `date_notif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lecture_notif` int(11) NOT NULL DEFAULT '0',
  `status_notif` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id_notif`, `sujet_notif`, `contenu_notif`, `id_emetteur`, `id_recepteur`, `date_notif`, `lecture_notif`, `status_notif`) VALUES
(1, '', '[object Object]', 1, 8, '2019-09-27 23:47:31', 1, 4),
(2, '', '[object Object]', 1, 8, '2019-09-28 00:00:56', 1, 4),
(3, '', '[object Object]', 1, 3, '2019-09-28 06:39:20', 1, 4),
(4, '', '[object Object]', 1, 8, '2019-09-28 06:43:55', 1, 1),
(5, '', '<pre><code>html(txt.innerHTML).summernote();</code></pre>', 1, 3, '2019-09-28 06:47:37', 1, 4),
(6, '', 'html(txt.innerHTML).summernote()', 1, 8, '2019-09-28 06:55:57', 0, 1),
(7, '', 'html(txt.innerHTML).summernote()', 1, 8, '2019-09-28 07:11:31', 0, 1),
(9, '', '[object Object]', 1, 8, '2019-09-28 07:18:37', 0, 1),
(16, '', '[object Object]', 1, 7, '2019-09-28 07:38:47', 0, 4),
(17, '', '[object Object]', 1, 7, '2019-09-28 07:39:27', 0, 4),
(19, '', '[object Object]', 1, 7, '2019-09-28 08:13:57', 1, 2),
(20, '', 'text', 1, 7, '2019-09-28 08:14:43', 1, 2),
(22, '', ' $($(\"#summernote\").code()).text()', 1, 7, '2019-09-28 08:17:52', 1, 2),
(23, '', '$($(\"#summernote\").summernote(\"code\")).text()', 1, 7, '2019-09-28 08:19:21', 1, 2),
(26, '', '[object Object]', 1, 3, '2019-09-28 08:26:51', 0, 2),
(28, '', '[object Object]', 1, 0, '2019-09-28 08:33:36', 1, 3),
(29, '', '[object Object]', 1, 7, '2019-09-28 09:37:10', 1, 3),
(30, '', 'Tapez votre message', 1, 7, '2019-09-28 09:58:57', 0, 3),
(33, '', 'Tapez votre message', 1, 7, '2019-09-28 10:02:21', 1, 3),
(34, '', 'Tapez votre message var parameters=\"method=creer', 1, 7, '2019-09-28 10:02:40', 1, 3),
(36, '', 'T var parameters=\"method=creer', 1, 7, '2019-09-28 10:03:12', 0, 3),
(38, '', 'Tapez votre message', 1, 8, '2019-09-28 10:04:49', 0, 3),
(39, '', 'test', 1, 8, '2019-09-28 10:05:02', 0, 4),
(40, '', '$(\'.summernote\').summernote();<br>', 1, 8, '2019-09-28 10:05:35', 0, 4),
(41, '', '\n        <div class=\"votecell post-layout--left\"><div class=\"js-voting-container grid fd-column ai-stretch gs4 fc-black-200\" data-post-id=\"49936552\">\n\n</div>\n\n        </div>\n\n        \n\n    \n    \n<p>I needed to check if the textarea had any content. This have done the trick:</p>', 1, 8, '2019-09-28 10:06:28', 1, 4),
(42, '', 'Tapez votre message', 1, 8, '2019-09-28 10:09:41', 0, 4),
(43, '', 'test', 1, 8, '2019-09-28 10:09:59', 1, 4),
(44, '', 'test hdfyugsdfihzaiueyr szaedgfyuzegiuhaziodu butyugkazeyoiueoiza jtuergkzaehiazheouzae<br>', 1, 8, '2019-09-28 10:10:27', 0, 0),
(45, '', 'Tapez votre message', 1, 7, '2019-09-28 10:28:43', 0, 0),
(46, '', 'test', 1, 7, '2019-09-28 10:29:02', 0, 0),
(47, '', 'You could apply one of the top two answers for the question JavaScript: How to strip HTML tags from ', 1, 7, '2019-09-28 10:29:27', 0, 0),
(49, '', '.replace(/', 1, 7, '2019-09-28 10:34:46', 0, 0),
(50, '', '\r\nYou could apply one of the top two answers for the question JavaScript: How to strip HTML tags from \r\n', 1, 7, '2019-09-28 10:35:37', 0, 0),
(51, '', 'I needed to check if the textarea had any content. This have done the trick:', 1, 7, '2019-09-28 10:38:58', 0, 0),
(52, '', 'I needed to check if the textarea had any content. This have done the trick: \n           \n\n \n\n         \n\n        \n\n    \n    \n I needed to check if the textarea had any content. This have done the trick:\n           \n\n \n\n         \n\n        \n\n    \n    \n I needed to check if the textarea had any content. This have done the trick:\n           \n\n \n\n         \n\n        \n\n    \n    \n I needed to check if the textarea had any content. This have done the trick:', 1, 7, '2019-09-28 10:39:47', 0, 0),
(56, '', 'Tapez votre message', 1, 0, '2019-09-28 10:50:58', 0, 0),
(57, '', 'Tapez votre message', 1, 7, '2019-09-28 10:51:24', 0, 0),
(58, '', 'Tapez votre message', 1, 7, '2019-09-28 12:35:23', 0, 0),
(64, 'Activite 2 non faite', 'Tapez votre message', 1, 1, '2019-09-28 14:45:49', 1, 1),
(66, 'Activite 2 non faite', 'Also having this issue, it\'d be great to sanitise everything except \nbasic text styling and href\'s. Just ran into this, specifically with \nusers pasting in content from Microsoft Office, resulting in the \nfollowing being saved (this is only the beggining snippet):', 1, 1, '2019-09-28 14:53:06', 1, 1),
(67, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:27:49', 0, 0),
(68, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:10', 0, 0),
(69, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:10', 0, 0),
(70, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:13', 0, 0),
(71, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:25', 0, 0),
(72, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:29', 0, 0),
(73, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:30', 0, 0),
(74, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:31', 0, 0),
(75, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:31', 0, 0),
(76, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:31', 0, 0),
(77, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:31', 0, 0),
(78, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:31', 0, 0),
(79, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:31', 0, 0),
(80, 'Activite 2 non faite', 'J\'ai tapé le message', 1, 0, '2019-09-30 10:28:32', 0, 0),
(81, 'Activite 2 non faite', 'J\'ai tapez le message', 1, 0, '2019-09-30 10:30:34', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE `poste` (
  `id_poste` int(11) NOT NULL,
  `intitule_poste` varchar(200) NOT NULL,
  `code_poste` varchar(200) NOT NULL,
  `description_poste` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `poste`
--

INSERT INTO `poste` (`id_poste`, `intitule_poste`, `code_poste`, `description_poste`) VALUES
(1, 'Chef de Service', 'CS', 'Chef de Service'),
(2, 'Directeur', 'Dr', 'Directeur');

-- --------------------------------------------------------

--
-- Structure de la table `programme`
--

CREATE TABLE `programme` (
  `id_programme` int(11) NOT NULL,
  `code_programme` varchar(20) NOT NULL,
  `denomination_programme` varchar(200) NOT NULL,
  `descriptif_programme` longtext NOT NULL,
  `id_indicateur` int(11) NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `valide_programme` int(11) NOT NULL DEFAULT '0',
  `annee_programme` int(11) NOT NULL,
  `date_programme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archive` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `programme`
--

INSERT INTO `programme` (`id_programme`, `code_programme`, `denomination_programme`, `descriptif_programme`, `id_indicateur`, `id_responsable`, `valide_programme`, `annee_programme`, `date_programme`, `archive`) VALUES
(23, '241', 'DEVELOPPEMENT DE LA COMPOSANTE TECHNOLOGIQUE ET PROFESSIONNELLE', 'DEVELOPPEMENT DE LA COMPOSANTE TECHNOLOGIQUE ET PROFESSIONNELLE', 0, 8, 0, 2019, '2019-09-14 22:17:28', 0),
(24, '242', 'MODERNISATION ET PROFESSIONNALISATION DES ETABLISSEMENTS FACULTAIRES CLASSIQUES', 'MODERNISATION ET PROFESSIONNALISATION DES ETABLISSEMENTS FACULTAIRES CLASSIQUES', 0, 3, 0, 2019, '2019-09-14 22:18:48', 0),
(25, '243', 'DEVELOPPEMENT DE LA RECHERCHE ET DE L’INNOVATION UNIVERSITAIRES ', ': DEVELOPPEMENT DE LA RECHERCHE ET DE L’INNOVATION UNIVERSITAIRES ', 0, 8, 0, 2019, '2019-09-14 22:21:42', 0),
(26, '244', 'GOUVERNANCE ET APPUI INSTITUTIONNEL DANS LE SOUS SECTEUR ENSEIGNEMENT SUPERIEUR', 'GOUVERNANCE ET APPUI INSTITUTIONNEL DANS LE SOUS SECTEUR ENSEIGNEMENT SUPERIEUR', 0, 9, 0, 2019, '2019-09-14 22:26:30', 0);

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

CREATE TABLE `responsable` (
  `id_responsable` int(11) NOT NULL,
  `nom_responsable` varchar(200) NOT NULL,
  `sexe_responsable` int(11) NOT NULL,
  `id_poste` int(11) NOT NULL,
  `id_structure` int(11) NOT NULL,
  `id_administration` int(11) NOT NULL,
  `date_administration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `responsable`
--

INSERT INTO `responsable` (`id_responsable`, `nom_responsable`, `sexe_responsable`, `id_poste`, `id_structure`, `id_administration`, `date_administration`) VALUES
(1, 'NKOUM NDJIND', 2, 2, 10, 1, '2018-10-09 17:06:47'),
(3, 'MAGDE VALENTIN', 2, 2, 10, 1, '2019-08-21 23:00:00'),
(20, 'DOMCHE IVAN', 2, 1, 8, 1, '2019-06-18 11:41:07');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `libele` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `libele`) VALUES
(1, 'Responsable activités'),
(2, 'Controleur'),
(3, 'SG'),
(4, 'Coordonateur');

-- --------------------------------------------------------

--
-- Structure de la table `sexe`
--

CREATE TABLE `sexe` (
  `id_sexe` int(11) NOT NULL,
  `nom_sexe` varchar(200) NOT NULL,
  `code_sexe` varchar(200) NOT NULL,
  `description_sexe` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sexe`
--

INSERT INTO `sexe` (`id_sexe`, `nom_sexe`, `code_sexe`, `description_sexe`) VALUES
(1, 'Feminin', 'F', ''),
(2, 'Masculin', 'M', '');

-- --------------------------------------------------------

--
-- Structure de la table `structure`
--

CREATE TABLE `structure` (
  `id_structure` int(11) NOT NULL,
  `code_structure` varchar(20) NOT NULL,
  `intitule_structure` varchar(200) NOT NULL,
  `descriptif_structure` longtext,
  `date_structure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `structure`
--

INSERT INTO `structure` (`id_structure`, `code_structure`, `intitule_structure`, `descriptif_structure`, `date_structure`) VALUES
(10, 'magde', 'magde', 'toute_toute', '2019-06-07 20:10:06'),
(11, 'ivantest', 'ivan1', 'toute_toute', '2019-06-07 20:31:17'),
(12, 'ivan', 'magde', 'toute_toute', '2019-06-07 20:50:49'),
(13, 'ivan3', 'ivan1', 'toute_toute', '2019-08-29 14:58:50'),
(14, 'ivan7', 'ivan1', 'toute_toute', '2019-08-29 15:04:40'),
(15, 'ivan7', 'ivan1', 'toute_toute', '2019-08-29 15:23:32'),
(16, 'ivan7', 'ivan1', 'toute_toute', '2019-08-29 15:26:04'),
(17, 'ivan7', 'ivan1', 'toute_toute', '2019-08-30 11:35:54'),
(18, 'ivan7', 'ivan1', 'toute_toute', '2019-08-30 13:59:33'),
(19, 'ivan7', 'ivan1', 'toute_toute', '2019-08-30 15:24:50'),
(20, 'ivan7', 'ivan1', 'toute_toute', '2019-08-31 21:18:52'),
(21, 'MINESUP', 'MINISTERE DE L\'ENSEIGNEMENT SUPERIEUR', '', '2019-09-27 10:40:43');

-- --------------------------------------------------------

--
-- Structure de la table `type_structure`
--

CREATE TABLE `type_structure` (
  `id_type_structure` int(11) NOT NULL,
  `code_type_structure` varchar(20) NOT NULL,
  `intitule_type_structure` varchar(200) NOT NULL,
  `descriptif_type_structure` longtext NOT NULL,
  `date_type_structure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_structure`
--

INSERT INTO `type_structure` (`id_type_structure`, `code_type_structure`, `intitule_type_structure`, `descriptif_type_structure`, `date_type_structure`) VALUES
(32, 'UNIV', 'UNIVERSITE', 'Universite d\'Etat', '2018-10-14 20:57:40'),
(33, 'IPES', 'IPES', 'Instituts Prives d\'Enseignement Superieur', '2018-10-14 21:01:18'),
(35, 'MINESUP', 'MINESUP', 'Ministere de l\'Enseignement Superieur', '2018-10-14 21:09:55');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom_utilisateur` varchar(200) NOT NULL,
  `tel_utilisateur` varchar(200) NOT NULL,
  `mail_utilisateur` varchar(200) NOT NULL,
  `login_utilisateur` varchar(200) DEFAULT NULL,
  `pass_utilisateur` varchar(200) NOT NULL,
  `id_structure` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sexe` varchar(255) DEFAULT NULL,
  `avatar` text,
  `biographie` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom_utilisateur`, `tel_utilisateur`, `mail_utilisateur`, `login_utilisateur`, `pass_utilisateur`, `id_structure`, `id_role`, `date`, `sexe`, `avatar`, `biographie`) VALUES
(1, 'magde', '6987882873', 'magde@gmail.com', NULL, 'phpuser', 11, 2, '2019-09-01 13:59:53', '2', 'uploads/1/FDS_4203 (1).JPG', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\"                                     \"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"'),
(3, 'joress nebo', '6987882873', 'nebo@gmail.com', NULL, 'nebo', 11, 1, '2019-09-01 14:09:03', '2', NULL, ''),
(4, 'batoum', '6987882873', 'batoum@gmail.com', NULL, 'nebo', 12, 2, '2019-09-02 08:29:26', '2', NULL, ''),
(5, 'test1', '6987882873', 'test1@gmail.com', NULL, 'test1', 11, 2, '2019-09-02 08:39:44', '1', NULL, ''),
(6, 'test2', '6987882873', 'test2@gmail.com', NULL, 'test2', 13, 2, '2019-09-02 08:42:08', '2', NULL, ''),
(7, 'test3', '6987882873', 'test3@gmail.com', NULL, 'test3', 13, 1, '2019-09-02 08:44:49', '2', NULL, ''),
(8, 'valentin', '698782873', 'valentin@gmail.com', NULL, 'phpuser', 10, 1, '2019-09-14 22:19:44', '2', NULL, ''),
(9, 'Demasso', '698782873', 'demassojames@gmail.com', NULL, 'james', 13, 2, '2019-09-14 22:24:42', '2', NULL, ''),
(10, 'naim', '698782873', 'naim@gmail.com', NULL, 'phpuser', 21, 4, '2019-09-27 10:48:15', '2', NULL, ''),
(11, 'valentin magde', '698782873', 'vmagde@gmail.com', NULL, 'phpuser', 21, 3, '2019-09-30 15:46:20', '2', NULL, ''),
(15, 'magde valentin', '698782873', 'valentinmagde@gmail.com', NULL, 'phpuser', 21, 3, '2019-09-30 20:09:11', '2', NULL, ''),
(16, 'Nebo Joress', '698782873', 'nebo@gmail.com', NULL, 'nebojoress123', 10, 3, '2019-09-30 20:26:58', '2', NULL, ''),
(17, 'Nebo Joress', '698782873', 'joress@gmail.com', NULL, 'nebojoress1234', 12, 4, '2019-09-30 20:31:49', '2', NULL, ''),
(18, 'Nebo Joress', '698782873', 'nebojoress@gmail.com', NULL, 'nebojoress12345', 13, 3, '2019-09-30 20:36:34', '2', NULL, '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id_action`);

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`id_activite`);

--
-- Index pour la table `administration`
--
ALTER TABLE `administration`
  ADD PRIMARY KEY (`id_administration`);

--
-- Index pour la table `dietetique`
--
ALTER TABLE `dietetique`
  ADD PRIMARY KEY (`id_die`);

--
-- Index pour la table `evolution_action`
--
ALTER TABLE `evolution_action`
  ADD PRIMARY KEY (`id_evolution_action`);

--
-- Index pour la table `evolution_activite`
--
ALTER TABLE `evolution_activite`
  ADD PRIMARY KEY (`id_evolution_activite`);

--
-- Index pour la table `evolution_programme`
--
ALTER TABLE `evolution_programme`
  ADD PRIMARY KEY (`id_evolution_programme`);

--
-- Index pour la table `indicateur`
--
ALTER TABLE `indicateur`
  ADD PRIMARY KEY (`id_indicateur`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id_notif`);

--
-- Index pour la table `poste`
--
ALTER TABLE `poste`
  ADD PRIMARY KEY (`id_poste`);

--
-- Index pour la table `programme`
--
ALTER TABLE `programme`
  ADD PRIMARY KEY (`id_programme`);

--
-- Index pour la table `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`id_responsable`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sexe`
--
ALTER TABLE `sexe`
  ADD PRIMARY KEY (`id_sexe`);

--
-- Index pour la table `structure`
--
ALTER TABLE `structure`
  ADD PRIMARY KEY (`id_structure`);

--
-- Index pour la table `type_structure`
--
ALTER TABLE `type_structure`
  ADD PRIMARY KEY (`id_type_structure`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `id_action` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `id_activite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT pour la table `administration`
--
ALTER TABLE `administration`
  MODIFY `id_administration` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `dietetique`
--
ALTER TABLE `dietetique`
  MODIFY `id_die` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evolution_action`
--
ALTER TABLE `evolution_action`
  MODIFY `id_evolution_action` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evolution_activite`
--
ALTER TABLE `evolution_activite`
  MODIFY `id_evolution_activite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evolution_programme`
--
ALTER TABLE `evolution_programme`
  MODIFY `id_evolution_programme` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `indicateur`
--
ALTER TABLE `indicateur`
  MODIFY `id_indicateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id_notif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT pour la table `poste`
--
ALTER TABLE `poste`
  MODIFY `id_poste` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `programme`
--
ALTER TABLE `programme`
  MODIFY `id_programme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `responsable`
--
ALTER TABLE `responsable`
  MODIFY `id_responsable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `sexe`
--
ALTER TABLE `sexe`
  MODIFY `id_sexe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `structure`
--
ALTER TABLE `structure`
  MODIFY `id_structure` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `type_structure`
--
ALTER TABLE `type_structure`
  MODIFY `id_type_structure` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
