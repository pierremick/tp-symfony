-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 27 fév. 2023 à 07:58
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `airbnb`
--
CREATE DATABASE IF NOT EXISTS `airbnb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `airbnb`;

-- --------------------------------------------------------

--
-- Structure de la table `accommodations`
--

CREATE TABLE `accommodations` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(75) NOT NULL,
  `description` varchar(155) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `bedroom` int(11) DEFAULT NULL,
  `bed_double` int(11) DEFAULT NULL,
  `bed_single` int(11) DEFAULT NULL,
  `bathroom` int(11) DEFAULT NULL,
  `traveller` int(11) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `accommodations`
--

INSERT INTO `accommodations` (`id`, `name`, `slug`, `description`, `image`, `price`, `bedroom`, `bed_double`, `bed_single`, `bathroom`, `traveller`, `content`, `updated_at`, `created_at`, `is_published`, `user_id`, `category_id`, `type_id`) VALUES
(1, 'Morbi ullamcorper fermentum nulla, eu viverra est', 'morbi-ullamcorper-fermentum-nulla-eu-viverra-est', 'Donec ut dictum tortor. Phasellus eu turpis ac turpis tincidunt molestie. Sed tincidunt ipsum id neque convallis, vel bibendum quam pretium efficitur.', NULL, 200, 2, 1, 2, 1, 4, 'Phasellus lectus lacus, viverra a dui sed, egestas consectetur odio. Sed sollicitudin consectetur purus non condimentum. Nullam ut mauris faucibus, convallis quam tristique, tincidunt enim. Ut semper ligula libero, sed cursus magna placerat et. Etiam et enim in elit semper varius id quis nisl. Aenean mattis feugiat viverra. Morbi eu tellus et nibh vestibulum laoreet. Cras a efficitur nulla.\r\n\r\nAenean egestas interdum placerat. Pellentesque eu sagittis tellus. Vestibulum dapibus vulputate ante nec rutrum. Curabitur auctor, nibh a dictum vulputate, quam quam interdum dolor, sed lobortis augue arcu et quam. Nam non sem mauris. Aenean pretium volutpat metus a euismod. Nam erat magna, accumsan eu cursus id, porttitor quis magna. Aenean sit amet urna sed ex posuere sagittis. Vivamus venenatis augue eros, eget tristique quam facilisis in. Maecenas sapien mi, lobortis ac leo ac, malesuada egestas massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', '2023-01-24 16:32:08', '2023-01-24 16:32:08', 1, NULL, 1, NULL),
(2, 'Cras vitae nunc sit amet lacus cursus tortor', 'cras-vitae-nunc-sit-amet-lacus-cursus-tortor', 'Aenean lacus odio, laoreet sit amet volutpat sed, mollis a nisl. Integer volutpat augue vel diam bibendum lobortis. Vivamus cursus velit vivamus', NULL, 36, 1, 2, NULL, 1, 2, 'Phasellus lectus lacus, viverra a dui sed, egestas consectetur odio. Sed sollicitudin consectetur purus non condimentum. Nullam ut mauris faucibus, convallis quam tristique, tincidunt enim. Ut semper ligula libero, sed cursus magna placerat et. Etiam et enim in elit semper varius id quis nisl. Aenean mattis feugiat viverra. Morbi eu tellus et nibh vestibulum laoreet. Cras a efficitur nulla.\r\n\r\nAenean egestas interdum placerat. Pellentesque eu sagittis tellus. Vestibulum dapibus vulputate ante nec rutrum. Curabitur auctor, nibh a dictum vulputate, quam quam interdum dolor, sed lobortis augue arcu et quam. Nam non sem mauris. Aenean pretium volutpat metus a euismod. Nam erat magna, accumsan eu cursus id, porttitor quis magna. Aenean sit amet urna sed ex posuere sagittis. Vivamus venenatis augue eros, eget tristique quam facilisis in. Maecenas sapien mi, lobortis ac leo ac, malesuada egestas massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', '2023-01-24 16:50:30', '2023-01-24 16:50:30', 1, NULL, 2, NULL),
(3, 'Non pulvinar neque laoreet suspendisse', 'non-pulvinar-neque-laoreet-suspendisse', 'non nisi est sit amet facilisis magna etiam tempor orci eu lobortis elementum nibh tellus', NULL, 24, 1, NULL, 1, 1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod lacinia at quis risus sed. Lacus sed turpis tincidunt id aliquet risus feugiat in. At quis risus sed vulputate odio. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam. Aliquam eleifend mi in nulla posuere. Tellus mauris a diam maecenas sed. Turpis egestas pretium aenean pharetra magna ac placerat vestibulum lectus. Vitae tempus quam pellentesque nec nam aliquam sem et tortor. Nisl pretium fusce id velit ut. Adipiscing at in tellus integer feugiat scelerisque varius morbi enim. Dui nunc mattis enim ut tellus. Donec ultrices tincidunt arcu non. Et leo duis ut diam quam nulla porttitor. Mi ipsum faucibus vitae aliquet nec. Consectetur lorem donec massa sapien faucibus. Porta nibh venenatis cras sed felis eget velit aliquet sagittis. Amet purus gravida quis blandit turpis. In nulla posuere sollicitudin aliquam ultrices. Pellentesque id nibh tortor id aliquet.\r\n\r\nFeugiat pretium nibh ipsum consequat nisl vel pretium lectus quam. Vulputate odio ut enim blandit. Pulvinar sapien et ligula ullamcorper. Nunc lobortis mattis aliquam faucibus. Vitae aliquet nec ullamcorper sit amet risus nullam eget. Non sodales neque sodales ut etiam. A lacus vestibulum sed arcu non odio euismod. Diam vulputate ut pharetra sit amet. Tortor id aliquet lectus proin nibh nisl condimentum. Lorem ipsum dolor sit amet consectetur adipiscing elit ut aliquam. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien. Sed ullamcorper morbi tincidunt ornare. Urna duis convallis convallis tellus. Risus ultricies tristique nulla aliquet enim tortor at auctor urna. Vestibulum lectus mauris ultrices eros in cursus turpis. Nulla at volutpat diam ut. Pulvinar pellentesque habitant morbi tristique senectus et netus et. Lorem mollis aliquam ut porttitor leo. Aliquet bibendum enim facilisis gravida neque convallis a cras. Vel orci porta non pulvinar neque laoreet suspendisse interdum.', '2023-01-25 15:59:41', '2023-01-25 15:59:41', 1, NULL, 25, NULL),
(4, 'Sit amet nisl suscipit adipiscing bibendum', 'sit-amet-nisl-suscipit-adipiscing-bibendum', 'sit amet consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis lectus magna fringilla', NULL, 60, 1, 1, 1, 1, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vulputate ut pharetra sit amet aliquam id. Amet nulla facilisi morbi tempus iaculis. Turpis tincidunt id aliquet risus feugiat in. Magna etiam tempor orci eu lobortis elementum nibh tellus. Facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris. Dui sapien eget mi proin sed. Sed nisi lacus sed viverra tellus in hac habitasse. Eget dolor morbi non arcu risus quis varius. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Mauris sit amet massa vitae tortor condimentum. A diam maecenas sed enim ut sem. Aliquam vestibulum morbi blandit cursus. Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique. Nisi lacus sed viverra tellus in hac. Odio pellentesque diam volutpat commodo sed egestas egestas.\r\n\r\nUltrices sagittis orci a scelerisque purus semper. Tortor id aliquet lectus proin nibh. Tincidunt tortor aliquam nulla facilisi cras fermentum. Amet venenatis urna cursus eget. Quisque egestas diam in arcu cursus. Nunc mattis enim ut tellus elementum sagittis vitae et. Felis eget velit aliquet sagittis id consectetur purus ut. Purus non enim praesent elementum facilisis leo vel. Sed faucibus turpis in eu mi. Nibh praesent tristique magna sit amet purus gravida. A diam sollicitudin tempor id eu nisl nunc. Placerat duis ultricies lacus sed turpis. Pharetra vel turpis nunc eget lorem dolor sed viverra. Quis commodo odio aenean sed adipiscing diam donec adipiscing tristique. Vitae purus faucibus ornare suspendisse sed nisi lacus. Vitae justo eget magna fermentum iaculis eu. Consequat mauris nunc congue nisi.', '2023-01-26 08:48:10', '2023-01-26 08:48:10', 1, NULL, 27, NULL),
(5, 'Sit amet mattis vulputate enim', 'sit-amet-mattis-vulputate-enim', 'aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt', NULL, 150, 3, 2, 2, 1, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vulputate ut pharetra sit amet aliquam id. Amet nulla facilisi morbi tempus iaculis. Turpis tincidunt id aliquet risus feugiat in. Magna etiam tempor orci eu lobortis elementum nibh tellus. Facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris. Dui sapien eget mi proin sed. Sed nisi lacus sed viverra tellus in hac habitasse. Eget dolor morbi non arcu risus quis varius. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Mauris sit amet massa vitae tortor condimentum. A diam maecenas sed enim ut sem. Aliquam vestibulum morbi blandit cursus. Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique. Nisi lacus sed viverra tellus in hac. Odio pellentesque diam volutpat commodo sed egestas egestas.\r\n\r\nUltrices sagittis orci a scelerisque purus semper. Tortor id aliquet lectus proin nibh. Tincidunt tortor aliquam nulla facilisi cras fermentum. Amet venenatis urna cursus eget. Quisque egestas diam in arcu cursus. Nunc mattis enim ut tellus elementum sagittis vitae et. Felis eget velit aliquet sagittis id consectetur purus ut. Purus non enim praesent elementum facilisis leo vel. Sed faucibus turpis in eu mi. Nibh praesent tristique magna sit amet purus gravida. A diam sollicitudin tempor id eu nisl nunc. Placerat duis ultricies lacus sed turpis. Pharetra vel turpis nunc eget lorem dolor sed viverra. Quis commodo odio aenean sed adipiscing diam donec adipiscing tristique. Vitae purus faucibus ornare suspendisse sed nisi lacus. Vitae justo eget magna fermentum iaculis eu. Consequat mauris nunc congue nisi.', '2023-01-26 08:48:10', '2023-01-26 08:48:10', 1, NULL, 1, NULL),
(6, 'Pellentesque nec nam aliquam sem', 'pellentesque-nec-nam-aliquam-sem', 'arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed', NULL, 160, 1, 1, 2, 1, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vulputate ut pharetra sit amet aliquam id. Amet nulla facilisi morbi tempus iaculis. Turpis tincidunt id aliquet risus feugiat in. Magna etiam tempor orci eu lobortis elementum nibh tellus. Facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris. Dui sapien eget mi proin sed. Sed nisi lacus sed viverra tellus in hac habitasse. Eget dolor morbi non arcu risus quis varius. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Mauris sit amet massa vitae tortor condimentum. A diam maecenas sed enim ut sem. Aliquam vestibulum morbi blandit cursus. Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique. Nisi lacus sed viverra tellus in hac. Odio pellentesque diam volutpat commodo sed egestas egestas.\r\n\r\nUltrices sagittis orci a scelerisque purus semper. Tortor id aliquet lectus proin nibh. Tincidunt tortor aliquam nulla facilisi cras fermentum. Amet venenatis urna cursus eget. Quisque egestas diam in arcu cursus. Nunc mattis enim ut tellus elementum sagittis vitae et. Felis eget velit aliquet sagittis id consectetur purus ut. Purus non enim praesent elementum facilisis leo vel. Sed faucibus turpis in eu mi. Nibh praesent tristique magna sit amet purus gravida. A diam sollicitudin tempor id eu nisl nunc. Placerat duis ultricies lacus sed turpis. Pharetra vel turpis nunc eget lorem dolor sed viverra. Quis commodo odio aenean sed adipiscing diam donec adipiscing tristique. Vitae purus faucibus ornare suspendisse sed nisi lacus. Vitae justo eget magna fermentum iaculis eu. Consequat mauris nunc congue nisi.', '2023-01-26 08:54:09', '2023-01-26 08:54:09', 1, NULL, 29, NULL),
(7, 'Vitae ultricies leo integer malesuada', 'vitae-ultricies-leo-integer-malesuada', 'id eu nisl nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit amet risus nullam', NULL, 60, 1, 1, NULL, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vulputate ut pharetra sit amet aliquam id. Amet nulla facilisi morbi tempus iaculis. Turpis tincidunt id aliquet risus feugiat in. Magna etiam tempor orci eu lobortis elementum nibh tellus. Facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris. Dui sapien eget mi proin sed. Sed nisi lacus sed viverra tellus in hac habitasse. Eget dolor morbi non arcu risus quis varius. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Mauris sit amet massa vitae tortor condimentum. A diam maecenas sed enim ut sem. Aliquam vestibulum morbi blandit cursus. Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique. Nisi lacus sed viverra tellus in hac. Odio pellentesque diam volutpat commodo sed egestas egestas.\r\n\r\nUltrices sagittis orci a scelerisque purus semper. Tortor id aliquet lectus proin nibh. Tincidunt tortor aliquam nulla facilisi cras fermentum. Amet venenatis urna cursus eget. Quisque egestas diam in arcu cursus. Nunc mattis enim ut tellus elementum sagittis vitae et. Felis eget velit aliquet sagittis id consectetur purus ut. Purus non enim praesent elementum facilisis leo vel. Sed faucibus turpis in eu mi. Nibh praesent tristique magna sit amet purus gravida. A diam sollicitudin tempor id eu nisl nunc. Placerat duis ultricies lacus sed turpis. Pharetra vel turpis nunc eget lorem dolor sed viverra. Quis commodo odio aenean sed adipiscing diam donec adipiscing tristique. Vitae purus faucibus ornare suspendisse sed nisi lacus. Vitae justo eget magna fermentum iaculis eu. Consequat mauris nunc congue nisi.', '2023-01-26 08:54:09', '2023-01-26 08:54:09', 1, NULL, 25, NULL),
(8, 'Volutpat est velit egestas dui', 'volutpat-est-velit-egestas-dui', 'Ut venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci', NULL, 200, 2, 2, 1, 1, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis massa sed elementum tempus. Nam aliquam sem et tortor consequat id porta. Mauris commodo quis imperdiet massa tincidunt nunc pulvinar. Integer feugiat scelerisque varius morbi. Malesuada pellentesque elit eget gravida cum sociis. Orci eu lobortis elementum nibh. Ac felis donec et odio pellentesque. Volutpat lacus laoreet non curabitur. Nulla facilisi cras fermentum odio eu feugiat. Velit sed ullamcorper morbi tincidunt ornare massa eget. A scelerisque purus semper eget duis at tellus.\r\n\r\nMassa ultricies mi quis hendrerit dolor. Sem fringilla ut morbi tincidunt augue interdum velit. Tempor nec feugiat nisl pretium. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum arcu. Tempus quam pellentesque nec nam aliquam sem. Diam maecenas ultricies mi eget mauris pharetra. Sem viverra aliquet eget sit amet tellus cras. Pharetra vel turpis nunc eget lorem. Nunc scelerisque viverra mauris in. Elementum pulvinar etiam non quam lacus suspendisse faucibus.', '2023-01-26 08:58:44', '2023-01-26 08:58:44', 1, NULL, 31, NULL),
(9, 'Vitae semper quis lectus nulla', 'vitae-semper-quis-lectus-nulla', 'Semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo', NULL, 800, 5, 10, NULL, 2, 20, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis massa sed elementum tempus. Nam aliquam sem et tortor consequat id porta. Mauris commodo quis imperdiet massa tincidunt nunc pulvinar. Integer feugiat scelerisque varius morbi. Malesuada pellentesque elit eget gravida cum sociis. Orci eu lobortis elementum nibh. Ac felis donec et odio pellentesque. Volutpat lacus laoreet non curabitur. Nulla facilisi cras fermentum odio eu feugiat. Velit sed ullamcorper morbi tincidunt ornare massa eget. A scelerisque purus semper eget duis at tellus.\r\n\r\nMassa ultricies mi quis hendrerit dolor. Sem fringilla ut morbi tincidunt augue interdum velit. Tempor nec feugiat nisl pretium. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum arcu. Tempus quam pellentesque nec nam aliquam sem. Diam maecenas ultricies mi eget mauris pharetra. Sem viverra aliquet eget sit amet tellus cras. Pharetra vel turpis nunc eget lorem. Nunc scelerisque viverra mauris in. Elementum pulvinar etiam non quam lacus suspendisse faucibus.', '2023-01-26 08:58:44', '2023-01-26 08:58:44', 1, NULL, 1, NULL),
(21, 'Purus ut faucibus pulvinar elementum', 'purus-ut-faucibus-pulvinar-elementum', 'leo in vitae turpis massa sed elementum tempus egestas sed sed risus pretium quam vulputate', NULL, 50, 1, 1, NULL, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis massa sed elementum tempus. Nam aliquam sem et tortor consequat id porta. Mauris commodo quis imperdiet massa tincidunt nunc pulvinar. Integer feugiat scelerisque varius morbi. Malesuada pellentesque elit eget gravida cum sociis. Orci eu lobortis elementum nibh. Ac felis donec et odio pellentesque. Volutpat lacus laoreet non curabitur. Nulla facilisi cras fermentum odio eu feugiat. Velit sed ullamcorper morbi tincidunt ornare massa eget. A scelerisque purus semper eget duis at tellus.\r\n\r\nMassa ultricies mi quis hendrerit dolor. Sem fringilla ut morbi tincidunt augue interdum velit. Tempor nec feugiat nisl pretium. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum arcu. Tempus quam pellentesque nec nam aliquam sem. Diam maecenas ultricies mi eget mauris pharetra. Sem viverra aliquet eget sit amet tellus cras. Pharetra vel turpis nunc eget lorem. Nunc scelerisque viverra mauris in. Elementum pulvinar etiam non quam lacus suspendisse faucibus.', '2023-01-26 09:07:11', '2023-01-26 09:07:11', 1, NULL, 4, NULL),
(22, 'Nibh sed pulvinar proin gravida', 'nibh-sed-pulvinar-proin-gravida', 'fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor', NULL, 210, 1, NULL, 7, 1, 14, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed elementum tempus egestas sed sed. Dignissim convallis aenean et tortor. Sodales ut eu sem integer vitae. Quis auctor elit sed vulputate mi. Habitant morbi tristique senectus et netus et malesuada fames. Sit amet porttitor eget dolor morbi. Interdum velit euismod in pellentesque massa placerat duis ultricies. In massa tempor nec feugiat nisl pretium fusce. Eget magna fermentum iaculis eu non. Dolor magna eget est lorem ipsum. Sed vulputate odio ut enim blandit volutpat maecenas. Nisl nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit. Suspendisse sed nisi lacus sed viverra tellus. Amet tellus cras adipiscing enim eu. Ipsum a arcu cursus vitae congue mauris rhoncus aenean vel. Amet mauris commodo quis imperdiet massa tincidunt.\r\n\r\nNam aliquam sem et tortor consequat id porta. Posuere sollicitudin aliquam ultrices sagittis orci a scelerisque purus. Pretium lectus quam id leo in. Urna porttitor rhoncus dolor purus. Felis donec et odio pellentesque diam volutpat commodo sed. Vulputate sapien nec sagittis aliquam. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt. Gravida cum sociis natoque penatibus. Adipiscing elit ut aliquam purus sit amet luctus. Gravida rutrum quisque non tellus orci. Enim nunc faucibus a pellentesque sit amet porttitor eget dolor. Morbi tincidunt ornare massa eget. Sed elementum tempus egestas sed sed risus pretium quam vulputate. Elementum facilisis leo vel fringilla. Leo in vitae turpis massa sed elementum tempus. Id donec ultrices tincidunt arcu. Vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet. Vulputate ut pharetra sit amet aliquam id diam maecenas.', '2023-01-26 09:17:23', '2023-01-26 09:17:23', 1, NULL, 3, NULL),
(23, 'Magnis dis parturient montes nascetur', 'magnis-dis-parturient-montes-nascetur', 'nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet non curabitur gravida', NULL, 60, 1, 1, NULL, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium viverra suspendisse potenti nullam ac. Aliquam malesuada bibendum arcu vitae. Pharetra sit amet aliquam id. Ultricies mi quis hendrerit dolor magna eget est lorem ipsum. Libero volutpat sed cras ornare arcu dui vivamus. Elit pellentesque habitant morbi tristique senectus et netus. Eros donec ac odio tempor. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium. Magna sit amet purus gravida. Volutpat maecenas volutpat blandit aliquam etiam. Nisl suscipit adipiscing bibendum est ultricies. Scelerisque purus semper eget duis at tellus at. Justo donec enim diam vulputate ut. Neque aliquam vestibulum morbi blandit cursus risus at. Odio facilisis mauris sit amet massa vitae tortor condimentum lacinia.\r\n\r\nVolutpat consequat mauris nunc congue nisi vitae. Congue nisi vitae suscipit tellus mauris a diam maecenas sed. Vitae auctor eu augue ut lectus. At lectus urna duis convallis convallis. Gravida cum sociis natoque penatibus et. A erat nam at lectus urna duis convallis. Ut tristique et egestas quis ipsum suspendisse. Ullamcorper morbi tincidunt ornare massa eget. Nec ultrices dui sapien eget mi proin sed libero enim. In ornare quam viverra orci sagittis eu volutpat. Metus dictum at tempor commodo ullamcorper a lacus. Nullam non nisi est sit amet facilisis. Aliquam nulla facilisi cras fermentum odio. In metus vulputate eu scelerisque felis imperdiet proin fermentum. Nec nam aliquam sem et. Fermentum odio eu feugiat pretium. Nec nam aliquam sem et tortor consequat id porta nibh. Amet consectetur adipiscing elit pellentesque.', '2023-01-26 09:17:23', '2023-01-26 09:17:23', 1, NULL, 4, NULL),
(24, 'Ultrices eros in cursus turpis', 'ultrices-eros-in-cursus-turpis', 'eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque', NULL, 45, 1, 1, 1, 1, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium viverra suspendisse potenti nullam ac. Aliquam malesuada bibendum arcu vitae. Pharetra sit amet aliquam id. Ultricies mi quis hendrerit dolor magna eget est lorem ipsum. Libero volutpat sed cras ornare arcu dui vivamus. Elit pellentesque habitant morbi tristique senectus et netus. Eros donec ac odio tempor. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium. Magna sit amet purus gravida. Volutpat maecenas volutpat blandit aliquam etiam. Nisl suscipit adipiscing bibendum est ultricies. Scelerisque purus semper eget duis at tellus at. Justo donec enim diam vulputate ut. Neque aliquam vestibulum morbi blandit cursus risus at. Odio facilisis mauris sit amet massa vitae tortor condimentum lacinia.\r\n\r\nVolutpat consequat mauris nunc congue nisi vitae. Congue nisi vitae suscipit tellus mauris a diam maecenas sed. Vitae auctor eu augue ut lectus. At lectus urna duis convallis convallis. Gravida cum sociis natoque penatibus et. A erat nam at lectus urna duis convallis. Ut tristique et egestas quis ipsum suspendisse. Ullamcorper morbi tincidunt ornare massa eget. Nec ultrices dui sapien eget mi proin sed libero enim. In ornare quam viverra orci sagittis eu volutpat. Metus dictum at tempor commodo ullamcorper a lacus. Nullam non nisi est sit amet facilisis. Aliquam nulla facilisi cras fermentum odio. In metus vulputate eu scelerisque felis imperdiet proin fermentum. Nec nam aliquam sem et. Fermentum odio eu feugiat pretium. Nec nam aliquam sem et tortor consequat id porta nibh. Amet consectetur adipiscing elit pellentesque.', '2023-01-26 09:22:27', '2023-01-26 09:22:27', 1, NULL, 6, NULL),
(25, 'Eget mi proin sed libero', 'eget-mi-proin-sed-libero', 'sed velit dignissim sodales ut eu sem integer vitae justo eget magna fermentum', NULL, 40, 1, 1, NULL, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium viverra suspendisse potenti nullam ac. Aliquam malesuada bibendum arcu vitae. Pharetra sit amet aliquam id. Ultricies mi quis hendrerit dolor magna eget est lorem ipsum. Libero volutpat sed cras ornare arcu dui vivamus. Elit pellentesque habitant morbi tristique senectus et netus. Eros donec ac odio tempor. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium. Magna sit amet purus gravida. Volutpat maecenas volutpat blandit aliquam etiam. Nisl suscipit adipiscing bibendum est ultricies. Scelerisque purus semper eget duis at tellus at. Justo donec enim diam vulputate ut. Neque aliquam vestibulum morbi blandit cursus risus at. Odio facilisis mauris sit amet massa vitae tortor condimentum lacinia.\r\n\r\nVolutpat consequat mauris nunc congue nisi vitae. Congue nisi vitae suscipit tellus mauris a diam maecenas sed. Vitae auctor eu augue ut lectus. At lectus urna duis convallis convallis. Gravida cum sociis natoque penatibus et. A erat nam at lectus urna duis convallis. Ut tristique et egestas quis ipsum suspendisse. Ullamcorper morbi tincidunt ornare massa eget. Nec ultrices dui sapien eget mi proin sed libero enim. In ornare quam viverra orci sagittis eu volutpat. Metus dictum at tempor commodo ullamcorper a lacus. Nullam non nisi est sit amet facilisis. Aliquam nulla facilisi cras fermentum odio. In metus vulputate eu scelerisque felis imperdiet proin fermentum. Nec nam aliquam sem et. Fermentum odio eu feugiat pretium. Nec nam aliquam sem et tortor consequat id porta nibh. Amet consectetur adipiscing elit pellentesque.', '2023-01-26 09:22:27', '2023-01-26 09:22:27', 1, NULL, 7, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `accommodation_features`
--

CREATE TABLE `accommodation_features` (
  `id` int(11) NOT NULL,
  `accommodation_id` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address_1` varchar(155) DEFAULT NULL,
  `address_2` varchar(155) DEFAULT NULL,
  `zipcode` varchar(12) DEFAULT NULL,
  `city` varchar(155) DEFAULT NULL,
  `state` varchar(155) DEFAULT NULL,
  `country` varchar(155) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `checkin` date DEFAULT NULL,
  `checkout` date DEFAULT NULL,
  `travellers` int(11) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `accommodation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `booking_status`
--

CREATE TABLE `booking_status` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(75) NOT NULL,
  `description` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`) VALUES
