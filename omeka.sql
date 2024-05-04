-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 04, 2024 alle 11:20
-- Versione del server: 10.4.25-MariaDB
-- Versione PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omeka`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(1, 'site_pages', NULL, 1, 'Home', 'Welcome to your new site. This is an example page.\n\n\n	This is a bullet list.\n	Second entry.\n\n\nBack to normal again.\n\n\n	This is an ordered list.\n	Second entry.\n\n\nBack to normal again.\n\nThis is a blockquote.\n\nBack to normal again.\n\nThis text is a link, which currently points to nothing.\n\nThis text is bold, in a &lt;strong&gt; tag.\n\nThis text is italicized, in an &lt;em&gt; tag.\n\nThis text is underlined, in a &lt;u&gt; tag.\n\nThis text has a strikethrough, in a &lt;s&gt; tag.\n\nThis text is subscript and superscript using &lt;sub&gt; and &lt;sup&gt;, which can be used for adding notes and citations.\n\n\nThis is an H1 title. It is bigger than the Page Title, which is rendered in H2.\n\nThis is an H2 header, the same size as the Page Title.\n\nThis is an H3 subheader.\n\nThis is an H4 subheader.\n\nThis is an H5 subheader.\n\nThis is an H6 subheader.\n\nThis is the \"Italic Title\" block style.\n\nThis is the \"Subtitle\" block style.\n\nThis is the \"Special Container\" block style.\n\nThis is the \"Marker\" inline style. \n\nThis is the \"Big\" inline style. This is normal text.\n\nThis text is inside a \"small\" inline style. This is normal text.\n\nThis is the \"Computer Code\" inline style.\n\nلكن لا بد أن أوضح لك أن كل هذه الأفكار المغلوطة حول استنكار النشوة وتمجيد الألم يعرض هذا النص من اليمين إلى اليسار.\n'),
(2, 'items', NULL, 1, 'CONTENUTO DE PROVA', 'CONTENUTO DE PROVA\nCollocata nel giardino del museo navale ritrae Costanzo Ciano, opera dello scultore Francesco Messina\n27 giugno 1991\nLa Nazione\nAdriana Boverini\nArticolo La Nazione giugno 1991\nXML'),
(3, 'media', 4, 1, 'Articolo La Nazione giugno 1991', 'Articolo La Nazione giugno 1991'),
(3, 'site_pages', NULL, 1, 'Il progetto', ''),
(4, 'media', 4, 1, NULL, ''),
(4, 'site_pages', NULL, 1, 'Cancel Culture', ''),
(5, 'media', 4, 1, 'XML', 'XML'),
(5, 'site_pages', NULL, 1, 'Crowdsourcing', ''),
(6, 'items', 4, 1, 'Fascicolo 1', 'B. 10 J. 95\nFascicolo 1\nSupporto:\nIl fascicolo cartaceo è composto da 6 pagine totali, compresa la copertina del fascicolo.\n\n\nCondizioni del documento:\nLe pagine si presentano in un ottimo stato di conservazione, solamente la carta appare leggermente ingiallita. Sia le scritte a macchina che a mano, ma anche i timbri sono facilmente comprensibili.\n\n\nFirme:\nNel testo si possono trovare varie firme (se ne contano 6). Inoltre, sono presenti i numeri dei protocolli di telegrafo scritti a mano, per un totale di 9 diverse grafie\nTesto\nDocumento battuto a macchina\nCartaceo\nMarina Militare, Venezia, 7 febbraio 1961\nMinistero della Difesa Marina Ufficio del Segretario Generale Coordinamento  - Seconda Sezione, Roma, 9 Gennaio 1961\nMinistero della Difesa Marina Ufficio del Segretario Generale Coordinamento - Seconda Sezione, 18 marzo 1960\nRoma\nArchivio Marina Militare\n 18 marzo 1960 \n9 gennaio 1961\n7 febbraio 1961\nPagina 1 \nPagina 2\nPagina 3\nPagina 4\nPagina 5\nPagina 6'),
(6, 'site_pages', NULL, 1, 'Parlano di noi', ''),
(7, 'media', 4, 1, 'Pagina 1', 'Pagina 1 '),
(7, 'site_pages', NULL, 1, 'Biografia', ''),
(8, 'media', 4, 1, 'Pagina 2', 'Pagina 2'),
(8, 'site_pages', NULL, 1, 'La statua', ''),
(9, 'media', 4, 1, 'Pagina 3', 'Pagina 3'),
(9, 'site_pages', NULL, 1, 'Modello 3D', ''),
(10, 'media', 4, 1, 'Pagina 4', 'Pagina 4'),
(10, 'site_pages', NULL, 1, 'Fonti', ''),
(11, 'media', 4, 1, 'Pagina 5', 'Pagina 5'),
(12, 'media', 4, 1, 'Pagina 6', 'Pagina 6'),
(12, 'site_pages', NULL, 1, 'Fonti secondarie', ''),
(13, 'items', 4, 1, 'Fascicolo 2', 'B. 15 J. 140\nFascicolo 2\nSupporto:\nIl fascicolo di materialecartaceo è composto da 8 pagine totali, compresa la copertina del fascicolo.\nCondizioni del documento:\nLe pagine si presentano in un ottimo stato di conservazione, solamente alcune di esse appaiono leggermente ingiallite. In generale, sono facilmente comprensibili sia le scritte effettuate a macchina a mano, come ad esempio le firme.\nFirme\nIl testo contiene varie firme, per un totale di 6. Inoltre, sono presenti i numeri dei protocolli del telegrafo scitti a mano, permettendo di osservare 9 diverse grafie.\nTesto\nDocumento battuto a macchina\nCartaceo\nMinistero della Difesa Marina, Ufficio del Segretario Generale Coordinamento, Roma, 9 maggio 1952\nComando in Capo del Dipartimento Marittimo dell\'Alto Tirreno, Ufficio Tecnico, La Spezia, 28 maggio 1952\nMinistero della Difesa Marina, Ufficio del Segretario Generale Coordinamento, Roma, 17 agosto 1951\nReparto Ufficio Storico, Roma, 12 agosto 1952\nMinistero della Difesa Marina, Ufficio del Segretario Generale Coordinamento, Roma, 9 agosto 1951\nComando in Capo del Dipartimento Marittimo dell\'Alto Tirreno, Ufficio Tecnico, La Spezia, 4 agosto 1951\nComune della Spezia, Segreteria Generale, La Spezia, 23 luglio 1951\nRoma\nArchivio Marina Militare\n17 agosto 1951\n23 luglio 1951\n4 agosto 1951\n9 agosto 1951\n9 maggio 1952\n28 maggio 1952\n12 agosto 1952\nPagina 1\nPagina 2\nPagina 3\nPagina 4\nPagina 5\nPagina 6\nPagina 7\nPagina 8'),
(13, 'site_pages', NULL, 1, 'Galleria', ''),
(14, 'media', 4, 1, 'Pagina 1', 'Pagina 1'),
(14, 'site_pages', NULL, 1, 'Media', ''),
(15, 'media', 4, 1, 'Pagina 2', 'Pagina 2'),
(15, 'site_pages', NULL, 1, 'Interviste', ''),
(16, 'media', 4, 1, 'Pagina 3', 'Pagina 3'),
(16, 'site_pages', NULL, 1, 'Istituto Luce', ''),
(17, 'media', 4, 1, 'Pagina 4', 'Pagina 4'),
(17, 'site_pages', NULL, 1, 'Mappe', ''),
(18, 'media', 4, 1, 'Pagina 5', 'Pagina 5'),
(18, 'site_pages', NULL, 1, 'Credits', ''),
(19, 'media', 4, 1, 'Pagina 6', 'Pagina 6'),
(20, 'media', 4, 1, 'Pagina 7', 'Pagina 7'),
(20, 'site_pages', NULL, 1, 'Codifica', 'XML'),
(21, 'media', 4, 1, 'Pagina 8', 'Pagina 8'),
(22, 'item_sets', 4, 1, 'Documenti relativi alla statua di Costanzo Ciano', 'Documenti relativi alla statua di Costanzo Ciano\nConservazione:\nUfficio storico della Marina Militare\nData:\naprile 2024\nI documenti sono stati raccolti dall\'archivio della Marina Militare. Raccontano degli spostamenti della statua dal suo basamento originale in piazza a La Spezia, fino al Castello di San Giorgio. Secondo gli ultimi documenti la statua è stata collocata definitivamente al Museo Tecnico Navale di La Spezia.\nTesto\nDocumenti battuti a macchina\nSupporto:\nFogli di carta. Il fascicolo cartaceo è composto da 6 pagine totali, compresa la copertina del fascicolo. Il fascicolo di materiale cartaceo è composto da 8 pagine totali , compresa la copertina del fascicolo. Il fascicolo cartaceo è composto da 14 pagine totali, compresa la copertina del fascicolo.\nEstensione:\n6 + 8 + 14 pagine\nCondizioni:\nIl testo non presenta cancellature, ma timbri, firme e la carta si presenta ingiallita.\nPagine:\nLe pagine sono lunghe in media tra le 28 e 50 righe, considerando anche timbri e firme.\nMani:\nLe pagine dei documenti sono scritte a macchina (Marina Militare di Venezia); sono riportati a mano numeri di protocollo e firme.\nRoma\nArchivio Marina Militare'),
(23, 'items', 4, 1, 'Fascicolo 3', 'B. 18 f. 165\nFascicolo 3\nSupporto\nIl fascicolo cartaceo è composto da 14 pagine totali, compresa la copertina del fascicolo.\nCondizioni del documento\nLe pagine si presentano in un ottimo stato di conservazione, in alcune di esse la carta appare leggermente ingiallita. Sia le scritte a macchina che a mano, ma anche i timbri sono facilmente comprensibili. Come lo schizzo della statua stessa\nFirme\nNel testo si possono trovare varie firme (se ne contano 6). Inoltre, sono presenti i numeri dei protocolli di telegrafo scritti a mano, per un totale di 9 diverse calligrafie.\nTesto\nDocumento battuto a macchina\nCartaceo\nRoma, 12 marzo 1970\nUfficio Storico M.M., Roma, 12 marzo 1970\nRoma, 6 marzo 1970\nUfficio Storico M.M., Roma, 5 marzo 1970\nRoma\nArchivio Marina Militare\n5 marzo 1970\n6 marzo 1970\n9 marzo 1970\n12 marzo 1970\nPagina 1\nPagina 2\nPagina 3\nPagina 4\nPagina 5\nPagina 6\nPagina 7\nPagina 8\nPagina 9\nPagina 10\nPagina 11\nPagina 12\nPagina 13\nPagina 14'),
(24, 'media', 4, 1, 'Pagina 1', 'Pagina 1'),
(25, 'media', 4, 1, 'Pagina 2', 'Pagina 2'),
(26, 'media', 4, 1, 'Pagina 3', 'Pagina 3'),
(27, 'media', 4, 1, 'Pagina 4', 'Pagina 4'),
(28, 'media', 4, 1, 'Pagina 5', 'Pagina 5'),
(29, 'media', 4, 1, 'Pagina 6', 'Pagina 6'),
(30, 'media', 4, 1, 'Pagina 7', 'Pagina 7'),
(31, 'media', 4, 1, 'Pagina 8', 'Pagina 8'),
(32, 'media', 4, 1, 'Pagina 9', 'Pagina 9'),
(33, 'media', 4, 1, 'Pagina 10', 'Pagina 10'),
(34, 'media', 4, 1, 'Pagina 11', 'Pagina 11'),
(35, 'media', 4, 1, 'Pagina 12', 'Pagina 12'),
(36, 'media', 4, 1, 'Pagina 13', 'Pagina 13'),
(37, 'media', 4, 1, 'Pagina 14', 'Pagina 14'),
(44, 'items', 4, 1, 'XML', 'XML\nXML'),
(47, 'media', 4, 1, 'XML', 'XML');

-- --------------------------------------------------------

--
-- Struttura della tabella `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(23, NULL),
(44, NULL),
(2, 3),
(6, 7),
(13, 14);

-- --------------------------------------------------------

--
-- Struttura della tabella `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `item_item_set`
--

INSERT INTO `item_item_set` (`item_id`, `item_set_id`) VALUES
(6, 22),
(13, 22),
(23, 22);

-- --------------------------------------------------------

--
-- Struttura della tabella `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `item_set`
--