(1, 'Maison', 'maison', NULL),
(2, 'Appartement', 'appartement', NULL),
(3, 'Grange', 'grange', NULL),
(4, 'Chambre d\'hôtes', 'chambre-d-hotes', NULL),
(6, 'Cabane', 'cabane', NULL),
(7, 'Caravane', 'caravane', NULL),
(9, 'Chateau', 'chateau', NULL),
(10, 'Maison troglodyte', 'maison-troglodyte', NULL),
(16, 'Ferme', 'ferme', NULL),
(25, 'Cabane de berger', 'cabane-de-berger', NULL),
(26, 'Tente', 'tente', NULL),
(27, 'Tiny house', 'tiny-house', NULL),
(29, 'Cabane perchée', 'cabane-perchee', NULL),
(31, 'Moulin à vent', 'moulin-a-vent', NULL),
(32, 'Yourte', 'yourte', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(75) NOT NULL,
  `classify` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `features`
--

INSERT INTO `features` (`id`, `name`, `slug`, `classify`) VALUES
(1, 'Wifi', 'wifi', 'Produits et services de base'),
(2, 'Cuisine', 'cuisine', 'Produits et services de base'),
(3, 'Lave-linge', 'lave-linge', 'Produits et services de base'),
(4, 'Sèche linge', 'seche-linge', 'Produits et services de base'),
(5, 'Climatisation', 'climatisation', 'Produits et services de base'),
(6, 'Chauffage', 'chauffage', 'Produits et services de base'),
(7, 'Espace de travail dédié', 'espace-de-travail-dedie', 'Produits et services de base'),
(8, 'Télévision', 'television', 'Produits et services de base'),
(9, 'Sèche-cheveux', 'seche-cheveux', 'Produits et services de base'),
(10, 'Fer à repasser', 'fer-a-repasser', 'Produits et services de base'),
(11, 'Piscine', 'piscine', 'Caractéristiques'),
(12, 'Jaccuzzi', 'jaccuzzi', 'Caractéristiques'),
(13, 'Parking gratuit sur place', 'parking-gratuit-sur-place', 'Caractéristiques'),
(14, 'Station de recharge pour véhicules électriques', 'station-de-recharge-pour-vehicules-electriques', 'Caractéristiques'),
(15, 'Lit pour bébé', 'lit-pour-bebe', 'Caractéristiques'),
(16, 'Salle de sport', 'salle-de-sport', 'Caractéristiques'),
(17, 'Barbecue', 'barbecue', 'Caractéristiques'),
(18, 'Petit déjeuner', 'petit-dejeuner', 'Caractéristiques'),
(19, 'Cheminée', 'cheminee', 'Caractéristiques'),
(20, 'Logement fumeur', 'logement-fumeur', 'Caractéristiques'),
(21, 'Bord de mer', 'bord-de-mer', 'Emplacement'),
(22, 'Front de mer', 'front-de-mer', 'Emplacement'),
(23, 'Au pied des pistes', 'au-pied-des-pistes', 'Emplacement'),
(24, 'Campagne', 'campagne', 'Emplacement'),
(25, 'Montagne', 'montagne', 'Emplacement'),
(26, 'Centre ville', 'centre-ville', 'Emplacement'),
(27, 'Bord de lac', 'bord-de-lac', 'Emplacement'),
(28, 'Sous les tropiques', 'sous-les-tropiques', 'Emplacement'),
(29, 'Ville emblématique', 'ville-emblematique', 'Emplacement'),
(30, 'Parc national', 'parc-national', 'Emplacement'),
(31, 'Vignoble', 'vignoble', 'Emplacement'),
(32, 'Détecteur de fumée', 'detecteur-de-fumee', 'Sécurité'),
(33, 'Détecteur de monoxyde de carbone', 'detecteur-de-monoxyde-de-carbone', 'Sécurité'),
(34, 'Largeur de portes supérieur à 81 cm', 'largeur-de-portes-superieur-a-81-cm', 'Accessibilité'),
(35, 'Entrée de plein pieds', 'entree-de-plein-pieds', 'Accessibilité'),
(36, 'Place de parking accessible', 'place-de-parking-accessible', 'Accessibilité'),
(37, 'Maison', 'maison', 'Type de propriété'),
(38, 'Appartement', 'appartement', 'Type de propriété'),
(39, 'Maison d\'hôtes', 'maison-d-hotes', 'Type de propriété'),
(40, 'Hôtel', 'hotel', 'Type de propriété');

-- --------------------------------------------------------

--
-- Structure de la table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20230124081413, 'CreateCategoriesTable', '2023-01-24 14:51:46', '2023-01-24 14:51:46', 0),
(20230124081641, 'CreateTypesTable', '2023-01-24 14:51:46', '2023-01-24 14:51:46', 0),
(20230124081845, 'CreateFeaturesTable', '2023-01-24 14:51:46', '2023-01-24 14:51:46', 0),
(20230124082936, 'CreateAddressTable', '2023-01-24 14:51:46', '2023-01-24 14:51:46', 0),
(20230124084117, 'CreateBookingsTable', '2023-01-24 14:51:46', '2023-01-24 14:51:46', 0),
(20230124085600, 'CreateAccommodationsTable', '2023-01-24 14:51:46', '2023-01-24 14:51:46', 0),
(20230124092535, 'CreateRolesTable', '2023-01-24 14:51:46', '2023-01-24 14:51:46', 0),
(20230124100036, 'CreateUsersTable', '2023-01-24 14:51:46', '2023-01-24 14:51:46', 0),
(20230124143416, 'CreateUserAddressTable', '2023-01-24 14:51:46', '2023-01-24 14:51:46', 0),
(20230124145020, 'CreateAccommodationFeaturesTable', '2023-01-24 14:51:46', '2023-01-24 14:51:46', 0),
(20230124145837, 'CreateBookingStatusTable', '2023-01-24 15:01:26', '2023-01-24 15:01:26', 0);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'member'),
(3, 'host');

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(75) NOT NULL,
  `description` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `types`
--

INSERT INTO `types` (`id`, `name`, `slug`, `description`) VALUES
(1, 'Un logement entier', 'un-logement-entier', NULL),
(2, 'Une chambre privée', 'une-chambre-privee', NULL),
(3, 'Une chambre partagée', 'une-chambre-partagee', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `capacity` varchar(25) DEFAULT 'user',
  `image` varchar(100) DEFAULT NULL,
  `user_address_id` int(11) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `shortbio` varchar(255) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `password_reset` varchar(100) DEFAULT NULL,
  `password_reset_at` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_address`
--

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accommodations`
--
ALTER TABLE `accommodations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accommodations_users_id_fk` (`user_id`),
  ADD KEY `accommodations_categories_id_fk` (`category_id`),
  ADD KEY `accommodations_types_id_fk` (`type_id`);

--
-- Index pour la table `accommodation_features`
--
ALTER TABLE `accommodation_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accommodation_features_accommodations_id_fk` (`accommodation_id`),
  ADD KEY `accommodation_features_features_id_fk` (`feature_id`);

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_booking_status_id_fk` (`status_id`),
  ADD KEY `bookings_accommodations_id_fk` (`accommodation_id`),
  ADD KEY `bookings_users_id_fk` (`user_id`);

--
-- Index pour la table `booking_status`
--
ALTER TABLE `booking_status`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `users_address_id_fk` (`user_address_id`),
  ADD KEY `users_roles_id_fk` (`role_id`);

--
-- Index pour la table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_address_users_id_fk` (`user_id`),
  ADD KEY `user_address_address_id_fk` (`address_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accommodations`
--
ALTER TABLE `accommodations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `accommodation_features`
--
ALTER TABLE `accommodation_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `booking_status`
--
ALTER TABLE `booking_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `accommodations`
--
ALTER TABLE `accommodations`
  ADD CONSTRAINT `accommodations_categories_id_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `accommodations_types_id_fk` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`),
  ADD CONSTRAINT `accommodations_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `accommodation_features`
--
ALTER TABLE `accommodation_features`
  ADD CONSTRAINT `accommodation_features_accommodations_id_fk` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodations` (`id`),
  ADD CONSTRAINT `accommodation_features_features_id_fk` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`);

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_accommodations_id_fk` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodations` (`id`),
  ADD CONSTRAINT `bookings_booking_status_id_fk` FOREIGN KEY (`status_id`) REFERENCES `booking_status` (`id`),
  ADD CONSTRAINT `bookings_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_address_id_fk` FOREIGN KEY (`user_address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `users_roles_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_address_id_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `user_address_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Base de données : `camping`
--
CREATE DATABASE IF NOT EXISTS `camping` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `camping`;
--
-- Base de données : `db_camping`
--
CREATE DATABASE IF NOT EXISTS `db_camping` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_camping`;

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `adult` int(11) NOT NULL,
  `child` int(11) DEFAULT NULL,
  `adult_pool` int(11) DEFAULT NULL,
  `child_pool` int(11) DEFAULT NULL,
  `position_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `status` varchar(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `booking`
--

INSERT INTO `booking` (`id`, `checkin`, `checkout`, `adult`, `child`, `adult_pool`, `child_pool`, `position_id`, `created_at`, `updated_at`, `status`, `customer_id`) VALUES
(1, '2023-05-05', '2023-05-12', 2, 1, 14, 7, 2, '2023-02-20 16:50:42', '2023-02-20 16:50:42', 'confirmed', 1),
(2, '2023-06-17', '2023-06-24', 2, 3, 14, 21, 6, '2023-02-20 16:54:24', '2023-02-20 16:54:24', 'confirmed', 2),
(3, '2023-05-16', '2023-05-18', 2, 1, 2, 1, 11, '2023-02-23 03:15:50', '2023-02-23 03:15:50', 'confirmed', 1),
(4, '2023-06-01', '2023-06-04', 2, NULL, 4, NULL, 6, '2023-02-23 03:21:13', '2023-02-23 03:21:13', 'pending', 2),
(5, '2023-05-05', '2023-05-16', 2, 0, 22, 0, 8, '2023-02-23 03:43:38', '2023-02-23 03:43:38', 'confirmed', 2);

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `city` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `siren` varchar(9) NOT NULL,
  `siret` varchar(14) NOT NULL,
  `tva_number` varchar(13) NOT NULL,
  `vat_rate` int(11) NOT NULL,
  `registration_city` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `company`
--

INSERT INTO `company` (`id`, `name`, `address`, `zipcode`, `city`, `email`, `phone`, `siren`, `siret`, `tva_number`, `vat_rate`, `registration_city`) VALUES
(1, 'l’Espadrille Volante', '123 Avenue de la Plage', '66750', 'Saint-Cyprien', 'contact@espadrille-volante.coop', '+33468535235', '831225673', '83122567300015', 'FR32831225673', 10, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_professional` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(6) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `is_optin_news` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`id`, `fullname`, `user_id`, `firstname`, `lastname`, `created_at`, `is_professional`, `address`, `zipcode`, `city`, `country`, `email`, `phone`, `is_optin_news`) VALUES
(1, 'Claire Mercier', NULL, 'Claire', 'Mercier', '2023-02-01 21:33:31', NULL, '37 Rue des Lilas', '75020', 'Paris', 'FR', 'claire.mercier@gmail.com', '+33 6 12 34 56 78', 1),
(2, 'Antoine Dupont', NULL, 'Antoine', 'Dupont', '2023-02-02 21:42:52', 1, '11 Rue de la Paix', '75001', 'Paris', 'FR', 'antoine.dupont@hotmail.com', '+33 6 98 76 54 32', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230219202828', '2023-02-19 20:28:33', 11),
('DoctrineMigrations\\Version20230219203417', '2023-02-19 20:34:21', 10),
('DoctrineMigrations\\Version20230219210234', '2023-02-19 21:02:40', 11),
('DoctrineMigrations\\Version20230220145503', '2023-02-20 14:55:16', 24),
('DoctrineMigrations\\Version20230221202317', '2023-02-21 20:23:30', 15),
('DoctrineMigrations\\Version20230221202815', '2023-02-21 20:28:29', 40),
('DoctrineMigrations\\Version20230224052100', '2023-02-24 05:21:14', 22);

-- --------------------------------------------------------

--
-- Structure de la table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `opt_in` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `fullname`, `opt_in`, `created_at`, `updated_at`) VALUES
(1, 'pierre@mick.fr', 'Pierre Mick', 1, '2023-02-16 21:37:40', '2023-02-16 21:37:40'),
(2, 'john.doe@exemple.org', 'John doe', 1, '2023-02-16 22:47:49', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

CREATE TABLE `option` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `adult_price` int(11) NOT NULL,
  `child_price` int(11) NOT NULL,
  `slug` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `option`
--

INSERT INTO `option` (`id`, `name`, `adult_price`, `child_price`, `slug`) VALUES
(1, 'Taxe', 60, 35, 'tax'),
(2, 'Piscine', 150, 100, 'pool');

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `image` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `type_id` int(11) NOT NULL,
  `lat` decimal(9,6) DEFAULT NULL,
  `lng` decimal(9,6) DEFAULT NULL,
  `sleeping` int(11) DEFAULT NULL,
  `shower` int(11) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `surface` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `position`
--

INSERT INTO `position` (`id`, `owner_id`, `name`, `slug`, `description`, `created_at`, `updated_at`, `image`, `active`, `type_id`, `lat`, `lng`, `sleeping`, `shower`, `room`, `surface`) VALUES
(1, 2, 'Savate sauvage', 'savate-sauvage', 'Un joli mobile home idéal pour une petite famille de trois personnes', '2023-02-14 17:01:47', '2023-02-17 01:35:10', 'la-sirene-hebergements-cocoon-2-4p-2ch-002.webp', 1, 1, NULL, NULL, 2, 1, 2, 20),
(2, 2, 'Espadrille enchantée', 'espadrille-enchantee', 'ce mobile homme est un vrai paradis familial', '2023-02-14 17:03:02', '2023-02-17 01:34:46', 'la-sirene-hebergements-cocoon-2-4p-2ch-001.webp', 1, 4, NULL, NULL, 5, 1, 3, 40),
(3, 3, 'Escarpin euphorique', 'escarpin-euphorique', 'Un mobile home spacieux pour 4 personnes...  Entre amis ou en famille...', '2023-02-14 18:18:08', '2023-02-17 01:37:34', 'la-sirene-hebergements-cottage-3-6p-3ch-001.webp', 1, 2, NULL, NULL, 2, 1, 2, 25),
(4, 5, 'Pantoufle pétillante', 'pantoufle-petillante', '2 chambres couple, une belle cuisine...', '2023-02-14 18:19:21', '2023-02-17 01:37:51', 'la-sirene-hebergements-sirene-2-4p-2ch-001.webp', 1, 2, NULL, NULL, 2, 1, 2, 25),
(5, 9, 'Tongue Tonitruante', 'tongue-tonitruante', NULL, '2023-02-17 01:39:36', '2023-02-17 01:39:42', 'la-sirene-hebergements-cottage-3-6p-3ch-002.webp', 1, 2, NULL, NULL, 3, 1, 1, 22),
(6, 1, 'Sandale sensuelle', 'sandale-sensuelle', 'la sandale sensuelle familiale', '2023-02-17 01:41:20', NULL, 'la-sirene-hebergements-sirene-3-6p-3ch-clim-004.webp', 1, 3, NULL, NULL, 4, 1, 3, 30),
(7, 12, 'Mule magique', 'mule-magique', NULL, '2023-02-17 01:45:39', NULL, 'la-sirene-hebergements-sirene-2-4p-2ch-005.webp', 1, 7, NULL, NULL, 4, 0, 3, 15),
(8, 1, 'Babouche brillante', 'babouche-brillante', NULL, '2023-02-17 01:47:01', '2023-02-23 04:42:09', 'la-sirene-hebergements-sirene-3-6p-3ch-clim-001.webp', 1, 1, NULL, NULL, 3, 1, 1, 18),
(11, 1, 'Pantoufle pétulante', 'pantoufle-petulante', 'Pour 3personnes', '2023-02-17 02:09:57', NULL, 'cosy-fr-1669213504.webp', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL,
  `capacity` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `active` tinyint(1) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `name`, `slug`, `capacity`, `description`, `created_at`, `updated_at`, `active`, `price`) VALUES
(1, 'Mobile Home 3 personnes', 'mobile-home-3-personnes', 3, 'Adapté pour un couple et un enfant...', '2023-02-13 20:40:20', '2023-02-13 22:04:07', 1, 2000),
(2, 'Mobile Home 4 personnes', 'mobile-home-4-personnes', 4, 'Parfait pour un couple et 2 enfants', '2023-02-13 20:52:55', '2023-02-13 22:04:17', 1, 2400),
(3, 'Mobile Home 5 personnes', 'mobile-home-5-personnes', 5, 'parfait pour 5 personnes', '2023-02-13 20:53:29', '2023-02-13 22:04:28', 1, 2700),
(4, 'Mobile Home 6-8 personnes', 'mobile-home-6-8-personnes', 8, 'parfait pour une famille nombreuses ou une bande d\'amis', '2023-02-13 20:54:23', '2023-02-13 22:04:56', 1, 3400),
(5, 'Caravane 2 places', 'caravane-2-places', 2, 'petite caravane pour 2 personnes', '2023-02-13 21:48:12', '2023-02-13 22:05:11', 1, 1500),
(6, 'Caravane 4 places', 'caravane-4-places', 4, 'Caravane pour un couple et deux enfants ou deux autres adultes', '2023-02-13 21:49:10', '2023-02-13 22:05:16', 1, 1800),
(7, 'Caravane 6 places', 'caravane-6-places', 6, 'un grande caravane', '2023-02-13 21:50:42', '2023-02-13 22:05:21', 1, 2400),
(8, 'Emplacement 8 m2', 'emplacement-8-m2', 4, 'emplacement pour une tente maximum 4m2 (soit 4 personnes)', '2023-02-13 21:55:03', '2023-02-13 21:58:17', 1, 1200),
(9, 'Emplacement 12 m2', 'emplacement-12-m2', 6, 'Emplacement pour tente maxi 6 m2 (soit 6 personnes maximum)', '2023-02-13 21:57:55', '2023-02-13 22:05:26', 1, 1400);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `is_team` tinyint(1) DEFAULT NULL,
  `is_owner` tinyint(1) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `phone`, `is_team`, `is_owner`, `avatar`) VALUES
(1, 'pierre@mick.fr', '[\"ROLE_ADMIN\"]', '$2y$13$zEn7XcGB8NmShZ5ZKwN1peJWWB981cwg1.3p7QPoFOfqXySSwpl0m', 'Pierre', 'Mick', '+33 6 51 53 52 35', 1, 1, 'avatar-pierre-mick.jpg'),
(2, 'john.doe@exemple.org', '[]', '$2y$13$cg6LqqBVd421K10bKKjtduejr5nCcHtCWHttQ9898XIBaCkDck8cS', 'John', 'Doe', NULL, NULL, 1, NULL),
(3, 'marie-claire.dubois@example.org', '[]', '$2y$13$a6pF26sGjg.QZJO5HA4Id.XAcM9XxxyrP0A404HZizmf5qzW3Drh.', 'Marie-Claire', 'Dubois', NULL, NULL, 1, NULL),
(4, 'antoine.martin@example.org', '[]', '$2y$13$R7uzm/9t.ue2r7E55AilnuFOJpV1Sk6Q05.WMGbi8gZBh6w6F15WK', 'Antoine', 'Martin', NULL, NULL, NULL, NULL),
(5, 'adele.moreau@example.org', '[]', '$2y$13$.XStsmI1q5ouBfauVFCGY.RKSTAVPil35m2RW7b/pPwJ8M0C4gsXO', 'Adèle', 'Moreau', NULL, NULL, 1, NULL),
(6, 'mathieu.girard@example.org', '[]', '$2y$13$cg6LqqBVd421K10bKKjtduejr5nCcHtCWHttQ9898XIBaCkDck8cS', 'Mathieu', 'Girard', NULL, NULL, NULL, NULL),
(7, 'anais.leroy@example.org', '[]', '$2y$13$mVxft4tId1lNVNeUjnfXju.391dcvUVBVxGHnUTcGwQ6DavlnaLyy', 'Anaïs', 'Leroy', NULL, NULL, NULL, NULL),
(8, 'julien.bernard@example.org', '[]', '$2y$13$cg6LqqBVd421K10bKKjtduejr5nCcHtCWHttQ9898XIBaCkDck8cS', 'Julien', 'Bernard', NULL, NULL, 1, NULL),
(9, 'chloe.durand@example.org', '[]', '$2y$13$cg6LqqBVd421K10bKKjtduejr5nCcHtCWHttQ9898XIBaCkDck8cS', 'Chloé', 'Durand', NULL, NULL, 1, NULL),
(10, 'lucie.lefevre@example.org', '[]', '$2y$13$cg6LqqBVd421K10bKKjtduejr5nCcHtCWHttQ9898XIBaCkDck8cS', 'Lucie', 'Lefevre', NULL, NULL, 1, NULL),
(11, 'maxime.laurent@example.org', '[]', '$2y$13$cg6LqqBVd421K10bKKjtduejr5nCcHtCWHttQ9898XIBaCkDck8cS', 'Maxime', 'Laurent', NULL, NULL, 1, NULL),
(12, 'emma.dupont@example.org', '[]', '$2y$13$cg6LqqBVd421K10bKKjtduejr5nCcHtCWHttQ9898XIBaCkDck8cS', 'Emma', 'Dupont', NULL, NULL, 1, NULL),
(13, 'pmick.project@gmail.com', '[]', '$2y$13$ylizi1dkMf3lAdnNXyJQx.dWxemDfF3czT4adBBiHhQkZnXVnvcVC', 'PIERRE', 'MICK', '+33651535235', NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E00CEDDEDD842E46` (`position_id`),
  ADD KEY `IDX_E00CEDDE9395C3F3` (`customer_id`);

--
-- Index pour la table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_81398E09A76ED395` (`user_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_140AB6205E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_140AB620989D9B62` (`slug`);

--
-- Index pour la table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_462CE4F55E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_462CE4F5989D9B62` (`slug`),
  ADD KEY `IDX_462CE4F57E3C61F9` (`owner_id`),
  ADD KEY `IDX_462CE4F5C54C8C93` (`type_id`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8CDE57295E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_8CDE5729989D9B62` (`slug`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `option`
--
ALTER TABLE `option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_E00CEDDE9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FK_E00CEDDEDD842E46` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`);

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_81398E09A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `FK_462CE4F57E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_462CE4F5C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);
--
-- Base de données : `db_keblo`
--
CREATE DATABASE IF NOT EXISTS `db_keblo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_keblo`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230225051735', '2023-02-25 05:17:49', 22),
('DoctrineMigrations\\Version20230225052127', '2023-02-25 05:21:31', 12),
('DoctrineMigrations\\Version20230225052528', '2023-02-25 05:25:34', 11),
('DoctrineMigrations\\Version20230225063321', '2023-02-25 06:33:46', 13),
('DoctrineMigrations\\Version20230225063553', '2023-02-25 06:35:57', 9),
('DoctrineMigrations\\Version20230225194839', '2023-02-25 19:48:52', 10),
('DoctrineMigrations\\Version20230225195022', '2023-02-25 19:50:25', 10),
('DoctrineMigrations\\Version20230225204752', '2023-02-25 20:48:08', 12),
('DoctrineMigrations\\Version20230225213112', '2023-02-25 21:31:15', 14),
('DoctrineMigrations\\Version20230225220649', '2023-02-25 22:07:01', 14),
('DoctrineMigrations\\Version20230225222309', '2023-02-25 22:23:16', 8),
('DoctrineMigrations\\Version20230225222525', '2023-02-25 22:25:31', 25),
('DoctrineMigrations\\Version20230225222746', '2023-02-25 22:27:53', 14),
('DoctrineMigrations\\Version20230225222858', '2023-02-25 22:29:02', 23),
('DoctrineMigrations\\Version20230225223707', '2023-02-25 22:37:13', 13),
('DoctrineMigrations\\Version20230225223923', '2023-02-25 22:39:26', 36),
('DoctrineMigrations\\Version20230225225326', '2023-02-25 22:53:31', 16),
('DoctrineMigrations\\Version20230225230205', '2023-02-25 23:02:11', 21),
('DoctrineMigrations\\Version20230225230921', '2023-02-25 23:09:27', 12),
('DoctrineMigrations\\Version20230225231249', '2023-02-25 23:12:56', 10),
('DoctrineMigrations\\Version20230225231400', '2023-02-25 23:14:06', 11),
('DoctrineMigrations\\Version20230225232140', '2023-02-25 23:21:44', 8),
('DoctrineMigrations\\Version20230225232418', '2023-02-25 23:24:26', 9),
('DoctrineMigrations\\Version20230225232653', '2023-02-25 23:26:56', 10),
('DoctrineMigrations\\Version20230225234911', '2023-02-25 23:49:16', 19),
('DoctrineMigrations\\Version20230226172517', '2023-02-26 17:25:26', 20);

-- --------------------------------------------------------

--
-- Structure de la table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` varchar(100) NOT NULL,
  `answer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:161:\\\"https://keblo.dev/verify/email?expires=1677274563&signature=jr3WO%2FvJrGGfyeA8uLmz7IuliTnthnwtdcK6I4AAAIM%3D&token=QnrN2h9zQlvTOB3IEkPdkxjLVIQbs59fI8USSD9E6O4%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"mailer@keblo.email\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:5:\\\"Keblo\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"pierre@mick.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2023-02-24 20:36:03', '2023-02-24 20:36:03', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(150) NOT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `featured_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `page`
--

INSERT INTO `page` (`id`, `name`, `slug`, `title`, `description`, `content`, `created_at`, `featured_image`) VALUES
(1, 'à propos', 'a-propos', 'À propos', 'une description de 150 caractères environ', 'Contenu de la page', '2023-02-25 06:34:10', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(150) NOT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `featured_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quote`
--

CREATE TABLE `quote` (
  `id` int(11) NOT NULL,
  `citation` varchar(255) NOT NULL,
  `featured_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `born_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `email` varchar(180) NOT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `is_organization` tinyint(1) DEFAULT NULL,
  `opt_in` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updatet_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `avatar`, `firstname`, `lastname`, `born_at`, `email`, `phone`, `password`, `roles`, `is_organization`, `opt_in`, `created_at`, `updatet_at`) VALUES
(1, NULL, NULL, NULL, NULL, 'pierre@mick.fr', NULL, '$2y$13$oXoLtKGMNV5AP33sy0LMRePreueGHtjV4Y5JouAY68UjTkJK/hBDu', '[\"ROLE_ADMIN\"]', NULL, NULL, '2023-02-25 05:37:57', NULL),
(2, NULL, NULL, NULL, NULL, 'pmick.project@gmail.com', NULL, '$2y$13$UtGXAvhkqHVK9UfpjQm7r.TfA7A34VBi2IPxwDbvG5pP47ej4er5.', '[]', NULL, NULL, '2023-02-25 06:14:21', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `worker`
--

CREATE TABLE `worker` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `my_activity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `worker_job`
--

CREATE TABLE `worker_job` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `worker_job`
--

INSERT INTO `worker_job` (`id`, `name`, `slug`, `description`) VALUES
(1, 'Consultant en stratégie', 'consultant-en-strategie', 'Le consultant en stratégie aide les entreprises à définir leur plan d\'action et leur stratégie en fonction de leurs objectifs à long terme et de leur environnement concurrentiel.'),
(2, 'Développeur web', 'developpeur-web', 'Le développeur web crée et entretient des sites web pour les entreprises et les organisations en utilisant des langages de programmation comme HTML, CSS, JavaScript, etc.'),
(13, 'Consultant en ressources humaines', 'consultant-en-ressources-humaines', 'Le consultant en ressources humaines aide les entreprises à recruter, former et gérer leur personnel en fonction de leurs besoins et de leur culture d\'entreprise.'),
(14, 'Traducteur / interprète', 'traducteur-interprete', 'Le traducteur / interprète aide les entreprises à communiquer avec des clients ou des partenaires internationaux en traduisant des documents ou en fournissant des services d\'interprétation.'),
(15, 'Spécialiste en marketing digital', 'specialiste-en-marketing-digital', 'Le spécialiste en marketing digital aide les entreprises à promouvoir leur marque, à générer des leads et à convertir des clients en utilisant des techniques de marketing numérique comme le référencement naturel.'),
(16, 'Coach en développement personnel', 'coach-en-developpement-personnel', 'Le coach en développement personnel aide les individus et les équipes à atteindre leurs objectifs personnels et professionnels en identifiant leurs forces et leurs faiblesses et en leur fournissant des outils et des stratégies pour se développer.'),
(17, 'Consultant en organisation', 'consultant-en-organisation', 'Le consultant en organisation aide les entreprises à améliorer leur efficacité et leur productivité en optimisant leurs processus, leurs structures organisationnelles, etc.'),
(18, 'Graphiste', 'graphiste', 'Le graphiste crée des designs visuels pour les entreprises, tels que des logos, des supports de communication, des sites web, etc.'),
(19, 'Coach en leadership', 'coach-en-leadership', 'Le coach en leadership aide les cadres et les managers à développer leur capacité de leadership en fournissant des conseils et des outils pour gérer leur équipe, résoudre les conflits, etc.'),
(20, 'Développeur de logiciels', 'developpeur-de-logiciels', 'Le développeur de logiciels crée des applications, des programmes et des systèmes informatiques en utilisant des langages de programmation comme Java, Python, C++, etc.'),
(21, 'Ingénieur en intelligence artificielle', 'ingenieur-en-intelligence-artificielle', 'L\'ingénieur en intelligence artificielle développe des systèmes d\'IA pour les entreprises, en utilisant des techniques telles que le deep learning, le traitement du langage naturel, la reconnaissance d\'images, etc.'),
(22, 'Consultant en cybersécurité', 'consultant-en-cybersecurite', 'Le consultant en cybersécurité aide les entreprises à protéger leurs systèmes informatiques contre les cyberattaques en identifiant les failles de sécurité, en mettant en place des mesures de sécurité, en formant les employés, etc.');

-- --------------------------------------------------------

--
-- Structure de la table `worker_service`
--

CREATE TABLE `worker_service` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `worker_skill`
--

CREATE TABLE `worker_skill` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `worker_status`
--

CREATE TABLE `worker_status` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `worker_status`
--

INSERT INTO `worker_status` (`id`, `name`, `slug`) VALUES
(1, 'Entreprise Individuelle', 'entreprise-individuelle'),
(2, 'Micro Entreprise', 'micro-entreprise'),
(3, 'Entrepreneur Salarié', 'entrepreneur-salarie'),
(4, 'Portage Salarial', 'portage-salarial'),
(5, 'SASU', 'sasu'),
(6, 'EURL', 'eurl');

-- --------------------------------------------------------

--
-- Structure de la table `worker_type`
--

CREATE TABLE `worker_type` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_64C19C15E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_64C19C1989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_64C19C19C74FFC5` (`featured_image`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_140AB6205E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_140AB620989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_140AB6209C74FFC5` (`featured_image`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5A8A6C8D5E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_5A8A6C8D989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_5A8A6C8D9C74FFC5` (`featured_image`);

--
-- Index pour la table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `IDX_5ACE3AF04B89032C` (`post_id`),
  ADD KEY `IDX_5ACE3AF0BAD26311` (`tag_id`);

--
-- Index pour la table `quote`
--
ALTER TABLE `quote`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_389B7835E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_389B783989D9B62` (`slug`);

--
-- Index pour la table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9FB2BF62A76ED395` (`user_id`);

--
-- Index pour la table `worker_job`
--
ALTER TABLE `worker_job`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `worker_service`
--
ALTER TABLE `worker_service`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `worker_skill`
--
ALTER TABLE `worker_skill`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `worker_status`
--
ALTER TABLE `worker_status`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `worker_type`
--
ALTER TABLE `worker_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `quote`
--
ALTER TABLE `quote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `worker`
--
ALTER TABLE `worker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `worker_job`
--
ALTER TABLE `worker_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `worker_service`
--
ALTER TABLE `worker_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `worker_skill`
--
ALTER TABLE `worker_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `worker_status`
--
ALTER TABLE `worker_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `worker_type`
--
ALTER TABLE `worker_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `FK_5ACE3AF04B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5ACE3AF0BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `FK_9FB2BF62A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--
-- Base de données : `db_symfony`
--
CREATE DATABASE IF NOT EXISTS `db_symfony` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_symfony`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `featured_image` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `udated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `user_id`, `category_id`, `name`, `slug`, `title`, `description`, `content`, `created_at`, `updated_at`, `featured_image`, `active`, `udated_at`) VALUES
(1, NULL, 2, 'premier article', 'premier-article', 'Titre du premier articles', 'Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam venenatis velit sit amet dictum bibendum. Duis justo nulla, sodales vitae posuere.', '<div>contenu de l\'article</div>', '2023-02-07 21:21:36', '2023-02-07 22:20:42', '240x135.png', 1, NULL),
(2, NULL, 1, 'deuxième article', 'deuxieme-article', 'Titre du deuxième articles', 'Phasellus eleifend dignissim urna, ac commodo ante scelerisque vel. Integer elementum pretium felis vel dictum. Fusce malesuada metus.', '<div>contenu de l\'article</div>', '2023-02-07 21:21:36', '2023-02-07 22:21:02', '240x135.png', 1, NULL),
(3, NULL, 2, 'troisième article', 'troisieme-article', 'Titre du troisieme articles', 'Vivamus ac nulla odio. Vivamus sit amet elit luctus, convallis tellus vel, faucibus neque. Vestibulum vehicula mi at quam commodo, ut luctus metu.', '<div>contenu de l\'article</div>', '2023-02-07 21:21:36', '2023-02-07 22:21:20', '240x135.png', 1, NULL),
(4, NULL, 2, 'quatrième article', 'quatrieme-article', 'Titre du quatrième article', 'Fusce venenatis fringilla ligula at pharetra. Praesent lacinia massa non sem mollis, nec sodales tellus ultricies. Curabitur viverra eget nisi in est.', '<div>contenu de l\'article</div>', '2023-02-07 21:21:36', '2023-02-07 22:21:36', '240x135.png', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `slug` varchar(65) NOT NULL,
  `description` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `active`, `created_at`, `updated_at`, `slug`, `description`) VALUES
(1, 'Catégorie 1', 1, '2023-02-07 21:19:10', NULL, 'categorie-1', 'description de la catégorie avec un texte de 150 caractères maximum qui sera utilisé dans la balise meta description...'),
(2, 'Catégorie 2', 1, '2023-02-07 21:25:01', NULL, 'categorie-2', 'Phasellus eleifend dignissim urna, ac commodo ante scelerisque vel. Integer elementum pretium felis vel dictum. Fusce malesuada metus placerat mauris.');

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `code` varchar(2) NOT NULL,
  `name` varchar(60) NOT NULL,
  `slug` varchar(60) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `county`
--

CREATE TABLE `county` (
  `id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `number` varchar(3) NOT NULL,
  `name` varchar(40) NOT NULL,
  `slug` varchar(40) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230207211354', '2023-02-07 21:14:08', 163);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `slug` varchar(40) NOT NULL,
  `code` varchar(6) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `genre` varchar(1) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `genre`, `birthdate`, `created_at`) VALUES
(1, 'pierre@mick.fr', '[\"ROLE_ADMIN\"]', '$2y$13$T3gIgy/WYhyQCRDHgEitJeLIKLvAeTmDwb1BSiwbkGPvuBzsxYGj.', 'Pierre', 'Mick', NULL, NULL, '2023-02-07 21:14:49');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E66A76ED395` (`user_id`),
  ADD KEY `IDX_23A0E6612469DE2` (`category_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5373C96677153098` (`code`),
  ADD UNIQUE KEY `UNIQ_5373C9665E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_5373C966989D9B62` (`slug`);

--
-- Index pour la table `county`
--
ALTER TABLE `county`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_58E2FF2596901F54` (`number`),
  ADD UNIQUE KEY `UNIQ_58E2FF255E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_58E2FF25989D9B62` (`slug`),
  ADD KEY `IDX_58E2FF255D83CC1` (`state_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A393D2FB5E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_A393D2FB989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_A393D2FB77153098` (`code`),
  ADD KEY `IDX_A393D2FBF92F3E70` (`country_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `county`
--
ALTER TABLE `county`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E6612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_23A0E66A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `county`
--
ALTER TABLE `county`
  ADD CONSTRAINT `FK_58E2FF255D83CC1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`);

--
-- Contraintes pour la table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `FK_A393D2FBF92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);
--
-- Base de données : `dev_accommodation`
--
CREATE DATABASE IF NOT EXISTS `dev_accommodation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dev_accommodation`;

-- --------------------------------------------------------

--
-- Structure de la table `accommodations`
--

CREATE TABLE `accommodations` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(150) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `zipcode` varchar(8) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `travellers` int(3) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `bed_room` int(2) DEFAULT NULL,
  `bed_double` int(2) DEFAULT NULL,
  `bed_single` int(2) DEFAULT NULL,
  `bath_room` int(2) DEFAULT NULL,
  `bath_private` tinyint(1) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `accommodation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `check_status` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(150) NOT NULL,
  `classify` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `features_accommodations`
--

CREATE TABLE `features_accommodations` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `accommodation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` int(45) NOT NULL,
  `role` varchar(25) DEFAULT 'user',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `password_reset` varchar(45) DEFAULT NULL,
  `password_reset_at` datetime DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `genre` varchar(15) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `zipcode` varchar(8) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `is_professional` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accommodations`
--
ALTER TABLE `accommodations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `image` (`image`),
  ADD KEY `accommodations_categories_id_fk` (`category_id`),
  ADD KEY `accommodations_users_id_fk` (`user_id`);

--
-- Index pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_accommodations_id_fk` (`accommodation_id`),
  ADD KEY `bookings_users_id_fk` (`user_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `image` (`image`);

--
-- Index pour la table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `features_accommodations`
--
ALTER TABLE `features_accommodations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `features_accommodations_features_id_fk` (`feature_id`),
  ADD KEY `features_accommodations_accommodations_id_fk` (`accommodation_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accommodations`
--
ALTER TABLE `accommodations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `features_accommodations`
--
ALTER TABLE `features_accommodations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `accommodations`
--
ALTER TABLE `accommodations`
  ADD CONSTRAINT `accommodations_categories_id_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `accommodations_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_accommodations_id_fk` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodations` (`id`),
  ADD CONSTRAINT `bookings_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `features_accommodations`
--
ALTER TABLE `features_accommodations`
  ADD CONSTRAINT `features_accommodations_accommodations_id_fk` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodations` (`id`),
  ADD CONSTRAINT `features_accommodations_features_id_fk` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`);
--
-- Base de données : `ovh-keblo`
--
CREATE DATABASE IF NOT EXISTS `ovh-keblo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ovh-keblo`;

-- --------------------------------------------------------

--
-- Structure de la table `organization`
--

CREATE TABLE `organization` (
  `org_id` int(11) NOT NULL,
  `org_name` varchar(65) NOT NULL,
  `org_slug` varchar(65) NOT NULL,
  `org_type` enum('asso','scic','scop','other') DEFAULT NULL,
  `org_status` enum('sa','sarl','sas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `firstname` varchar(65) NOT NULL,
  `lastname` varchar(65) NOT NULL,
  `genre` tinyint(4) NOT NULL,
  `birth_date` date NOT NULL DEFAULT current_timestamp(),
  `birth_city` varchar(100) DEFAULT NULL,
  `birth_county` varchar(2) NOT NULL,
  `birth_country` varchar(2) NOT NULL,
  `nationality` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(16) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_role` tinyint(1) NOT NULL,
  `user_created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`org_id`),
  ADD UNIQUE KEY `organization_name` (`org_name`),
  ADD UNIQUE KEY `organization_slug` (`org_slug`);

--
-- Index pour la table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `organization`
--
ALTER TABLE `organization`
  MODIFY `org_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Base de données : `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Structure de la table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Structure de la table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Structure de la table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Settings related to Designer';

--
-- Déchargement des données de la table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved export templates';

--
-- Déchargement des données de la table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'BDD PDF', '{\"quick_or_custom\":\"quick\",\"what\":\"pdf\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"activity\",\"category\",\"collectif\",\"cooperative\",\"customer\",\"doctrine_migration_versions\",\"entrepreneur\",\"entrepreneur_activity\",\"job\",\"landing_page\",\"messenger_messages\",\"partner\",\"post\",\"product\",\"question\",\"service\",\"service_entrepreneur\",\"skill\",\"support\",\"territory\",\"user\"],\"table_data[]\":[\"activity\",\"category\",\"collectif\",\"cooperative\",\"customer\",\"doctrine_migration_versions\",\"entrepreneur\",\"entrepreneur_activity\",\"job\",\"landing_page\",\"messenger_messages\",\"partner\",\"post\",\"product\",\"question\",\"service\",\"service_entrepreneur\",\"skill\",\"support\",\"territory\",\"user\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure de la table @TABLE@\",\"latex_structure_continued_caption\":\"Structure de la table @TABLE@ (suite)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenu de la table @TABLE@\",\"latex_data_continued_caption\":\"Contenu de la table @TABLE@ (suite)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"table_structure[]\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Structure de la table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Structure de la table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Recently accessed tables';

--
-- Déchargement des données de la table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('accommodation', '[{\"db\":\"dev_accommodation\",\"table\":\"accommodations\"},{\"db\":\"dev_accommodation\",\"table\":\"users\"}]'),
('camping', '[{\"db\":\"db_camping\",\"table\":\"booking\"},{\"db\":\"db_camping\",\"table\":\"company\"},{\"db\":\"db_camping\",\"table\":\"position\"},{\"db\":\"db_camping\",\"table\":\"customer\"},{\"db\":\"db_camping\",\"table\":\"user\"},{\"db\":\"db_camping\",\"table\":\"doctrine_migration_versions\"},{\"db\":\"db_camping\",\"table\":\"type\"},{\"db\":\"db_camping\",\"table\":\"page\"},{\"db\":\"db_camping\",\"table\":\"contact\"},{\"db\":\"db_camping\",\"table\":\"newsletter\"}]'),
('pierre', '[{\"db\":\"airbnb\",\"table\":\"accommodations\"},{\"db\":\"airbnb\",\"table\":\"users\"},{\"db\":\"airbnb\",\"table\":\"roles\"},{\"db\":\"airbnb\",\"table\":\"categories\"},{\"db\":\"ovh-keblo\",\"table\":\"user\"},{\"db\":\"ovh-keblo\",\"table\":\"role\"},{\"db\":\"ovh-keblo\",\"table\":\"user_role\"},{\"db\":\"ovh-keblo\",\"table\":\"person\"},{\"db\":\"ovh-keblo\",\"table\":\"organization\"},{\"db\":\"ovh-keblo\",\"table\":\"org_status\"}]'),
('root', '[{\"db\":\"db_keblo\",\"table\":\"worker_status\"},{\"db\":\"db_keblo\",\"table\":\"worker_skill\"},{\"db\":\"db_keblo\",\"table\":\"worker_service\"},{\"db\":\"db_keblo\",\"table\":\"worker_job\"},{\"db\":\"db_keblo\",\"table\":\"user\"},{\"db\":\"db_camping\",\"table\":\"user\"},{\"db\":\"db_keblo\",\"table\":\"worker\"},{\"db\":\"db_keblo\",\"table\":\"cooperative\"},{\"db\":\"db_keblo\",\"table\":\"faq\"},{\"db\":\"db_keblo\",\"table\":\"post_tag\"}]'),
('video-games', '[{\"db\":\"video-games\",\"table\":\"jeu\"},{\"db\":\"video-games\",\"table\":\"restriction_age\"},{\"db\":\"video-games\",\"table\":\"console\"},{\"db\":\"video-games\",\"table\":\"game_console\"}]');

-- --------------------------------------------------------

--
-- Structure de la table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Structure de la table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Structure de la table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Déchargement des données de la table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('accommodation', '2023-01-30 17:05:02', '{\"lang\":\"fr\",\"Console\\/Mode\":\"collapse\"}'),
('airbnb', '2023-02-14 11:00:35', '{\"lang\":\"fr\",\"Console\\/Mode\":\"collapse\"}'),
('camping', '2023-02-27 07:57:48', '{\"lang\":\"fr\",\"Console\\/Mode\":\"collapse\"}'),
('pierre', '2023-01-26 18:42:17', '{\"lang\":\"fr\",\"Console\\/Mode\":\"collapse\"}'),
('root', '2023-02-26 15:52:59', '{\"lang\":\"fr\",\"Console\\/Mode\":\"collapse\"}'),
('video-games', '2022-11-24 06:10:44', '{\"lang\":\"fr\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Structure de la table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Users and their assignments to user groups';

--
-- Déchargement des données de la table `pma__users`
--

INSERT INTO `pma__users` (`username`, `usergroup`) VALUES
('video-games', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Index pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index pour la table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Index pour la table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index pour la table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Index pour la table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index pour la table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index pour la table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index pour la table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index pour la table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index pour la table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de données : `pierre`
--
CREATE DATABASE IF NOT EXISTS `pierre` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pierre`;
--
-- Base de données : `symfony`
--
CREATE DATABASE IF NOT EXISTS `symfony` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `symfony`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contract`
--

CREATE TABLE `contract` (
  `id` int(11) NOT NULL,
  `contract_type_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `contractor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contract_type`
--

CREATE TABLE `contract_type` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(165) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contract_type`
--

INSERT INTO `contract_type` (`id`, `code`, `name`, `description`) VALUES
(1, 'CAPE', 'contrat d\'appui au projet d\'entreprise', 'description du CAPE 255 caratères maximum et 150 caractères minumum...'),
(2, 'CES', 'contrat d\'entrepreneur salarié', 'description du CES 255 caratères maximum et 150 caractères minumum...'),
(3, 'CESA', 'contrat d\'entrepreneur salarié associé', 'description du CESA 255 caratères maximum et 150 caractères minumum...');

-- --------------------------------------------------------

--
-- Structure de la table `cooperative`
--

CREATE TABLE `cooperative` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221104145745', '2022-11-04 14:58:04', 37),
('DoctrineMigrations\\Version20221104155437', '2022-11-04 15:55:12', 39),
('DoctrineMigrations\\Version20221105083047', '2022-11-05 08:30:59', 35),
('DoctrineMigrations\\Version20221105084351', '2022-11-05 08:44:04', 27),
('DoctrineMigrations\\Version20221105084521', '2022-11-05 08:45:29', 29),
('DoctrineMigrations\\Version20221105084705', '2022-11-05 08:47:12', 28),
('DoctrineMigrations\\Version20221105084813', '2022-11-05 08:48:18', 27),
('DoctrineMigrations\\Version20221105085706', '2022-11-05 08:57:16', 38),
('DoctrineMigrations\\Version20221105091530', '2022-11-05 09:15:37', 44),
('DoctrineMigrations\\Version20221105125858', '2022-11-05 13:00:13', 31),
('DoctrineMigrations\\Version20221105133038', '2022-11-05 13:30:51', 41),
('DoctrineMigrations\\Version20221106103903', '2022-11-06 10:39:16', 26),
('DoctrineMigrations\\Version20221107185830', '2022-11-07 18:58:41', 31),
('DoctrineMigrations\\Version20221109213609', '2022-11-09 21:36:24', 38),
('DoctrineMigrations\\Version20221111071753', '2022-11-11 07:18:08', 41),
('DoctrineMigrations\\Version20221111073048', '2022-11-11 07:30:56', 31),
('DoctrineMigrations\\Version20221111073540', '2022-11-11 07:35:48', 29),
('DoctrineMigrations\\Version20221111074112', '2022-11-11 07:41:20', 36),
('DoctrineMigrations\\Version20221111075257', '2022-11-11 07:53:03', 60),
('DoctrineMigrations\\Version20221111081454', '2022-11-11 08:15:01', 43),
('DoctrineMigrations\\Version20221111082752', '2022-11-11 08:28:04', 42),
('DoctrineMigrations\\Version20221111090935', '2022-11-11 09:09:40', 30),
('DoctrineMigrations\\Version20221111091416', '2022-11-11 09:14:20', 27),
('DoctrineMigrations\\Version20221111092110', '2022-11-11 09:21:14', 37),
('DoctrineMigrations\\Version20221111093407', '2022-11-11 09:34:12', 56),
('DoctrineMigrations\\Version20221111095345', '2022-11-11 09:53:50', 38),
('DoctrineMigrations\\Version20221111101011', '2022-11-11 10:10:18', 31),
('DoctrineMigrations\\Version20221111101957', '2022-11-11 10:20:02', 83),
('DoctrineMigrations\\Version20221111103048', '2022-11-11 10:30:57', 69),
('DoctrineMigrations\\Version20221111104753', '2022-11-11 10:48:00', 50),
('DoctrineMigrations\\Version20221111105433', '2022-11-11 10:54:38', 47),
('DoctrineMigrations\\Version20221111112636', '2022-11-11 11:26:45', 36),
('DoctrineMigrations\\Version20221111113930', '2022-11-11 11:39:35', 29),
('DoctrineMigrations\\Version20221111114400', '2022-11-11 11:44:04', 63),
('DoctrineMigrations\\Version20221111114732', '2022-11-11 11:47:38', 48),
('DoctrineMigrations\\Version20221111120456', '2022-11-11 12:05:03', 27),
('DoctrineMigrations\\Version20221111120646', '2022-11-11 12:06:52', 41),
('DoctrineMigrations\\Version20221111121042', '2022-11-11 12:10:48', 54),
('DoctrineMigrations\\Version20221111123613', '2022-11-11 12:36:24', 23),
('DoctrineMigrations\\Version20221111124027', '2022-11-11 12:40:32', 56),
('DoctrineMigrations\\Version20221111154003', '2022-11-11 15:40:20', 30),
('DoctrineMigrations\\Version20221112000604', '2022-11-12 00:06:14', 32),
('DoctrineMigrations\\Version20221112005556', '2022-11-12 00:56:01', 227),
('DoctrineMigrations\\Version20221112014514', '2022-11-12 01:45:22', 48),
('DoctrineMigrations\\Version20221112032927', '2022-11-12 03:29:31', 48),
('DoctrineMigrations\\Version20221112033829', '2022-11-12 03:38:32', 27),
('DoctrineMigrations\\Version20221112034427', '2022-11-12 03:44:33', 62),
('DoctrineMigrations\\Version20221112044756', '2022-11-12 04:48:05', 28),
('DoctrineMigrations\\Version20221112045642', '2022-11-12 04:56:47', 26),
('DoctrineMigrations\\Version20221112064455', '2022-11-12 06:45:06', 29),
('DoctrineMigrations\\Version20221112070234', '2022-11-12 07:02:46', 27),
('DoctrineMigrations\\Version20221112070659', '2022-11-12 07:07:05', 53),
('DoctrineMigrations\\Version20221112075212', '2022-11-12 07:52:19', 29),
('DoctrineMigrations\\Version20221112080215', '2022-11-12 08:02:19', 38),
('DoctrineMigrations\\Version20221112084336', '2022-11-12 08:43:41', 26),
('DoctrineMigrations\\Version20221112085221', '2022-11-12 08:52:27', 29),
('DoctrineMigrations\\Version20221112090347', '2022-11-12 09:03:53', 39),
('DoctrineMigrations\\Version20221112165110', '2022-11-12 16:51:20', 27),
('DoctrineMigrations\\Version20221112171925', '2022-11-12 17:19:29', 49),
('DoctrineMigrations\\Version20221112173742', '2022-11-12 17:37:48', 34),
('DoctrineMigrations\\Version20221112173939', '2022-11-12 17:39:42', 26),
('DoctrineMigrations\\Version20221112174408', '2022-11-12 17:44:16', 27),
('DoctrineMigrations\\Version20221112175012', '2022-11-12 17:50:20', 28),
('DoctrineMigrations\\Version20221112184822', '2022-11-12 18:48:27', 34),
('DoctrineMigrations\\Version20221112185338', '2022-11-12 18:53:41', 27),
('DoctrineMigrations\\Version20221112190016', '2022-11-12 19:00:20', 28),
('DoctrineMigrations\\Version20221112191933', '2022-11-12 19:19:44', 39),
('DoctrineMigrations\\Version20221112192342', '2022-11-12 19:23:46', 27),
('DoctrineMigrations\\Version20221112193944', '2022-11-12 19:39:50', 46),
('DoctrineMigrations\\Version20221112194501', '2022-11-12 19:45:06', 62),
('DoctrineMigrations\\Version20221112195330', '2022-11-12 19:53:34', 26),
('DoctrineMigrations\\Version20221112200030', '2022-11-12 20:00:33', 106),
('DoctrineMigrations\\Version20221112205257', '2022-11-12 20:53:07', 39),
('DoctrineMigrations\\Version20221112205640', '2022-11-12 20:56:48', 48),
('DoctrineMigrations\\Version20221113080510', '2022-11-13 08:05:17', 34),
('DoctrineMigrations\\Version20221113144457', '2022-11-13 14:45:06', 67),
('DoctrineMigrations\\Version20221113150017', '2022-11-13 15:00:21', 49),
('DoctrineMigrations\\Version20221113151428', '2022-11-13 15:14:33', 42),
('DoctrineMigrations\\Version20221113152431', '2022-11-13 15:24:50', 55),
('DoctrineMigrations\\Version20221113154048', '2022-11-13 15:40:54', 40),
('DoctrineMigrations\\Version20221113162424', '2022-11-13 16:24:33', 27),
('DoctrineMigrations\\Version20221113162919', '2022-11-13 16:29:23', 42),
('DoctrineMigrations\\Version20221113163817', '2022-11-13 18:45:27', 44),
('DoctrineMigrations\\Version20221113192929', '2022-11-13 19:29:55', 199),
('DoctrineMigrations\\Version20221113193750', '2022-11-13 19:37:55', 49),
('DoctrineMigrations\\Version20221113195212', '2022-11-13 19:52:16', 27),
('DoctrineMigrations\\Version20221113200119', '2022-11-13 20:01:23', 55),
('DoctrineMigrations\\Version20221113200839', '2022-11-13 20:08:43', 29),
('DoctrineMigrations\\Version20221113201827', '2022-11-13 20:18:32', 27),
('DoctrineMigrations\\Version20221113202534', '2022-11-13 20:25:39', 27),
('DoctrineMigrations\\Version20221113210126', '2022-11-13 21:01:32', 46),
('DoctrineMigrations\\Version20221113210654', '2022-11-13 21:07:02', 39),
('DoctrineMigrations\\Version20221113211245', '2022-11-13 21:12:49', 69),
('DoctrineMigrations\\Version20221113212619', '2022-11-13 21:26:25', 51),
('DoctrineMigrations\\Version20221113213017', '2022-11-13 21:30:21', 37),
('DoctrineMigrations\\Version20221113213705', '2022-11-13 21:37:09', 57),
('DoctrineMigrations\\Version20221113214007', '2022-11-13 21:40:10', 42),
('DoctrineMigrations\\Version20221113214214', '2022-11-13 21:42:21', 28),
('DoctrineMigrations\\Version20221113214315', '2022-11-13 21:43:19', 29),
('DoctrineMigrations\\Version20221113220458', '2022-11-13 22:05:07', 39),
('DoctrineMigrations\\Version20221114003513', '2022-11-14 00:35:26', 50),
('DoctrineMigrations\\Version20221114004249', '2022-11-14 00:42:53', 56),
('DoctrineMigrations\\Version20221114010436', '2022-11-14 01:04:39', 70),
('DoctrineMigrations\\Version20221114010618', '2022-11-14 01:06:21', 40),
('DoctrineMigrations\\Version20221114012341', '2022-11-14 01:23:53', 131),
('DoctrineMigrations\\Version20221114013509', '2022-11-14 01:35:13', 91),
('DoctrineMigrations\\Version20221114013924', '2022-11-14 01:39:27', 27),
('DoctrineMigrations\\Version20221114022541', '2022-11-14 02:25:47', 39),
('DoctrineMigrations\\Version20221114022632', '2022-11-14 02:26:35', 27),
('DoctrineMigrations\\Version20221114170240', '2022-11-14 17:02:49', 30),
('DoctrineMigrations\\Version20221114171021', '2022-11-14 17:10:27', 35),
('DoctrineMigrations\\Version20221114172159', '2022-11-14 17:22:06', 31),
('DoctrineMigrations\\Version20221114173003', '2022-11-14 17:30:10', 43),
('DoctrineMigrations\\Version20221114173446', '2022-11-14 17:34:50', 57),
('DoctrineMigrations\\Version20221114173809', '2022-11-14 17:38:14', 30),
('DoctrineMigrations\\Version20221114174226', '2022-11-14 17:42:31', 34),
('DoctrineMigrations\\Version20221114174911', '2022-11-14 17:49:15', 28),
('DoctrineMigrations\\Version20221114182104', '2022-11-14 18:21:16', 33),
('DoctrineMigrations\\Version20221114182823', '2022-11-14 18:28:28', 31),
('DoctrineMigrations\\Version20221114184521', '2022-11-14 18:45:26', 34),
('DoctrineMigrations\\Version20221114185202', '2022-11-14 18:52:05', 33),
('DoctrineMigrations\\Version20221114190248', '2022-11-14 19:02:52', 30),
('DoctrineMigrations\\Version20221114192929', '2022-11-14 19:29:54', 31),
('DoctrineMigrations\\Version20221114195747', '2022-11-14 19:57:57', 26),
('DoctrineMigrations\\Version20221114202239', '2022-11-14 20:22:44', 26),
('DoctrineMigrations\\Version20221114204546', '2022-11-14 20:45:52', 43),
('DoctrineMigrations\\Version20221114205433', '2022-11-14 20:54:41', 42),
('DoctrineMigrations\\Version20221114210322', '2022-11-14 21:03:28', 30),
('DoctrineMigrations\\Version20221114212428', '2022-11-14 21:24:32', 44),
('DoctrineMigrations\\Version20221114213644', '2022-11-14 21:36:49', 28),
('DoctrineMigrations\\Version20221114214434', '2022-11-14 21:44:37', 39),
('DoctrineMigrations\\Version20221114220350', '2022-11-14 22:03:54', 50),
('DoctrineMigrations\\Version20221115181846', '2022-11-15 18:19:06', 50),
('DoctrineMigrations\\Version20221115182540', '2022-11-15 18:25:45', 38),
('DoctrineMigrations\\Version20221115183424', '2022-11-15 18:34:31', 79),
('DoctrineMigrations\\Version20221115184218', '2022-11-15 18:42:25', 38),
('DoctrineMigrations\\Version20221115185204', '2022-11-15 18:52:08', 33),
('DoctrineMigrations\\Version20221115185726', '2022-11-15 18:57:31', 35),
('DoctrineMigrations\\Version20221115203606', '2022-11-15 20:36:09', 42);

-- --------------------------------------------------------

--
-- Structure de la table `entrepreneur`
--

CREATE TABLE `entrepreneur` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entrepreneur_activity`
--

CREATE TABLE `entrepreneur_activity` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entrepreneur_category`
--

CREATE TABLE `entrepreneur_category` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entrepreneur_job`
--

CREATE TABLE `entrepreneur_job` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entrepreneur_skill`
--

CREATE TABLE `entrepreneur_skill` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `geo_city`
--

CREATE TABLE `geo_city` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `postal_code` varchar(5) NOT NULL,
  `insee_code` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `geo_country`
--

CREATE TABLE `geo_country` (
  `id` int(11) NOT NULL,
  `code` varchar(2) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `geo_country`
--

INSERT INTO `geo_country` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'ZA', 'Afrique du Sud'),
(3, 'AX', 'Åland, Îles'),
(4, 'AL', 'Albanie'),
(5, 'DZ', 'Algérie'),
(6, 'DE', 'Allemagne'),
(7, 'AD', 'Andorre'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctique'),
(11, 'AG', 'Antigua et Barbuda'),
(12, 'SA', 'Arabie Saoudite'),
(13, 'AR', 'Argentine'),
(14, 'AM', 'Arménie'),
(15, 'AW', 'Aruba'),
(16, 'AU', 'Australie'),
(17, 'AT', 'Autriche'),
(18, 'AZ', 'Azerbaïdjan');

-- --------------------------------------------------------

--
-- Structure de la table `geo_county`
--

CREATE TABLE `geo_county` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `number` varchar(2) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `geo_county`
--

INSERT INTO `geo_county` (`id`, `code`, `number`, `name`) VALUES
(1, 'FR-01', '01', 'Ain'),
(2, 'FR-02', '02', 'Aisne'),
(3, 'FR-03', '03', 'Allier'),
(4, 'FR-04', '04', 'Alpes-de-Haute-Provence'),
(5, 'FR-05', '05', 'Hautes-Alpes'),
(6, 'FR-06', '06', 'Alpes-Maritimes'),
(7, 'FR-07', '07', 'Ardèche'),
(8, 'FR-08', '08', 'Ardennes'),
(9, 'FR-09', '09', 'Ariège'),
(10, 'FR-10', '10', 'Aube'),
(11, 'FR-11', '11', 'Aude'),
(12, 'FR-12', '12', 'Aveyron'),
(13, 'FR-13', '13', 'Bouches-du-Rhône'),
(14, 'FR-14', '14', 'Calvados'),
(15, 'FR-15', '15', 'Cantal'),
(16, 'FR-16', '16', 'Charente'),
(17, 'FR-17', '17', 'Charente-Maritime'),
(18, 'FR-18', '18', 'Cher'),
(19, 'FR-19', '19', 'Corrèze'),
(20, 'FR-2A', '2A', 'Corse-du-Sud'),
(21, 'FR-2B', '2B', 'Haute-Corse'),
(22, 'FR-21', '21', 'Côte-d\'Or'),
(23, 'FR-22', '22', 'Côtes-d\'Armor'),
(24, 'FR-23', '23', 'Creuse'),
(25, 'FR-24', '24', 'Dordogne'),
(26, 'FR-25', '25', 'Doubs'),
(27, 'FR-26', '26', 'Drôme'),
(28, 'FR-27', '27', 'Eure'),
(29, 'FR-28', '28', 'Eure-et-Loir'),
(30, 'FR-29', '29', 'Finistère'),
(31, 'FR-30', '30', 'Gard'),
(32, 'FR-31', '31', 'Haute-Garonne'),
(33, 'FR-32', '32', 'Gers'),
(34, 'FR-33', '33', 'Gironde'),
(35, 'FR-34', '34', 'Hérault'),
(36, 'FR-35', '35', 'Ille-et-Vilaine'),
(37, 'FR-36', '36', 'Indre'),
(38, 'FR-37', '37', 'Indre-et-Loire'),
(39, 'FR-38', '38', 'Isère'),
(40, 'FR-39', '39', 'Jura'),
(41, 'FR-40', '40', 'Landes'),
(42, 'FR-41', '41', 'Loir-et-Cher'),
(43, 'FR-42', '42', 'Loire'),
(44, 'FR-43', '43', 'Haute-Loire'),
(45, 'FR-44', '44', 'Loire-Atlantique'),
(46, 'FR-45', '45', 'Loiret'),
(47, 'FR-46', '46', 'Lot'),
(48, 'FR-47', '47', 'Lot-et-Garonne'),
(49, 'FR-48', '48', 'Lozère'),
(50, 'FR-49', '49', 'Maine-et-Loire'),
(51, 'FR-50', '50', 'Manche'),
(52, 'FR-51', '51', 'Marne'),
(53, 'FR-52', '52', 'Haute-Marne'),
(54, 'FR-53', '53', 'Mayenne'),
(55, 'FR-54', '54', 'Meurthe-et-Moselle'),
(56, 'FR-55', '55', 'Meuse'),
(57, 'FR-56', '56', 'Morbihan'),
(58, 'FR-57', '57', 'Moselle'),
(59, 'FR-58', '58', 'Nièvre'),
(60, 'FR-59', '59', 'Nord'),
(61, 'FR-60', '60', 'Oise'),
(62, 'FR-61', '61', 'Orne'),
(63, 'FR-62', '62', 'Pas-de-Calais'),
(64, 'FR-63', '63', 'Puy-de-Dôme'),
(65, 'FR-64', '64', 'Pyrénées-Atlantiques'),
(66, 'FR-65', '65', 'Hautes-Pyrénées'),
(67, 'FR-66', '66', 'Pyrénées-Orientales'),
(68, 'FR-67', '67', 'Bas-Rhin'),
(69, 'FR-68', '68', 'Haut-Rhin'),
(70, 'FR-69', '69', 'Rhône'),
(71, 'FR-70', '70', 'Haute-Saône'),
(72, 'FR-71', '71', 'Saône-et-Loire'),
(73, 'FR-72', '72', 'Sarthe'),
(74, 'FR-73', '73', 'Savoie'),
(75, 'FR-74', '74', 'Haute-Savoie'),
(76, 'FR-75', '75', 'Paris'),
(77, 'FR-76', '76', 'Seine-Maritime'),
(78, 'FR-77', '77', 'Seine-et-Marne'),
(79, 'FR-78', '78', 'Yvelines'),
(80, 'FR-79', '79', 'Deux-Sèvres'),
(81, 'FR-80', '80', 'Somme'),
(82, 'FR-81', '81', 'Tarn'),
(83, 'FR-82', '82', 'Tarn-et-Garonne'),
(84, 'FR-83', '83', 'Var'),
(85, 'FR-84', '84', 'Vaucluse'),
(86, 'FR-85', '85', 'Vendée'),
(87, 'FR-86', '86', 'Vienne'),
(88, 'FR-87', '87', 'Haute-Vienne'),
(89, 'FR-88', '88', 'Vosges'),
(90, 'FR-89', '89', 'Yonne'),
(91, 'FR-90', '90', 'Territoire-de-Belfort'),
(92, 'FR-91', '91', 'Essonne'),
(93, 'FR-92', '92', 'Hauts-de-Seine'),
(94, 'FR-93', '93', 'Seine-Saint-Denis'),
(95, 'FR-94', '94', 'Val-de-Marne'),
(96, 'FR-95', '95', 'Val-d\'Oise');

-- --------------------------------------------------------

--
-- Structure de la table `geo_state`
--

CREATE TABLE `geo_state` (
  `id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `geo_state`
--

INSERT INTO `geo_state` (`id`, `code`, `name`) VALUES
(1, 'FR-ARA', 'Auvergne-Rhône-Alpes'),
(2, 'FR-BFC', 'Bourgogne-Franche-Comté'),
(3, 'FR-BRE', 'Bretagne'),
(4, 'FR-CVL', 'Centre-Val de Loire'),
(5, 'FR-GES', 'Grand Est'),
(6, 'FR-HDF', 'Hauts-de-France'),
(7, 'FR-IDF', 'Île-de-France'),
(8, 'FR-NOR', 'Normandie'),
(9, 'FR-NAQ', 'Nouvelle-Aquitaine'),
(10, 'FR-OCC', 'Occitanie'),
(11, 'FR-PDL', 'Pays de la Loire'),
(12, 'FR-PAC', 'Provence-Alpes-Côte d\'Azur'),
(13, 'FR-20R', 'Corse');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:163:\\\"https://keblo.dev/verify/email?expires=1667593494&signature=ryy7fKKKNTevBGq83iYjJHYFwtQJk6qMt9Une65GlA8%3D&token=8dtUS2C%2Fn%2F5AmYGCujKd4woKE3mXmPVSdHgKTkg1O7k%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"mailer@keblo.email\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:14:\\\"Keblo Mail Bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"pierre@mick.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2022-11-04 19:24:54', '2022-11-04 19:24:54', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:34:\\\"front/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:169:\\\"https://keblo.dev/verify/email?expires=1667604473&signature=Sa05yoHL4%2BMTk1eVn1l4F%2F0lY35wFzYJ%2FgIoidesXPw%3D&token=pes7bn9kqoquWlXYUQeBZ%2FuxdpJP%2BYt1d9EWvvCOSB4%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"mailer@keblo.email\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:14:\\\"Keblo Mail Bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"pmick.project@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2022-11-04 22:27:53', '2022-11-04 22:27:53', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `organization_status`
--

CREATE TABLE `organization_status` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `organization_status`
--

INSERT INTO `organization_status` (`id`, `name`) VALUES
(1, 'SA'),
(3, 'SARL'),
(2, 'SAS');

-- --------------------------------------------------------

--
-- Structure de la table `organization_type`
--

CREATE TABLE `organization_type` (
  `id` int(11) NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `organization_type`
--

INSERT INTO `organization_type` (`id`, `code`, `name`) VALUES
(1, 'ASSOCIATION', 'association Loi 1901'),
(2, 'SCIC', 'société coopérative d\'intérêt collectif'),
(3, 'SCOP', 'société coopérative de production');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_tarif`
--

CREATE TABLE `product_tarif` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_type`
--

CREATE TABLE `product_type` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profil_type`
--

CREATE TABLE `profil_type` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `profil_type`
--

INSERT INTO `profil_type` (`id`, `name`) VALUES
(1, 'entrepreneur'),
(2, 'cooperative'),
(3, 'team'),
(4, 'partner'),
(5, 'support');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `is_organization` tinyint(1) NOT NULL,
  `firstname` varchar(65) DEFAULT NULL,
  `lastname` varchar(65) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `genre` int(11) DEFAULT NULL,
  `birth_city` varchar(100) DEFAULT NULL,
  `birth_county` varchar(2) DEFAULT NULL,
  `birth_country` varchar(2) DEFAULT NULL,
  `nir` varchar(15) DEFAULT NULL,
  `nationality` varchar(2) DEFAULT NULL,
  `contact_address_postal_code` varchar(5) DEFAULT NULL,
  `contact_address_city` varchar(100) DEFAULT NULL,
  `contact_address_line1` varchar(155) DEFAULT NULL,
  `contact_address_line2` varchar(155) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(17) DEFAULT NULL,
  `is_entrepreneur` tinyint(1) DEFAULT NULL,
  `is_cooperative` tinyint(1) DEFAULT NULL,
  `is_team` tinyint(1) DEFAULT NULL,
  `is_partner` tinyint(1) DEFAULT NULL,
  `is_support` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`, `is_organization`, `firstname`, `lastname`, `birthdate`, `genre`, `birth_city`, `birth_county`, `birth_country`, `nir`, `nationality`, `contact_address_postal_code`, `contact_address_city`, `contact_address_line1`, `contact_address_line2`, `contact_email`, `contact_phone`, `is_entrepreneur`, `is_cooperative`, `is_team`, `is_partner`, `is_support`) VALUES
(1, 'pierre@mick.fr', '[\"ROLE_ADMIN\"]', '$2y$13$HjbfBRJLEkCF9sS4J4ku0e83cpsywSHK9JXVvNwPQvG8r3hTxepDe', 1, 0, 'Pierre', 'Mick', '1968-06-04', 2, 'Lons-le-Saunier', '66', 'FR', NULL, 'FR', '66300', 'Thuir', '5 Impasse des Bergeronnettes', NULL, 'pierre@mick.fr', '+33 6 51 53 52 35', NULL, NULL, 1, NULL, NULL),
(2, 'pmick.project@gmail.com', '[]', '$2y$13$4qStYx6zGYGB/BvgtNhF.ec56jqUsc8SMr4nNCKkQYz0VNC.Sb6li', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `web_page`
--

CREATE TABLE `web_page` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `web_site`
--

CREATE TABLE `web_site` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `slug` varchar(65) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_23A0E665E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_23A0E66989D9B62` (`slug`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_64C19C15E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_64C19C1989D9B62` (`slug`);

--
-- Index pour la table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E98F2859CD1DF15B` (`contract_type_id`),
  ADD KEY `IDX_E98F2859B0265DC7` (`contractor_id`);

--
-- Index pour la table `contract_type`
--
ALTER TABLE `contract_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E4AB194177153098` (`code`),
  ADD UNIQUE KEY `UNIQ_E4AB19415E237E06` (`name`);

--
-- Index pour la table `cooperative`
--
ALTER TABLE `cooperative`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_7107DC7B5E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_7107DC7B989D9B62` (`slug`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `entrepreneur`
--
ALTER TABLE `entrepreneur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F28C90A35E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_F28C90A3989D9B62` (`slug`);

--
-- Index pour la table `entrepreneur_activity`
--
ALTER TABLE `entrepreneur_activity`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_67F17E765E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_67F17E76989D9B62` (`slug`);

--
-- Index pour la table `entrepreneur_category`
--
ALTER TABLE `entrepreneur_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_CDC96EED5E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_CDC96EED989D9B62` (`slug`);

--
-- Index pour la table `entrepreneur_job`
--
ALTER TABLE `entrepreneur_job`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D0FBB36E5E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_D0FBB36E989D9B62` (`slug`);

--
-- Index pour la table `entrepreneur_skill`
--
ALTER TABLE `entrepreneur_skill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8B44E2865E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_8B44E286989D9B62` (`slug`);

--
-- Index pour la table `geo_city`
--
ALTER TABLE `geo_city`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_297C2D3415A3C1BC` (`insee_code`);

--
-- Index pour la table `geo_country`
--
ALTER TABLE `geo_country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E465446477153098` (`code`),
  ADD UNIQUE KEY `UNIQ_E46544645E237E06` (`name`);

--
-- Index pour la table `geo_county`
--
ALTER TABLE `geo_county`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F333C65B77153098` (`code`),
  ADD UNIQUE KEY `UNIQ_F333C65B96901F54` (`number`),
  ADD UNIQUE KEY `UNIQ_F333C65B5E237E06` (`name`);

--
-- Index pour la table `geo_state`
--
ALTER TABLE `geo_state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A397F5D477153098` (`code`),
  ADD UNIQUE KEY `UNIQ_A397F5D45E237E06` (`name`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `organization_status`
--
ALTER TABLE `organization_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_7E8EB5E95E237E06` (`name`);

--
-- Index pour la table `organization_type`
--
ALTER TABLE `organization_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_B5D769B477153098` (`code`),
  ADD UNIQUE KEY `UNIQ_B5D769B45E237E06` (`name`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_tarif`
--
ALTER TABLE `product_tarif`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_AF2DF2955E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_AF2DF295989D9B62` (`slug`);

--
-- Index pour la table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_13675885E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_1367588989D9B62` (`slug`);

--
-- Index pour la table `profil_type`
--
ALTER TABLE `profil_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `web_page`
--
ALTER TABLE `web_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D008BBD55E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_D008BBD5989D9B62` (`slug`);

--
-- Index pour la table `web_site`
--
ALTER TABLE `web_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_AD4104115E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_AD410411989D9B62` (`slug`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contract`
--
ALTER TABLE `contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contract_type`
--
ALTER TABLE `contract_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `cooperative`
--
ALTER TABLE `cooperative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `entrepreneur`
--
ALTER TABLE `entrepreneur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `entrepreneur_activity`
--
ALTER TABLE `entrepreneur_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `entrepreneur_category`
--
ALTER TABLE `entrepreneur_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `entrepreneur_job`
--
ALTER TABLE `entrepreneur_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `entrepreneur_skill`
--
ALTER TABLE `entrepreneur_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `geo_city`
--
ALTER TABLE `geo_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `geo_country`
--
ALTER TABLE `geo_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `geo_county`
--
ALTER TABLE `geo_county`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT pour la table `geo_state`
--
ALTER TABLE `geo_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `organization_status`
--
ALTER TABLE `organization_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `organization_type`
--
ALTER TABLE `organization_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_tarif`
--
ALTER TABLE `product_tarif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `profil_type`
--
ALTER TABLE `profil_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `web_page`
--
ALTER TABLE `web_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `web_site`
--
ALTER TABLE `web_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `FK_E98F2859B0265DC7` FOREIGN KEY (`contractor_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_E98F2859CD1DF15B` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_type` (`id`);
--
-- Base de données : `video-games`
--
CREATE DATABASE IF NOT EXISTS `video-games` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `video-games`;

-- --------------------------------------------------------

--
-- Structure de la table `console`
--

CREATE TABLE `console` (
  `id` int(10) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `label` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `console`
--

INSERT INTO `console` (`id`, `slug`, `label`) VALUES
(1, 'ps4', 'PS4'),
(2, 'ps5', 'PS5'),
(3, '360', '360'),
(4, 'xbox-series', 'Xbox Series'),
(5, 'one', 'ONE'),
(6, 'switch', 'Switch'),
(7, 'pc', 'PC');

-- --------------------------------------------------------

--
-- Structure de la table `game_console`
--

CREATE TABLE `game_console` (
  `id` int(11) NOT NULL,
  `console_id` int(11) NOT NULL,
  `jeu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `game_console`
--

INSERT INTO `game_console` (`id`, `console_id`, `jeu_id`) VALUES
(1, 6, 1),
(2, 1, 2),
(3, 2, 2),
(4, 4, 2),
(5, 5, 2),
(6, 7, 2),
(7, 1, 3),
(8, 2, 3),
(9, 4, 3),
(10, 5, 3),
(11, 7, 3),
(12, 1, 4),
(13, 2, 4),
(14, 4, 4),
(15, 5, 4),
(16, 7, 4),
(17, 1, 5),
(18, 2, 5),
(19, 3, 5),
(20, 4, 5),
(21, 5, 5),
(22, 7, 5),
(23, 1, 6),
(24, 2, 6),
(25, 4, 6),
(26, 5, 6),
(27, 7, 6),
(28, 6, 7),
(29, 6, 8),
(30, 1, 9),
(31, 2, 9),
(32, 3, 9),
(33, 4, 9),
(34, 5, 9),
(35, 7, 9),
(36, 6, 10),
(37, 1, 11),
(38, 5, 11),
(39, 7, 11),
(40, 1, 12),
(41, 5, 12),
(42, 7, 12),
(43, 1, 13),
(44, 2, 13),
(45, 3, 13),
(46, 4, 13),
(47, 5, 13),
(48, 7, 13),
(49, 6, 14);

-- --------------------------------------------------------

--
-- Structure de la table `jeu`
--

CREATE TABLE `jeu` (
  `id` int(10) NOT NULL,
  `titre` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `prix` int(11) NOT NULL,
  `date_sortie` datetime NOT NULL,
  `image_path` varchar(150) DEFAULT 'default.png',
  `note_id` int(11) NOT NULL,
  `age_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `jeu`
--

INSERT INTO `jeu` (`id`, `titre`, `slug`, `description`, `prix`, `date_sortie`, `image_path`, `note_id`, `age_id`) VALUES
(1, 'Animal Crossing : New Horizons', 'animal-crossing-new-horizons', 'Animal Crossing : New Horizons vous emmène de nouveau dans le monde mignon d\'Animal Crossing, sur Nintendo Switch. Cultivez votre potager, pêchez, et faites votre vie avec vos compagnons en temps réel grâce à l\'horloge de la console.', 4490, '2020-03-20 00:00:00', 'animal-crossing.jpg', 1, 2),
(2, 'Call of Duty : Modern Warfare 2', 'call-of-duty-modern-warfare-2', 'Il s\'agit d\'une version reboot de l\'emblématique jeu de tir à la première personne Call of Duty Modern Warfare 2, sorti en 2009. Le jeu bénéficie de nouveaux graphismes et d\'une refonte complète. Le jeu devrait etre le début d\'une nouvelle ère pour la licence.', 5999, '2022-10-28 00:00:00', 'call-of-duty.jpg', 2, 5),
(3, 'Fall Guys : Ultimate Knockout', 'fall-guys-ultimate-knockout', 'Fall Guys : Ultimate Knockout réunit 60 participants en ligne dans une course chaotique et effrénée qui ne couronnera qu’un seul gagnant. Les obstacles étranges, le manque de discipline des concurrents et les lois inflexibles de la physique se dressent sur la route du succès de cet intervilles moderne .', 0, '2020-08-04 00:00:00', 'fall-guys.jpg', 3, 1),
(4, 'FIFA 23', 'fifa-23', 'Il s\'agit de la dernière version du célèbre licence de football en collaboration avec la FIFA. FIFA 23 apporte des améliorations techniques, de nouveaux modes et de nouveaux joueurs pour créer les équipes de foot.', 5699, '2022-09-30 00:00:00', 'fifa-23.jpg', 4, 1),
(5, 'Grand Theft Auto V', 'grand-theft-auto-5', 'Jeu d\'action-aventure en monde ouvert, Grand Theft Auto (GTA) V vous place dans la peau de trois personnages inédits : Michael, Trevor et Franklin. Ces derniers ont élu domicile à Los Santos, ville de la région de San Andreas. Braquages et missions font partie du quotidien du joueur qui pourra également cohabiter avec 15 autres utilisateurs dans cet univers persistant s\'il joue sur PS3/Xbox 360 ou 29 s\'il joue sur PS4/Xbox One/PC.', 2999, '2013-09-17 00:00:00', 'gta-v.jpg', 5, 5),
(6, 'Human Fall Flat', 'human-fall-flat', 'Human : Fall Flat est un jeu d\'aventure puzzle qui propose au joueur de prendre possession de Bob, un personnage désarticulé qui doit se dépatouiller dans 8 niveaux remplis d\'énigmes. Ces dernières sont basées sur la physique et notre héros devra gérer au mieux ses bras pour soulever, s\'agripper, et actionner divers mécanismes.', 2499, '2016-06-22 00:00:00', 'human-fall-flat.jpg', 6, 2),
(7, 'Mario Kart 8 Deluxe', 'mario-kart-8-deluxe', 'Mario Kart 8 sur Switch est un jeu de course coloré et délirant qui reprend les personnages phares des grandes licences Nintendo. Le joueur peut y affronter ses amis dans différents modes et types de coupes et a accès à 32 circuits aux environnements variés. Il est possible de jouer jusqu\' à 12 simultanément en ligne et 4 en local.', 4999, '2017-04-28 00:00:00', 'mario-kart-8.jpg', 7, 1),
(8, 'Super Mario Odyssey', 'super-mario-odyssey', 'Super Mario Odyssey est un jeu de plate-forme sur Switch où la princesse Peach a été enlevée par Bowser.Pour la sauver, Mario quitte le royaume Champignon à bord de l\'Odyssey. Accompagné de Cappy, son chapeau vivant, il doit parcourir différents royaumes et faire tout pour vaincre, une nouvelle fois, le terrible Bowser.', 4499, '2017-10-27 00:00:00', 'mario-odyssey.jpg', 8, 1),
(9, 'Minecraft', 'minecraft', 'Jeu bac à sable indépendant et pixelisé dont le monde infini est généré aléatoirement, Minecraft permet au joueur de récolter divers matériaux, d\'élever des animaux et de modifier le terrain selon ses choix, en solo ou en multi (via des serveurs). Il doit également survivre en se procurant de la nourriture et en se protégeant des monstres qui apparaissent la nuit et dans des donjons. Il peut également monter de niveau afin d\'acheter des enchantements.', 2249, '2011-11-18 00:00:00', 'minecraft.jpg', 9, 2),
(10, 'Légendes Pokémon: Arceus', 'legendes-pokemon-arceus', 'Légendes Pokémon : Arceus tranche avec les précédents opus Pokémon puisqu\'il prend place dans un monde ouvert. Le titre se déroule dans la région de Sinnoh, bien avant sa colonisation par les êtres humains. Le joueur incarnera toujours un dresseur de Pokémon, cette fois-ci chargé de créer le premier Pokédex de Sinnoh.', 4499, '2022-01-28 00:00:00', 'pokemon.jpg', 10, 2),
(11, 'PlayerUnknown\'s Battlegrounds', 'playerunknown-s-battlegrounds', 'PlayerUnknown\'s Battlegrounds est un jeu multijoueur de type Battle Royale. En partant de rien, il vous faut trouver des armes et des ressources afin d\'être le dernier survivant. Vous vous retrouvez sur une île de 8x8 km, avec pour but ultime de ne pas vous faire tuer.', 995, '2017-03-23 00:00:00', 'pubg-Battlegrounds.jpg', 11, 4),
(12, 'Red Dead Redemption II', 'red-dead-redemption-2', 'Suite du précédent volet multi récompensé, Red Dead Redemption II nous permet de nous replonger sur PS4 dans une ambiance western synonyme de vastes espaces sauvages et de villes malfamées. L\'histoire se déroule en 1899,	avant le premier Red Dead Redemption, au moment où Arthur Morgan doit fuir avec sa bande à la suite d\'un braquage raté.', 1399, '2018-10-26 00:00:00', 'red-dead-redemption.jpg', 12, 5),
(13, 'The Elder Scrolls V : Skyrim', 'the-elder-skrolls-5-skyrim', 'The Elder Scrolls V: Skyrim est le cinquième épisode de la saga de jeux de rôle du même nom. Le scénario se passe 200 ans après l\'histoire du quatrième opus, quand Alduin fait son retour au milieu d\'une guerre civile. Seul le Dovahkiin, incarné par le joueur, peut mettre un terme à cette sombre affaire... Un monde gigantesque empli de quêtes est à explorer et auquel se sont rajoutées des extensions débloquant plus de quêtes.', 1990, '2011-11-11 00:00:00', 'the-elder-scrolls-skyrim.jpg', 13, 5),
(14, 'The Legend of Zelda : Breath of the Wild', 'the-legend-of-zelda-breath-of-the-wild', 'The Legend of Zelda: Breath of the Wild est un jeu d\'action/aventure. Link se réveille d\'un sommeil de 100 ans dans un royaume d\'Hyrule dévasté.Il lui faudra percer les mystères du passé et vaincre Ganon, le fléau. L\'aventure prend place dans un gigantesque monde ouvert et accorde ainsi une part importante à l\'exploration. Le titre a été pensé pour que le joueur puisse aller où il veut dès le début, s\'éloignant de la linéarité habituelle de la série.', 5199, '2017-03-03 00:00:00', 'zelda.jpg', 14, 3);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `note_media` int(11) NOT NULL,
  `note_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id`, `note_media`, `note_utilisateur`) VALUES
(1, 18, 17),
(2, 17, 16),
(3, 12, 15),
(4, 16, 16),
(5, 17, 18),
(6, 18, 16),
(7, 17, 18),
(8, 20, 19),
(9, 18, 19),
(10, 17, 16),
(11, 18, 17),
(12, 16, 19),
(13, 18, 18),
(14, 20, 20);

-- --------------------------------------------------------

--
-- Structure de la table `restriction_age`
--

CREATE TABLE `restriction_age` (
  `id` int(11) NOT NULL,
  `label` int(5) NOT NULL,
  `image_path` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `restriction_age`
--

INSERT INTO `restriction_age` (`id`, `label`, `image_path`) VALUES
(1, 3, '3-ans.png'),
(2, 7, '7-ans.png'),
(3, 12, '12-ans.png'),
(4, 16, '16-ans.png'),
(5, 18, '18-ans.png');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `console`
--
ALTER TABLE `console`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game_console`
--
ALTER TABLE `game_console`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_console` (`console_id`),
  ADD KEY `FK2_jeu` (`jeu_id`);

--
-- Index pour la table `jeu`
--
ALTER TABLE `jeu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_note_jeu` (`note_id`),
  ADD KEY `FK2_age_jeu` (`age_id`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `restriction_age`
--
ALTER TABLE `restriction_age`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `console`
--
ALTER TABLE `console`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `game_console`
--
ALTER TABLE `game_console`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `jeu`
--
ALTER TABLE `jeu`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `restriction_age`
--
ALTER TABLE `restriction_age`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `game_console`
--
ALTER TABLE `game_console`
  ADD CONSTRAINT `FK1_console` FOREIGN KEY (`console_id`) REFERENCES `console` (`id`),
  ADD CONSTRAINT `FK2_jeu` FOREIGN KEY (`jeu_id`) REFERENCES `jeu` (`id`);

--
-- Contraintes pour la table `jeu`
--
ALTER TABLE `jeu`
  ADD CONSTRAINT `FK1_note_jeu` FOREIGN KEY (`note_id`) REFERENCES `jeu` (`id`),
  ADD CONSTRAINT `FK2_age_jeu` FOREIGN KEY (`age_id`) REFERENCES `restriction_age` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