INSERT INTO `item_set` (`id`, `is_open`) VALUES
(22, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(2, 1),
(6, 1),
(13, 1),
(23, 1),
(44, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `media`
--

INSERT INTO `media` (`id`, `item_id`, `ingester`, `renderer`, `data`, `source`, `media_type`, `storage_id`, `extension`, `sha256`, `size`, `has_original`, `has_thumbnails`, `position`, `lang`, `alt_text`) VALUES
(3, 2, 'upload', 'file', NULL, 'articolo_Nazione_1991.HEIC', 'image/heic', '6548da7b0cf056dbe8bfa333b6cf7cc5dc0a8de3', 'heic', '0cac1fc8d9af22dcd8ba2fa939424c7bfe95b1d58fb877300991f0518b6987f8', 2054886, 1, 0, 1, NULL, NULL),
(4, 2, 'upload', 'file', NULL, 'tei_all.dtd', 'text/plain', '76a6f877adb53430598daa239227f1a4e90618e2', 'dtd', 'fe20ef6fd361ba2127b0f11de89ab855341d8fd3612e8bb93038c2e159c4cc38', 348089, 1, 0, 2, NULL, NULL),
(5, 2, 'upload', 'file', NULL, 'LL1_6.xml', 'application/tei+xml', '4da050974a09b417050218974a5886ab627146cd', 'xml', '68e85e85db58eebab9226d3ad0fa9324d00256467c4646a017b809254242775a', 46329, 1, 0, 3, NULL, NULL),
(7, 6, 'upload', 'file', NULL, 'statua1_ciano_pag1.jpeg', 'image/jpeg', 'ffe56d6e886ac3acb28d77d96a34cc0b08f525d5', 'jpeg', '91aaa4c57dd0d76afda413ba90ebce0a45de9f3c7445f4fd20ac1c4dff9f6bdb', 91817, 1, 1, 1, NULL, NULL),
(8, 6, 'upload', 'file', NULL, 'statua1_ciano_pag2.jpeg', 'image/jpeg', 'ce06edd76f7875e3993607d1411f2434a24ce6f6', 'jpeg', 'c7c55f53b6b908f3382dbf329958ee0b4e869a2129eea8c68f4122005a39f54f', 268758, 1, 1, 2, NULL, NULL),
(9, 6, 'upload', 'file', NULL, 'statua1_ciano_pag3.jpeg', 'image/jpeg', '2ea29063658c35a80ed3ef965f6dd2669ebaa027', 'jpeg', '0e97b457e550f9d2c903ca220997b0b086e3a142328f3c6967420978e4ef6984', 104618, 1, 1, 3, NULL, NULL),
(10, 6, 'upload', 'file', NULL, 'statua1_ciano_pag4.jpeg', 'image/jpeg', '7d39fabdba6ad7cabb88d1937c8a8380bd95df6a', 'jpeg', 'fd115f24ec3ec3c6281dade0a2268875fd9efccdca31f7b7ecc9bbe970364047', 131146, 1, 1, 4, NULL, NULL),
(11, 6, 'upload', 'file', NULL, 'statua1_ciano_pag5.jpeg', 'image/jpeg', '380e36b85b7290835f4ed2924c86ee923e3f8c65', 'jpeg', 'ba0ac12836f6a98eccf40167b011a74b94252cc145691e045fead7bd87c8b9e2', 260881, 1, 1, 5, NULL, NULL),
(12, 6, 'upload', 'file', NULL, 'statua1_ciano_pag6.jpeg', 'image/jpeg', 'e7dee11e245ccd233ea546f3f13ddec492d0ab60', 'jpeg', '1852ca4ccf9ea1f54d32d8e860d02eb140ff9017282f1da0267e139607350f67', 127945, 1, 1, 6, NULL, NULL),
(14, 13, 'upload', 'file', NULL, 'statua2_ciano_pag1.jpeg', 'image/jpeg', '187ac4401fbc74d6a0acc48479473a0888d6394e', 'jpeg', '5ddf83e9ca8f46ec645550d6eee4fa3f283353b32f2c913b014ffe158ae8b025', 81736, 1, 1, 1, NULL, NULL),
(15, 13, 'upload', 'file', NULL, 'statua2_ciano_pag2.jpeg', 'image/jpeg', '041bea2836172b77d36c687f1386148aead82875', 'jpeg', '8ac9831cb675566e340bdf93b07239ae6710e1164e97ba652660f48b6f185806', 91180, 1, 1, 2, NULL, NULL),
(16, 13, 'upload', 'file', NULL, 'statua2_ciano_pag3.jpeg', 'image/jpeg', '14c190a0176e4b371c62546f8b28eeb9ca1390f4', 'jpeg', '30ca4b2a05a3dcf59b8ca9dd3957a4b148900b9abececa88ea62daad52faaaf2', 92156, 1, 1, 3, NULL, NULL),
(17, 13, 'upload', 'file', NULL, 'statua2_ciano_pag4.jpeg', 'image/jpeg', '747b5ab1cef4abc52b0b8d21439e50ed8692b912', 'jpeg', '0694c2aa47283c7b35e3be481462290aa568d7e393826f68c41e6450f88735aa', 218129, 1, 1, 4, NULL, NULL),
(18, 13, 'upload', 'file', NULL, 'statua2_ciano_pag5.jpeg', 'image/jpeg', '623a9bf0c4c31d1d378ab72db11c3c3f4641e90d', 'jpeg', 'cb3ff7635360a84e7f46383722f6be3868e0a85de608890f19eeff3597445cc8', 84042, 1, 1, 5, NULL, NULL),
(19, 13, 'upload', 'file', NULL, 'statua2_ciano_pag6.jpeg', 'image/jpeg', '950f6486750884d73473b4b230624f9848f069ee', 'jpeg', '3132734a740ac05193bc0eca7c66d09a00e9c689b02e05f693ab27a3d6fc80ff', 208336, 1, 1, 6, NULL, NULL),
(20, 13, 'upload', 'file', NULL, 'statua2_ciano_pag7.jpeg', 'image/jpeg', 'b1606a8103da86855ce519032f872645e896a957', 'jpeg', '0d5355d0037bcbbe26cecb9ffe41760236ad057097667232db1d7d9f4371e1dd', 122646, 1, 1, 7, NULL, NULL),
(21, 13, 'upload', 'file', NULL, 'statua2_ciano_pag8.jpeg', 'image/jpeg', 'b02310d0ba04a1416202e771bd3a881ee557157e', 'jpeg', 'b26fb4f61253fdd51aecfb47f8c1c8bb39784c99762d1638fea5750e4f92a2f5', 108865, 1, 1, 8, NULL, NULL),
(24, 23, 'upload', 'file', NULL, 'statua3_ciano_pag1.jpeg', 'image/jpeg', '9fc6850cc5ce29eac45ae5aa7966e71c78b3e2e7', 'jpeg', 'a7d457a918b275c85d8c60db7f2e9f01d2cc006a83dcbe0735cc5f8d740bc1e7', 76867, 1, 1, 1, NULL, NULL),
(25, 23, 'upload', 'file', NULL, 'statua3_ciano_pag2.jpeg', 'image/jpeg', 'fe8fb36b7a6d14dbbf8421b93c926e55adf87e22', 'jpeg', '4ed3f73b9c87f271c5b9dc8104c88fe16904c5cc50b0a1ef8480f1e26efe0907', 36270, 1, 1, 2, NULL, NULL),
(26, 23, 'upload', 'file', NULL, 'statua3_ciano_pag3.jpeg', 'image/jpeg', 'f592c2dce7e56747e5e123766d1d7e6d762b33e2', 'jpeg', 'b82b553977cb42edae1079b732dd9cd124d5c561f4a82af4b04b8772dd7479ec', 76051, 1, 1, 3, NULL, NULL),
(27, 23, 'upload', 'file', NULL, 'statua3_ciano_pag4.jpeg', 'image/jpeg', '2c23758cd4de5bdb62ac4a7ffbfacff187d24c0e', 'jpeg', '70e319a0ba8980de605fc16ad59ad2c7857039945970c56ab65ecf3922d3bf61', 68239, 1, 1, 4, NULL, NULL),
(28, 23, 'upload', 'file', NULL, 'statua3_ciano_pag5.jpeg', 'image/jpeg', '67b89be2c7ef95e473b67b95ed3ac57e046a688c', 'jpeg', '2d9d17e3e4c9ef19422227784552142f625074935e1919bc18b60c6d0bbef1b8', 74867, 1, 1, 5, NULL, NULL),
(29, 23, 'upload', 'file', NULL, 'statua3_ciano_pag6.jpeg', 'image/jpeg', 'c3a7a35d5584bbc2c16b2792a1293e5370d0e7a2', 'jpeg', '3b055edaa4d5e7a74ab95f917853c7798124395d60156a166eb0ddcfcd5f028a', 98693, 1, 1, 6, NULL, NULL),
(30, 23, 'upload', 'file', NULL, 'statua3_ciano_pag7.jpeg', 'image/jpeg', 'ff359e3cca2a552aaccac86113c24bdd9c7663e5', 'jpeg', 'b38a6a19db114dc1c51912a512bcc9adfdae1f11670a7cb576153f581626ef99', 47542, 1, 1, 7, NULL, NULL),
(31, 23, 'upload', 'file', NULL, 'statua3_ciano_pag8.jpeg', 'image/jpeg', '44ded9abf40ddba0b42cf65e695aeb68f4dba147', 'jpeg', 'f90d96bce224f8a81cbf706eab6b0b71ed0e87a51016e79ca41ad7cb8354d7b5', 92902, 1, 1, 8, NULL, NULL),
(32, 23, 'upload', 'file', NULL, 'statua3_ciano_pag9.jpeg', 'image/jpeg', '84baac8f97b28d905675cba01d3c6dfb875294ed', 'jpeg', '1bfe35b475d7e5128477ef463f2920bba7628ed3837be429f88050132cb9c455', 129772, 1, 1, 9, NULL, NULL),
(33, 23, 'upload', 'file', NULL, 'statua3_ciano_pag10.jpeg', 'image/jpeg', '5689555289e3de3641f710c46ed3d644d6366c32', 'jpeg', 'b5fb4e408a65afd8d26ac0ae3049cab3aea056e97cc626271c76acde2c9b7694', 61764, 1, 1, 10, NULL, NULL),
(34, 23, 'upload', 'file', NULL, 'statua3_ciano_pag11.jpeg', 'image/jpeg', 'd25b45b22b7345159ea96fa8d8ce6d2e84044074', 'jpeg', 'ab503c2ab3a582905a0ff438170fa2657835777e7532bc1507af3058f2582208', 160631, 1, 1, 11, NULL, NULL),
(35, 23, 'upload', 'file', NULL, 'statua3_ciano_pag12.jpeg', 'image/jpeg', '9ac3a0400150dc306a769fcc350108f0e1c30041', 'jpeg', 'e9244e3bb4070c4509afd9fc02df22801c97c130935c2eac063137b0a15ed5cd', 160775, 1, 1, 12, NULL, NULL),
(36, 23, 'upload', 'file', NULL, 'statua3_ciano_pag13.jpeg', 'image/jpeg', 'dfb915f18ceca3036ef6fde278702b8bc0f704c3', 'jpeg', '94fe87ed89d0893fe5d82817849f39a00a5db45f5cd4d61fa770f61250da7ab0', 99383, 1, 1, 13, NULL, NULL),
(37, 23, 'upload', 'file', NULL, 'statua3_ciano_pag14.jpeg', 'image/jpeg', '17c4185e9ae39265c0bf5c9866e95171ba91042b', 'jpeg', '5c4418ebc83bfa0031f73f68b4b45f7aa370a3bb120c821e1df699db0cc99e96', 96552, 1, 1, 14, NULL, NULL),
(47, 44, 'upload', 'file', NULL, 'CC_codifica-ok1.xml', 'application/tei+xml', 'bded1487b9f28733ba9da7708ffb893d1d5c4c5d', 'xml', 'd2927923a566d34156563f05c23d435a54a061d0e637b81f143e7fcc63b05f49', 223512, 1, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230601060113'),
('20230713101012');

-- --------------------------------------------------------

--
-- Struttura della tabella `module`
--

CREATE TABLE `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('BlocksDisposition', 1, '3.4.3'),
('Common', 1, '3.4.55'),
('XmlViewer', 1, '3.4.8');

-- --------------------------------------------------------

--
-- Struttura della tabella `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('DsQPEe3n3oqlyCMfdU9TQWYP8MxMDssx', 4, '2024-04-19 16:28:05', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.');

-- --------------------------------------------------------

--
-- Struttura della tabella `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(2, NULL, 72, 6, NULL, 'CONTENUTO DE PROVA', 1, '2024-02-22 15:56:37', '2024-04-23 16:04:42', 'Omeka\\Entity\\Item'),
(3, 4, NULL, NULL, NULL, 'Articolo La Nazione giugno 1991', 1, '2024-04-15 16:35:44', '2024-04-15 16:35:44', 'Omeka\\Entity\\Media'),
(4, 4, NULL, NULL, NULL, NULL, 1, '2024-04-19 16:36:14', '2024-04-19 16:36:14', 'Omeka\\Entity\\Media'),
(5, 4, NULL, NULL, NULL, 'XML', 1, '2024-04-19 16:39:08', '2024-04-19 16:39:08', 'Omeka\\Entity\\Media'),
(6, 4, 45, 8, NULL, 'Fascicolo 1', 1, '2024-04-23 16:04:21', '2024-04-29 19:51:35', 'Omeka\\Entity\\Item'),
(7, 4, NULL, NULL, NULL, 'Pagina 1', 1, '2024-04-23 16:48:46', '2024-04-23 16:48:46', 'Omeka\\Entity\\Media'),
(8, 4, NULL, NULL, NULL, 'Pagina 2', 1, '2024-04-23 16:48:46', '2024-04-23 16:48:46', 'Omeka\\Entity\\Media'),
(9, 4, NULL, NULL, NULL, 'Pagina 3', 1, '2024-04-23 16:48:46', '2024-04-23 16:48:46', 'Omeka\\Entity\\Media'),
(10, 4, NULL, NULL, NULL, 'Pagina 4', 1, '2024-04-23 16:48:46', '2024-04-23 16:48:46', 'Omeka\\Entity\\Media'),
(11, 4, NULL, NULL, NULL, 'Pagina 5', 1, '2024-04-23 16:48:46', '2024-04-23 16:48:46', 'Omeka\\Entity\\Media'),
(12, 4, NULL, NULL, NULL, 'Pagina 6', 1, '2024-04-23 16:48:46', '2024-04-23 16:48:46', 'Omeka\\Entity\\Media'),
(13, 4, 45, 8, NULL, 'Fascicolo 2', 1, '2024-04-23 17:12:19', '2024-04-23 17:37:14', 'Omeka\\Entity\\Item'),
(14, 4, NULL, NULL, NULL, 'Pagina 1', 1, '2024-04-23 17:22:21', '2024-04-23 17:22:21', 'Omeka\\Entity\\Media'),
(15, 4, NULL, NULL, NULL, 'Pagina 2', 1, '2024-04-23 17:22:22', '2024-04-23 17:22:22', 'Omeka\\Entity\\Media'),
(16, 4, NULL, NULL, NULL, 'Pagina 3', 1, '2024-04-23 17:22:22', '2024-04-23 17:22:22', 'Omeka\\Entity\\Media'),
(17, 4, NULL, NULL, NULL, 'Pagina 4', 1, '2024-04-23 17:22:23', '2024-04-23 17:22:23', 'Omeka\\Entity\\Media'),
(18, 4, NULL, NULL, NULL, 'Pagina 5', 1, '2024-04-23 17:22:23', '2024-04-23 17:22:23', 'Omeka\\Entity\\Media'),
(19, 4, NULL, NULL, NULL, 'Pagina 6', 1, '2024-04-23 17:22:23', '2024-04-23 17:22:23', 'Omeka\\Entity\\Media'),
(20, 4, NULL, NULL, NULL, 'Pagina 7', 1, '2024-04-23 17:22:24', '2024-04-23 17:22:24', 'Omeka\\Entity\\Media'),
(21, 4, NULL, NULL, NULL, 'Pagina 8', 1, '2024-04-23 17:22:24', '2024-04-23 17:22:24', 'Omeka\\Entity\\Media'),
(22, 4, 45, 8, NULL, 'Documenti relativi alla statua di Costanzo Ciano', 1, '2024-04-23 17:36:24', '2024-04-23 17:36:24', 'Omeka\\Entity\\ItemSet'),
(23, 4, 45, 8, NULL, 'Fascicolo 3', 1, '2024-04-23 17:49:09', '2024-04-23 17:51:53', 'Omeka\\Entity\\Item'),
(24, 4, NULL, NULL, NULL, 'Pagina 1', 1, '2024-04-23 17:51:53', '2024-04-23 17:51:53', 'Omeka\\Entity\\Media'),
(25, 4, NULL, NULL, NULL, 'Pagina 2', 1, '2024-04-23 17:51:54', '2024-04-23 17:51:54', 'Omeka\\Entity\\Media'),
(26, 4, NULL, NULL, NULL, 'Pagina 3', 1, '2024-04-23 17:51:54', '2024-04-23 17:51:54', 'Omeka\\Entity\\Media'),
(27, 4, NULL, NULL, NULL, 'Pagina 4', 1, '2024-04-23 17:51:54', '2024-04-23 17:51:54', 'Omeka\\Entity\\Media'),
(28, 4, NULL, NULL, NULL, 'Pagina 5', 1, '2024-04-23 17:51:54', '2024-04-23 17:51:54', 'Omeka\\Entity\\Media'),
(29, 4, NULL, NULL, NULL, 'Pagina 6', 1, '2024-04-23 17:51:55', '2024-04-23 17:51:55', 'Omeka\\Entity\\Media'),
(30, 4, NULL, NULL, NULL, 'Pagina 7', 1, '2024-04-23 17:51:55', '2024-04-23 17:51:55', 'Omeka\\Entity\\Media'),
(31, 4, NULL, NULL, NULL, 'Pagina 8', 1, '2024-04-23 17:51:55', '2024-04-23 17:51:55', 'Omeka\\Entity\\Media'),
(32, 4, NULL, NULL, NULL, 'Pagina 9', 1, '2024-04-23 17:51:56', '2024-04-23 17:51:56', 'Omeka\\Entity\\Media'),
(33, 4, NULL, NULL, NULL, 'Pagina 10', 1, '2024-04-23 17:51:56', '2024-04-23 17:51:56', 'Omeka\\Entity\\Media'),
(34, 4, NULL, NULL, NULL, 'Pagina 11', 1, '2024-04-23 17:51:56', '2024-04-23 17:51:56', 'Omeka\\Entity\\Media'),
(35, 4, NULL, NULL, NULL, 'Pagina 12', 1, '2024-04-23 17:51:56', '2024-04-23 17:51:56', 'Omeka\\Entity\\Media'),
(36, 4, NULL, NULL, NULL, 'Pagina 13', 1, '2024-04-23 17:51:57', '2024-04-23 17:51:57', 'Omeka\\Entity\\Media'),
(37, 4, NULL, NULL, NULL, 'Pagina 14', 1, '2024-04-23 17:51:57', '2024-04-23 17:51:57', 'Omeka\\Entity\\Media'),
(44, 4, NULL, NULL, NULL, 'XML', 1, '2024-04-29 20:12:49', '2024-04-29 20:34:16', 'Omeka\\Entity\\Item'),
(47, 4, NULL, NULL, NULL, 'XML', 1, '2024-04-29 20:34:16', '2024-04-29 20:34:16', 'Omeka\\Entity\\Media');

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.');

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(6, NULL, 72, NULL, NULL, 'Articolo di giornale'),
(7, NULL, 66, NULL, NULL, 'Lettera'),
(8, 4, NULL, NULL, NULL, 'Fascicolo Ufficio Storico della Marina Militare');

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(41, 6, 1, 'Giornale', NULL, 1, NULL, 0, 0, NULL),
(42, 6, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(43, 7, 1, 'Lettera', NULL, 1, NULL, 0, 0, NULL),
(44, 7, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(45, 8, 1, NULL, NULL, 2, NULL, 0, 0, NULL),
(46, 8, 4, NULL, NULL, 3, NULL, 0, 0, NULL),
(47, 8, 10, NULL, NULL, 1, NULL, 0, 0, NULL),
(48, 8, 8, NULL, NULL, 4, NULL, 0, 0, NULL),
(49, 8, 26, NULL, NULL, 5, NULL, 0, 0, NULL),
(50, 8, 9, NULL, NULL, 6, NULL, 0, 0, NULL),
(51, 8, 51, NULL, NULL, 7, NULL, 0, 0, NULL),
(52, 8, 14, NULL, NULL, 8, NULL, 0, 0, NULL),
(53, 8, 7, NULL, NULL, 9, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `session`
--

CREATE TABLE `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('85sck5jjdecvdf0c6bl8qirkid', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731343431373337302e3232343739313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22383573636b356a6a646563766466306336626c387169726b6964223b7d7d, 1714417373),
('ibg59bqnkf1apegetd0eu08ufu', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333534353736392e3236353339383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f716c74326d693571656e39727633326e717675643965616976223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534373839383b7d733a35313a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534373639313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731333534393234373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534393236333b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534383738373b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534393230343b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226431633934613265656465356164333436623065363839653033666233616263223b733a33323a223062366635633637393537343738636331303630626362613363316337643233223b733a33323a226334393231646364626161383661646238666334373939316339616234386435223b733a33323a223662313965373266353366333930303239323261376162383932656664663961223b733a33323a223238316133663035393238386462616665633437313063343766363739663435223b733a33323a223735306362363038643037366434363962636239346165663862643636393736223b733a33323a223236663363323731663030623139376662373535633234373633393132323764223b733a33323a226362666332323236636362646164633330623139633935636263656261303238223b733a33323a223431313165373538316339653466643936633936393938373066323331616338223b733a33323a223863353537306361303162633761363465623339623564306366656562353131223b733a33323a223066613836353931306564643838356561383630333332376430643031386339223b733a33323a223030313230383437613566383539653165613234353963663565663136303434223b733a33323a223661636366373936333031636564386132363432306134666666613739303735223b733a33323a223436613630323566333734656337393435353632366363363564663037356130223b733a33323a223465393936656635356566373335306434316264653162623238356534616463223b733a33323a226134313335333933666333653034376362656364303238343130383264343862223b7d733a343a2268617368223b733a36353a2261343133353339336663336530343763626563643032383431303832643438622d3465393936656635356566373335306434316264653162623238356534616463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223066623166363831353230356438303838656564353236663531663332353566223b733a33323a226664393861636430616463616663343731376539656632663966333065333164223b733a33323a223165373466333661316164613939363664636235666431303466646361363337223b733a33323a223437633466353366646364623131663937663738636331366265613331656564223b7d733a343a2268617368223b733a36353a2234376334663533666463646231316639376637386363313662656133316565642d3165373466333661316164613939363664636235666431303466646361363337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a226433356438316235373966373930396266306262346166656237366164636539223b733a33323a223262326432633637326564616365613562346330663032316534623230323138223b733a33323a223833343736623165653965373535613736323162366136366232316432383534223b733a33323a223866396130343961386466396331396432393563386266353936306532363731223b733a33323a223933356236353164373433633536306261616365373065336164353966306234223b733a33323a223136663135666166356539613637326536316136396135303832303964303963223b733a33323a226634663338643566396630363232303363636634376135343733656137326166223b733a33323a226432376534316263663663643738636364373130363330643866303933656166223b733a33323a223038343264646539643035613636363863616333363335373435336437396531223b733a33323a226539613163636564306330623732383962643765323365333531643538613536223b733a33323a226163356465333738353033363364633662336130613265373463303664613437223b733a33323a223238626635326564646638623130666636333866643339346636376234373861223b733a33323a223162663233366230636535343262363166643136303837653238313630336666223b733a33323a223665336333623131623530613838616236356438653464333335623933303263223b733a33323a223432343066646136316265316236656332623337363963636366663763386539223b733a33323a226535336539306530323766316232366362663532613638623637653137343665223b733a33323a223237623733646434623366663463376563323766626436303064663464363262223b733a33323a226639613963663036396561346365313631653631313564383033383331396664223b733a33323a223035323134363438663235333238323631323737643839383936326438313037223b733a33323a226461666336343463323935616636333930366230386135663466313539363036223b733a33323a223036376131656661313634373139643831636661333464633533623930363266223b733a33323a223661373763643962303463363361303830623861366636326139656533333463223b733a33323a223766343862303638333661316662393738393962633662616530316661383136223b733a33323a223733663565353233333232613664656364383963316339663566663963333132223b733a33323a226334616332343434653262306633653735396161343831666337306235363836223b733a33323a226233333838306165336162373239363035306464363436643464306165366564223b733a33323a226236383633396233316638626638643765633961663962623631393266653563223b733a33323a223163656661366639333263663066353964313130316466616138663636616236223b7d733a343a2268617368223b733a36353a2231636566613666393332636630663539643131303164666161386636366162362d6236383633396233316638626638643765633961663962623631393266653563223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33303a7b733a33323a226336303262666633323038363035653632663064323831323966313432636431223b733a33323a223637643762656436343964656365343736393537666235656264353436636563223b733a33323a223833366364363836616636383532646461383562343034353132386635336537223b733a33323a223034643365653538646632646633303263356564666330333563663365303637223b733a33323a223638633134363037623163643661313536636132346534376665313739653462223b733a33323a226633646332653331366530303264316636353635633262623065623639373164223b733a33323a223065633061613835396435383838396162383439643831393437333263336466223b733a33323a226132343365326264326331613836383931383938356230333937386566333839223b733a33323a223638326233383738336261616263656637346139323731626335653735613063223b733a33323a223734363233346238306264396139386135366665313732383531623762343037223b733a33323a226663383738383538653032363134636531346139663831636166323737623564223b733a33323a223835663562326365343463633830393861316131353337386134653865313036223b733a33323a226265356133386539653364356536643762636238313838653730343330326463223b733a33323a226339303762613434623439336235643734366235366430376366376164383061223b733a33323a226535393961633632313037303930313763333137613436613732353862396264223b733a33323a223037343836366235343735333636363264313063613761396535333932356531223b733a33323a226138643437653033353461346361373131353166333333376539616630393235223b733a33323a223439343262353462376338613962306639363134356438623633646232393430223b733a33323a226334366433323736393162383733386133323630383366356266376138653533223b733a33323a226563666566313231363566316133663761636530376138363930386466643865223b733a33323a226533353866383331353035383535313135656261616262373035366666356338223b733a33323a223062616666343935353465313565343230633436636166643633653831316238223b733a33323a226462353762353064383938313131373334376634633562656661346634306134223b733a33323a226132633166643431663233343439656434323138383835666434376634643937223b733a33323a223736393339626237623166633832313533623161356462373962613030343833223b733a33323a226236343761633764303763636230333632333934656332323639373164623731223b733a33323a223161643237666431653032316236343839383662616363363936366236353632223b733a33323a226236356364393732393930333165643934373562616161633664386364633237223b733a33323a223763396630396265633564313632366461633034626138623363353630633136223b733a33323a223735613637386665366564383935333332663234326239643864663062633961223b733a33323a223933376236623063376563653765613031316530653265626433643230633230223b733a33323a226333616561643232653439363532303335363934313134373665383639613538223b733a33323a226131646134326237373338376434623461303563663037383037336164353938223b733a33323a223436333834353230623136306636383862653964623932623661353130323734223b733a33323a226463376235666463653834333732323830303937383864366538666365343831223b733a33323a223634326638623361656666333362663439636536323832323534653039613037223b733a33323a223863653265313638303264376134376562626435396534396437623130313037223b733a33323a223731333330333165333861386534363635353334343361333237393764646265223b733a33323a223931396137333761643632333436343964613663643661653433633262336465223b733a33323a226165636138646537663366303832326533313431613031393734623834356532223b733a33323a226637316261623437353237363664323462396465653766613438363533383034223b733a33323a223332373565663739656362623365343065396435653133643965303033663333223b733a33323a223662613932633334633835373131306337616263363934653561323037643961223b733a33323a226364363561313932306263633365626635353866303865613463313765633063223b733a33323a226462363637366638313365633564663865633231656531356236346261643238223b733a33323a223735356666653938333932646466343462343632303061346433373437626566223b733a33323a223034346265626131613661653734343664623765623032396566396236396461223b733a33323a226631363931346162626265643339336565353739366132303633346130366134223b733a33323a223830336363613938666663383336366238613130303666383461316637313036223b733a33323a226635666561373138393265313539653963616364376561626639386232313739223b733a33323a226266316337626435656664313837336636346336663965303962303735653335223b733a33323a226639393436653661646132346166333631653636616466383265343035373364223b733a33323a226334366635353533626231313536366465333438366464623332313333343964223b733a33323a223333333734633239333431666466333962666634316639633165396265306165223b733a33323a223866336636346232633237306434383537663736666664353031643337366633223b733a33323a223236663562613437613431383362613133636166396631616434353062613835223b733a33323a226565336435373234346535613635636534636236613139636131353233636133223b733a33323a226335393462313666373064633464333931323266336132333231333639396663223b733a33323a223132633766393434623965366137333032623236303863646666363261623064223b733a33323a223966386532373363383636303465383636623138633062336566636661613538223b7d733a343a2268617368223b733a36353a2239663865323733633836363034653836366231386330623365666366616135382d3132633766393434623965366137333032623236303863646666363261623064223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226234353238393835383930666662383730653433663864343162623737353132223b733a33323a223762366364353430343836356333303434303262313437653530366234313265223b733a33323a223139656462666563353561623264353138656133386663623430633966306332223b733a33323a226637306537623661643532613532353666366135626232393539366466663039223b733a33323a226531346564306431613935653466386639643639393130326365386234386262223b733a33323a223861666637353966393136633231623363623131653232396437396631643338223b733a33323a223137633566326463646362353966303838613437303463313164396436386237223b733a33323a223030343836356335336331626135346635643139626363383635663738376236223b733a33323a223061376536633965383166326363363663616330376232356332316131663138223b733a33323a226361393530636433633663616161386131346535373264643231353866356433223b733a33323a223734653636313732633330303232306266353162333631613762306632353430223b733a33323a223637396338363266623330316663393339633030316631346563613238323263223b733a33323a223333316561353438663438656466306439616131326530623364613965306436223b733a33323a226336346237663430303164643134346533666431316534363862663864343736223b733a33323a223961333664323461336230646138376532353561386334343661666536623463223b733a33323a226532323830396332396533343032663865373537613039323331626638343566223b7d733a343a2268617368223b733a36353a2265323238303963323965333430326638653735376130393233316266383435662d3961333664323461336230646138376532353561386334343661666536623463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226232373662653063623538323664643565663235313965303266373432316537223b733a33323a226137363761316234333235643232613862386165353237333863663135663035223b7d733a343a2268617368223b733a36353a2261373637613162343332356432326138623861653532373338636631356630352d6232373662653063623538323664643565663235313965303266373432316537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1713545769),
('lm6ua3mogsonca5kr9vdp3cnvo', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333838373531302e39383839353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223139697576756338726439696c616f75766f3139617063766239223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839313033343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226236316636653935343761316133343262363638396663303837386336646365223b733a33323a223233656334613065393161323837316261333161373761653961653464336231223b733a33323a223134326261393366626630343037666132666165626631303562346338636334223b733a33323a223936386364373564366662653264353235666330386336313234343833306663223b733a33323a226439336431643936333061663561616238383331356336336161663434393261223b733a33323a223162333863326231666363346137373737313537626364346135356237656234223b733a33323a223965643934316564396663663066343433613133333238633135656334393266223b733a33323a226131393135336135333436623161386332376634616434363638383034616237223b7d733a343a2268617368223b733a36353a2261313931353361353334366231613863323766346164343636383830346162372d3965643934316564396663663066343433613133333238633135656334393266223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1713887511),
('mhhek8a0urnocvh792vu9ndfvk', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333839343735332e3237303339393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676c6a346f7468343234666672366e3463766f3332316f64326c223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839353036323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839383333353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731333839383136303b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226364353963383031626565653636393237663732316336393337623733633235223b733a33323a226565376337666662386436646135323434636262613739353365306338386165223b7d733a343a2268617368223b733a36353a2265653763376666623864366461353234346362626137393533653063383861652d6364353963383031626565653636393237663732316336393337623733633235223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33383a7b733a33323a223764323065616338363966643164383431346266643635663735623433363237223b733a33323a226231323462636131613166346338663562346166393366653530303064613262223b733a33323a223438633732623966303963393636643138373130383631393162616535663463223b733a33323a226564393362653137376231333737363736373664336230366432616338613537223b733a33323a226533393163326135616234336164633038626637663336313738616132613830223b733a33323a223463613838386562386437356433376661313466393832333738313463323539223b733a33323a223133633563326262313739303632336231373434393261636165366461313462223b733a33323a223738666166326639653263613432363231616436616631616438633832363532223b733a33323a226261643336313438613536653766383763656231666538653131346231333233223b733a33323a223432313231386432326232303939396431326537633732396264336266323135223b733a33323a223030376332303265306666373834656637343965663062633338333531393261223b733a33323a226134626238616635336331303464303766623434636535613336353064343337223b733a33323a223237343566343865666433363430316262376565613637633137333534306539223b733a33323a226331646431346637653365633035633061373936363332613639653739356130223b733a33323a223362663861303166666434326163323431393261636465653634303233356264223b733a33323a226135343362323362323366373639313238393664633237393464383464323065223b733a33323a223532303464663430393237343733653133373864653964323564333336666462223b733a33323a223536656635306266376535663332666332323864396138363236313932616435223b733a33323a226536336362336437336435303632343461343534306431343064633564373131223b733a33323a223534343731393536643433306435666536353533363434323134373462363634223b733a33323a223064303934613831623831333666346536373531393766303639333861626439223b733a33323a226434333730626265396136613931316534303031313039393132333134656662223b733a33323a223930333864363162383634363134393935643237376232653431393536616366223b733a33323a223138626639353863343864323266636233353264303836353732316431653335223b733a33323a223830393134613732313661326538636135303666363434363765376366326161223b733a33323a226535356630643832366637353966616264306465323535663436383330386330223b733a33323a226136623639323232636631656161343134646666626663343938626564663931223b733a33323a223462303138363835323661646432323232616461386134356562636137396163223b733a33323a223139636130376634313161633439646330343763376134353137656166663662223b733a33323a226135343061323163343236616237333130366133646132376632343466343833223b733a33323a223564663538626166393566343137353839333463376630646434333337313136223b733a33323a223665613933383735656638313739396233356464303062653130633933373564223b733a33323a223862316362666332323934626639303835656636336163373230616165396565223b733a33323a223935353061343564653365383964633837353465386266376635303965636465223b733a33323a226266613332623931373738653036653631653962356434336439336163666631223b733a33323a226663626131393666653137353736303961656233363137323263356137666661223b733a33323a223265666166313836346535653563613836636535343638636434616133663762223b733a33323a226639623630373239356430313438303430636464636132663961643466333935223b733a33323a223065636331653036626530396331323334386661386430316636646132616664223b733a33323a223565636363353564343162663665626436313766336538393764386433303264223b733a33323a223464636463663362663439613766633934393338626330323638643865366633223b733a33323a226563303666323738346630393935626534323765383361343730363464633165223b733a33323a226436346433616364646637643435663762396164313966663334376330373863223b733a33323a223136633464643163396231316236363462323735356331396465386432376566223b733a33323a226639656466306431633762386637313034336165663438393930363535326563223b733a33323a223139356663636461356662366661313662303230303861366162363037373030223b733a33323a223065376539613964666136363637623636333466373335333634393139623662223b733a33323a226236326431343434643562363234323535623764653263313961656234646262223b733a33323a223035633236343238393465643663346537313566323761636638393162373431223b733a33323a223330353962346338353531323162646266393839383538366465656565653361223b733a33323a223730393739383835376532626661633131396235366466663963363265653830223b733a33323a226265303331363837396636336665663665643961373136336638346631393962223b733a33323a226132306563626335636566396431613935323565333631343861643831316637223b733a33323a223366663431303566643034623364343638376264613464356166623837663637223b733a33323a223634386164366666353331313639333362313434623663376431313662303536223b733a33323a223766663834363937616563366536356362373138373836653034323832343234223b733a33323a226362653836623764393431613262633865323963393035646365656164396637223b733a33323a226533663736623433366431623862336262643730666630623339313064663163223b733a33323a226130396163663763613539666537313831363136366366613434373666646334223b733a33323a226236333363343537386638663461613233613433663339633162323866383435223b733a33323a223232636433356566326338633036666566653233646239336632366636373366223b733a33323a223631356435313132363064386464633133323137646335343562346237353636223b733a33323a226138326230343637643565386231616435353531353834613235653666393439223b733a33323a223634326466643063346161653363663565306135343730396234396638373138223b733a33323a226336316138653230396432333337363735633833363532363932653763636439223b733a33323a223232643733613034303137623137636437323038623163333339323466383033223b733a33323a226365626539356139376564313730333330383036613864643336373066373365223b733a33323a223236623033366532363261643661613330396630383632383166323438396132223b733a33323a223366336437346466366432333132663765353934653436353739393739366162223b733a33323a226264316133306663663238353439373431613735343536376362663333623738223b733a33323a223130356362343266356232313134373365663435383665373933333261626231223b733a33323a226233613639616664313738343437633137383762313036303932663662663963223b733a33323a226436623364653263316566353866616534333130376238383162336665326230223b733a33323a223762623064633132396633636132636535393835333533336330363561636563223b733a33323a223033303362633365613431363363616262326463373266376664373564313663223b733a33323a226363333131316238376162623362626337636432366161366462373735333734223b7d733a343a2268617368223b733a36353a2263633331313162383761626233626263376364323661613664623737353337342d3033303362633365613431363363616262326463373266376664373564313663223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223834313834363766393532613636663963303932613435313964303663613137223b733a33323a223935396632343434353665316461393037346462303830663636373930373737223b733a33323a223130656433373237623232633162323963353263633762636635383137356538223b733a33323a223538376130343063363738633435363431383362343961653932316232343338223b733a33323a226634363332633061383561303632333365343064363636663165313936343938223b733a33323a223161346536646361303634303161393162656334356462646534376539333062223b733a33323a226636303663356666316239663334313031626232353933653331306137393938223b733a33323a226535393230343932656634313864333133333732636133643837363739356431223b733a33323a226333376233393364363331393335353962326632653131373332343864373262223b733a33323a226638383634623364616136633730333662636635356133326537313338666462223b733a33323a223964383064613166613131363234363637326637656330356330356331353962223b733a33323a223365356231346235356339356262616165343735323131663961393335353735223b733a33323a223762373463646265333261356266303264396265373331613732663865346363223b733a33323a223062306532336139656332383235376633323431626437613637333761303363223b733a33323a226336393164353264373930613730636266386633613739396533666564633762223b733a33323a223435343039663464346530666130343934323766316337396636353935666336223b733a33323a223831303034396437373066313061653832353833366465613630316130616664223b733a33323a223661303165663431353736613736393534646335366162363663376431323564223b733a33323a226136373633613338656361633066636236393938373665303437343332366236223b733a33323a223765656465633266653031633535626661336365373632616639346635386338223b7d733a343a2268617368223b733a36353a2237656564656332666530316335356266613363653736326166393466353863382d6136373633613338656361633066636236393938373665303437343332366236223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1713894753),
('r987rirapbid44r6fh13735hmm', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333839313137332e3633333835393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22653636643931636e6f64746d326a3861676b6f73627575656567223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839313431373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839343737333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731333839343633353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839333234323b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839343737333b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226635613735653530653966386666343264303334336163396231653031623962223b733a33323a223236636434646630336637366164313062623930653863616638343035663164223b7d733a343a2268617368223b733a36353a2232366364346466303366373661643130626239306538636166383430356631642d6635613735653530653966386666343264303334336163396231653031623962223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34313a7b733a33323a226263383333346531366665376366393438336335336534656330313163653737223b733a33323a226232653535376664326639353138623961633231643731303431646639613265223b733a33323a223166353939316464633034393132326437346163323362626364356635653162223b733a33323a223131646564616236656434303161633934366135653666333532383630656438223b733a33323a226539633134616363663765333136626564623565663737373463646366613338223b733a33323a223463396232663265393037613864376534376138616163613862373233386661223b733a33323a226263313961643464393735356166616236323834303536363662353362376539223b733a33323a226161633331323139336465656537306437306361656561323463633163323362223b733a33323a223939303032383533613534376235653235306462326439343331313065656466223b733a33323a223864616439363766333162316661613566393632323937626131663863353138223b733a33323a223938333237643036653534646533343432353965333433653239643534653135223b733a33323a223362333864626361363164653734326633653236316262316463373937643130223b733a33323a226461306133383364656537373332316238663837306463313732316433383361223b733a33323a223766376539653666326435386636636133356235616561633731363338376263223b733a33323a226632353764363164656534303335333761383866323833386261306431333031223b733a33323a223935343931666362663237613339316134373362363233626263346433353232223b733a33323a223161383462623238303066383237376137376130336136346464653530386339223b733a33323a226164343933316632366564316633376232363564363261653163356539616333223b733a33323a226331666633306464343131663730333463613334613064323766363333393839223b733a33323a223661656566323935313962393565393666633838323638323738323931356239223b733a33323a223332643137616431616265356539613631383835313635316666643364336335223b733a33323a223836343439636266366465356630316339306234336132363838323434303833223b733a33323a226664343234366331376135616633646263363433376630386433366236636364223b733a33323a223836646330626264643537396634653130393062386332633738633035383738223b733a33323a226332643739343438313038323365636162346361626234663266653432666334223b733a33323a226663663966653536636439383665396163356666333666646637343262616630223b733a33323a226634623066646166616539393538393166303233376364623965323764306532223b733a33323a226632653336376336626531343239303163383063303239353466353236363836223b733a33323a226334626465383934303765643566663030663637333963623666353762396130223b733a33323a226665333362336538376330643663396233306632346535336135656531346562223b733a33323a223261393663343937633331653735653564646565316466313364643532393632223b733a33323a223933356430343834666663643839396165643735323864396234353734343331223b733a33323a223162323732363934306437333139613435343739326565303562336663613434223b733a33323a223865303435376365323232313836386665616563303139663236383061323063223b733a33323a223833323332336263343764363531666536643237313931666336396331316138223b733a33323a223139366535393235636134343564316161633636373830393438323332383130223b733a33323a226363326637323436613465663738323239356665356661633363386633333463223b733a33323a223238636235376138643663326234663165343439666638336437666530316439223b733a33323a223831356233336337376137313864323434363933323832383136303262346437223b733a33323a226366366238376161653332633261653137333461616166303563333761316363223b733a33323a223537306635663634323530623736626133396133313562353636386432353837223b733a33323a223463383565363637303065373162653861396136356132393763666630323037223b733a33323a226139353063376639643537656231306666616433663138316164373265303137223b733a33323a223531356363653432653336303237323230653636333034336634313039653266223b733a33323a223465316465356238323665363031623535383765366533653166363430626536223b733a33323a223662386162383631626333303935613932636664396362373932323561366336223b733a33323a226564316464336261356662366362333030303962396233353834353735623833223b733a33323a223839633133333531646164363761653437643830336164383834626439373764223b733a33323a223632323564373632396564353539316437653461333030616264323962643061223b733a33323a226634323234373539666632336237623063633932343534346664373236376439223b733a33323a223462643030383633663732376335323035363939383039373339353261376661223b733a33323a226231376365313239643764636139313130383435623832323536333337643936223b733a33323a223235663262393734396664663962643736313261333664303066313531613838223b733a33323a223061626634316536346566333436303965653966646365346366323066303230223b733a33323a226666646233656661383662623861303230616161646534313762333237643437223b733a33323a223638313637386566633361613437373838663434663931633939666262643866223b733a33323a223234656634313635626661666564643135636238376636626233653461396365223b733a33323a226237646639333264313463356632613161616237306337313435353339343333223b733a33323a223230623032326666616366303636613930643561323638383833653165626464223b733a33323a223230313765373738343235633464373635336333323639653761643236386233223b733a33323a223837306531363961386131303766643965366438396334393330633830333139223b733a33323a223932386239613334336530636461643537373365396562643736363337323933223b733a33323a226530653761303465333830326231383361396338626163653037656337373862223b733a33323a226638663630376534623764326165643466346338633332366435313962643165223b733a33323a226162643631383864653837653735373132663435643365636632356238623563223b733a33323a226232656466613465663563663632323631313330353166393535363466356639223b733a33323a223164383462396231326566343135353066383736346334383331633264336533223b733a33323a223130316134396336343537656166663135616262613232373439313332373938223b733a33323a226534633932386530373661363463396434376335323564613937336566613030223b733a33323a226431646334663533313637333636613439656634656135616363663135653061223b733a33323a226361643835316337333762656564643363623438636431643764636139643238223b733a33323a226462303662343938303763393533316636653466633638316566326537633130223b733a33323a223563396662383038363234383839363938633936653632646539656436616638223b733a33323a223332613731666637376465353136656165653232633034656339663333383662223b733a33323a223465666361303865623830373731383236356430346637386435313137306339223b733a33323a226537646535336564356630346364663530626364396438626137346134666638223b733a33323a223532333436303763366631363863343463323465373533383437613962376636223b733a33323a223138323439623333633961376261643435663763356565653835623835646635223b733a33323a223966633064643231653032373163653938616637303964633263363964313965223b733a33323a223730386433323939363965653731363261346639663062666237346532323964223b733a33323a226338646231383130343264363036663232336361313133313163396165653733223b733a33323a223364656166323932633431326630663137643262346261353939343037633933223b7d733a343a2268617368223b733a36353a2233646561663239326334313266306631376432623462613539393430376339332d6338646231383130343264363036663232336361313133313163396165653733223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223132613832336432333566323338613464396564353037303766353563383561223b733a33323a226431363631303237366561616334613933636563653530376633333362326339223b733a33323a226633646533616465666263333330393133663535626234393536313032663737223b733a33323a226262386439306361623364663766376338646461343162356366633365326438223b733a33323a226666653737353538346334646234646461393930643335346636343565633463223b733a33323a226239663939653631663730386363313930643739396263323130666335356439223b733a33323a223062373066303236343432346636646164323735396332383464663030313431223b733a33323a223461313135633965346166336564646636333738393736653035396530393437223b733a33323a226166653432323038616261663438363262353362646366633561393761666436223b733a33323a223261383032303937343362663334343939356631636666633663393734633936223b733a33323a223236316339646334313233666437643032353838313334393463663837613139223b733a33323a223265653062626263623266373737323964353237663034616332353938393461223b733a33323a226431323435656130626565393637373630396439613964323630393136303561223b733a33323a223239353862343764663039616366343539386337663932613062643934363231223b733a33323a223463663739616462333939633830653238306363373739333931326165616239223b733a33323a223464646362363265333162366539633965376632393333663537346164396661223b733a33323a223162653262653262373831633862323466376430323439303266633736653036223b733a33323a226432333337616464306132356632363464616331653835346532373133333034223b733a33323a226264653761343538656161623338653132346563373834356265663339643966223b733a33323a223834333366333334346439623438666433376538663539643466373935326465223b733a33323a226437353237613434326465636465646136656561633161396162653834343636223b733a33323a223165333066396436636631353234333231346131613666303862356334333764223b733a33323a223932626565613462636537363035303965623465626664636632613530303639223b733a33323a226437326631313831663434383238383137303561386639613265653436633865223b7d733a343a2268617368223b733a36353a2264373266313138316634343832383831373035613866396132656534366338652d3932626565613462636537363035303965623465626664636632613530303639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226562663163623266393336353531383836656461373831366534656239383538223b733a33323a223937383763653364626534646563323961376361656434613936616561346362223b733a33323a226261646136393135343030303663613562356537373538356136376335653030223b733a33323a226233653936306163633665346163666563376665313532353332313434323539223b733a33323a223563663565613062373630353236376561336364653332333730316630643732223b733a33323a226264623263393238383266656266393466366238306264303137313536323530223b733a33323a223232343463333864363633333666363936653730666130326463353433383239223b733a33323a226532383636646464383963326464363730353436313661656665373238386561223b7d733a343a2268617368223b733a36353a2265323836366464643839633264643637303534363136616566653732383865612d3232343463333864363633333666363936653730666130326463353433383239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a226138653830343032653038616132313733396362343238326335386239653166223b733a33323a223832383939643235663734323734376433303038643565303964363537326533223b733a33323a223562383664636433666530666361306262326534613930313130356533363132223b733a33323a226134343537313836656234633837323962616564653535326630666537343931223b733a33323a223939653635353539616630363537656335336330323161396532393434333337223b733a33323a223461353930336265633864653738656331666162306165316232393465383533223b733a33323a226534376164396539396534356132376630323834663963396663636562323963223b733a33323a223962363161623562616363343864616662353862663136316362666263316239223b733a33323a223061353131373765353134663735333838373836333336663032363466633037223b733a33323a226436663665356138373561653430303964653864326563363034356631663566223b733a33323a223965356564643733633065646431666339333437396463653264376137366364223b733a33323a223733396562663334643031313431343666623838353330636363373338306265223b733a33323a223835643134353961353663346366393536313139386666666361343631616130223b733a33323a223330643937306232623738653238336134613961333137383234353464306638223b733a33323a226230333734633536623732396562653361356665383630643430343261356464223b733a33323a226437643038646264303863393665653965343931303362306435656462346666223b733a33323a223262343633643830363139346333643038353964613364366462386638653066223b733a33323a223361626666646564373239333936666363326266383766306366626535323466223b733a33323a226232613632363638383862343435626133323766366664346134393338383038223b733a33323a223034346332376562623135646330376138326439643334336331643137323332223b7d733a343a2268617368223b733a36353a2230343463323765626231356463303761383264396433343363316431373233322d6232613632363638383862343435626133323766366664346134393338383038223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1713891173);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('uav9l05os348vf5lr8esgcakri', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731343432333731312e3433393930313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276696768736c67307565637064756c693234746f6f346c6f6871223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731343432313030363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731343432373233373b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731343432353830343b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731343432353539323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731343432373233373b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226639343734393837376535316236613266323963306264323162393030373430223b733a33323a226339356331323733646639653434613163656139616561343164386361383664223b7d733a343a2268617368223b733a36353a2263393563313237336466396534346131636561396165613431643863613836642d6639343734393837376535316236613266323963306264323162393030373430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a39323a7b733a33323a223365346231313439326161633736343464333038663637666361653530643965223b733a33323a226639333034343863613737643966346464343633336639616131666238303631223b733a33323a226132613532313632613862653564383362653135396134626462383738343462223b733a33323a223534613438326133326266333666366337346235303766313964323666393837223b733a33323a226265613437316334623765353539323262366335373765386233633232383265223b733a33323a223163373335323730613337393866616637656439393863383836653634303238223b733a33323a223534343935393438376637636133616466623839393063636233343530353835223b733a33323a226163316361643234373436613765303933616339303034626137656132643662223b733a33323a223734326537333939336233653632626433663465626631373235316563376338223b733a33323a226635316139323730373633643831376638633165323037343330666566303336223b733a33323a223662366266323963346134623136353336393430323037653664376232633433223b733a33323a226565356133326535323236383837626462643761393463336638366139393539223b733a33323a226136616162396431643363663764313462326333356331343365326165306131223b733a33323a223834396138653262653739373165646435656163646533613038326232393538223b733a33323a223937626432306264333737333064633234363133666238353465343236303632223b733a33323a226638353065643639616437336236386436626663663431633064653732353834223b733a33323a223030363534333236326534323162313831623165633761363664306638356332223b733a33323a223463653230373663346335386638663164613836623136656665343838396565223b733a33323a226265393730653031336666356565313866643131623664646536326462303632223b733a33323a223266333830663834616130626463316136333430323464626131616637666563223b733a33323a223164353637313130623237333463623062336131376366363064326465363133223b733a33323a226132653137333862386263653334633532643563393032343561666161343734223b733a33323a226138346437373939336237623336306631303765613932336236326538303662223b733a33323a226265376335626364343234663261626634376332633636383062623132326261223b733a33323a226631666630633339363333643964636265303333303538386536326134626264223b733a33323a223131306465356536396635636665336464353866323637303536376338653132223b733a33323a226164383836376161633839303234663837366332303564646339613332653633223b733a33323a226438646634623539313966313130616234303534373063343735346362313337223b733a33323a223361643762363032383931333938383034373639636535363433623932623561223b733a33323a223737316165363530353836343962316231643833663131333566643766313433223b733a33323a223035333235633738373162316438653664303563623062303930356232303864223b733a33323a226539323337643861653766386665666230366265306131653165313732303532223b733a33323a226639616138646264303962393861653332323961323930313661336661363365223b733a33323a226163646439656433326663643838313361323064636463653732353964653861223b733a33323a223338653961643439653561393663663734623330393666616437656232343834223b733a33323a223035373130303762316665346266336337376164396461616365333738353630223b733a33323a226136333839326663623937336332353837386337343830343738376338303863223b733a33323a226562626535343439376161663261633866326164616332623336366637306466223b733a33323a226133643836663061623461656365336331323238356463336535303734616539223b733a33323a223036636162663736633966303837653231323030303933343764653435653737223b733a33323a226230376464353961346663313361666266636466383938666339343437633737223b733a33323a223531643636623334363531653064626161323365326130303335626262356433223b733a33323a226239656465653634326439643136646462303061616266643136346533613136223b733a33323a226562316437656661653339356561363834373765666639623437333564386363223b733a33323a223464666330666638626663386336393538346662653264353466346539623333223b733a33323a226430373530643963353430663432356461353036333138376632643632333238223b733a33323a226239366463656666376632313262643931663339653366376437393762616238223b733a33323a223438346438353235643966373830613863323761363137313638353231626232223b733a33323a226338623336356561393833616164373133666432376665663030386330626361223b733a33323a223635623638306432323933333362353065343034313239303237663334323832223b733a33323a226662366538623934623331346631386131643561356239643332646630633965223b733a33323a226461646136323661656163396330383832666535623833653531333035626366223b733a33323a223562373032363339353731316361386266616561373261363831333330316438223b733a33323a223462643530303933393035376234393565343638313038613836663461346164223b733a33323a226465613032653633363233613537623338323839323231613266636337363361223b733a33323a226132353865323463346639373039373935646533323664353131343766653761223b733a33323a226533326265323861363030303736666431323964353764646261383834616133223b733a33323a223566343431636534633536616531303166653730623033303165663932306338223b733a33323a223366323138373535353564623736363232393531646634333864626264366365223b733a33323a223434323765396538646635303637393661336530313365376138366430626163223b733a33323a223234313566336336363237626239366163383535623464613232636438343061223b733a33323a223166313561303865383630333336316564623761636534666466306366623336223b733a33323a223437346435396530393466653439323033346334386439666436313532356231223b733a33323a223866393131316531396530393966663666353336623130616439316436343932223b733a33323a223431313138343065336638636664313031313837346133356630333135353633223b733a33323a223131633732353564636139356538313337386661316536376138373061323730223b733a33323a223063666262636637393634646531393766633733306234626338626132343964223b733a33323a223662353131323836616363613863353337393633333266393438663865626361223b733a33323a226430346637616439306466336463643938383866663262613866303032636261223b733a33323a223536386436356235303230386637366662653534313965623734666534343263223b733a33323a223737643039666135323936316165356166633736383764333137386462643762223b733a33323a223538623664323038376330323537396361336665303663633066343731663664223b733a33323a226431656162373234653534623763636238613663326235623863323634336566223b733a33323a226530663234343162616336396134343536336636316139613832353837376564223b733a33323a223761373261666139336531343136646464306265633030333531643361643530223b733a33323a223836396362373463313039303166393830373433353261643265643433393635223b733a33323a223333633535356131393862633638386638303636633562363336363034636162223b733a33323a223932616336636462636664353662386565653161313164646138346637383165223b733a33323a223439373134356331653631653066383161653066343232666163643638383965223b733a33323a223230363736346534396136373634616639363636326335356638343962383663223b733a33323a223136373539646639336636353235666639653862336336626664303737353662223b733a33323a223133396630346334366135666437363066653936626365626131663665363232223b733a33323a223338643036613038343232613665383963363737666262633537393633356334223b733a33323a223133383530653063653732396538313730313032323066323835663131663962223b733a33323a223237306638663563663338346137636434303839643166663765333838663034223b733a33323a223764333537363733343939643564316230396136346262343264343632663336223b733a33323a223562646331613633343939363261393863353739343461643339386134343863223b733a33323a226532636436393166383766653732643763663166396165643262323666663232223b733a33323a226539643966323632636136393631333335656239316662363464353561306434223b733a33323a226563363262353265343130643964346134366433656331663834636232323832223b733a33323a226137353263396330363331616137306166376337376234313466346461306139223b733a33323a223038626263373434343330663962303137666431383466363835393039626439223b733a33323a223831636230643037363062386238626634336263366533393333353865383761223b733a33323a223764396437303832623565333536633264366431666131303339653231663036223b733a33323a226137303832383632366130623864313962623062656332353463663130313765223b733a33323a226438316338363435626233336634623838663739643863353133633039326530223b733a33323a226363373530303434353833616366386636626566373335653938323566383637223b733a33323a223439363463663765656239383237666562623032313666363333396234666262223b733a33323a226338636233383766656262306632653731326631633433373666613665356566223b733a33323a226136653362336530313331376166643431313238396130346439636336393235223b733a33323a226331663439306536353530356561633334653937363865336661343565363738223b733a33323a226262383736633331633461396638643431623134303337613234356635383931223b733a33323a223239393861643561306262323838316365633737653637376538376364656137223b733a33323a223434393233613833356364633663323662363539343037336633623237376331223b733a33323a226364626137613635616539616563613139323136643463633634623264613532223b733a33323a223339656437326533613863373236303739396539623861633662643665393736223b733a33323a223133643435353134343462323637633962353365633735653132303331313966223b733a33323a223633326431333466393934613139323166333966633564633736353262353239223b733a33323a226531313239373234303139333532363666346633653035393465323966316138223b733a33323a226162333231323137396436323561396333333064653035326234303165316339223b733a33323a226664323066386231663463363464396533323034313333336233363037396332223b733a33323a223736656463653339396430666535373364386338326661653831356539613931223b733a33323a226266356162353134383363323136366262393535656635623933386634653863223b733a33323a223332386136303065373536623232336532656536333231613131336561623066223b733a33323a223231643637326565623864656430636137393266633834333137663961393836223b733a33323a226637343533353365663236656236373464393664643432333032333866386365223b733a33323a223937376631363961383965336137333663373632333537343630633633653536223b733a33323a226536303639386535396237326235326664613264386535326430616430356365223b733a33323a223533356230366432386531396334323233376364663365303634363664363936223b733a33323a223938613963353261373065383463353761396462353238623634376564363436223b733a33323a226438343961356363663965323938393137363137323464643864366335356266223b733a33323a223163336463313136303638636664666239366439386538346330633666313763223b733a33323a223037613236303037346539323739656139323130386136386234353332616238223b733a33323a223033306230363734663661303232623431623834643232666431333766656565223b733a33323a223837343664356237666264666263363435373038373233326464323232663461223b733a33323a223766313239633133373832356161656663393033643062633338633939313361223b733a33323a223263326530303936323430643766386432633238343139336630633336653162223b733a33323a223361626664366436306435316564343433343938343861316364626637333631223b733a33323a226232346339623934363365356536663632346430356430666266373262376465223b733a33323a226335396638356232376137626432663636343966663562363035353237633837223b733a33323a226365653230323761353462656137663739366531626139386265623136623836223b733a33323a223436393731303132383530316661306365323161643233636533353738316563223b733a33323a223630636665316234613665346662343963353465376239626638303461366662223b733a33323a226539356435353366363964623938353461376230633634666365363734623762223b733a33323a223736336163353239373037666164386132663561313766656333663135393738223b733a33323a223339363334626339363033346265663537653462653463353932356232613835223b733a33323a223230336564393731633137396332356361386238653331313937626439633530223b733a33323a226131303164663936613837643566633365663830383736316334353265353666223b733a33323a223139346635343633663930303239363166316331643165323830393565613666223b733a33323a223631313161666565653636613134663131316666343134383661656635383533223b733a33323a223339373937666335613032343332633330363363626462373133346533666530223b733a33323a223637313065386666353939633061616163303464353666616565363936313231223b733a33323a223865343164346631653263613537363430386233656633373234353038313931223b733a33323a223435613064343437366334383436653039396237353839653531396664393831223b733a33323a223930363162343836656432383632393664386163666532363430626366366232223b733a33323a223331363235383064643734636133646432303934393866313762376330386565223b733a33323a223565303739373466386163643035313737383230383034343331353431393166223b733a33323a226139306138646463663732653334343138306361306538616437653434623338223b733a33323a223138303866363733636665336461633333366361636461376633633966306333223b733a33323a226163356233626430393832316561663837656333393332636562346239303431223b733a33323a223933376231313635626439643334366138373032336262636138393563323639223b733a33323a226232653335306235393762346331636463346135613264336134636335326639223b733a33323a223434393433393234646332383265656435353937306137393338643933303266223b733a33323a223761316132326363323366306663343134343230633239303730626662663966223b733a33323a223535653566633939306239313231393564313330313462616137643565333134223b733a33323a223365393037616537663963306166373639346238343133636666653737363866223b733a33323a226432346462616131363730383463363239373135383832643231666632353265223b733a33323a226233326463396332626238383635356234613839636162363135313035646239223b733a33323a223633363632613563646637386463363664343839383137336264663332366361223b733a33323a226433646539613135376434633165346432393731626563376661643136363964223b733a33323a223463313136363230626337343937373731366331313863626338306265623862223b733a33323a226466303634336339353766643863666565616539363433306564656431626530223b733a33323a223539316166656161626365623336386535626431666439383761333563646564223b733a33323a223961396166326538656363376137646637656366613837636562613065633633223b733a33323a223130386534633166633762653431366632316166623031643635386332366631223b733a33323a223533323065393731613539303863613565336165336239613639333931383331223b733a33323a226130303833666134306635303663363332363231343334326231653739383063223b733a33323a226662643761393763303966326639356139336430323762303939643533366365223b733a33323a223532313339663638313138636137303964356439613035386366376130633738223b733a33323a223438323738376330643762303364353333646662343439303133616233306661223b733a33323a223733643163303439666164656133363063623536363430363862653133313035223b733a33323a226162343234656261663537373266303666316564383736393862343438323765223b733a33323a223439393735616337636161346564653062643536313433636537343563396637223b733a33323a223938623237393361363566616664363736663633323737356235646337366161223b733a33323a223136663464643966363134636239303037636366636238343036626138393963223b733a33323a223534633131303763323866373433643235653033313736643831373633306539223b733a33323a223935343135316138316532373238386334303135636530656237653663616535223b733a33323a223733343665623562653233663036623765333037656161613030623539323938223b733a33323a223231326430303837343266363434663366646262633062323166353838663735223b733a33323a223966623230366433386134656561326633373830323165653266613634613631223b733a33323a223334626565666266353363656533646364626435386265386338396262373134223b733a33323a226663343430663330393335373965393430303834306635343330646165343832223b733a33323a223866353362363836623432386566626361396565643731643537326265313738223b733a33323a223634396435363164306663373033663433626336366664356336306264643039223b7d733a343a2268617368223b733a36353a2236343964353631643066633730336634336263363666643563363062646430392d3866353362363836623432386566626361396565643731643537326265313738223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223631643230346636386331366162653031306331643738326233373365623863223b733a33323a226635626235653364316339666230653134313539666661306561343462346235223b733a33323a226132363464626562306630636664363736303134646331623466343039313161223b733a33323a226236633566396437643232666431623261343362316564356533396634326564223b733a33323a223238313636303464393861313664393236353634666566343430396164323864223b733a33323a226562626431366232356438343034323865613837616639643163326530323261223b733a33323a226536306130303165656332346434333363383766353839363230623537653238223b733a33323a226434646434343061353661626334663934316534306266643566646439396532223b733a33323a223662356261643334393064633333613862356238633732333863366364633463223b733a33323a223939613533636234353562326133366635643936383762333937666331623633223b733a33323a223139326330386634633164613437316235363531383935343832666633373366223b733a33323a223336613832336536303037653733333761353963306462346638626261336664223b733a33323a223036386162366464343064623163656161326635396630636632363030353134223b733a33323a223531623135396339313836666535656436363239666162643432313537303466223b733a33323a226264383937363362333662616165333538633134643961343866333231633166223b733a33323a226364616631336130353961316362653639303534323830623264363065646264223b733a33323a223730343061373332386262326566633564313966613333363166633332326436223b733a33323a223936356534343938623836393834373233353565316361303163323234373137223b733a33323a223338656561353734323934396638643236666463353165656239646532396134223b733a33323a226534346265376130666335663235356538633762393862656437386566346266223b733a33323a223764386466633963663937366130616432323564323934666561643566636137223b733a33323a223362666337386338303037623466363430326331393130653663626563396530223b733a33323a223764316164333966336239656666613132336632346563656130653631666661223b733a33323a223761626362613931666131383062343665393663313562333965326630316533223b733a33323a226338336163333763373935626634353031376531666639386164323438323661223b733a33323a226638646434343166363737643832396663303664646436653338663034643732223b733a33323a226130613464336463343433323136613765623861356563363638633566663636223b733a33323a223463646631303933623631396533663330303561306436356139343261633461223b733a33323a226432356237316163353466353864303136346435383066353965383864323430223b733a33323a223737373433646666623736633134613534376437656264303539613065363435223b733a33323a223238353461336337356237346132616464643330356164623864333066636464223b733a33323a223938313231373737373962356538366535623564353163623233613437643438223b733a33323a223635613131643532656666366139633264393535366132626231366563383933223b733a33323a223830633562353863653065316363356161353764663535346561636330386539223b733a33323a226564363965666466336430353535323166623261663663633837386363643663223b733a33323a226536316138303630636666303336383965323733623034616264346633636166223b733a33323a226632643833333135636236363562613631396231323630653665626338303666223b733a33323a223734626662623136313432343336343231313461393266383362653636663239223b733a33323a226666356239636536636632303864303063626165396130646662653536393264223b733a33323a226631666235353232383964343363633535336234623266323861663934323064223b7d733a343a2268617368223b733a36353a2266316662353532323839643433636335353362346232663238616639343230642d6666356239636536636632303864303063626165396130646662653536393264223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a226631613335333430393232656139333131623333316464373138336564393764223b733a33323a226232376435346333383932643363653866656130613839313061333130383835223b733a33323a226330343734626334356231376662373563386637363435396538653538313931223b733a33323a223638663239323832353533353634623730303663303732653733633332346135223b733a33323a223939363266336130343932346134623737643139353132633233386362383335223b733a33323a223363313134643337323366656562393765383433356433346165363131633238223b733a33323a226438633263353565326564613930393339383936363538366536656630386637223b733a33323a226530646563366132383931306261376434333530376637393932666530393437223b733a33323a223662623732616463303363303666393936363765626130646234356263353762223b733a33323a223936656136323633656335653363633137393534633236313232323065386566223b733a33323a223165396664653930303935653363646230663763663833393066656138653936223b733a33323a226262353531373639363739363436646562623263316662613064363034313931223b733a33323a226163336466366364306330323730383737396434386361333136663931666363223b733a33323a226535643838303362353839346165363032383862643166313438616361356233223b733a33323a223539366665613065353632303734323365323736303761623531663230383031223b733a33323a223066623334386335353633626533636466313864366237323439323461636433223b733a33323a223534343964633763316231363739323932366530336438623930636334396438223b733a33323a223034616535396166316663343139303330366365633363613039313566643737223b733a33323a226232633562626633376161613937663062313266343131353836653630623736223b733a33323a223836343166333235313531636439633639636462353562316231626565346566223b733a33323a223961653635316161623166386261306135363137623639313562323330326331223b733a33323a223133326630303633366130343638363230633436306230393463313931646634223b733a33323a226433333737633461326430303237383665373166356362316462656432396236223b733a33323a226234376663333166643331653263316566623633323936626433393362653164223b733a33323a223130643461636230626139386238333131343738343438336165646165313132223b733a33323a226565623731386663333135643763653537646338383734653536626639636662223b7d733a343a2268617368223b733a36353a2265656237313866633331356437636535376463383837346535366266396366622d3130643461636230626139386238333131343738343438336165646165313132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35313a7b733a33323a223162633762633736373661393036646562353464353937626135626339303132223b733a33323a226462353466616335393132376539626164646632373638353732313338623862223b733a33323a226436666430363737626330636232393931326434396436373464356434666431223b733a33323a226631623963616330616235383066346533373330323638623135636130326532223b733a33323a223365303939343534616333316261313335623636356237326263343931346632223b733a33323a223966616432393239393135656264663738306363366237373839366461643832223b733a33323a223363346264666239313735313634343431333034383237636463643634626133223b733a33323a226233316264366335666137643364366338666661643461666333636164306265223b733a33323a223966623538303365623736663566396137383636396564636433343435656132223b733a33323a223861363338323464643933623535613863616366313664633135333839316361223b733a33323a223130623330303930653366663837653035313237336336643964666530313830223b733a33323a223635626134396633663635353934353632353066333737313663623238316262223b733a33323a223435613432303738616332373730643139303632363932386361326132376434223b733a33323a223465346663653338386361396662386233613463663030386663303838323836223b733a33323a223935366364353166313434636330353835343233383133373135326638616365223b733a33323a223632666135323735623139353935393531643862373031383139343539366536223b733a33323a226332636365363035393837353861333232626337653435656433666434333964223b733a33323a226234346230656365346163353932623262356637636361656531646563643464223b733a33323a223661353435346631346136666339363035326239623634623630633638636638223b733a33323a223337316437303130646332383263386564336165613335366162313662653563223b733a33323a223633313436366365323936613361636666636238316435303937623131366466223b733a33323a223166366361303532613237303865613831643433303965353138653236343362223b733a33323a223233366265323266326261353231666464653637613338653434313633393964223b733a33323a223534636566623863646632623165396164313366646462373366663838353164223b733a33323a226637393636376137386335366135363238386234383434376262383661663938223b733a33323a226431313263636630353865353838313135303937373839646133646464386535223b733a33323a226239653632633163373963663530646265636436346438306666313732383565223b733a33323a226461393932336436363231643436633064646637373036353933393132636266223b733a33323a223664646233376536363131306539626662616538333264393337653636343733223b733a33323a223438346430656631643738383966663563323033346165356335653438333134223b733a33323a226264333237316166353536306239326139333865383339633735363833353065223b733a33323a223235313635313534373530316139663439346437633665333331636535393736223b733a33323a226463376566306361326433666662303735666435363731643665346632623638223b733a33323a223434303730326436303539306637313963666236346161643962313536663037223b733a33323a226133333632613962313266356532613738373030636536333462363533313463223b733a33323a226430333331626262323937636566363139656263353962393538323735316461223b733a33323a223239303333656638383333366533616431323565643663323761636333393763223b733a33323a223734366363336531626336326133623632633031303861386535366432356238223b733a33323a223632373536353938646332623035653935333131353132666331393430376165223b733a33323a223837383938333762626463633463663335353066613138353533326364633737223b733a33323a226534633633316138306233353336313335326263643866303037343638623466223b733a33323a226465396564653161363861373439353437653733316263626464663761666262223b733a33323a226135396339333864613161666465643230653266616365343537613737646531223b733a33323a223965356630366566343632373964373965633365333532636639323739333264223b733a33323a223838366663636633333862393139653238393436663961316362343835393332223b733a33323a223863383139306235623632323637373531666336623738633630333661646333223b733a33323a223038626164633065663066653761613463643738323835323061326531303631223b733a33323a223830636633333566663034343962623266626532653865653263363731333731223b733a33323a223766313434633463643765353134313430366236303734386163373437613833223b733a33323a223365633037393864326561363962636631333735306231393132653434653439223b733a33323a226331393134353230366664313038663035363039633137386331663166356334223b733a33323a226633343430346335383963373161326562653161643638343464636337373538223b733a33323a226633373064363733623961363166653033386633346161353666663935646661223b733a33323a226430636235306464313333373433316436393433613962303362366366636138223b733a33323a223930306334633038633734396366386231626266326664386465313666353137223b733a33323a223963363564343264363538646136653262613663353238653030316163383834223b733a33323a226334623134663432356666323338383963663830353539613031643434343837223b733a33323a223464333336383538363731366365373132313736613635636432643464363465223b733a33323a223336633231353130313962633137363065653232363736333263663434343439223b733a33323a226664353663643164386661333133366230346239616266386338303462626332223b733a33323a223561336537646332623066613366616134396662396365323362656330303166223b733a33323a223030323237373965376130343633363739326338616433393063633036613336223b733a33323a226332636637303266313333366534646437356663366230393435663362626239223b733a33323a223462633431646433633338396636333330373662333063636665626632303235223b733a33323a226562356337306232396265383665613439666636633863623539366633343839223b733a33323a223839353333646561653636643134333534376130643233663133376432373335223b733a33323a226563633935333831333333623065386662663433633264356163626439343465223b733a33323a226463313838303164373063323330623965623961343131313535343636386130223b733a33323a226566373263633164323934313737313765653232393962613062653064633637223b733a33323a223764333562643963366131323233393165356537613433336465663463353433223b733a33323a223235336431336435373431333661306639653038336234613362396165303664223b733a33323a223732353835343162383838366534366139626563623565386337343561613238223b733a33323a223962616664383831316164383133383566353834653334636133643233613135223b733a33323a226135613831626164633031323163396566333736323861393238333838336664223b733a33323a223332633135343963613530323139383936623662316433653139633966636436223b733a33323a223565633830343630363063333734393833323733376332326334336535626636223b733a33323a226239653963666362366530633763613136626662363762366363356339346431223b733a33323a226661623936313634303233313266663565323961383231613766663666663539223b733a33323a223866363631316164393634303939643934363338643761633330376633346561223b733a33323a226131623263333134333264646534376166323562666337383161633835376362223b733a33323a223633396534323534326237623261333538333931643864376661613937323266223b733a33323a223338666633323939653834393964343333643433383662333337633130353461223b733a33323a223430653132373232363332383638356135323464346232613036396637373738223b733a33323a226235386435353131333462643933303062623734646231326235373438376664223b733a33323a223930376566383066393531643838383236306539376532313437383462396330223b733a33323a223962633364396262356135323638316233313238313665666436326435323738223b733a33323a223662393162373462633836633765353730346333393737323531373264386137223b733a33323a226265353232656330336264623062383731306162333931356534633266353264223b733a33323a223363313365623835383338666262373464313630353532616634386538633532223b733a33323a223935323538373536303333303866383035343162663732626437626463613863223b733a33323a226636363263633239326236376131393265363439656236306466373538633830223b733a33323a223931376462303838363334383932373138666261343035353036336338643735223b733a33323a223136373432613064386233356366383761393739356665626566326266633036223b733a33323a223232653831376461626437666265646265363233623136343761376662616536223b733a33323a223264373238316137323731616237343565343739323161363861303864343662223b733a33323a223733396365633531663334353261303936343063653536306562643731376662223b733a33323a223165633635393739643165363836626465386166366630636434323336376462223b733a33323a223938383130623130623438343430616239376632363736323639376433396434223b733a33323a226231393439653834633664633765616364383132333664663035636162346431223b733a33323a223736613835323436373934346565663763643861616234353532366333653730223b733a33323a223333373935353365653935646665396135313431613638363238613130393764223b733a33323a226136626230336231323334373562613534366163626532366533303339343230223b7d733a343a2268617368223b733a36353a2261366262303362313233343735626135343661636265323665333033393432302d3333373935353365653935646665396135313431613638363238613130393764223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1714423711),
('v387vc67q9fsrmog29q50i9nc4', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333838373831372e30383135373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346d61616569366c746673683464386d326f386b633967636b76223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839313137383b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226431333561366565646631326239646133383633393965666536303866666163223b733a33323a223930666132646263383564613965643565393739353835366532333932393239223b733a33323a226435643962383033623833396661373565386565623536386330303438326630223b733a33323a223964316165383061393238353439356231366238653736666634303062643465223b733a33323a223037653438333361666333656433333936346166313233643035393632373730223b733a33323a226133653534613264623933373435633833616239316231366330313235346633223b7d733a343a2268617368223b733a36353a2261336535346132646239333734356338336162393162313663303132353466332d3037653438333361666333656433333936346166313233643035393632373730223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1713887817);

-- --------------------------------------------------------

--
-- Struttura della tabella `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"federicoboggia96@gmail.com\"'),
('blocksdisposition_modules', '[]'),
('bulkedit_deduplicate_on_save', 'false'),
('default_site', '\"1\"'),
('default_to_private', '\"0\"'),
('disable_file_validation', '\"0\"'),
('disable_jsonld_embed', '\"0\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"heic\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\",\"alto\",\"atom\",\"ead\",\"feed\",\"fodp\",\"fods\",\"fodt\",\"html\",\"mag\",\"mei\",\"mets\",\"mods\",\"musicxml\",\"mxl\",\"pdf2xml\",\"refnum\",\"rss\",\"svg\",\"tei\",\"xhtml\",\"xml\",\"dtd\",\"xslt\"]'),
('installation_title', '\"Progetto Storia Pubblica Digitale\"'),
('locale', '\"it\"'),
('media_alt_text_property', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"image\\/heic\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\",\"application\\/alto+xml\",\"application\\/atom+xml\",\"application\\/marcxml+xml\",\"application\\/mets+xml\",\"application\\/mods+xml\",\"application\\/rss+xml\",\"application\\/tei+xml\",\"application\\/vnd.bnf.refnum+xml\",\"application\\/vnd.ead+xml\",\"application\\/vnd.iccu.mag+xml\",\"application\\/vnd.mei+xml\",\"application\\/vnd.oasis.opendocument.presentation-flat-xml\",\"application\\/vnd.oasis.opendocument.spreadsheet-flat-xml\",\"application\\/vnd.oasis.opendocument.text-flat-xml\",\"application\\/vnd.openarchives.oai-pmh+xml\",\"application\\/vnd.pdf2xml+xml\",\"application\\/vnd.recordare.musicxml\",\"application\\/vnd.recordare.musicxml+xml\",\"application\\/xhtml+xml\",\"application\\/xml\",\"image\\/svg+xml\",\"model\\/vnd.collada+xml\",\"text\\/html\",\"text\\/vnd.omeka+xml\",\"text\\/xml\"]'),
('pagination_per_page', '\"25\"'),
('property_label_information', '\"none\"'),
('recaptcha_secret_key', '\"\"'),
('recaptcha_site_key', '\"\"'),
('time_zone', '\"UTC\"'),
('use_htmlpurifier', '\"1\"'),
('value_languages', '[]'),
('version', '\"4.0.4\"'),
('version_notifications', '\"1\"'),
('xmlviewer_renderings', '{\"text\\/xml\":\"xsl\\/xml-html.xslt\",\"application\\/xml\":\"xsl\\/xml-html.xslt\",\"application\\/alto+xml\":\"xsl\\/xml-alto-html.xslt\",\"application\\/tei+xml\":\"xsl\\/pagina_ciano.xsl\"}');

-- --------------------------------------------------------

--
-- Struttura della tabella `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navigation` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site`
--

INSERT INTO `site` (`id`, `thumbnail_id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(1, NULL, 1, NULL, 'index', 'default', 'Cancel Culture — Costanzo Ciano', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Home\",\"query\":\"\"},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":3,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":4,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":5,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":6,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":7,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":8,\"is_public\":true},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":9,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":10,\"is_public\":true},\"links\":[{\"type\":\"url\",\"data\":{\"label\":\"Fonti primarie\",\"url\":\"\\/spd\\/s\\/index\\/item-set\\/22?page=1&sort_by=created&sort_order=asc\"},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":20,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":12,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":14,\"is_public\":true},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":13,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":15,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":16,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":17,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":18,\"is_public\":true},\"links\":[]}]', '[]', '2024-02-13 20:25:22', '2024-04-29 20:47:16', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_block_attachment`
--

INSERT INTO `site_block_attachment` (`id`, `block_id`, `item_id`, `media_id`, `caption`, `position`) VALUES
(7, 28, 44, NULL, '', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `created`, `modified`) VALUES
(1, 1, 'home', 'Home', 1, '2024-02-13 20:25:22', '2024-02-22 14:53:50'),
(3, 1, 'progetto', 'Il progetto', 1, '2024-02-22 14:55:06', '2024-02-22 14:55:06'),
(4, 1, 'cancel-culture', 'Cancel Culture', 1, '2024-02-22 14:56:50', '2024-02-22 14:56:50'),
(5, 1, 'crowdsourcing', 'Crowdsourcing', 1, '2024-02-22 14:57:31', '2024-02-22 14:57:38'),
(6, 1, 'parlano-di-noi', 'Parlano di noi', 1, '2024-02-22 14:58:08', '2024-02-22 15:04:18'),
(7, 1, 'biografia', 'Biografia', 1, '2024-02-22 14:59:00', '2024-02-22 14:59:00'),
(8, 1, 'statua', 'La statua', 1, '2024-02-22 14:59:18', '2024-02-22 14:59:18'),
(9, 1, 'modello-3d', 'Modello 3D', 1, '2024-02-22 14:59:35', '2024-02-22 14:59:35'),
(10, 1, 'fonti', 'Fonti', 1, '2024-02-22 15:00:14', '2024-02-22 15:00:14'),
(12, 1, 'fonti-secondarie', 'Fonti secondarie', 1, '2024-02-22 15:00:58', '2024-02-22 15:00:58'),
(13, 1, 'gallery', 'Galleria', 1, '2024-02-22 15:01:18', '2024-02-22 15:01:18'),
(14, 1, 'media', 'Media', 1, '2024-02-22 15:01:39', '2024-02-22 15:01:39'),
(15, 1, 'interviste', 'Interviste', 1, '2024-02-22 15:01:56', '2024-02-22 15:01:56'),
(16, 1, 'istituto-luce', 'Istituto Luce', 1, '2024-02-22 15:02:11', '2024-02-22 15:02:11'),
(17, 1, 'mappe', 'Mappe', 1, '2024-02-22 15:02:46', '2024-02-22 15:02:46'),
(18, 1, 'about', 'Credits', 1, '2024-02-22 15:02:59', '2024-02-22 15:04:29'),
(20, 1, 'codifica', 'Codifica', 1, '2024-04-29 19:56:53', '2024-04-29 20:23:24');

-- --------------------------------------------------------

--
-- Struttura della tabella `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `position`) VALUES
(1, 1, 'html', '{\"html\":\"<p>Welcome to your new site. This is an example page.<\\/p>\\n\\n<ul>\\n\\t<li>This is a bullet list.<\\/li>\\n\\t<li>Second entry.<\\/li>\\n<\\/ul>\\n\\n<p>Back to normal again.<\\/p>\\n\\n<ol>\\n\\t<li>This is an ordered list.<\\/li>\\n\\t<li>Second entry.<\\/li>\\n<\\/ol>\\n\\n<p>Back to normal again.<\\/p>\\n\\n<blockquote>This is a blockquote.<\\/blockquote>\\n\\n<p>Back to normal again.<\\/p>\\n\\n<div><a href=\\\"#\\\">This text is a link, which currently points to nothing.<\\/a><\\/div>\\n\\n<p><strong>This text is bold, in a &lt;strong&gt; tag.<\\/strong><\\/p>\\n\\n<p><em>This text is italicized, in an &lt;em&gt; tag.<\\/em><\\/p>\\n\\n<p><u>This text is underlined, in a &lt;u&gt; tag.<\\/u><\\/p>\\n\\n<p><s>This text has a strikethrough, in a &lt;s&gt; tag.<\\/s><\\/p>\\n\\n<p>This text is <sub>subscript<\\/sub> and <sup>superscript<\\/sup> using &lt;sub&gt; and &lt;sup&gt;, which can be used for adding notes and citations.<\\/p>\\n\\n<hr \\/>\\n<h1>This is an H1 title. It is bigger than the Page Title, which is rendered in H2.<\\/h1>\\n\\n<h2>This is an H2 header, the same size as the Page Title.<\\/h2>\\n\\n<h3>This is an H3 subheader.<\\/h3>\\n\\n<h4>This is an H4 subheader.<\\/h4>\\n\\n<h5>This is an H5 subheader.<\\/h5>\\n\\n<h6>This is an H6 subheader.<\\/h6>\\n\",\"divclass\":\"\"}', 1),
(2, 1, 'lineBreak', '{\"break_type\":\"opaque\"}', 2),
(3, 1, 'html', '{\"html\":\"<h2 style=\\\"font-style:italic;\\\">This is the \\\"Italic Title\\\" block style.<\\/h2>\\n\\n<h3 style=\\\"color:#aaaaaa;font-style:italic;\\\">This is the \\\"Subtitle\\\" block style.<\\/h3>\\n\\n<div style=\\\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\\\">This is the \\\"Special Container\\\" block style.<\\/div>\\n\\n<p><span class=\\\"marker\\\">This is the \\\"Marker\\\" inline style. <\\/span><\\/p>\\n\\n<p><big>This is the \\\"Big\\\" inline style.<\\/big> This is normal text.<\\/p>\\n\\n<p><small>This text is inside a \\\"small\\\" inline style.<\\/small> This is normal text.<\\/p>\\n\\n<p><code>This is the \\\"Computer Code\\\" inline style.<\\/code><\\/p>\\n\\n<p><span dir=\\\"rtl\\\">\\u0644\\u0643\\u0646 \\u0644\\u0627 \\u0628\\u062f \\u0623\\u0646 \\u0623\\u0648\\u0636\\u062d \\u0644\\u0643 \\u0623\\u0646 \\u0643\\u0644 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0623\\u0641\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0645\\u063a\\u0644\\u0648\\u0637\\u0629 \\u062d\\u0648\\u0644 \\u0627\\u0633\\u062a\\u0646\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0646\\u0634\\u0648\\u0629 \\u0648\\u062a\\u0645\\u062c\\u064a\\u062f \\u0627\\u0644\\u0623\\u0644\\u0645 \\u064a\\u0639\\u0631\\u0636 \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0646\\u0635 \\u0645\\u0646 \\u0627\\u0644\\u064a\\u0645\\u064a\\u0646 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u064a\\u0633\\u0627\\u0631.<\\/span><\\/p>\\n\",\"divclass\":\"\"}', 3),
(7, 3, 'pageTitle', '[]', 1),
(8, 4, 'pageTitle', '[]', 1),
(9, 5, 'pageTitle', '[]', 1),
(10, 6, 'pageTitle', '[]', 1),
(11, 7, 'pageTitle', '[]', 1),
(12, 8, 'pageTitle', '[]', 1),
(13, 9, 'pageTitle', '[]', 1),
(14, 10, 'pageTitle', '[]', 1),
(16, 12, 'pageTitle', '[]', 1),
(17, 13, 'pageTitle', '[]', 1),
(18, 14, 'pageTitle', '[]', 1),
(19, 15, 'pageTitle', '[]', 1),
(20, 16, 'pageTitle', '[]', 1),
(21, 17, 'pageTitle', '[]', 1),
(22, 18, 'pageTitle', '[]', 1),
(27, 20, 'pageTitle', '[]', 1),
(28, 20, 'media', '{\"thumbnail_type\":\"large\",\"alignment\":\"center\",\"show_title_option\":\"item_title\"}', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(4, 1, 4, 'admin');

-- --------------------------------------------------------

--
-- Struttura della tabella `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_setting`
--

INSERT INTO `site_setting` (`id`, `site_id`, `value`) VALUES
('attachment_link_type', 1, '\"item\"'),
('browse_attached_items', 1, '\"0\"'),
('browse_body_property_term', 1, '\"\"'),
('browse_defaults_public_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_heading_property_term', 1, '\"\"'),
('disable_jsonld_embed', 1, '\"0\"'),
('exclude_resources_not_in_site', 1, '\"0\"'),
('filter_locale_values', 1, '\"0\"'),
('item_media_embed', 1, '\"0\"'),
('locale', 1, '\"\"'),
('property_label_information', 1, '\"none\"'),
('search_resource_names', 1, '[\"site_pages\",\"items\"]'),
('search_restrict_templates', 1, '\"0\"'),
('search_type', 1, '\"sitewide\"'),
('show_attached_pages', 1, '\"1\"'),
('show_locale_label', 1, '\"1\"'),
('show_page_pagination', 1, '\"1\"'),
('show_user_bar', 1, '\"0\"'),
('show_value_annotations', 1, '\"0\"'),
('theme_settings_default', 1, '{\"accent_color\":\"#0A3568\",\"nav_depth\":\"0\",\"logo\":\"\",\"banner\":\"\",\"banner_height\":\"\",\"banner_height_mobile\":\"\",\"banner_position\":\"center\",\"footer\":\"Sviluppato dal corso di Informatica Umanistica a.a. 2023\\/2024\"}'),
('vocabulary_scope', 1, '\"\"'),
('xmlviewer_renderings', 1, '{\"text\\/xml\":\"xsl\\/xml-html.xslt\",\"application\\/xml\":\"xsl\\/xml-html.xslt\",\"application\\/alto+xml\":\"xsl\\/xml-alto-html.xslt\",\"application\\/tei+xml\":\"xsl\\/pagina_ciano1.xsl\"}');

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(4, 'kalo@binatomy.com', 'Kalo', '2024-04-09 15:43:38', '2024-04-09 15:44:00', '$2y$10$eHONFxV8vibiVUKC790CeuXfD6BuRx4uKm.EyS0cOEIPaC8IDZOlm', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 4, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 4, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 4, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 4, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 4, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 4, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 4, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 4, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('default_resource_template', 4, '\"\"'),
('locale', 4, '\"it\"');

-- --------------------------------------------------------

--
-- Struttura della tabella `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `type` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value_annotation_id`, `value`, `uri`, `is_public`) VALUES
(5, 2, 1, NULL, 'literal', '', NULL, 'CONTENUTO DE PROVA', NULL, 1),
(6, 2, 4, NULL, 'literal', '', NULL, 'Collocata nel giardino del museo navale ritrae Costanzo Ciano, opera dello scultore Francesco Messina', NULL, 1),
(7, 2, 7, NULL, 'literal', '', NULL, '27 giugno 1991', NULL, 1),
(8, 2, 5, NULL, 'literal', '', NULL, 'La Nazione', NULL, 1),
(9, 2, 58, NULL, 'literal', '', NULL, 'Adriana Boverini', NULL, 1),
(10, 3, 1, NULL, 'literal', NULL, NULL, 'Articolo La Nazione giugno 1991', NULL, 1),
(11, 5, 1, NULL, 'literal', NULL, NULL, 'XML', NULL, 1),
(12, 6, 10, NULL, 'literal', '', NULL, 'B. 10 J. 95', NULL, 1),
(13, 6, 1, NULL, 'literal', '', NULL, 'Fascicolo 1', NULL, 1),
(14, 6, 4, NULL, 'literal', '', NULL, 'Supporto:\nIl fascicolo cartaceo è composto da 6 pagine totali, compresa la copertina del fascicolo.\n\n', NULL, 1),
(15, 6, 4, NULL, 'literal', '', NULL, 'Condizioni del documento:\nLe pagine si presentano in un ottimo stato di conservazione, solamente la carta appare leggermente ingiallita. Sia le scritte a macchina che a mano, ma anche i timbri sono facilmente comprensibili.\n\n', NULL, 1),
(16, 6, 4, NULL, 'literal', '', NULL, 'Firme:\nNel testo si possono trovare varie firme (se ne contano 6). Inoltre, sono presenti i numeri dei protocolli di telegrafo scritti a mano, per un totale di 9 diverse grafie', NULL, 1),
(17, 6, 8, NULL, 'literal', '', NULL, 'Testo', NULL, 1),
(18, 6, 26, NULL, 'literal', '', NULL, 'Documento battuto a macchina', NULL, 1),
(19, 6, 9, NULL, 'literal', '', NULL, 'Cartaceo', NULL, 1),
(20, 6, 51, NULL, 'literal', '', NULL, 'Marina Militare, Venezia, 7 febbraio 1961', NULL, 1),
(21, 6, 51, NULL, 'literal', '', NULL, 'Ministero della Difesa Marina Ufficio del Segretario Generale Coordinamento  - Seconda Sezione, Roma, 9 Gennaio 1961', NULL, 1),
(22, 6, 51, NULL, 'literal', '', NULL, 'Ministero della Difesa Marina Ufficio del Segretario Generale Coordinamento - Seconda Sezione, 18 marzo 1960', NULL, 1),
(23, 6, 14, NULL, 'literal', '', NULL, 'Roma', NULL, 1),
(24, 6, 14, NULL, 'literal', '', NULL, 'Archivio Marina Militare', NULL, 1),
(25, 6, 7, NULL, 'literal', '', NULL, ' 18 marzo 1960 ', NULL, 1),
(26, 6, 7, NULL, 'literal', '', NULL, '9 gennaio 1961', NULL, 1),
(27, 6, 7, NULL, 'literal', '', NULL, '7 febbraio 1961', NULL, 1),
(28, 7, 1, NULL, 'literal', NULL, NULL, 'Pagina 1 ', NULL, 1),
(29, 8, 1, NULL, 'literal', NULL, NULL, 'Pagina 2', NULL, 1),
(30, 9, 1, NULL, 'literal', NULL, NULL, 'Pagina 3', NULL, 1),
(31, 10, 1, NULL, 'literal', NULL, NULL, 'Pagina 4', NULL, 1),
(32, 11, 1, NULL, 'literal', NULL, NULL, 'Pagina 5', NULL, 1),
(33, 12, 1, NULL, 'literal', NULL, NULL, 'Pagina 6', NULL, 1),
(34, 13, 10, NULL, 'literal', '', NULL, 'B. 15 J. 140', NULL, 1),
(35, 13, 1, NULL, 'literal', '', NULL, 'Fascicolo 2', NULL, 1),
(36, 13, 4, NULL, 'literal', '', NULL, 'Supporto:\nIl fascicolo di materialecartaceo è composto da 8 pagine totali, compresa la copertina del fascicolo.', NULL, 1),
(37, 13, 4, NULL, 'literal', '', NULL, 'Condizioni del documento:\nLe pagine si presentano in un ottimo stato di conservazione, solamente alcune di esse appaiono leggermente ingiallite. In generale, sono facilmente comprensibili sia le scritte effettuate a macchina a mano, come ad esempio le firme.', NULL, 1),
(38, 13, 4, NULL, 'literal', '', NULL, 'Firme\nIl testo contiene varie firme, per un totale di 6. Inoltre, sono presenti i numeri dei protocolli del telegrafo scitti a mano, permettendo di osservare 9 diverse grafie.', NULL, 1),
(39, 13, 8, NULL, 'literal', '', NULL, 'Testo', NULL, 1),
(40, 13, 26, NULL, 'literal', '', NULL, 'Documento battuto a macchina', NULL, 1),
(41, 13, 9, NULL, 'literal', '', NULL, 'Cartaceo', NULL, 1),
(42, 13, 51, NULL, 'literal', '', NULL, 'Ministero della Difesa Marina, Ufficio del Segretario Generale Coordinamento, Roma, 9 maggio 1952', NULL, 1),
(43, 13, 51, NULL, 'literal', '', NULL, 'Comando in Capo del Dipartimento Marittimo dell\'Alto Tirreno, Ufficio Tecnico, La Spezia, 28 maggio 1952', NULL, 1),
(44, 13, 51, NULL, 'literal', '', NULL, 'Ministero della Difesa Marina, Ufficio del Segretario Generale Coordinamento, Roma, 17 agosto 1951', NULL, 1),
(45, 13, 51, NULL, 'literal', '', NULL, 'Reparto Ufficio Storico, Roma, 12 agosto 1952', NULL, 1),
(46, 13, 51, NULL, 'literal', '', NULL, 'Ministero della Difesa Marina, Ufficio del Segretario Generale Coordinamento, Roma, 9 agosto 1951', NULL, 1),
(47, 13, 51, NULL, 'literal', '', NULL, 'Comando in Capo del Dipartimento Marittimo dell\'Alto Tirreno, Ufficio Tecnico, La Spezia, 4 agosto 1951', NULL, 1),
(48, 13, 51, NULL, 'literal', '', NULL, 'Comune della Spezia, Segreteria Generale, La Spezia, 23 luglio 1951', NULL, 1),
(49, 13, 14, NULL, 'literal', '', NULL, 'Roma', NULL, 1),
(50, 13, 14, NULL, 'literal', '', NULL, 'Archivio Marina Militare', NULL, 1),
(51, 13, 7, NULL, 'literal', '', NULL, '17 agosto 1951', NULL, 1),
(52, 13, 7, NULL, 'literal', '', NULL, '23 luglio 1951', NULL, 1),
(53, 13, 7, NULL, 'literal', '', NULL, '4 agosto 1951', NULL, 1),
(54, 13, 7, NULL, 'literal', '', NULL, '9 agosto 1951', NULL, 1),
(55, 13, 7, NULL, 'literal', '', NULL, '9 maggio 1952', NULL, 1),
(56, 13, 7, NULL, 'literal', '', NULL, '28 maggio 1952', NULL, 1),
(57, 13, 7, NULL, 'literal', '', NULL, '12 agosto 1952', NULL, 1),
(58, 14, 1, NULL, 'literal', NULL, NULL, 'Pagina 1', NULL, 1),
(59, 15, 1, NULL, 'literal', NULL, NULL, 'Pagina 2', NULL, 1),
(60, 16, 1, NULL, 'literal', NULL, NULL, 'Pagina 3', NULL, 1),
(61, 17, 1, NULL, 'literal', NULL, NULL, 'Pagina 4', NULL, 1),
(62, 18, 1, NULL, 'literal', NULL, NULL, 'Pagina 5', NULL, 1),
(63, 19, 1, NULL, 'literal', NULL, NULL, 'Pagina 6', NULL, 1),
(64, 20, 1, NULL, 'literal', NULL, NULL, 'Pagina 7', NULL, 1),
(65, 21, 1, NULL, 'literal', NULL, NULL, 'Pagina 8', NULL, 1),
(66, 22, 1, NULL, 'literal', '', NULL, 'Documenti relativi alla statua di Costanzo Ciano', NULL, 1),
(67, 22, 4, NULL, 'literal', '', NULL, 'Conservazione:\nUfficio storico della Marina Militare', NULL, 1),
(68, 22, 4, NULL, 'literal', '', NULL, 'Data:\naprile 2024', NULL, 1),
(69, 22, 4, NULL, 'literal', '', NULL, 'I documenti sono stati raccolti dall\'archivio della Marina Militare. Raccontano degli spostamenti della statua dal suo basamento originale in piazza a La Spezia, fino al Castello di San Giorgio. Secondo gli ultimi documenti la statua è stata collocata definitivamente al Museo Tecnico Navale di La Spezia.', NULL, 1),
(70, 22, 8, NULL, 'literal', '', NULL, 'Testo', NULL, 1),
(71, 22, 26, NULL, 'literal', '', NULL, 'Documenti battuti a macchina', NULL, 1),
(72, 22, 9, NULL, 'literal', '', NULL, 'Supporto:\nFogli di carta. Il fascicolo cartaceo è composto da 6 pagine totali, compresa la copertina del fascicolo. Il fascicolo di materiale cartaceo è composto da 8 pagine totali , compresa la copertina del fascicolo. Il fascicolo cartaceo è composto da 14 pagine totali, compresa la copertina del fascicolo.', NULL, 1),
(73, 22, 9, NULL, 'literal', '', NULL, 'Estensione:\n6 + 8 + 14 pagine', NULL, 1),
(74, 22, 9, NULL, 'literal', '', NULL, 'Condizioni:\nIl testo non presenta cancellature, ma timbri, firme e la carta si presenta ingiallita.', NULL, 1),
(75, 22, 9, NULL, 'literal', '', NULL, 'Pagine:\nLe pagine sono lunghe in media tra le 28 e 50 righe, considerando anche timbri e firme.', NULL, 1),
(76, 22, 9, NULL, 'literal', '', NULL, 'Mani:\nLe pagine dei documenti sono scritte a macchina (Marina Militare di Venezia); sono riportati a mano numeri di protocollo e firme.', NULL, 1),
(77, 22, 14, NULL, 'literal', '', NULL, 'Roma', NULL, 1),
(78, 22, 14, NULL, 'literal', '', NULL, 'Archivio Marina Militare', NULL, 1),
(79, 23, 10, NULL, 'literal', '', NULL, 'B. 18 f. 165', NULL, 1),
(80, 23, 1, NULL, 'literal', '', NULL, 'Fascicolo 3', NULL, 1),
(81, 23, 4, NULL, 'literal', '', NULL, 'Supporto\nIl fascicolo cartaceo è composto da 14 pagine totali, compresa la copertina del fascicolo.', NULL, 1),
(82, 23, 4, NULL, 'literal', '', NULL, 'Condizioni del documento\nLe pagine si presentano in un ottimo stato di conservazione, in alcune di esse la carta appare leggermente ingiallita. Sia le scritte a macchina che a mano, ma anche i timbri sono facilmente comprensibili. Come lo schizzo della statua stessa', NULL, 1),
(83, 23, 4, NULL, 'literal', '', NULL, 'Firme\nNel testo si possono trovare varie firme (se ne contano 6). Inoltre, sono presenti i numeri dei protocolli di telegrafo scritti a mano, per un totale di 9 diverse calligrafie.', NULL, 1),
(84, 23, 8, NULL, 'literal', '', NULL, 'Testo', NULL, 1),
(85, 23, 26, NULL, 'literal', '', NULL, 'Documento battuto a macchina', NULL, 1),
(86, 23, 9, NULL, 'literal', '', NULL, 'Cartaceo', NULL, 1),
(87, 23, 51, NULL, 'literal', '', NULL, 'Roma, 12 marzo 1970', NULL, 1),
(88, 23, 51, NULL, 'literal', '', NULL, 'Ufficio Storico M.M., Roma, 12 marzo 1970', NULL, 1),
(89, 23, 51, NULL, 'literal', '', NULL, 'Roma, 6 marzo 1970', NULL, 1),
(90, 23, 51, NULL, 'literal', '', NULL, 'Ufficio Storico M.M., Roma, 5 marzo 1970', NULL, 1),
(91, 23, 14, NULL, 'literal', '', NULL, 'Roma', NULL, 1),
(92, 23, 14, NULL, 'literal', '', NULL, 'Archivio Marina Militare', NULL, 1),
(93, 23, 7, NULL, 'literal', '', NULL, '5 marzo 1970', NULL, 1),
(94, 23, 7, NULL, 'literal', '', NULL, '6 marzo 1970', NULL, 1),
(95, 23, 7, NULL, 'literal', '', NULL, '9 marzo 1970', NULL, 1),
(96, 23, 7, NULL, 'literal', '', NULL, '12 marzo 1970', NULL, 1),
(97, 24, 1, NULL, 'literal', NULL, NULL, 'Pagina 1', NULL, 1),
(98, 25, 1, NULL, 'literal', NULL, NULL, 'Pagina 2', NULL, 1),
(99, 26, 1, NULL, 'literal', NULL, NULL, 'Pagina 3', NULL, 1),
(100, 27, 1, NULL, 'literal', NULL, NULL, 'Pagina 4', NULL, 1),
(101, 28, 1, NULL, 'literal', NULL, NULL, 'Pagina 5', NULL, 1),
(102, 29, 1, NULL, 'literal', NULL, NULL, 'Pagina 6', NULL, 1),
(103, 30, 1, NULL, 'literal', NULL, NULL, 'Pagina 7', NULL, 1),
(104, 31, 1, NULL, 'literal', NULL, NULL, 'Pagina 8', NULL, 1),
(105, 32, 1, NULL, 'literal', NULL, NULL, 'Pagina 9', NULL, 1),
(106, 33, 1, NULL, 'literal', NULL, NULL, 'Pagina 10', NULL, 1),
(107, 34, 1, NULL, 'literal', NULL, NULL, 'Pagina 11', NULL, 1),
(108, 35, 1, NULL, 'literal', NULL, NULL, 'Pagina 12', NULL, 1),
(109, 36, 1, NULL, 'literal', NULL, NULL, 'Pagina 13', NULL, 1),
(110, 37, 1, NULL, 'literal', NULL, NULL, 'Pagina 14', NULL, 1),
(111, 44, 1, NULL, 'literal', '', NULL, 'XML', NULL, 1),
(114, 47, 1, NULL, 'literal', NULL, NULL, 'XML', NULL, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Indici per le tabelle `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Indici per le tabelle `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`),
  ADD KEY `is_public` (`is_public`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Indici per le tabelle `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Indici per le tabelle `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Indici per le tabelle `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Indici per le tabelle `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Indici per le tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`),
  ADD KEY `ingester` (`ingester`),
  ADD KEY `renderer` (`renderer`),
  ADD KEY `media_type` (`media_type`),
  ADD KEY `extension` (`extension`);

--
-- Indici per le tabelle `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indici per le tabelle `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Indici per le tabelle `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Indici per le tabelle `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190));

--
-- Indici per le tabelle `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Indici per le tabelle `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Indici per le tabelle `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Indici per le tabelle `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Indici per le tabelle `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Indici per le tabelle `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Indici per le tabelle `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Indici per le tabelle `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Indici per le tabelle `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Indici per le tabelle `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indici per le tabelle `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Indici per le tabelle `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190)),
  ADD KEY `type` (`type`),
  ADD KEY `lang` (`lang`);

--
-- Indici per le tabelle `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT per la tabella `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT per la tabella `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT per la tabella `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT per la tabella `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la tabella `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT per la tabella `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Limiti per la tabella `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Limiti per la tabella `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Limiti per la tabella `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Limiti per la tabella `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Limiti per la tabella `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
