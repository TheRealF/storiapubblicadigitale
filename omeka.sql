-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 15, 2024 alle 18:03
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
(47, 'media', 4, 1, 'XML', 'XML'),
(63, 'items', 4, 1, 'La Spezia - Palazzo del Governo', 'La Spezia - Palazzo del Governo\nAnonimo\n22/04/1947\nLa Spezia\nMilano\nCartolina\nCartolina con fotografia del palazzo del governo a La Spezia\nRetro della cartolina con data e luogo di stesura, saluti, francolbollo delle poste, timbro di La Spezia con data, indirizzo del destinatario presso via Botticelli 22, Milano.\nSul retro è riportato: \" La Spezia 22-4-47 Cordiali saluti (firma).\' Destinatario (nome e cognome ) Milano, Botticelli 22\nLa Spezia - Palazzo del Governo\nLa Spezia - Palazzo del Governo Retro'),
(64, 'media', 4, 1, 'La Spezia - Palazzo del Governo', 'La Spezia - Palazzo del Governo'),
(65, 'media', 4, 1, 'La Spezia - Palazzo del Governo Retro', 'La Spezia - Palazzo del Governo Retro'),
(67, 'items', 4, 1, 'La Spezia - Palazzo del Governo', 'La Spezia - Palazzo del Governo\nAnonimo\nLa Spezia\nCartolina\nCartolina che ritrae il palazzo del Governo a La Spezia\nRetro della cartolina\nLa Spezia - Palazzo del Governo\nLa Spezia - Palazzo del Governo Retro'),
(68, 'media', 4, 1, 'La Spezia - Palazzo del Governo', 'La Spezia - Palazzo del Governo'),
(69, 'media', 4, 1, 'La Spezia - Palazzo del Governo Retro', 'La Spezia - Palazzo del Governo Retro'),
(70, 'items', 4, 1, 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti', 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti\nAnonimo\nLa Spezia\nCartolina che ritrae il nuovo monumento ai caduti in piazza Matteotti a La Spezia\nLa Spezia - Piazza Matteotti - Nuovo Monumento ai caduti\nLa Spezia - Piazza Matteotti - Nuovo Monumento ai caduti Retro'),
(71, 'media', 4, 1, 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti', 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti'),
(72, 'media', 4, 1, 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti Retro', 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti Retro'),
(73, 'items', 4, 1, 'La Spezia - Giardini e Palazzo del Governo', 'La Spezia - Giardini e Palazzo del Governo\nAnonimo\nLa Spezia\nCartolina\nCartolina che ritrae la piazza del Governo a La Spezia con il moumento dei Caduti\nLa Spezia - Giardini e Palazzo del Governo\nLa Spezia - Giardini e Palazzo del Governo Retro'),
(74, 'media', 4, 1, 'La Spezia - Giardini e Palazzo del Governo', 'La Spezia - Giardini e Palazzo del Governo'),
(75, 'media', 4, 1, 'La Spezia - Giardini e Palazzo del Governo Retro', 'La Spezia - Giardini e Palazzo del Governo Retro'),
(76, 'items', 4, 1, 'La Spezia - Giardini - Monumento a Costanzo Ciano', 'La Spezia - Giardini - Monumento a Costanzo Ciano\n28/04/1944\n29/04/1944\nLa Spezia\nCortina\nFoto che ritrae il monumento a Costanzo Ciano nei pressi del Palazzo Civico a La Spezia\nCartolina indirizzata a Maria Bevati, viale Bassi 17 a Cortina\nRetro con contenuto non significativo\nLa Spezia - Giardini - Monumento a Costanzo Ciano\nLa Spezia - Giardini - Monumento a Costanzo Ciano Retro'),
(77, 'media', 4, 1, 'La Spezia - Giardini - Monumento a Costanzo Ciano', 'La Spezia - Giardini - Monumento a Costanzo Ciano'),
(78, 'media', 4, 1, 'La Spezia - Giardini - Monumento a Costanzo Ciano Retro', 'La Spezia - Giardini - Monumento a Costanzo Ciano Retro'),
(79, 'items', 4, 1, 'La Spezia - Piazza Italia', 'La Spezia - Piazza Italia\nAnonimo\n9/12/1959\nLa Spezia\nCartolina\nFotografia che ritrae piazza Italia a La Spezia\nDedica di saluti indirizzata a Cosimo Cecinato\nLa Spezia - Piazza Italia\nLa Spezia - Piazza Italia Retro'),
(80, 'media', 4, 1, 'La Spezia - Piazza Italia', 'La Spezia - Piazza Italia'),
(81, 'media', 4, 1, 'La Spezia - Piazza Italia Retro', 'La Spezia - Piazza Italia Retro'),
(83, 'items', 4, 1, 'Quartiere Ciano a Piacenza', 'Quartiere Ciano a Piacenza\nAnonimo\nPiacenza\nhttps://www.movio.beniculturali.it/aspc/piacenzannitrenta/it/56/le-case-popolari Foto\nImmagine\nFoto che ritrae il quartiere popolare a Piacenza tutt\'ora conosciuto come \"quartiere Ciano\", inaugurato il 28 ottobre 1939 e dedicato a Costanzo Ciano\nQuartiere Ciano a Piacenza'),
(84, 'media', 4, 1, 'Quartiere Ciano a Piacenza', 'Quartiere Ciano a Piacenza'),
(85, 'items', 4, 1, 'Inaugurazione del monumento a Costanzo Ciano', 'Inaugurazione del monumento a Costanzo Ciano\nAnonimo\n20/11/1941\n1943\nGenova\nhttp://www.valbisagno.altervista.org/028-il%20papa%20buono%20e%20il%20busto%20di%20Ciano.html Foto\nImmagine\nImmagine che mostra l\'inaugurazione del monumento dedicato a Costanzo Ciano avvenuta il 20 novembre del 1941. La statua si trovava a Genova ed è stata rimossa nel 1943.\nInaugurazione del monumento a Costanzo Ciano (Genova)'),
(86, 'media', 4, 1, 'Inaugurazione del monumento a Costanzo Ciano (Genova)', 'Inaugurazione del monumento a Costanzo Ciano (Genova)'),
(87, 'items', 4, 1, 'Inaugurazione del monumento a Costanzo Ciano', 'Inaugurazione del monumento a Costanzo Ciano\nIstituto Nazionale LUCE\nRoma\n29 giugno 1942\nRavenna\nhttps://patrimonio.archivioluce.com/luce-web/detail/IL3000001277/12/gruppo-giovani-della-g-i-l-uniforme-marinara-ripreso-ai-piedi-del-monumento-costanzo-ciano-durante-cerimonia-inaugurale.html Foto\nImmagine\nIstituto Nazionale LUCE (Roma)	29 giugno 1942	Inaugurazione del monumento a Costanzo Ciano (Ravenna) 	Fotografia scatta durante l\'inaugurazione del monumento a Costanzo Ciano a Ravenna il 29 giugno 1942.\nSull\'alto basamento c\'è l\'iscrizione dedicatoria \"Ravenna a Costanzo Ciano\"\nInaugurazione del monumento a Costanzo Ciano'),
(88, 'media', 4, 1, 'Inaugurazione del monumento a Costanzo Ciano', 'Inaugurazione del monumento a Costanzo Ciano'),
(89, 'items', 4, 1, 'Soldati americani nel collegio Costanzo Ciano', 'Soldati americani nel collegio Costanzo Ciano\nAnonimo\n1944 ca.\nNapoli\nhttps://www.ww2online.org/image/american-soldiers-front-statue-italy Foto\nImmagine\nFoto che mostra un gruppo di soldati americani nel collegio Costanzo Ciano a Napoli.\nSoldati americani nel collegio Costanzo Ciano (Napoli)'),
(90, 'media', 4, 1, 'Soldati americani nel collegio Costanzo Ciano (Napoli)', 'Soldati americani nel collegio Costanzo Ciano (Napoli)'),
(92, 'items', 4, 1, 'Gli amanti di Francesco Messina', 'Gli amanti di Francesco Messina\nAnonimo\n1928\nScultura in bronzo\nOpera di Francesco Messina in bronzo, datata 1928\nGli amanti di Francesco Messina\nGli amanti di Francesco Messina'),
(93, 'media', 4, 1, 'Gli amanti di Francesco Messina', 'Gli amanti di Francesco Messina'),
(94, 'media', 4, 1, 'Gli amanti di Francesco Messina', 'Gli amanti di Francesco Messina'),
(96, 'item_sets', 4, 1, 'Architettura fascista di La Spezia', 'Architettura fascista di La Spezia'),
(97, 'item_sets', 4, 1, 'Il Ventennio a La Spezia', 'Il Ventennio a La Spezia'),
(98, 'item_sets', 4, 1, 'Altri monumenti di Costanzo Ciano', 'Altri monumenti di Costanzo Ciano'),
(99, 'items', 4, 1, 'Palazzo delle Poste La Spezia', 'Palazzo delle Poste La Spezia\nUser Wikipedia: Formkurve92\nhttps://de.wikipedia.org/wiki/Benutzer:Formkurve92 Utente (DE)\n31 marzo 2018\nLa Spezia\nhttps://it.wikipedia.org/wiki/Palazzo_delle_Poste_%28La_Spezia%29#/media/File:Mazzoni_Post_La_Spezia.JPG Foto\nFoto che ritrae il palazzo delle poste di La Spezia inaugurato nel novembre 1933.\nPalazzo delle Poste La Spezia'),
(100, 'media', 4, 1, 'Palazzo delle Poste La Spezia', 'Palazzo delle Poste La Spezia'),
(101, 'items', 4, 1, 'Palazzo del governo La Spezia', 'Palazzo del governo La Spezia\nGianni Porcellini\nLa Spezia\nhttps://www.artefascista.it/la_spezia__fascismo__arc.htm Foto\nFoto che mostra il palazzo del governo di La Spezia.\nPalazzo del governo La Spezia'),
(102, 'media', 4, 1, 'Palazzo del governo La Spezia', 'Palazzo del governo La Spezia'),
(103, 'items', 4, 1, 'Teatro civico di La Spezia', 'Teatro civico di La Spezia\nAnonimo\nhttps://catalogo.beniculturali.it/detail/ArchitecturalOrLandscapeHeritage/0700111222 Foto\nImmagine che ritrae il teatro civico di La Spezia. \nTeatro civico di La Spezia'),
(104, 'media', 4, 1, 'Teatro civico di La Spezia', 'Teatro civico di La Spezia'),
(105, 'item_sets', 4, 1, 'Arte e architettura nel Ventennio', 'Arte e architettura nel Ventennio'),
(106, 'items', 4, 1, 'La città che sale', 'La città che sale\nAnonimo\nUmberto Boccioni\n1910-1911\nMoMa, New York\nhttps://mydbook.giuntitvp.it/app/books/GIAC89_G8970105L/html/290 Immagine\nDipinto\nOpera \"La città che sale\" di Umberto Boccioni realizzata nel 1910-1911, conservata al MoMa di New York.\nLa città che sale'),
(107, 'media', 4, 1, 'La città che sale', 'La città che sale'),
(108, 'items', 4, 1, 'L\'Italia corporativa', 'L\'Italia corporativa\nAnonimo\nMario Sironi\n1936\nPalazzo dell\'Informazione, Milano\nhttps://www.panorama.it/il-sironi-che-si-vede-con-una-telefonata Immagine\nMosaico\nOpera \"L\'Italia corporativa\" di Mario Sironi, datata al 1936, che si trova a Milano nel palazzo dell\'Informazione. \nL\'Italia corporativa'),
(109, 'media', 4, 1, 'L\'Italia corporativa', 'L\'Italia corporativa'),
(110, 'items', 4, 1, 'Manifesto pubblicitario mostra Novecento Italiano', 'Manifesto pubblicitario mostra Novecento Italiano\nAnonimo\nMario Sironi\n1926 ca.\nhttps://catalogo.beniculturali.it/detail/HistoricOrArtisticProperty/0500659418 Foto\nManifesto pubblicitario\nManifesto pubblicitario della mostra Novecento Italiano realizzato da Mario Sironi intorno al 1926.\nManifesto pubblicitario mostra Novecento Italiano'),
(111, 'media', 4, 1, 'Manifesto pubblicitario mostra Novecento Italiano', 'Manifesto pubblicitario mostra Novecento Italiano'),
(112, 'item_sets', 4, 1, 'Opere di Francesco Messina', 'Opere di Francesco Messina'),
(113, 'items', 4, 1, 'Autoritratto di Francesco Messina', 'Autoritratto di Francesco Messina\nAnonimo\nFrancesco Messina\n1974\nSchizzo su carta\nOpera matita su carta di Francesco Messina datata 1974\nAutoritratto di Francesco Messina'),
(114, 'media', 4, 1, 'Autoritratto di Francesco Messina', 'Autoritratto di Francesco Messina'),
(115, 'items', 4, 1, 'Bagnante di Francesco Messina', 'Bagnante di Francesco Messina\nAnonimo\nFrancesco Messina\n1929\nScultura in bronzo\nOpera di Francesco Messina datata 1929 in bronzo\nBagnante di Francesco Messina'),
(116, 'media', 4, 1, 'Bagnante di Francesco Messina', 'Bagnante di Francesco Messina'),
(117, 'items', 4, 1, 'Monumento alla Vittoria a Bolzano', 'Monumento alla Vittoria a Bolzano\nSailko\n25/09/2016\nBolzano\nIl monumento alla Vittoria a Bolzano è un monumentale complesso marmoreo celebrativo della vittoria italiana nella prima guerra mondiale sull\'Austria-Ungheria, progettato dall\'architetto Marcello Piacentini e costruito tra il 1926 e il 1928. Si trova in piazza della Vittoria, a pochi passi dal ponte sul torrente Talvera. Il regime fascista lo creò a proprio simbolo.\nMonumento alla Vittoria a Bolzano'),
(118, 'media', 4, 1, 'Monumento alla Vittoria a Bolzano', 'Monumento alla Vittoria a Bolzano'),
(119, 'items', 4, 1, 'Statua di Costanzo Ciano', 'Statua di Costanzo Ciano\nAnonimo\nIsola di Santo Stefano, Livorno\nBusto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno\nProfilo del busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno attualmente situato sull\'isola di Santo Stefano\nVista frontale del busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno attualmente situato sull\'isola di Santo Stefano\nVolto della statua di Costanzo Ciano incompiuta concepita per il mausoleo di Livorno attualmente situato sull\'isola di Santo Stefano\nBusto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno\nBusto di Costanzo Ciano di profilo incompiuto concepito per il mausoleo di Livorno\nBusto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno vista frontale\nBusto di Costanzo Ciano di profilo incompiuto concepito per il mausoleo di Livorno\nVolto della statua di Costanzo Ciano incompiuta concepita per il mausoleo di Livorno'),
(120, 'media', 4, 1, 'Busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno', 'Busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno'),
(121, 'media', 4, 1, 'Busto di Costanzo Ciano di profilo incompiuto concepito per il mausoleo di Livorno', 'Busto di Costanzo Ciano di profilo incompiuto concepito per il mausoleo di Livorno'),
(122, 'media', 4, 1, 'Busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno vista frontale', 'Busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno vista frontale'),
(123, 'media', 4, 1, 'Busto di Costanzo Ciano di profilo incompiuto concepito per il mausoleo di Livorno', 'Busto di Costanzo Ciano di profilo incompiuto concepito per il mausoleo di Livorno'),
(124, 'media', 4, 1, 'Volto della statua di Costanzo Ciano incompiuta concepita per il mausoleo di Livorno', 'Volto della statua di Costanzo Ciano incompiuta concepita per il mausoleo di Livorno'),
(125, 'item_sets', 4, 1, 'Cancel Culture', 'Cancel Culture'),
(126, 'items', 4, 1, 'Monumento Kit Carson', 'Monumento Kit Carson\nUser Flickr: cmh2315fl\nhttps://www.flickr.com/photos/cmhpictures/ Profilo\n31/12/2016\nSanta Fé, New Mexico\nFotografia digitale\n\"Foto che ritrae il monumento dedicato a Kit Carson di fronte al tribunale degli Stati Uniti nel centro di Santa Fe, nel New Mexico. L\'obelisco fu eretto nel 1884 dal Grande Esercito della Repubblica. Kit Carson era un veterano della guerra messicano-americana e della guerra civile. Il monumento è stato danneggiato più volte, nel 2022 è stato schizzato di vernice rossa dagli\nattivisti in occasione della Giornata dei popoli indigeni.\"\nDettaglio del monumento dedicato a Kit Carson di fronte al tribunale degli Stati Uniti nel centro di Santa Fe, nel New Mexico. L\'incisione riporta la data della sua morte, avvenuta il 23 maggio 1868, quando aveva 59 anni.\nDettaglio del monumento dedicato a Kit Carson di fronte al tribunale degli Stati Uniti nel centro di Santa Fe, nel New Mexico. L\'incisione riporta \"Pioneer Pathfinder Soldier\".\nMonumento Kit Carson (Santa Fé, New Mexico)\nDettaglio del monumento Kit Carson 1\nDettaglio del monumento Kit Carson 2'),
(127, 'media', 4, 1, 'Monumento Kit Carson (Santa Fé, New Mexico)', 'Monumento Kit Carson (Santa Fé, New Mexico)'),
(128, 'media', 4, 1, 'Dettaglio del monumento Kit Carson 1', 'Dettaglio del monumento Kit Carson 1'),
(129, 'media', 4, 1, 'Dettaglio del monumento Kit Carson 2', 'Dettaglio del monumento Kit Carson 2'),
(130, 'items', 4, 1, 'Kit Carson', 'Kit Carson\nAnonimo\n1860 ca.\nFotografia\n\"Foto che ritrae Christopher Carson, meglio noto come Kit Carson (1809-1868), è stato un esploratore e militare statunitense.\nFu un celebre \"\"uomo di frontiera\"\" statunitense del XIX secolo: fu esploratore, guida, agente indiano, trapper, cacciatore e soldato. Figura quasi leggendaria, rappresenta nell\'immaginario collettivo una delle icone del Far West.\"\nKit Carson'),
(131, 'media', 4, 1, 'Kit Carson', 'Kit Carson'),
(132, 'items', 4, 1, 'Kit Carson 2', 'Kit Carson 2\nMathew Brady\nLevin C. Handy\n1860-1875\nFotografia con stampa negativa realizzata con la tecnica del collodio umido.\nFoto che ritrae Kit Carson tra il 1860 e il 1875.\nKit Carson 2'),
(133, 'media', 4, 1, 'Kit Carson 2', 'Kit Carson 2'),
(134, 'items', 4, 1, 'Stato attuale dell\'ex obelisco dedicato a Kit Carson', 'Stato attuale dell\'ex obelisco dedicato a Kit Carson\nEnrica Salvatori\n09/2023\nSanta Fé, New Mexico\nFotografia digitale\nFoto che ritrae lo stato attuale del monumento dedicato a Kit Carson, situato a Santa Fé. L\'obelisco è scomparso, il basamento è coperto ed è presente un\'epigrafe pacificatoria con QRCode. Si trova nella pagina 3 delle slides della prima lezione.\nStato attuale dell\'ex obelisco dedicato a Kit Carson'),
(135, 'media', 4, 1, 'Stato attuale dell\'ex obelisco dedicato a Kit Carson', 'Stato attuale dell\'ex obelisco dedicato a Kit Carson'),
(136, 'item_sets', 4, 1, 'Kit Carson', 'Kit Carson'),
(137, 'items', 4, 1, 'Cartolina Giardini e Palazzo del Governo La Spezia', 'Cartolina Giardini e Palazzo del Governo La Spezia\nAnonimo\nCartolina\nFoto che ritrae la piazza dove c\'è il Palazzo del Governo, la statua sembra non esserci nella foto\nRetro della cartolina che ritrae i giardini e il Palazzo del Governo a La Spezia\nSul retro è riportato: \"Gentilissima Famiglia Brunetto, Via Vernazza 14C Torino. Ringraziamenti e saluti affettuosi Alfredo Lidia Giovanna Gigi(?) altro nome 8-10-1943\nCartolina Giardini e Palazzo del Governo La Spezia\nCartolina Giardini e Palazzo del Governo La Spezia Retro'),
(138, 'media', 4, 1, 'Cartolina Giardini e Palazzo del Governo La Spezia', 'Cartolina Giardini e Palazzo del Governo La Spezia'),
(139, 'media', 4, 1, 'Cartolina Giardini e Palazzo del Governo La Spezia Retro', 'Cartolina Giardini e Palazzo del Governo La Spezia Retro'),
(140, 'items', 4, 1, 'Cavallo Morente di Francesco Messina', 'Cavallo Morente di Francesco Messina\nAnonimo\nFrancesco Messina\nViale Mazzini, Roma\nScultura\nCavallo Morente di Franscesco Messina collocata alla sede della Direzione Generale di viale Mazzini a Roma\nCavallo Morente di Francesco Messina'),
(141, 'media', 4, 1, 'Cavallo Morente di Francesco Messina', 'Cavallo Morente di Francesco Messina'),
(142, 'item_sets', 4, 1, 'Censura della Comunicazione', 'Censura della Comunicazione'),
(143, 'items', 4, 1, 'Mussolini, la figlia e altri gerarchi durante una parata', 'Mussolini, la figlia e altri gerarchi durante una parata\nAnonimo\nante 1945\nForo Italico, Roma\nhttps://it.wikipedia.org/wiki/File:Censura_Fascismo_2.jpg Foto\nFotografia\nFoto vietata che ritrae, in una parata al Foro Italico di Roma, Benito Mussolini, la figlia Edda Ciano e altri gerarchi bagnati da un\'innaffiatrice.\nMussolini, la figlia e altri gerarchi durante una parata'),
(144, 'media', 4, 1, 'Mussolini, la figlia e altri gerarchi durante una parata', 'Mussolini, la figlia e altri gerarchi durante una parata'),
(145, 'items', 4, 1, 'Soldato ferito in battaglia', 'Soldato ferito in battaglia\nAnonimo\n1940-1943\nhttps://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/ Foto\nFotografia\nLa foto è stata censurata perché mostra un soldato ferito in battaglia.\nSoldato ferito in battaglia'),
(146, 'media', 4, 1, 'Soldato ferito in battaglia', 'Soldato ferito in battaglia'),
(147, 'items', 4, 1, 'Uomo prega in ginocchio', 'Uomo prega in ginocchio\nAnonimo\n1940-1943\nhttps://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/. Foto\nFotografia\nLa foto è stata censurata perché mostra un uomo, in preda alla disperazione, che prega in ginocchio.\n\nUomo prega in ginocchio'),
(148, 'media', 4, 1, 'Uomo prega in ginocchio', 'Uomo prega in ginocchio'),
(149, 'items', 4, 1, 'Soldati con camicia strappata e scarpe rotte', 'Soldati con camicia strappata e scarpe rotte\nAnonimo\n1940-1943\nhttps://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/. Foto\nFotografia\nImmagine censurata perché i soldati hanno la camicia strappata e le scarpe rotte.\nSulla foto è riportato \"Camicia strappata! Scarpe rotte!\"\nSoldati con camicia strappata e scarpe rotte'),
(150, 'media', 4, 1, 'Soldati con camicia strappata e scarpe rotte', 'Soldati con camicia strappata e scarpe rotte'),
(151, 'items', 4, 1, 'Soldati con camicia strappata, cappelli e scarpe rotte', 'Soldati con camicia strappata, cappelli e scarpe rotte\nAnonimo\n1940-1943\nhttps://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/ Foto\nFotografia\nImmagine censurata perché i soldati hanno la camicia strappata e i cappelli e le scarpe rotte.	\nSulla fotografia è riportato \"Se pubblicassimo foto di questo genere ci faremmo una bella figura\"\nSoldati con camicia strappata, cappelli e scarpe rotte 2'),
(152, 'media', 4, 1, 'Soldati con camicia strappata, cappelli e scarpe rotte 2', 'Soldati con camicia strappata, cappelli e scarpe rotte 2'),
(153, 'items', 4, 1, 'Tre soldati pensierosi e preoccupati', 'Tre soldati pensierosi e preoccupati\nAnonimo\n1940-1943\nhttps://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/ Foto\nFotografia\nImmagine censurata perché i soldati sembrano preoccupati e pensierosi.\nSulla foto è riportato \"Ammirare la fierezza (!) che traspare da questo gruppo!\"\nTre soldati pensierosi e preoccupati'),
(154, 'media', 4, 1, 'Tre soldati pensierosi e preoccupati', 'Tre soldati pensierosi e preoccupati'),
(155, 'items', 4, 1, 'Mussolini saluta il re Vittorio Emanuele III', 'Mussolini saluta il re Vittorio Emanuele III\nAnonimo\nante 1945\nhttps://it.wikipedia.org/wiki/File:Censura_Fascismo_1.jpg Foto\nFotografia\nFotografia che mostra Mussolini che saluta il re Vittorio Emanuele III, ma l\'inchino e la stretta di mano erano vietati dal regime: la foto fu censurata.\nMussolini saluta il re Vittorio Emanuele III'),
(156, 'media', 4, 1, 'Mussolini saluta il re Vittorio Emanuele III', 'Mussolini saluta il re Vittorio Emanuele III'),
(157, 'items', 4, 1, 'Gerarca inciampa comicamente', 'Gerarca inciampa comicamente\nAnonimo\n1937\nhttps://it.wikipedia.org/wiki/File:Censura_Fascimo_3.jpg Foto\nFotografia\nImmagine che ritrae un gerarca, durante una visita di Mussolini nel 1937, che inciampa comicamente: la foto venne vietata poiché non si atteneva alla marzialità fascista.\nGerarca inciampa comicamente'),
(158, 'media', 4, 1, 'Gerarca inciampa comicamente', 'Gerarca inciampa comicamente'),
(159, 'items', 4, 1, 'Funerali e rientro delle salme', 'Funerali e rientro delle salme\nAnonimo\n1940-1943\nhttp://www.lafotografiacomeattopolitico.it/2019/02/06/la-censura/	 Foto\nFotografia\nImmagine censurata che ritrae il rientro delle salme; è stata archiviata sotto la dicitura “riservata”. \nFunerali e rientro delle salme'),
(160, 'media', 4, 1, 'Funerali e rientro delle salme', 'Funerali e rientro delle salme'),
(161, 'items', 4, 1, 'Tre soldati sul fronte del Nordafrica', 'Tre soldati sul fronte del Nordafrica\nAnonimo\n1940-1943\nhttp://www.lafotografiacomeattopolitico.it/2019/02/06/la-censura/ Foto\nFotografia\nFoto che ritrae tre soldati sul fronte del Nordafrica mentre parlano tra loro. La foto fu censurata ed archiviata come \"riservata\" in quanto i loro atteggiamenti non mostrano fierezza bensì paura e sciatteria sono occultati. Inoltre nella foto alcune camicie sono strappate e uno di loro sta fumando.\nSulla foto è riportato \"Per fotografie di questo genere o si scelgono dei bellissimi figli di razza italiana - ben vestiti ed in atteggiamento veramente austero- o non si fanno!\"\nTre soldati sul fronte del Nordafrica'),
(162, 'media', 4, 1, 'Tre soldati sul fronte del Nordafrica', 'Tre soldati sul fronte del Nordafrica'),
(163, 'items', 4, 1, 'Spari sul fronte del Nordafrica', 'Spari sul fronte del Nordafrica\nAnonimo\n1940-1943\nhttp://www.lafotografiacomeattopolitico.it/2019/02/06/la-censura/ Foto\nFotografia\nFotografia che ritrae dei soldati mentre stanno sparando con il cannone; la foto fu censurata ed archiviata come \"riservata\" perché alcuni si stavano tappando le orecchie per paura dello sparo.\nSull\'immagine è riportato \"Hanno tutti paura dello sparo\"\nSpari sul fronte del Nordafrica'),
(164, 'media', 4, 1, 'Spari sul fronte del Nordafrica', 'Spari sul fronte del Nordafrica'),
(165, 'items', 4, 1, 'Due uomini suonano sul fronte del Nordafrica', 'Due uomini suonano sul fronte del Nordafrica\nAnonimo\n1940-1943\nhttp://www.lafotografiacomeattopolitico.it/2019/02/06/la-censura/ Foto\nFotografia\nFoto che ritrae due soldati mentre stanno suonando. La foto fu censurata ed archiviata come \"riservata\" perché vengono definiti come \"accattoni\" e la sciatteria veniva occultata.\nSull\'immagine è riportato \"Sono accattoni o soldati?\"\nDue uomini suonano sul fronte del Nordafrica'),
(166, 'media', 4, 1, 'Due uomini suonano sul fronte del Nordafrica', 'Due uomini suonano sul fronte del Nordafrica'),
(167, 'items', 4, 1, 'Lo sguardo terrorizzato del soldato verso il Duce', 'Lo sguardo terrorizzato del soldato verso il Duce\nAnonimo\n1940-1943\nhttps://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/ Foto\nFotografia\nLo sguardo terrorizzato del soldato verso il duce	Immagine che mostra Mussolini visita ad un soldato, la foto è stata censurata perché il soldato lo guarda in modo ostile e denso di paura.\nLo sguardo terrorizzato del soldato verso il Duce'),
(168, 'media', 4, 1, 'Lo sguardo terrorizzato del soldato verso il Duce', 'Lo sguardo terrorizzato del soldato verso il Duce'),
(169, 'items', 4, 1, 'Soldati feriti', 'Soldati feriti\nAnonimo\n1940-1943\nhttps://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/ Foto\nFotografia\nFotografia censurata perché mostra i soldati feriti.\nSoldati feriti'),
(170, 'media', 4, 1, 'Soldati feriti', 'Soldati feriti'),
(171, 'items', 4, 1, 'Cocaina di Francesco Messina', 'Cocaina di Francesco Messina\nAnonimo\n1920-1921\nScultura\nOpera di Francesco Messina datata 1920-21\nCocaina di Francesco Messina'),
(172, 'media', 4, 1, 'Cocaina di Francesco Messina', 'Cocaina di Francesco Messina'),
(173, 'item_sets', 4, 1, 'Edward Colston', 'Edward Colston'),
(174, 'items', 4, 1, 'Statua di Edward Colston', 'Statua di Edward Colston\nSimon Cobb\n24/06/2019\nFotografia digitale\nFoto che ritrae la statua di bronzo dedicata a Edward Colston e realizzata nel 1865 da John Cassidy. Si trova nel parco pubblico \"The Centre\" di Bristol. C\'è stato un dibattito sulla moralità della statua ed è stata danneggiata nel 2020. Ora si trova al M-Shed museum di Bristol.\nStatua di Edward Colston'),
(175, 'media', 4, 1, 'Statua di Edward Colston', 'Statua di Edward Colston'),
(176, 'items', 4, 1, 'Abbattimento statua Colston', 'Abbattimento statua Colston\nAnonimo\n06/2020\nFotografia digitale\nFoto che ritrae la folla mentre cerca di gettare la statua dedicata a Colston nel fiume.\nAbbattimento statua Colston'),
(177, 'media', 4, 1, 'Abbattimento statua Colston', 'Abbattimento statua Colston'),
(178, 'items', 4, 1, 'Il piedistallo vuoto della statua di Edward Colton a Bristol', 'Il piedistallo vuoto della statua di Edward Colton a Bristol\nCaitlin Hobbs\n07/06/2020\nFotografia digitale\nIl piedistallo vuoto della statua di Edward Colton a Bristol, il giorno dopo che i manifestanti avevano abbattuto la statua e l\'avevano fatta rotolare nel fiume. Il terreno è ricoperto di cartelli Black Lives Matter.\nIl piedistallo vuoto della statua di Edward Colton a Bristol'),
(179, 'media', 4, 1, 'Il piedistallo vuoto della statua di Edward Colton a Bristol', 'Il piedistallo vuoto della statua di Edward Colton a Bristol'),
(180, 'items', 4, 1, 'Degrado della scultura di E.Colston', 'Degrado della scultura di E.Colston\nAdrian Boliston\n08/06/2021\nFotografia digitale\nFoto che ritrae la statua deturpata di Colston conservata al museo M Shed, a Bristol.\nDegrado della scultura di E.Colston'),
(181, 'media', 4, 1, 'Degrado della scultura di E.Colston', 'Degrado della scultura di E.Colston'),
(182, 'items', 4, 1, 'Installazione artistica statua Colston', 'Installazione artistica statua Colston\nAnonimo\n2018\nFotografia digitale\nFoto che ritrae l\'installazione artistica del 2018, realizzata intorno alla statua di Colston, che rappresenta gli schiavi come bare su una nave negriera.\nInstallazione artistica statua Colston'),
(183, 'media', 4, 1, 'Installazione artistica statua Colston', 'Installazione artistica statua Colston'),
(184, 'items', 4, 1, 'Folla rovescia la statua di E.Colston', 'Folla rovescia la statua di E.Colston\nAnonimo\n7 giugno 2020\nFotografia digitale\nFoto che ritrae la folla mentre rovescia la statua di E.Colston durante una protesta di protestanti anti-razzisti avvenuta il 7 giugno 2020. La statua è poi stata gettata nel fiume.\nFolla rovescia la statua di E.Colston'),
(185, 'media', 4, 1, 'Folla rovescia la statua di E.Colston', 'Folla rovescia la statua di E.Colston'),
(186, 'item_sets', 4, 1, 'La persona di Costanzo Ciano', 'La persona di Costanzo Ciano'),
(187, 'items', 4, 1, 'Costanzo Ciano inaugura il 12 novembre 1933 il Palazzo delle Poste', 'Costanzo Ciano inaugura il 12 novembre 1933 il Palazzo delle Poste\nAnonimo\n12/11/1933\nLa Spezia\nFoto che ritrae le celebrazioni per l\'inaugurazione del Palazzo delle Poste avvenuta il 12 novembre 1933 a La Spezia.\nCostanzo Ciano inaugura il 12 novembre 1933 il Palazzo delle Poste'),
(188, 'media', 4, 1, 'Costanzo Ciano inaugura il 12 novembre 1933 il Palazzo delle Poste', 'Costanzo Ciano inaugura il 12 novembre 1933 il Palazzo delle Poste'),
(189, 'items', 4, 1, 'Luogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno', 'Luogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno\nAnonimo\n1959\nSanto Stefano\nFotografia\nFotografia che ritrae il luogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno nel 1959\nLuogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno'),
(190, 'media', 4, 1, 'Luogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno', 'Luogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno'),
(191, 'items', 4, 1, 'Obelisco di Marconi', 'Obelisco di Marconi\nBlackcat\n09/05/2011\nRoma\nL\'obelisco di Marconi, o obelisco dell\'EUR, è un obelisco di Roma, annoverato tra i più moderni insieme al Novecento, a quello del Foro Italico, a quelli di villa Torlonia e a quello di villa Medici. Opera dello scultore Arturo Dazzi, è intitolato al fisico, inventore e senatore Guglielmo Marconi.\nObelisco di Marconi'),
(192, 'media', 4, 1, 'Obelisco di Marconi', 'Obelisco di Marconi'),
(193, 'item_sets', 4, 1, 'Squadrismo', 'Squadrismo'),
(194, 'items', 4, 1, 'Roberto Farinacci (1892-1945)', 'Roberto Farinacci (1892-1945)\nAnonimo\n1925\nFotografia\nFotografia che ritrae Roberto Farinacci, politico, giornalista e generale italiano che nel 1925 era capo dello squadrismo intransigente. L\'immagine è tratta da Storia della Rivoluzione Fascista (1919-1922) di Giorgio Alberto Chiurco, Volume IV, Anno 1922, parte I, pag 327.\nRoberto Farinacci (1892-1945)'),
(195, 'media', 4, 1, 'Roberto Farinacci (1892-1945)', 'Roberto Farinacci (1892-1945)'),
(196, 'items', 4, 1, 'Foro Italico', 'Foro Italico\nMister No\n12/09/2015\nScultura\nIl Foro Italico (inaugurato nel 1932 con il nome di Foro Mussolini) è un vasto complesso sportivo che si trova alla base di Monte Mario a Roma, ideato e realizzato da Enrico Del Debbio fra il 1927 e il 1933 e completato dopo la guerra fra il 1956 e il 1968.\nForo Italico'),
(197, 'media', 4, 1, 'Foro Italico', 'Foro Italico'),
(198, 'items', 4, 1, 'Statua Costanzo Ciano', 'Statua Costanzo Ciano\nAnonimo\nFoto che ritrae la statua di Costanzo Ciano realizzata dallo scultore Francesco Messina.\nIn basso è riportato: \"La Spezia- Monumento a Costanzo Ciano - Piazza Cortellazzo (Scultore Francesco Messina)\nStatua Costanzo Ciano'),
(200, 'item_sets', 4, 1, 'Storia della statua di Costanzo Ciano', 'Storia della statua di Costanzo Ciano'),
(202, 'media', 4, 1, 'Statua Costanzo Ciano', 'Statua Costanzo Ciano'),
(203, 'items', 4, 1, 'Statua di Santa Caterina da Siena', 'Statua di Santa Caterina da Siena\nAnonimo\nFoto che ritrae la statua di Santa Caterina da Siena, realizzata dallo scultore Francesco Messina nel 1962, che si trova in Largo Giovanni XXIII a Roma. \nStatua di Santa Caterina da Siena'),
(204, 'media', 4, 1, 'Statua di Santa Caterina da Siena', 'Statua di Santa Caterina da Siena'),
(205, 'items', 4, 1, 'Fotografia monumento a Costanzo Ciano La Spezia', 'Fotografia monumento a Costanzo Ciano La Spezia\n30/09/1940\nLa Spezia\nFotografia che ritrae il monumento a Costanzo Ciano a La Spezia\nSul retro una scritta in tedesco che specifica il nome e la dedica del monumento\nFotografia monumento a Costanzo Ciano La Spezia\nFotografia monumento a Costanzo Ciano La Spezia - Retro'),
(206, 'media', 4, 1, 'Fotografia monumento a Costanzo Ciano La Spezia', 'Fotografia monumento a Costanzo Ciano La Spezia'),
(207, 'media', 4, 1, 'Fotografia monumento a Costanzo Ciano La Spezia - Retro', 'Fotografia monumento a Costanzo Ciano La Spezia - Retro'),
(208, 'item_sets', 4, 1, 'Propaganda post mortem', 'Propaganda post mortem'),
(209, 'items', 4, 1, 'La morte di Costanzo Ciano e l\'omaggio del Duce', 'La morte di Costanzo Ciano e l\'omaggio del Duce\nAnonimo\n02/07/1939\nIl Duce lascia la villa di Ponte a Moriano dopo aver reso omaggio alla salma di COstanzo Ciano\nLa morte di Costanzo Ciano e l\'omaggio del Duce'),
(210, 'media', 4, 1, 'La morte di Costanzo Ciano e l\'omaggio del Duce', 'La morte di Costanzo Ciano e l\'omaggio del Duce'),
(211, 'items', 4, 1, 'La bara di Costanzo Ciano nella sala della Casa Littoria a Livorno', 'La bara di Costanzo Ciano nella sala della Casa Littoria a Livorno\nAnonimo\n02/07/1939\nLa bara di Costanzo Ciano vestito in uniforme da ammiraglio nella sala della Casa Littoria a Livorno\nLa bara di Costanzo Ciano nella sala della Casa Littoria a Livorno'),
(212, 'media', 4, 1, 'La bara di Costanzo Ciano nella sala della Casa Littoria a Livorno', 'La bara di Costanzo Ciano nella sala della Casa Littoria a Livorno'),
(213, 'items', 4, 1, 'La bara di Costanzo Ciano vestito da ammiraglio', 'La bara di Costanzo Ciano vestito da ammiraglio\nAnonimo\n02/07/1939\nLa bara di Costanzo Ciano sull\'affusto di cannone\nLa bara di Costanzo Ciano vestito da ammiraglio'),
(214, 'media', 4, 1, 'La bara di Costanzo Ciano vestito da ammiraglio', 'La bara di Costanzo Ciano vestito da ammiraglio'),
(215, 'items', 4, 1, 'Il furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza', 'Il furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza\nAnonimo\n02/07/1939\nIl furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza prima di prendere posto nell\'automobile\nIl furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza'),
(216, 'media', 4, 1, 'Il furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza', 'Il furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza'),
(217, 'items', 4, 1, 'La bara di Costanzo Ciano a Livorno', 'La bara di Costanzo Ciano a Livorno\nAnonimo\n02/07/1939\nLa bara di Costanzo Ciano a Livorno tra la folla\nLa bara di Costanzo Ciano a Livorno'),
(218, 'media', 4, 1, 'La bara di Costanzo Ciano a Livorno', 'La bara di Costanzo Ciano a Livorno'),
(219, 'items', 4, 1, 'La bara di Costanzo Ciano accolta dalla folla a Livorno', 'La bara di Costanzo Ciano accolta dalla folla a Livorno\nAnonimo\n02/07/1939\nLa bara di Ciano accolta dalla folla a Livorno\nLa bara di Costanzo Ciano accolta dalla folla a Livorno'),
(220, 'media', 4, 1, 'La bara di Costanzo Ciano accolta dalla folla a Livorno', 'La bara di Costanzo Ciano accolta dalla folla a Livorno'),
(221, 'items', 4, 1, 'Il galletto di Francesco Messina', 'Il galletto di Francesco Messina\nAnonimo\nIl galletto ritratto di fanciullo busto datato 1920 - 1980\nIl galletto di Francesco Messina'),
(222, 'media', 4, 1, 'Il galletto di Francesco Messina', 'Il galletto di Francesco Messina'),
(223, 'items', 4, 1, 'Arco della vittoria a Genova', 'Arco della vittoria a Genova\nDomenico Lucà\n24/05/2014\nL\'Arco della Vittoria, detto anche Monumento ai caduti o Arco dei Caduti, è un imponente arco di trionfo, realizzato durante il regime fascista, situato in piazza della Vittoria a Genova. È dedicato ai genovesi caduti nel corso della prima guerra mondiale e fu inaugurato il 31 maggio del 1931.\nArco della vittoria a Genova'),
(224, 'media', 4, 1, 'Arco della vittoria a Genova', 'Arco della vittoria a Genova'),
(225, 'items', 4, 1, 'Giacomo Matteotti', 'Giacomo Matteotti\nAnonimo\nante 1924\nFotografia che ritrae Giacomo Matteotti, politico, giornalista e antifascista italiano, segretario del Partito Socialista Unitario.\nGiacomo Matteotti'),
(226, 'media', 4, 1, 'Giacomo Matteotti', 'Giacomo Matteotti'),
(227, 'item_sets', 4, 1, 'Opposizione', 'Opposizione'),
(228, 'item_sets', 4, 1, 'Il nostro percorso', 'Il nostro percorso'),
(229, 'items', 4, 1, 'Incontro con Giorgio Pagano', 'Incontro con Giorgio Pagano\nAnonimo\n04/12/2023\nFoto che ritrae Giorgio Pagano, ex sindaco della\nSpezia (Comitato provinciale unitario della Resistenza) durante un incontro che si è tenuto il 4 dicembre 2023 nell\'ora di lezione del corso.\nIncontro con Giorgio Pagano'),
(230, 'media', 4, 1, 'Incontro con Giorgio Pagano', 'Incontro con Giorgio Pagano'),
(231, 'items', 4, 1, 'Grande torso femminile di Francesco Messina', 'Grande torso femminile di Francesco Messina\nAnonimo\nScultura in bronzo datata 1970\nGrande torso femminile di Francesco Messina'),
(232, 'media', 4, 1, 'Grande torso femminile di Francesco Messina', 'Grande torso femminile di Francesco Messina'),
(233, 'items', 4, 1, 'Costanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni', 'Costanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni\nAnonimo\n23/03/1939\nGelatina a sviluppo\nFoto in cui sono presenti Costanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni il 23 marzo 1939. Ultima foto di Ciano.\nTit. e data del catalogatore da nota ms. sul verso. Riproduzione di fotografia originale.  Ultima foto di C. Ciano.\nCostanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni'),
(234, 'media', 4, 1, 'Costanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni', 'Costanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni'),
(235, 'item_sets', 4, 1, 'Propaganda fascista', 'Propaganda fascista'),
(236, 'items', 4, 1, 'Prospettiva Palazzo del Governo', 'Prospettiva Palazzo del Governo\nEnrica Salvatori\n11/11/2023\nFotografia digitale\nRipresa attuale cartoline antiche\nProspettiva del palazzo del governo, in primo piano NH hotel \nPalazzo del governo visto da dietro, in primo piano NH hotel\nRipresa attuale cartoline antiche\nProspettiva Palazzo del Governo\nProspettiva Palazzo del Governo'),
(237, 'media', 4, 1, 'Prospettiva Palazzo del Governo', 'Prospettiva Palazzo del Governo'),
(238, 'media', 4, 1, 'Prospettiva Palazzo del Governo', 'Prospettiva Palazzo del Governo'),
(239, 'items', 4, 1, 'Palazzo INPS', 'Palazzo INPS\nEnrica Salvatori\n11/11/2023\nFotografia digitale\nVista e vista dal basso della statua di Ercole presente all\'angolo del palazzo dell\'INPS\nProbabile sostituzione fascio littorio in data ignota\nPalazzo INPS\nPalazzo INPS'),
(240, 'media', 4, 1, 'Palazzo INPS', 'Palazzo INPS'),
(241, 'media', 4, 1, 'Palazzo INPS', 'Palazzo INPS'),
(242, 'items', 4, 1, 'Monumento ai Caduti', 'Monumento ai Caduti\nEnrica Salvatori\n11/11/2023\nFotografia digitale\nVista laterale del Monumento ai Caduti in Piazza del Marinaio a La Spezia\nDettaglio del Monumento ai Caduti in Piazza del Marinaio a La Spezia\nMonumento ai Caduti in Piazza del Marinaio a La Spezia\nDedica a C. Bergamini e ai marinai caduti alla Maddalena nel 1943\nVista laterale\nMonumento ai Caduti\nMonumento ai Caduti\nMonumento ai Caduti\nMonumento ai Caduti\nMonumento ai Caduti'),
(243, 'media', 4, 1, 'Monumento ai Caduti', 'Monumento ai Caduti'),
(244, 'media', 4, 1, 'Monumento ai Caduti', 'Monumento ai Caduti'),
(245, 'media', 4, 1, 'Monumento ai Caduti', 'Monumento ai Caduti'),
(246, 'media', 4, 1, 'Monumento ai Caduti', 'Monumento ai Caduti'),
(247, 'media', 4, 1, 'Monumento ai Caduti', 'Monumento ai Caduti');

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
(89, NULL),
(99, NULL),
(103, NULL),
(106, NULL),
(108, NULL),
(110, NULL),
(115, NULL),
(117, NULL),
(119, NULL),
(126, NULL),
(130, NULL),
(134, NULL),
(137, NULL),
(140, NULL),
(143, NULL),
(147, NULL),
(155, NULL),
(157, NULL),
(159, NULL),
(167, NULL),
(169, NULL),
(171, NULL),
(176, NULL),
(178, NULL),
(180, NULL),
(182, NULL),
(184, NULL),
(187, NULL),
(189, NULL),
(191, NULL),
(196, NULL),
(198, NULL),
(203, NULL),
(205, NULL),
(209, NULL),
(211, NULL),
(213, NULL),
(215, NULL),
(217, NULL),
(219, NULL),
(221, NULL),
(223, NULL),
(229, NULL),
(231, NULL),
(236, NULL),
(239, NULL),
(242, NULL),
(2, 3),
(6, 7),
(13, 14),
(63, 64),
(67, 68),
(70, 71),
(73, 74),
(76, 77),
(79, 80),
(83, 84),
(85, 86),
(87, 88),
(92, 93),
(101, 102),
(113, 114),
(132, 133),
(145, 146),
(149, 150),
(151, 152),
(153, 154),
(161, 162),
(163, 164),
(165, 166),
(174, 175),
(194, 195),
(225, 226),
(233, 234);

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
(23, 22),
(63, 96),
(67, 96),
(70, 97),
(73, 96),
(76, 96),
(76, 97),
(79, 96),
(79, 97),
(83, 98),
(85, 98),
(87, 98),
(89, 98),
(92, 112),
(99, 96),
(101, 96),
(103, 96),
(106, 105),
(108, 105),
(110, 105),
(113, 112),
(115, 112),
(117, 105),
(119, 98),
(126, 125),
(126, 136),
(130, 136),
(132, 125),
(132, 136),
(134, 125),
(134, 136),
(137, 96),
(137, 97),
(140, 112),
(143, 142),
(145, 142),
(147, 142),
(149, 142),
(151, 142),
(153, 142),
(155, 142),
(157, 142),
(159, 142),
(161, 142),
(163, 142),
(165, 142),
(167, 142),
(169, 142),
(171, 112),
(174, 125),
(174, 173),
(176, 125),
(176, 173),
(178, 125),
(178, 173),
(180, 125),
(180, 173),
(182, 125),
(182, 173),
(184, 125),
(184, 173),
(187, 186),
(189, 98),
(191, 105),
(194, 193),
(196, 105),
(198, 112),
(198, 200),
(203, 112),
(205, 200),
(209, 186),
(209, 208),
(211, 186),
(211, 208),
(213, 186),
(213, 208),
(215, 186),
(215, 208),
(217, 186),
(217, 208),
(219, 186),
(219, 208),
(221, 112),
(223, 105),
(225, 227),
(229, 228),
(231, 112),
(233, 186),
(233, 235),
(236, 200),
(239, 96),
(239, 105),
(242, 97);

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
(22, 0),
(96, 0),
(97, 0),
(98, 0),
(105, 0),
(112, 0),
(125, 0),
(136, 0),
(142, 0),
(173, 0),
(186, 0),
(193, 0),
(200, 0),
(208, 0),
(227, 0),
(228, 0),
(235, 0);

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
(44, 1),
(63, 1),
(67, 1),
(70, 1),
(73, 1),
(76, 1),
(79, 1),
(83, 1),
(85, 1),
(87, 1),
(89, 1),
(92, 1),
(99, 1),
(101, 1),
(103, 1),
(106, 1),
(108, 1),
(110, 1),
(113, 1),
(115, 1),
(117, 1),
(119, 1),
(126, 1),
(130, 1),
(132, 1),
(134, 1),
(137, 1),
(140, 1),
(143, 1),
(145, 1),
(147, 1),
(149, 1),
(151, 1),
(153, 1),
(155, 1),
(157, 1),
(159, 1),
(161, 1),
(163, 1),
(165, 1),
(167, 1),
(169, 1),
(171, 1),
(174, 1),
(176, 1),
(178, 1),
(180, 1),
(182, 1),
(184, 1),
(187, 1),
(189, 1),
(191, 1),
(194, 1),
(196, 1),
(198, 1),
(203, 1),
(205, 1),
(209, 1),
(211, 1),
(213, 1),
(215, 1),
(217, 1),
(219, 1),
(221, 1),
(223, 1),
(225, 1),
(229, 1),
(231, 1),
(233, 1),
(236, 1),
(239, 1),
(242, 1);

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
(47, 44, 'upload', 'file', NULL, 'CC_codifica-ok1.xml', 'application/tei+xml', 'bded1487b9f28733ba9da7708ffb893d1d5c4c5d', 'xml', 'd2927923a566d34156563f05c23d435a54a061d0e637b81f143e7fcc63b05f49', 223512, 1, 0, 1, NULL, NULL),
(64, 63, 'upload', 'file', NULL, '1214_Domenico_Rollo.jpg', 'image/jpeg', 'e0844ffe27b59891f4a89afcf20651af6febe8c2', 'jpg', '06bc3af323472d2d1bce69bb9c718f9ef2eecaa4152df379b9699aeb5455a122', 298819, 1, 1, 1, NULL, NULL),
(65, 63, 'upload', 'file', NULL, '1214R_Domenico_Rollo.jpg', 'image/jpeg', '4c592fe30e33cdc0397111369bf1481867449467', 'jpg', 'b4269a9cda5841a1eb9eef815dd712fb03a55fe8f05645d3873cf1a851e7c333', 336471, 1, 1, 2, NULL, NULL),
(68, 67, 'upload', 'file', NULL, '2423_Domenico_Rollo.jpg', 'image/jpeg', '7700fafbd8eb06f35fe7f60046a31bb79d7f0477', 'jpg', '07082eb71b75ac210252e41065a387fae4bf3b1742417e152d6f74d5e3b6cfff', 834639, 1, 1, 1, NULL, NULL),
(69, 67, 'upload', 'file', NULL, '2423R_Domenico_Rollo.jpg', 'image/jpeg', '6e8be88181fad536c9bde440ff0a892149425b51', 'jpg', 'fc2ff6de94083dd8b7bdc737b19faa6defd6d8936e12113d9de21a51f00285e1', 395639, 1, 1, 2, NULL, NULL),
(71, 70, 'upload', 'file', NULL, '2429_Domenico_Rollo.jpg', 'image/jpeg', 'd1cdee77a0b9294b6a4fcc70c4cb1ade1963d06c', 'jpg', 'f51d8f4ed824737a55cc9db240e62dbd2a603e19fcb4053f45c286e5459599c7', 638100, 1, 1, 1, NULL, NULL),
(72, 70, 'upload', 'file', NULL, '2429R_Domenico_Rollo.jpg', 'image/jpeg', '08496fa346ff08f08b91c478251e047e5aa53737', 'jpg', '8bce6c372f8d92db58c966d5c22118dbe771ca533e0fc2523fe7b6524e99c38a', 365746, 1, 1, 2, NULL, NULL),
(74, 73, 'upload', 'file', NULL, '2431_Domenico_Rollo.jpg', 'image/jpeg', 'e5c1b5fb696a7cf56a03638a2318c2b51f6cca0e', 'jpg', 'bc2bafe0623cefebb4e44a02fe5f4f0622ad64f6fb3a784e76999dc2e6f051c5', 802548, 1, 1, 1, NULL, NULL),
(75, 73, 'upload', 'file', NULL, '2431R.jpg', 'image/jpeg', 'd027c1141e52d78869d0c5c1d4bd0fbb4d218217', 'jpg', '4005ea7558772f26603902a9c24a3da5f0191832d78e2d3e297293bfe31c3cdb', 371498, 1, 1, 2, NULL, NULL),
(77, 76, 'upload', 'file', NULL, '2432_Domenico_Rollo.jpg', 'image/jpeg', 'ba977807f2a4e923f86f57fc92805bdb57744541', 'jpg', '025ad84109fa0f57002d0b330f5b71c54c78d0a73c87825e6dec06200db5cee3', 785262, 1, 1, 1, NULL, NULL),
(78, 76, 'upload', 'file', NULL, '2432R_Domenico_Rollo.jpg', 'image/jpeg', 'a2791c041ee8d58736e04a3d8a8e46c558ee621b', 'jpg', 'c5212535d480aad8f451a6694ff53a4ab48f6a05b31da630d4047d59a9c97b4f', 393862, 1, 1, 2, NULL, NULL),
(80, 79, 'upload', 'file', NULL, '3288_Domenico_Rollo.jpg', 'image/jpeg', '8531d0f035a236f9129ee86ba2cd0a7967e9a02d', 'jpg', 'd2c620fc9e310c360b6d9da70f5370496bf781d8e8c785599cb39bdc354c526f', 678330, 1, 1, 1, NULL, NULL),
(81, 79, 'upload', 'file', NULL, '3288R_Domenico_Rollo.jpg', 'image/jpeg', '9b1875c2ab0fc39561ece5126bc4d884f24d4111', 'jpg', '2c79cdf80f6e42a6f1297aae21ca68bb568aaccfc3314fbece10125018e8c28b', 463819, 1, 1, 2, NULL, NULL),
(84, 83, 'upload', 'file', NULL, 'altri_monumenti_ciano.jpg', 'image/jpeg', '8f681ef83869dc3cc0be77fb8daeabcdadd3054d', 'jpg', '207159e1e9241dfc6490102ca8a28b4ae0420e7bd3433e8c3ba53998731920be', 84177, 1, 1, 1, NULL, NULL),
(86, 85, 'upload', 'file', NULL, 'altri_monumenti_ciano_2.jpg', 'image/jpeg', '796436b75c464121f656994f2989ae3964499fa2', 'jpg', '655d01e1afc97956ca2c6370cfa7bc6e7741b8a788c60ea909972da85d478dc1', 145531, 1, 1, 1, NULL, NULL),
(88, 87, 'upload', 'file', NULL, 'altri_monumenti_ciano_3.jpg', 'image/jpeg', '66a121a02c8c3021b1703a516680e9b027443ab0', 'jpg', 'd3505b7e05f9404f2a9806168e8e0d400f5cd25361ec0e956eab1808473f2f1b', 101437, 1, 1, 1, NULL, NULL),
(90, 89, 'upload', 'file', NULL, 'altri_monumenti_ciano_4.jpg', 'image/jpeg', 'a02f4af3da2d22cf9d8a62b95989d0c37ef62b4e', 'jpg', 'c7e14450a6d3d18fbdff4e84e258934f0e8c036de9f8575e2e8137502549783e', 41490, 1, 1, 1, NULL, NULL),
(93, 92, 'upload', 'file', NULL, 'amanti_2.png', 'image/png', '3155090dfb08c78e92cb7a40208d18626ea17d5e', 'png', '24ce37f8e94d57d99a3c8900f48471ec33b579d20f592dd80792b70687c981c6', 51620, 1, 1, 1, NULL, NULL),
(94, 92, 'upload', 'file', NULL, 'amanti_messina.png', 'image/png', 'f036dd2b9753e2519a7e79f0bee8ff8d95ebbdc7', 'png', '138d641f2e8661b0ad4f21b9415faaa92af8497da3819bd629f88918ff917ed6', 43014, 1, 1, 2, NULL, NULL),
(100, 99, 'upload', 'file', NULL, 'architettura_laspezia_1.JPG', 'image/jpeg', 'e38dff80b2c5cf00e5b2a704c3607d84fcc242c9', 'jpg', '3a45dba8a18d116574430eeea72e152ab2f4d745d0abc14856542ebd996b2a98', 587630, 1, 1, 1, NULL, NULL),
(102, 101, 'upload', 'file', NULL, 'architettura_laspezia_2.JPG', 'image/jpeg', '2d9d1319f033612159aa06da00d72f0b14adc989', 'jpg', '67021e8cc12b842e97eaee79202c7e8af86d15ae8e54e3741a69b39b873c3ad8', 105415, 1, 1, 1, NULL, NULL),
(104, 103, 'upload', 'file', NULL, 'architettura_laspezia_3.JPG', 'image/jpeg', 'febdae8aeb0d5eac98968624ca2e7667126d7aa5', 'jpg', '0011e306b57982f47c4947fd8ccd5c9c0c5b87e8a9df4c5ce63ccce7a377d71a', 434244, 1, 1, 1, NULL, NULL),
(107, 106, 'upload', 'file', NULL, 'arte_ventennio.jpg', 'image/jpeg', 'f03b118641b9b335e8dfdf3e8933b78ad88f909e', 'jpg', '9b398498b597d2ef10ecad0a425683daffba4647d499f7c00656cfe8db9e095f', 361027, 1, 1, 1, NULL, NULL),
(109, 108, 'upload', 'file', NULL, 'arte_ventennio_2.jpg', 'image/jpeg', 'fcf7ed722d37b419e2ccec9c93827da5b467eb87', 'jpg', '3bce800a397c6dd81d745211e3c43b14a76efb49af0562aef9ff6ac4fcebe5f9', 335060, 1, 1, 1, NULL, NULL),
(111, 110, 'upload', 'file', NULL, 'arte_ventennio_3.jpg', 'image/jpeg', '8e9f866bcd86bde3c01b5401287d841367b931a3', 'jpg', 'f621edb7d8dafd1f5a4b7695c14926cdda9fe9724b0492051b45fff5c4d3c13d', 201692, 1, 1, 1, NULL, NULL),
(114, 113, 'upload', 'file', NULL, 'autoritratto_messina.png', 'image/png', '69f7c6117a15f47eca4793a579d030c57aaaa4de', 'png', 'c822bfcadb3eaf27207e6eaffccc3244d9605f823f254b797842f8919c3be30d', 56897, 1, 1, 1, NULL, NULL),
(116, 115, 'upload', 'file', NULL, 'bagnante_messina.png', 'image/png', 'ed0f8776e2460a2f72da00ff81116515a2da1993', 'png', 'ef37a1511da9cf440cc44a0bca6533f733c2a764608814ea23a488be1f0483b8', 63512, 1, 1, 1, NULL, NULL),
(118, 117, 'upload', 'file', NULL, 'Bolzano,_monumento_alla_vittoria_(13995)_01.jpg', 'image/jpeg', 'a5949597fc7eeec80c149bab0921140497bbc355', 'jpg', '378f5b1316b96d19eeeccb0bf45c884058e722366c191d2d995e5918bdb94283', 3038649, 1, 1, 1, NULL, NULL),
(120, 119, 'upload', 'file', NULL, 'busto_ciano_santo_stefano_1.png', 'image/png', 'f4fbbb1a4c7ed69049dff573f1a1faeeec585c01', 'png', 'edb299edac75da070c2b1bd0f88e2a393f1c8939a536d69c2819e007719f377c', 1379876, 1, 1, 1, NULL, NULL),
(121, 119, 'upload', 'file', NULL, 'busto_costanzo_ciano_stefano_2.png', 'image/png', '4f7f7658b2da1a593189602262293dd2620f3bee', 'png', '37b503b2b1454216366fe4e24c4cea811c8892d0c6974a0d35c03ea8f52bc7dc', 1368366, 1, 1, 2, NULL, NULL),
(122, 119, 'upload', 'file', NULL, 'busto_costanzo_ciano_stefano_3.png', 'image/png', '2946a81e0b479fda9fbb9b5770640d6df23ed5ad', 'png', '623635eb46b20b59ced3701ca7f4b4f573390b0a27ed79d2f35a490eaeebc523', 1449719, 1, 1, 3, NULL, NULL),
(123, 119, 'upload', 'file', NULL, 'busto_costanzo_ciano_stefano_4.png', 'image/png', '8507fff263d6f61105ca83d1fc147da8ed554ad8', 'png', 'cb6cc6bff2fb2fcaf095c0e9f37588e00bf19438be17fa7f35e602dc01608f31', 1922054, 1, 1, 4, NULL, NULL),
(124, 119, 'upload', 'file', NULL, 'busto_costanzo_ciano_stefano_5.png', 'image/png', '918fab09e814b521c387d47d348a06b53d85f275', 'png', '55b678520bb9f21f436fdfe0e0dd649505e53951c66c8fcac2a1edf4cad4cc19', 1173427, 1, 1, 5, NULL, NULL),
(127, 126, 'upload', 'file', NULL, 'Carson_2.jpg', 'image/jpeg', '912957c4d0e3b0051ae27ad944cd23b173f1b14e', 'jpg', '730af809d85139c1665da0c12e22b995387f936e3e4b2806ad786f5d9335386a', 180626, 1, 1, 1, NULL, NULL),
(128, 126, 'upload', 'file', NULL, 'Carson_3.jpg', 'image/jpeg', '8306e4f714cf1befc9e787382df3bd194bdf15e3', 'jpg', '17897e499c2b426ed79fa2186e01f6338f390917cc6582b79b5325662305c477', 205317, 1, 1, 2, NULL, NULL),
(129, 126, 'upload', 'file', NULL, 'Carson_4.jpg', 'image/jpeg', '97b0079a3a30ad6ffaba6b1abad5382d69718e52', 'jpg', '7ac036ed921d2e6c7488e40f6eceb9e6e10f83072405195cae37f72a0a1ef0d1', 144098, 1, 1, 3, NULL, NULL),
(131, 130, 'upload', 'file', NULL, 'Carson_5.jpg', 'image/jpeg', '0eff435065ded5420094efa4e068e8afd7c9708f', 'jpg', '1aacd562907230af8b2b2645ff23902fa58e86b6c965fc701e88fdf86593e808', 30352, 1, 1, 1, NULL, NULL),
(133, 132, 'upload', 'file', NULL, 'Carson_6.jpg', 'image/jpeg', 'dfd9fc6dd3ba128870f9640f8fbb7e1669966b83', 'jpg', '2cd24bc9066820e3118e3518bcb1817dbb483c2c72fc00d12a0892eac8258342', 69039, 1, 1, 1, NULL, NULL),
(135, 134, 'upload', 'file', NULL, 'Carson.jpg', 'image/jpeg', '17b4b6b9e29cc928e7a1cfeb5dbd639f7a84cc4a', 'jpg', '5d000a621cd472202f58b46939fefeca4945a30ef123212a9da97c41551ebe8b', 625251, 1, 1, 1, NULL, NULL),
(138, 137, 'upload', 'file', NULL, 'cartolinaebay-l1600.jpg', 'image/jpeg', '16dda24e094d32f115c1348a9272ac7e7dca0f1d', 'jpg', '93d2e05224c7f7e6e5cd8db9f9357673f84b285d61a9d473851507a6e5afee3b', 492483, 1, 1, 1, NULL, NULL),
(139, 137, 'upload', 'file', NULL, 'cartolinaebayR-l1600.jpg', 'image/jpeg', '2db1ee4f236550d89c7ee824006134bd812ffbb5', 'jpg', '9a5e9e60cc58399a40f3923e14776564fab69b00510a21eb1e1badb40859f263', 309413, 1, 1, 2, NULL, NULL),
(141, 140, 'upload', 'file', NULL, 'cavallo_messina.jpeg', 'image/jpeg', '711bb37afec003107fb7c77de39e353d0e514ad3', 'jpeg', '6b9d56220a0ec76f18235eafb57f151be49481fa3bdb5e80e474972e3865ac98', 153368, 1, 1, 1, NULL, NULL),
(144, 143, 'upload', 'file', NULL, 'censuraFascismo_1.jpg', 'image/jpeg', '7ff140139c77cbb5212a6ce2d5bd0d88910f0f6d', 'jpg', '6b2152eab8ef16377a09b188ef43091fc3e5ec23f8339c162fe72bd16ccaa186', 120728, 1, 1, 1, NULL, NULL),
(146, 145, 'upload', 'file', NULL, 'censuraFascismo_10.jpg', 'image/jpeg', '9ee904e2750054b4715938c4b09fd4ecdc326f2d', 'jpg', '96280bb0c8241f39f9290ee607d0f932158c4f760392af1df113a169f0ff3dcf', 532793, 1, 1, 1, NULL, NULL),
(148, 147, 'upload', 'file', NULL, 'censuraFascismo_11.jpg', 'image/jpeg', '5a31c23542a351359af271b7d847ec8d6326109c', 'jpg', 'a704b36242c8300e8130a6b02c0ef4f4cb3ca65f8d6ee8190199161ca21f2081', 400151, 1, 1, 1, NULL, NULL),
(150, 149, 'upload', 'file', NULL, 'censuraFascismo_12.jpg', 'image/jpeg', '31d6645f63e2f6549b8fd824ca040ce820c02df7', 'jpg', '76a38f6455ee153930fd3fa1f4e04e2bf131c21bec3cf1eb8c04cede68a11727', 546639, 1, 1, 1, NULL, NULL),
(152, 151, 'upload', 'file', NULL, 'censuraFascismo_13.jpg', 'image/jpeg', '4f57469a84bcf16b76503ece0f8bf191f1495d8f', 'jpg', '04e6cdcbb627aa9cd099c92e21a65f8d195d5986f70a6400fb7411d634ff50de', 564474, 1, 1, 1, NULL, NULL),
(154, 153, 'upload', 'file', NULL, 'censuraFascismo_14.jpg', 'image/jpeg', '9331defc4c4c06c6b9d09e095864429801ea287e', 'jpg', '9b7e0f0f03ca7591c15b429d091e0605c0c50b7de6cd36365d3e399b142275ed', 519433, 1, 1, 1, NULL, NULL),
(156, 155, 'upload', 'file', NULL, 'censuraFascismo_2.jpg', 'image/jpeg', '34c7295408d97999aca514cae0a7c0a83c5a13ea', 'jpg', 'd34c4269c72bab6ed5dc304c118317679e1508b8de7cd960668893f6ee902b1b', 121362, 1, 1, 1, NULL, NULL),
(158, 157, 'upload', 'file', NULL, 'censuraFascismo_3.jpg', 'image/jpeg', 'e3fa5bda1ee5d3132f489fb73ca6c1eaaaa856a5', 'jpg', '302f014ce27b72a6ffc3b275aae9bfb6132049cec9e66c5fd6ca88cd959b9db1', 103985, 1, 1, 1, NULL, NULL),
(160, 159, 'upload', 'file', NULL, 'censuraFascismo_4.jpg', 'image/jpeg', 'acdcf5294dbc9dec69e163ec5eeb386ec8a5aeab', 'jpg', 'e25b939946296a0f3390992053e976f6dba4837848178b44036431491e63f252', 475819, 1, 1, 1, NULL, NULL),
(162, 161, 'upload', 'file', NULL, 'censuraFascismo_5.jpg', 'image/jpeg', 'd614bc00f6a92de496c6723cbdf60e223dd1dcc6', 'jpg', 'f9364f7b17cbc93b8660e5c87572852777ab1fae986fe73df423b9bbc37d8021', 477200, 1, 1, 1, NULL, NULL),
(164, 163, 'upload', 'file', NULL, 'censuraFascismo_6.jpg', 'image/jpeg', '42d05fcbabfa6f9409958cc577da7af2e1e6086f', 'jpg', 'ccc78d5bc081de9ea3714805644ec8cb2c35653e0995c9b0630366187fc5e3a0', 454268, 1, 1, 1, NULL, NULL),
(166, 165, 'upload', 'file', NULL, 'censuraFascismo_7.jpg', 'image/jpeg', 'a4ad96501d3e95b99f562f8a056aa32cbfc14e1a', 'jpg', 'eb0807cf6382e9c3a0d02d0a24b5eccf92137ba70cda25a91c122f186bdeae35', 102902, 1, 1, 1, NULL, NULL),
(168, 167, 'upload', 'file', NULL, 'censuraFascismo_8.jpg', 'image/jpeg', '53a535ee6b8ae1f9dce1ec208ca09fcaccf3d36b', 'jpg', 'ba1af140c0f0ffc4bc89e40bf6a0f694b1a5e748522b481b4b02aec0c7fd865f', 503178, 1, 1, 1, NULL, NULL),
(170, 169, 'upload', 'file', NULL, 'censuraFascismo_9.jpg', 'image/jpeg', 'c376b4e0833575e21582c6d2ca6312fcfd814e74', 'jpg', '0eab68cdd4550edda9e8f5e7401b0af9cf516320d37101025c3ea02665167529', 426769, 1, 1, 1, NULL, NULL),
(172, 171, 'upload', 'file', NULL, 'cocaina_messina.png', 'image/png', '2d4162d2f04727e9550f8f4990af64b1c80effce', 'png', '4e5dba8ddcb5b4e82455af11c0719b80ada4b51f5ee8edf97373dbaec3145030', 359868, 1, 1, 1, NULL, NULL),
(175, 174, 'upload', 'file', NULL, 'Colston_1.jpg', 'image/jpeg', '91c8351ce2d1287947fefd0b7c87a2f05dd86ea2', 'jpg', '775e24b20a1a1f08fd83153e44f891555544cb46e8d981e1568af26c925238a7', 2870302, 1, 1, 1, NULL, NULL),
(177, 176, 'upload', 'file', NULL, 'Colston_2.jpg', 'image/jpeg', 'a61561a96d53564be6ccef2c89c0821a601f460e', 'jpg', '9cdf6ab7d73034f67e08e562218df7ad86e9e225edb04388c602175b5cce9cdf', 84458, 1, 1, 1, NULL, NULL),
(179, 178, 'upload', 'file', NULL, 'Colston_3.jpg', 'image/jpeg', '52c7d301815429d71b09b44d0dc8518fa5da9a8e', 'jpg', '4eebcb7be46bb1f94fb5d230c4a341e7a1e90da0b682e9b930313bc0e70c3482', 685823, 1, 1, 1, NULL, NULL),
(181, 180, 'upload', 'file', NULL, 'Colston_4.jpg', 'image/jpeg', '022a524bc9858703507ba46c33880ead5ff6aebc', 'jpg', '6ad1f41e385031d71bfd055e833e8703edccabb9790a13fc3140c0b20189905c', 149243, 1, 1, 1, NULL, NULL),
(183, 182, 'upload', 'file', NULL, 'Colston_5.jpg', 'image/jpeg', '1a691dce3f3001fb082a7aa6172bafb811dec583', 'jpg', '050d7868102ad3274b17302f227da779925a1154a9a48000803e1dc43705567e', 1736819, 1, 1, 1, NULL, NULL),
(185, 184, 'upload', 'file', NULL, 'Colston_6.jpg', 'image/jpeg', 'c9c2b76be412bd90fff2063bcd8022ab11716834', 'jpg', 'a3559fccc95796d7cb6962da964e7d46ed3ec06d41aaf5f0fa6e530284d6396c', 628610, 1, 1, 1, NULL, NULL),
(188, 187, 'upload', 'file', NULL, 'Costanzo Ciano inaugura il 12 novembre 1933 il Palazzo delle Poste - Liberi.jpg', 'image/jpeg', '988fa40953da88a01230442436032f346671ce1c', 'jpg', '8ab8d489f0cdf773c178e6dd401e92992f5b914102d750a4542c7fabea35bb3c', 1319663, 1, 1, 1, NULL, NULL),
(190, 189, 'upload', 'file', NULL, 'costruzione_statua_ciano_santo_stefano.png', 'image/png', '60f6f6ebbe571e1c373697eb5124a1b12d9314a7', 'png', 'edc489c5763236a2776853fde2515f43f5efd5caed94dc00b04750306b9245c5', 1323155, 1, 1, 1, NULL, NULL),
(192, 191, 'upload', 'file', NULL, 'EUR_Obelisco_Guglielmo_Marconi_2.jpg', 'image/jpeg', 'e2f9ab26885574d96b4da439adda5dc6d556ae9f', 'jpg', '4a64063e9accb24424f43d7e814ab600e42f0b758e84ece2e4b9f0c416aed0c1', 698213, 1, 1, 1, NULL, NULL),
(195, 194, 'upload', 'file', NULL, 'Farinacci.jpg', 'image/jpeg', '80b88005983666fc6b63dfc7274a96333cdaa21a', 'jpg', 'a509df631466ba7e7a87a601b4a6077d2345bb33ff57f8e629c987d16384a91b', 815994, 1, 1, 1, NULL, NULL),
(197, 196, 'upload', 'file', NULL, 'foro_italico.jpg', 'image/jpeg', '2aae27805f19df813245df0e8f4786f49cacbe28', 'jpg', 'ae9d1e363654fa65f2433a60c7c9c0808320dda93693216a6596528ec3dd6226', 666984, 1, 1, 1, NULL, NULL),
(202, 198, 'upload', 'file', NULL, 'Foto_statua_provArcMuseoNavale_1.jpg', 'image/jpeg', '339537ab7cf20785a58516c71d4899519506c00d', 'jpg', 'acb33f8217dd860d4a72f8fa859fcef4ef9e08c5ebda438495458e0230c6c38c', 2086447, 1, 1, 1, NULL, NULL),
(204, 203, 'upload', 'file', NULL, 'Foto_statua_provArcMuseoNavale_2.jpg', 'image/jpeg', '59ec62138fd540a9872faf3be2c59a239f67dc8f', 'jpg', '74ec3b7a6344a6ac94dfcb17b4965799a17a04c5d349d0f7e660646b9f05ed78', 2232748, 1, 1, 1, NULL, NULL),
(206, 205, 'upload', 'file', NULL, 'fotografiaVedutaLaSpezia_MonumentoCianoF.jpg', 'image/jpeg', '2c4f9675dd8e6c496c87c153e1c03d0944590ca2', 'jpg', 'e500d998be110ad66c96794d5d4ca33e5cf41231434ebecf24250ae1c64246dd', 61812, 1, 1, 1, NULL, NULL),
(207, 205, 'upload', 'file', NULL, 'fotografiaVedutaLaSpezia_MonumentoCianoR.jpg', 'image/jpeg', '3d9f6d182f8708eff5608c957d99e1c28b3f7ffe', 'jpg', 'c99fcf890d0fea02dc7dcef845316526a3118a7cb8b8c5fc5c0b9ea1bc9814ca', 60972, 1, 1, 2, NULL, NULL),
(210, 209, 'upload', 'file', NULL, 'funerale_ciano_1.png', 'image/png', '8167929e604df3fb71715c9ab190ade92ef3cc84', 'png', '5bfe7afadb11e3a96476b5cf3bcbe601a138858b85abf4ed39217f0f1a448585', 282056, 1, 1, 1, NULL, NULL),
(212, 211, 'upload', 'file', NULL, 'funerale_ciano_2.png', 'image/png', '8323abf346ace3b7e4464f437d03b322bd86314c', 'png', 'a298e781af72b0805f3a04a8c7178d5ec1508fc2919699a3a42dcfd66fb58c30', 361594, 1, 1, 1, NULL, NULL),
(214, 213, 'upload', 'file', NULL, 'funerale_ciano_3.png', 'image/png', '6e1526f324d327ed67043fa5ba29d8d0157f1b17', 'png', '8d37d8e51f058d451cc6bb4deab9e827c6528a09b9d341665a92462b661bb6cb', 412975, 1, 1, 1, NULL, NULL),
(216, 215, 'upload', 'file', NULL, 'funerale_ciano_4.png', 'image/png', '72304e119f265bb9f0c7b17e859d81fcd9ebeccd', 'png', '851da68ffaf5334f0f74b654471a4201226686b7740452ed76fee84783a4b87a', 329478, 1, 1, 1, NULL, NULL),
(218, 217, 'upload', 'file', NULL, 'funerale_ciano_5.png', 'image/png', 'beccd7e07f63808523d6606771bdd16e4b438fb6', 'png', '8d04fb1daafdb610071f0416c0f3c1c6787b5d34180aeadde71cd6d9970114b3', 389725, 1, 1, 1, NULL, NULL),
(220, 219, 'upload', 'file', NULL, 'funerale_ciano_6.png', 'image/png', '7b2b5c33b384e81fd8aab12cd29b06a8a0a63acd', 'png', 'a149baf573c40734498eaf0fe6c7e2d14c71eccbc0ecccd70620ee964fb4d7e3', 413248, 1, 1, 1, NULL, NULL),
(222, 221, 'upload', 'file', NULL, 'galletto_messina.jpg', 'image/jpeg', 'c7c53604377f719d6bd7bcc1b28a1edc9bbd7bb3', 'jpg', '0951c05a066223eb7bf55a790525e97ea5e9247c27ed057b9b274ca4ddcc8e91', 156772, 1, 1, 1, NULL, NULL),
(224, 223, 'upload', 'file', NULL, 'Genova_-_Piazza_della_Vittoria.jpg', 'image/jpeg', 'ef814270c8293f5daa76b8ea0bfa8834d80095aa', 'jpg', '71a67fcee8f5cf26d29bc54bdab304cfe7ceaa1378ea555714398c0a9247fee3', 3367609, 1, 1, 1, NULL, NULL),
(226, 225, 'upload', 'file', NULL, 'GiacomoMatteotti_1.jpg', 'image/jpeg', '34761ee31f8a11ef30206a65c5069833f39a4292', 'jpg', 'f43150fac7ad9262d9291ee481202b163987f86be22d03aeb469b555152babdd', 988247, 1, 1, 1, NULL, NULL),
(230, 229, 'upload', 'file', NULL, 'giorgio_pagano.png', 'image/png', '82ca7412ceca5b45db99eaad27ec981427f27a23', 'png', '9474c385bf5113151e6b1517872cac09ac67a49499c93914746153a1faa93c71', 660130, 1, 1, 1, NULL, NULL),
(232, 231, 'upload', 'file', NULL, 'grande_torso_femminile_messina.jpg', 'image/webp', '550cd43855f45690ec53eff363a52a54ce56f9b9', 'jpg', 'a6365cba88334d39a49abb3e7f19f450b72ce51446beffa5bb327b40e88b2306', 35054, 1, 1, 1, NULL, NULL),
(234, 233, 'upload', 'file', NULL, 'IMAG0037.JPG', 'image/jpeg', '263a036ae63884a1f2756cff7df4654ec60c385f', 'jpg', '5579466feae057792bd47fb81fa4a905948fb9c95995e74877741d99bfebabb7', 1130197, 1, 1, 1, NULL, NULL),
(237, 236, 'upload', 'file', NULL, 'IMG_2359.jpg', 'image/jpeg', 'ece413b44ccaa5dfc963b44119b50963cb96c245', 'jpg', '0c4a5ea8fc71b849ce5bf1556b21b2160d9b354cdbf01349019e813d087495ad', 5383504, 1, 1, 1, NULL, NULL),
(238, 236, 'upload', 'file', NULL, 'IMG_2362.jpg', 'image/jpeg', '2f367d3509b2d165d6a370d6bcdd802eb6d39426', 'jpg', '56fc08e0ec609229f6b3afb499a15c82f0ff5e8e2060d67f6e9d195455e6945b', 3645223, 1, 1, 2, NULL, NULL),
(240, 239, 'upload', 'file', NULL, 'IMG_2363.jpg', 'image/jpeg', 'f4b4f018ecd58427ddad362bf48d945b771502f5', 'jpg', '54dd6760209dcfe3c62ed618f752d5e428208a6b520d5678d019798e3af54959', 2394196, 1, 1, 1, NULL, NULL),
(241, 239, 'upload', 'file', NULL, 'IMG_2364.jpg', 'image/jpeg', '50eafaa0cd38448166b4e43783ea8679d2b8881b', 'jpg', '66e8f13eca73eb9fd31d3f8c69101204e49e47aa3155e12aefe7923445209426', 2466307, 1, 1, 2, NULL, NULL),
(243, 242, 'upload', 'file', NULL, 'IMG_2368.jpg', 'image/jpeg', 'e7882889db6f6157ab11df33a3828461f5be124c', 'jpg', '66058facb4b2ad6ec500770aab4e5d83652ea3f0f336dec530a716dab51bdacc', 3319011, 1, 1, 1, NULL, NULL),
(244, 242, 'upload', 'file', NULL, 'IMG_2369.jpg', 'image/jpeg', '09293e7fc03443888500f59f34cf423575335ed1', 'jpg', '11b9052a32b48553da22d923a4476a1a3f806332e1e2c097c43082a17c82b8a2', 4003021, 1, 1, 2, NULL, NULL),
(245, 242, 'upload', 'file', NULL, 'IMG_2371.jpg', 'image/jpeg', '8042f770fb5721cc1b9be9f8e37a44550dcf686f', 'jpg', '2ce3a8d872e841f4b4bb844639c764d24efeeabb40bdc2e004d3dcf447c4714d', 4325767, 1, 1, 3, NULL, NULL),
(246, 242, 'upload', 'file', NULL, 'IMG_2372.jpg', 'image/jpeg', '290642dc718609dfb9d7ca3679c88da1f3f3dd9c', 'jpg', '86f3cd14b9973aba98aee63935b005584f14acbb2ba47a377a08984d72adaa7b', 4126890, 1, 1, 4, NULL, NULL),
(247, 242, 'upload', 'file', NULL, 'IMG_2373.jpg', 'image/jpeg', 'b6697a856bbc36fabad12a8ae84b3d1b8efca54c', 'jpg', '362cb1a6c2071c8c06929d2bc32f31d4502c0416f0b2f92a730f4bef2140d22f', 4483384, 1, 1, 5, NULL, NULL);

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
(2, NULL, 72, NULL, NULL, 'CONTENUTO DE PROVA', 1, '2024-02-22 15:56:37', '2024-04-23 16:04:42', 'Omeka\\Entity\\Item'),
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
(47, 4, NULL, NULL, NULL, 'XML', 1, '2024-04-29 20:34:16', '2024-04-29 20:34:16', 'Omeka\\Entity\\Media'),
(63, 4, 26, 9, NULL, 'La Spezia - Palazzo del Governo', 1, '2024-05-04 15:47:40', '2024-05-05 15:08:45', 'Omeka\\Entity\\Item'),
(64, 4, NULL, NULL, NULL, 'La Spezia - Palazzo del Governo', 1, '2024-05-04 15:47:40', '2024-05-04 15:47:40', 'Omeka\\Entity\\Media'),
(65, 4, NULL, NULL, NULL, 'La Spezia - Palazzo del Governo Retro', 1, '2024-05-04 15:47:41', '2024-05-04 15:47:41', 'Omeka\\Entity\\Media'),
(67, 4, 26, 9, NULL, 'La Spezia - Palazzo del Governo', 1, '2024-05-04 15:51:08', '2024-05-05 15:09:01', 'Omeka\\Entity\\Item'),
(68, 4, NULL, NULL, NULL, 'La Spezia - Palazzo del Governo', 1, '2024-05-04 15:51:08', '2024-05-04 15:51:08', 'Omeka\\Entity\\Media'),
(69, 4, NULL, NULL, NULL, 'La Spezia - Palazzo del Governo Retro', 1, '2024-05-04 15:51:08', '2024-05-04 15:51:08', 'Omeka\\Entity\\Media'),
(70, 4, 26, 9, NULL, 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti', 1, '2024-05-04 15:54:23', '2024-05-05 15:09:58', 'Omeka\\Entity\\Item'),
(71, 4, NULL, NULL, NULL, 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti', 1, '2024-05-04 15:54:23', '2024-05-04 15:54:23', 'Omeka\\Entity\\Media'),
(72, 4, NULL, NULL, NULL, 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti Retro', 1, '2024-05-04 15:54:23', '2024-05-04 15:54:23', 'Omeka\\Entity\\Media'),
(73, 4, 26, 9, NULL, 'La Spezia - Giardini e Palazzo del Governo', 1, '2024-05-04 15:56:22', '2024-05-05 15:10:22', 'Omeka\\Entity\\Item'),
(74, 4, NULL, NULL, NULL, 'La Spezia - Giardini e Palazzo del Governo', 1, '2024-05-04 15:56:22', '2024-05-04 15:56:22', 'Omeka\\Entity\\Media'),
(75, 4, NULL, NULL, NULL, 'La Spezia - Giardini e Palazzo del Governo Retro', 1, '2024-05-04 15:56:22', '2024-05-04 15:56:22', 'Omeka\\Entity\\Media'),
(76, 4, 26, 9, NULL, 'La Spezia - Giardini - Monumento a Costanzo Ciano', 1, '2024-05-04 16:00:14', '2024-05-05 15:11:12', 'Omeka\\Entity\\Item'),
(77, 4, NULL, NULL, NULL, 'La Spezia - Giardini - Monumento a Costanzo Ciano', 1, '2024-05-04 16:00:14', '2024-05-04 16:00:14', 'Omeka\\Entity\\Media'),
(78, 4, NULL, NULL, NULL, 'La Spezia - Giardini - Monumento a Costanzo Ciano Retro', 1, '2024-05-04 16:00:14', '2024-05-04 16:00:14', 'Omeka\\Entity\\Media'),
(79, 4, 26, 9, NULL, 'La Spezia - Piazza Italia', 1, '2024-05-04 16:04:44', '2024-05-05 15:11:51', 'Omeka\\Entity\\Item'),
(80, 4, NULL, NULL, NULL, 'La Spezia - Piazza Italia', 1, '2024-05-04 16:04:44', '2024-05-04 16:04:44', 'Omeka\\Entity\\Media'),
(81, 4, NULL, NULL, NULL, 'La Spezia - Piazza Italia Retro', 1, '2024-05-04 16:04:44', '2024-05-04 16:04:44', 'Omeka\\Entity\\Media'),
(83, 4, 26, 10, NULL, 'Quartiere Ciano a Piacenza', 1, '2024-05-04 16:17:09', '2024-05-05 15:13:38', 'Omeka\\Entity\\Item'),
(84, 4, NULL, NULL, NULL, 'Quartiere Ciano a Piacenza', 1, '2024-05-04 16:17:09', '2024-05-04 16:17:09', 'Omeka\\Entity\\Media'),
(85, 4, 26, 10, NULL, 'Inaugurazione del monumento a Costanzo Ciano', 1, '2024-05-04 16:29:51', '2024-05-05 15:13:38', 'Omeka\\Entity\\Item'),
(86, 4, NULL, NULL, NULL, 'Inaugurazione del monumento a Costanzo Ciano (Genova)', 1, '2024-05-04 16:29:51', '2024-05-04 16:29:51', 'Omeka\\Entity\\Media'),
(87, 4, 26, 10, NULL, 'Inaugurazione del monumento a Costanzo Ciano', 1, '2024-05-04 16:36:18', '2024-05-05 15:13:38', 'Omeka\\Entity\\Item'),
(88, 4, NULL, NULL, NULL, 'Inaugurazione del monumento a Costanzo Ciano', 1, '2024-05-04 16:36:18', '2024-05-04 16:36:18', 'Omeka\\Entity\\Media'),
(89, 4, 26, 10, NULL, 'Soldati americani nel collegio Costanzo Ciano', 1, '2024-05-04 16:38:32', '2024-05-05 15:13:38', 'Omeka\\Entity\\Item'),
(90, 4, NULL, NULL, NULL, 'Soldati americani nel collegio Costanzo Ciano (Napoli)', 1, '2024-05-04 16:38:32', '2024-05-04 16:38:32', 'Omeka\\Entity\\Media'),
(92, 4, 26, 10, NULL, 'Gli amanti di Francesco Messina', 1, '2024-05-05 15:00:09', '2024-05-05 15:44:23', 'Omeka\\Entity\\Item'),
(93, 4, NULL, NULL, NULL, 'Gli amanti di Francesco Messina', 1, '2024-05-05 15:00:09', '2024-05-05 15:00:09', 'Omeka\\Entity\\Media'),
(94, 4, NULL, NULL, NULL, 'Gli amanti di Francesco Messina', 1, '2024-05-05 15:00:09', '2024-05-05 15:00:09', 'Omeka\\Entity\\Media'),
(96, 4, 23, NULL, NULL, 'Architettura fascista di La Spezia', 1, '2024-05-05 15:03:57', '2024-05-05 15:15:10', 'Omeka\\Entity\\ItemSet'),
(97, 4, 23, NULL, NULL, 'Il Ventennio a La Spezia', 1, '2024-05-05 15:09:35', '2024-05-05 15:15:10', 'Omeka\\Entity\\ItemSet'),
(98, 4, 23, NULL, NULL, 'Altri monumenti di Costanzo Ciano', 1, '2024-05-05 15:12:54', '2024-05-05 15:15:10', 'Omeka\\Entity\\ItemSet'),
(99, 4, 26, 10, NULL, 'Palazzo delle Poste La Spezia', 1, '2024-05-05 15:20:58', '2024-05-05 15:20:58', 'Omeka\\Entity\\Item'),
(100, 4, NULL, NULL, NULL, 'Palazzo delle Poste La Spezia', 1, '2024-05-05 15:20:58', '2024-05-05 15:20:58', 'Omeka\\Entity\\Media'),
(101, 4, 26, 10, NULL, 'Palazzo del governo La Spezia', 1, '2024-05-05 15:23:44', '2024-05-05 15:26:44', 'Omeka\\Entity\\Item'),
(102, 4, NULL, NULL, NULL, 'Palazzo del governo La Spezia', 1, '2024-05-05 15:23:44', '2024-05-05 15:23:44', 'Omeka\\Entity\\Media'),
(103, 4, 26, 10, NULL, 'Teatro civico di La Spezia', 1, '2024-05-05 15:28:05', '2024-05-05 15:28:05', 'Omeka\\Entity\\Item'),
(104, 4, NULL, NULL, NULL, 'Teatro civico di La Spezia', 1, '2024-05-05 15:28:05', '2024-05-05 15:28:05', 'Omeka\\Entity\\Media'),
(105, 4, 23, NULL, NULL, 'Arte e architettura nel Ventennio', 1, '2024-05-05 15:29:20', '2024-05-05 15:38:14', 'Omeka\\Entity\\ItemSet'),
(106, 4, 26, 10, NULL, 'La città che sale', 1, '2024-05-05 15:32:19', '2024-05-05 15:32:19', 'Omeka\\Entity\\Item'),
(107, 4, NULL, NULL, NULL, 'La città che sale', 1, '2024-05-05 15:32:19', '2024-05-05 15:32:19', 'Omeka\\Entity\\Media'),
(108, 4, 26, 10, NULL, 'L\'Italia corporativa', 1, '2024-05-05 15:34:56', '2024-05-05 15:34:56', 'Omeka\\Entity\\Item'),
(109, 4, NULL, NULL, NULL, 'L\'Italia corporativa', 1, '2024-05-05 15:34:56', '2024-05-05 15:34:56', 'Omeka\\Entity\\Media'),
(110, 4, 26, 10, NULL, 'Manifesto pubblicitario mostra Novecento Italiano', 1, '2024-05-05 15:37:58', '2024-05-05 15:37:58', 'Omeka\\Entity\\Item'),
(111, 4, NULL, NULL, NULL, 'Manifesto pubblicitario mostra Novecento Italiano', 1, '2024-05-05 15:37:58', '2024-05-05 15:37:58', 'Omeka\\Entity\\Media'),
(112, 4, 23, NULL, NULL, 'Opere di Francesco Messina', 1, '2024-05-05 15:44:04', '2024-05-05 15:44:04', 'Omeka\\Entity\\ItemSet'),
(113, 4, 26, 10, NULL, 'Autoritratto di Francesco Messina', 1, '2024-05-05 15:45:54', '2024-05-05 15:48:48', 'Omeka\\Entity\\Item'),
(114, 4, NULL, NULL, NULL, 'Autoritratto di Francesco Messina', 1, '2024-05-05 15:45:54', '2024-05-05 15:45:54', 'Omeka\\Entity\\Media'),
(115, 4, 26, 10, NULL, 'Bagnante di Francesco Messina', 1, '2024-05-05 15:47:39', '2024-05-05 15:47:39', 'Omeka\\Entity\\Item'),
(116, 4, NULL, NULL, NULL, 'Bagnante di Francesco Messina', 1, '2024-05-05 15:47:39', '2024-05-05 15:47:39', 'Omeka\\Entity\\Media'),
(117, 4, 26, 10, NULL, 'Monumento alla Vittoria a Bolzano', 1, '2024-05-05 15:52:53', '2024-05-05 15:52:53', 'Omeka\\Entity\\Item'),
(118, 4, NULL, NULL, NULL, 'Monumento alla Vittoria a Bolzano', 1, '2024-05-05 15:52:53', '2024-05-05 15:52:53', 'Omeka\\Entity\\Media'),
(119, 4, 26, 10, NULL, 'Statua di Costanzo Ciano', 1, '2024-05-05 16:00:33', '2024-05-05 16:00:33', 'Omeka\\Entity\\Item'),
(120, 4, NULL, NULL, NULL, 'Busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno', 1, '2024-05-05 16:00:33', '2024-05-05 16:00:33', 'Omeka\\Entity\\Media'),
(121, 4, NULL, NULL, NULL, 'Busto di Costanzo Ciano di profilo incompiuto concepito per il mausoleo di Livorno', 1, '2024-05-05 16:00:34', '2024-05-05 16:00:34', 'Omeka\\Entity\\Media'),
(122, 4, NULL, NULL, NULL, 'Busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno vista frontale', 1, '2024-05-05 16:00:34', '2024-05-05 16:00:34', 'Omeka\\Entity\\Media'),
(123, 4, NULL, NULL, NULL, 'Busto di Costanzo Ciano di profilo incompiuto concepito per il mausoleo di Livorno', 1, '2024-05-05 16:00:35', '2024-05-05 16:00:35', 'Omeka\\Entity\\Media'),
(124, 4, NULL, NULL, NULL, 'Volto della statua di Costanzo Ciano incompiuta concepita per il mausoleo di Livorno', 1, '2024-05-05 16:00:35', '2024-05-05 16:00:35', 'Omeka\\Entity\\Media'),
(125, 4, 23, NULL, NULL, 'Cancel Culture', 1, '2024-05-05 16:02:18', '2024-05-05 16:02:18', 'Omeka\\Entity\\ItemSet'),
(126, 4, 26, 10, NULL, 'Monumento Kit Carson', 1, '2024-05-05 16:15:58', '2024-05-05 16:35:09', 'Omeka\\Entity\\Item'),
(127, 4, NULL, NULL, NULL, 'Monumento Kit Carson (Santa Fé, New Mexico)', 1, '2024-05-05 16:15:58', '2024-05-05 16:15:58', 'Omeka\\Entity\\Media'),
(128, 4, NULL, NULL, NULL, 'Dettaglio del monumento Kit Carson 1', 1, '2024-05-05 16:15:58', '2024-05-05 16:15:58', 'Omeka\\Entity\\Media'),
(129, 4, NULL, NULL, NULL, 'Dettaglio del monumento Kit Carson 2', 1, '2024-05-05 16:15:59', '2024-05-05 16:15:59', 'Omeka\\Entity\\Media'),
(130, 4, 26, 10, NULL, 'Kit Carson', 1, '2024-05-05 16:20:25', '2024-05-05 16:35:09', 'Omeka\\Entity\\Item'),
(131, 4, NULL, NULL, NULL, 'Kit Carson', 1, '2024-05-05 16:20:25', '2024-05-05 16:20:25', 'Omeka\\Entity\\Media'),
(132, 4, 26, 10, NULL, 'Kit Carson 2', 1, '2024-05-05 16:25:58', '2024-05-05 16:35:09', 'Omeka\\Entity\\Item'),
(133, 4, NULL, NULL, NULL, 'Kit Carson 2', 1, '2024-05-05 16:25:58', '2024-05-05 16:25:58', 'Omeka\\Entity\\Media'),
(134, 4, 26, 10, NULL, 'Stato attuale dell\'ex obelisco dedicato a Kit Carson', 1, '2024-05-05 16:32:33', '2024-05-05 16:35:09', 'Omeka\\Entity\\Item'),
(135, 4, NULL, NULL, NULL, 'Stato attuale dell\'ex obelisco dedicato a Kit Carson', 1, '2024-05-05 16:32:33', '2024-05-05 16:32:33', 'Omeka\\Entity\\Media'),
(136, 4, 23, NULL, NULL, 'Kit Carson', 1, '2024-05-05 16:32:58', '2024-05-05 16:32:58', 'Omeka\\Entity\\ItemSet'),
(137, 4, 26, 9, NULL, 'Cartolina Giardini e Palazzo del Governo La Spezia', 1, '2024-05-06 14:29:53', '2024-05-06 14:29:53', 'Omeka\\Entity\\Item'),
(138, 4, NULL, NULL, NULL, 'Cartolina Giardini e Palazzo del Governo La Spezia', 1, '2024-05-06 14:29:53', '2024-05-06 14:29:53', 'Omeka\\Entity\\Media'),
(139, 4, NULL, NULL, NULL, 'Cartolina Giardini e Palazzo del Governo La Spezia Retro', 1, '2024-05-06 14:29:54', '2024-05-06 14:29:54', 'Omeka\\Entity\\Media'),
(140, 4, 26, 10, NULL, 'Cavallo Morente di Francesco Messina', 1, '2024-05-06 14:31:54', '2024-05-06 14:31:54', 'Omeka\\Entity\\Item'),
(141, 4, NULL, NULL, NULL, 'Cavallo Morente di Francesco Messina', 1, '2024-05-06 14:31:54', '2024-05-06 14:31:54', 'Omeka\\Entity\\Media'),
(142, 4, 23, NULL, NULL, 'Censura della Comunicazione', 1, '2024-05-06 14:34:59', '2024-05-06 14:34:59', 'Omeka\\Entity\\ItemSet'),
(143, 4, 26, 10, NULL, 'Mussolini, la figlia e altri gerarchi durante una parata', 1, '2024-05-06 14:39:13', '2024-05-06 14:39:13', 'Omeka\\Entity\\Item'),
(144, 4, NULL, NULL, NULL, 'Mussolini, la figlia e altri gerarchi durante una parata', 1, '2024-05-06 14:39:13', '2024-05-06 14:39:13', 'Omeka\\Entity\\Media'),
(145, 4, 26, 10, NULL, 'Soldato ferito in battaglia', 1, '2024-05-06 14:41:19', '2024-05-06 14:41:31', 'Omeka\\Entity\\Item'),
(146, 4, NULL, NULL, NULL, 'Soldato ferito in battaglia', 1, '2024-05-06 14:41:19', '2024-05-06 14:41:19', 'Omeka\\Entity\\Media'),
(147, 4, 26, 10, NULL, 'Uomo prega in ginocchio', 1, '2024-05-06 14:43:55', '2024-05-06 14:43:55', 'Omeka\\Entity\\Item'),
(148, 4, NULL, NULL, NULL, 'Uomo prega in ginocchio', 1, '2024-05-06 14:43:55', '2024-05-06 14:43:55', 'Omeka\\Entity\\Media'),
(149, 4, 26, 10, NULL, 'Soldati con camicia strappata e scarpe rotte', 1, '2024-05-06 14:45:38', '2024-05-06 15:13:23', 'Omeka\\Entity\\Item'),
(150, 4, NULL, NULL, NULL, 'Soldati con camicia strappata e scarpe rotte', 1, '2024-05-06 14:45:38', '2024-05-06 14:45:38', 'Omeka\\Entity\\Media'),
(151, 4, 26, 10, NULL, 'Soldati con camicia strappata, cappelli e scarpe rotte', 1, '2024-05-06 14:48:44', '2024-05-06 15:14:06', 'Omeka\\Entity\\Item'),
(152, 4, NULL, NULL, NULL, 'Soldati con camicia strappata, cappelli e scarpe rotte 2', 1, '2024-05-06 14:48:44', '2024-05-06 14:48:44', 'Omeka\\Entity\\Media'),
(153, 4, 26, 10, NULL, 'Tre soldati pensierosi e preoccupati', 1, '2024-05-06 14:50:24', '2024-05-06 15:14:31', 'Omeka\\Entity\\Item'),
(154, 4, NULL, NULL, NULL, 'Tre soldati pensierosi e preoccupati', 1, '2024-05-06 14:50:24', '2024-05-06 14:50:24', 'Omeka\\Entity\\Media'),
(155, 4, 26, 10, NULL, 'Mussolini saluta il re Vittorio Emanuele III', 1, '2024-05-06 14:53:31', '2024-05-06 14:53:31', 'Omeka\\Entity\\Item'),
(156, 4, NULL, NULL, NULL, 'Mussolini saluta il re Vittorio Emanuele III', 1, '2024-05-06 14:53:31', '2024-05-06 14:53:31', 'Omeka\\Entity\\Media'),
(157, 4, 26, 10, NULL, 'Gerarca inciampa comicamente', 1, '2024-05-06 14:55:32', '2024-05-06 14:55:32', 'Omeka\\Entity\\Item'),
(158, 4, NULL, NULL, NULL, 'Gerarca inciampa comicamente', 1, '2024-05-06 14:55:32', '2024-05-06 14:55:32', 'Omeka\\Entity\\Media'),
(159, 4, 26, 10, NULL, 'Funerali e rientro delle salme', 1, '2024-05-06 14:57:20', '2024-05-06 14:57:20', 'Omeka\\Entity\\Item'),
(160, 4, NULL, NULL, NULL, 'Funerali e rientro delle salme', 1, '2024-05-06 14:57:20', '2024-05-06 14:57:20', 'Omeka\\Entity\\Media'),
(161, 4, 26, 10, NULL, 'Tre soldati sul fronte del Nordafrica', 1, '2024-05-06 14:58:49', '2024-05-06 15:15:33', 'Omeka\\Entity\\Item'),
(162, 4, NULL, NULL, NULL, 'Tre soldati sul fronte del Nordafrica', 1, '2024-05-06 14:58:49', '2024-05-06 14:58:49', 'Omeka\\Entity\\Media'),
(163, 4, 26, 10, NULL, 'Spari sul fronte del Nordafrica', 1, '2024-05-06 15:00:27', '2024-05-06 15:15:58', 'Omeka\\Entity\\Item'),
(164, 4, NULL, NULL, NULL, 'Spari sul fronte del Nordafrica', 1, '2024-05-06 15:00:27', '2024-05-06 15:00:27', 'Omeka\\Entity\\Media'),
(165, 4, 26, 10, NULL, 'Due uomini suonano sul fronte del Nordafrica', 1, '2024-05-06 15:06:49', '2024-05-06 15:16:27', 'Omeka\\Entity\\Item'),
(166, 4, NULL, NULL, NULL, 'Due uomini suonano sul fronte del Nordafrica', 1, '2024-05-06 15:06:49', '2024-05-06 15:06:49', 'Omeka\\Entity\\Media'),
(167, 4, 26, 10, NULL, 'Lo sguardo terrorizzato del soldato verso il Duce', 1, '2024-05-06 15:08:10', '2024-05-06 15:08:10', 'Omeka\\Entity\\Item'),
(168, 4, NULL, NULL, NULL, 'Lo sguardo terrorizzato del soldato verso il Duce', 1, '2024-05-06 15:08:10', '2024-05-06 15:08:10', 'Omeka\\Entity\\Media'),
(169, 4, 26, 10, NULL, 'Soldati feriti', 1, '2024-05-06 15:12:17', '2024-05-06 15:12:17', 'Omeka\\Entity\\Item'),
(170, 4, NULL, NULL, NULL, 'Soldati feriti', 1, '2024-05-06 15:12:17', '2024-05-06 15:12:17', 'Omeka\\Entity\\Media'),
(171, 4, 26, 10, NULL, 'Cocaina di Francesco Messina', 1, '2024-05-06 15:27:49', '2024-05-06 15:27:49', 'Omeka\\Entity\\Item'),
(172, 4, NULL, NULL, NULL, 'Cocaina di Francesco Messina', 1, '2024-05-06 15:27:49', '2024-05-06 15:27:49', 'Omeka\\Entity\\Media'),
(173, 4, 23, NULL, NULL, 'Edward Colston', 1, '2024-05-06 15:28:21', '2024-05-06 15:28:21', 'Omeka\\Entity\\ItemSet'),
(174, 4, 26, 10, NULL, 'Statua di Edward Colston', 1, '2024-05-06 16:47:24', '2024-05-06 16:48:59', 'Omeka\\Entity\\Item'),
(175, 4, NULL, NULL, NULL, 'Statua di Edward Colston', 1, '2024-05-06 16:47:24', '2024-05-06 16:47:24', 'Omeka\\Entity\\Media'),
(176, 4, 26, 10, NULL, 'Abbattimento statua Colston', 1, '2024-05-06 16:52:03', '2024-05-06 16:52:03', 'Omeka\\Entity\\Item'),
(177, 4, NULL, NULL, NULL, 'Abbattimento statua Colston', 1, '2024-05-06 16:52:03', '2024-05-06 16:52:03', 'Omeka\\Entity\\Media'),
(178, 4, 26, 10, NULL, 'Il piedistallo vuoto della statua di Edward Colton a Bristol', 1, '2024-05-06 16:53:15', '2024-05-06 16:53:15', 'Omeka\\Entity\\Item'),
(179, 4, NULL, NULL, NULL, 'Il piedistallo vuoto della statua di Edward Colton a Bristol', 1, '2024-05-06 16:53:15', '2024-05-06 16:53:15', 'Omeka\\Entity\\Media'),
(180, 4, 26, 10, NULL, 'Degrado della scultura di E.Colston', 1, '2024-05-06 16:59:19', '2024-05-06 16:59:19', 'Omeka\\Entity\\Item'),
(181, 4, NULL, NULL, NULL, 'Degrado della scultura di E.Colston', 1, '2024-05-06 16:59:19', '2024-05-06 16:59:19', 'Omeka\\Entity\\Media'),
(182, 4, 26, 10, NULL, 'Installazione artistica statua Colston', 1, '2024-05-06 17:00:34', '2024-05-06 17:00:34', 'Omeka\\Entity\\Item'),
(183, 4, NULL, NULL, NULL, 'Installazione artistica statua Colston', 1, '2024-05-06 17:00:34', '2024-05-06 17:00:34', 'Omeka\\Entity\\Media'),
(184, 4, 26, 10, NULL, 'Folla rovescia la statua di E.Colston', 1, '2024-05-06 17:16:04', '2024-05-06 17:16:04', 'Omeka\\Entity\\Item'),
(185, 4, NULL, NULL, NULL, 'Folla rovescia la statua di E.Colston', 1, '2024-05-06 17:16:04', '2024-05-06 17:16:04', 'Omeka\\Entity\\Media'),
(186, 4, 23, NULL, NULL, 'La persona di Costanzo Ciano', 1, '2024-05-06 17:19:18', '2024-05-06 17:19:18', 'Omeka\\Entity\\ItemSet'),
(187, 4, 26, 10, NULL, 'Costanzo Ciano inaugura il 12 novembre 1933 il Palazzo delle Poste', 1, '2024-05-06 17:20:28', '2024-05-06 17:20:28', 'Omeka\\Entity\\Item'),
(188, 4, NULL, NULL, NULL, 'Costanzo Ciano inaugura il 12 novembre 1933 il Palazzo delle Poste', 1, '2024-05-06 17:20:28', '2024-05-06 17:20:28', 'Omeka\\Entity\\Media'),
(189, 4, 26, 10, NULL, 'Luogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno', 1, '2024-05-06 17:22:20', '2024-05-06 17:22:20', 'Omeka\\Entity\\Item'),
(190, 4, NULL, NULL, NULL, 'Luogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno', 1, '2024-05-06 17:22:20', '2024-05-06 17:22:20', 'Omeka\\Entity\\Media'),
(191, 4, 26, 10, NULL, 'Obelisco di Marconi', 1, '2024-05-06 17:31:45', '2024-05-06 17:31:45', 'Omeka\\Entity\\Item'),
(192, 4, NULL, NULL, NULL, 'Obelisco di Marconi', 1, '2024-05-06 17:31:45', '2024-05-06 17:31:45', 'Omeka\\Entity\\Media'),
(193, 4, 23, NULL, NULL, 'Squadrismo', 1, '2024-05-08 11:29:28', '2024-05-08 11:29:28', 'Omeka\\Entity\\ItemSet'),
(194, 4, 26, 10, NULL, 'Roberto Farinacci (1892-1945)', 1, '2024-05-08 11:31:15', '2024-05-10 15:22:19', 'Omeka\\Entity\\Item'),
(195, 4, NULL, NULL, NULL, 'Roberto Farinacci (1892-1945)', 1, '2024-05-08 11:31:15', '2024-05-08 11:31:15', 'Omeka\\Entity\\Media'),
(196, 4, 26, 10, NULL, 'Foro Italico', 1, '2024-05-08 11:38:35', '2024-05-08 11:38:35', 'Omeka\\Entity\\Item'),
(197, 4, NULL, NULL, NULL, 'Foro Italico', 1, '2024-05-08 11:38:35', '2024-05-08 11:38:35', 'Omeka\\Entity\\Media'),
(198, 4, 26, 10, NULL, 'Statua Costanzo Ciano', 1, '2024-05-10 15:17:04', '2024-05-10 15:24:50', 'Omeka\\Entity\\Item'),
(200, 4, 23, NULL, NULL, 'Storia della statua di Costanzo Ciano', 1, '2024-05-10 15:18:37', '2024-05-10 15:18:37', 'Omeka\\Entity\\ItemSet'),
(202, 4, NULL, NULL, NULL, 'Statua Costanzo Ciano', 1, '2024-05-10 15:24:50', '2024-05-10 15:24:50', 'Omeka\\Entity\\Media'),
(203, 4, 26, 10, NULL, 'Statua di Santa Caterina da Siena', 1, '2024-05-10 15:26:12', '2024-05-10 15:26:12', 'Omeka\\Entity\\Item'),
(204, 4, NULL, NULL, NULL, 'Statua di Santa Caterina da Siena', 1, '2024-05-10 15:26:12', '2024-05-10 15:26:12', 'Omeka\\Entity\\Media'),
(205, 4, 26, 10, NULL, 'Fotografia monumento a Costanzo Ciano La Spezia', 1, '2024-05-10 15:28:23', '2024-05-10 15:28:23', 'Omeka\\Entity\\Item'),
(206, 4, NULL, NULL, NULL, 'Fotografia monumento a Costanzo Ciano La Spezia', 1, '2024-05-10 15:28:23', '2024-05-10 15:28:23', 'Omeka\\Entity\\Media'),
(207, 4, NULL, NULL, NULL, 'Fotografia monumento a Costanzo Ciano La Spezia - Retro', 1, '2024-05-10 15:28:23', '2024-05-10 15:28:23', 'Omeka\\Entity\\Media'),
(208, 4, 23, NULL, NULL, 'Propaganda post mortem', 1, '2024-05-10 15:34:59', '2024-05-10 15:34:59', 'Omeka\\Entity\\ItemSet'),
(209, 4, 26, 10, NULL, 'La morte di Costanzo Ciano e l\'omaggio del Duce', 1, '2024-05-10 15:37:04', '2024-05-10 15:37:04', 'Omeka\\Entity\\Item'),
(210, 4, NULL, NULL, NULL, 'La morte di Costanzo Ciano e l\'omaggio del Duce', 1, '2024-05-10 15:37:04', '2024-05-10 15:37:04', 'Omeka\\Entity\\Media'),
(211, 4, 26, 10, NULL, 'La bara di Costanzo Ciano nella sala della Casa Littoria a Livorno', 1, '2024-05-10 15:38:13', '2024-05-10 15:38:13', 'Omeka\\Entity\\Item'),
(212, 4, NULL, NULL, NULL, 'La bara di Costanzo Ciano nella sala della Casa Littoria a Livorno', 1, '2024-05-10 15:38:13', '2024-05-10 15:38:13', 'Omeka\\Entity\\Media'),
(213, 4, 26, 10, NULL, 'La bara di Costanzo Ciano vestito da ammiraglio', 1, '2024-05-10 15:39:30', '2024-05-10 15:39:30', 'Omeka\\Entity\\Item'),
(214, 4, NULL, NULL, NULL, 'La bara di Costanzo Ciano vestito da ammiraglio', 1, '2024-05-10 15:39:30', '2024-05-10 15:39:30', 'Omeka\\Entity\\Media'),
(215, 4, 26, 10, NULL, 'Il furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza', 1, '2024-05-10 15:40:45', '2024-05-10 15:40:45', 'Omeka\\Entity\\Item'),
(216, 4, NULL, NULL, NULL, 'Il furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza', 1, '2024-05-10 15:40:45', '2024-05-10 15:40:45', 'Omeka\\Entity\\Media'),
(217, 4, 26, 10, NULL, 'La bara di Costanzo Ciano a Livorno', 1, '2024-05-10 15:42:09', '2024-05-10 15:42:09', 'Omeka\\Entity\\Item'),
(218, 4, NULL, NULL, NULL, 'La bara di Costanzo Ciano a Livorno', 1, '2024-05-10 15:42:09', '2024-05-10 15:42:09', 'Omeka\\Entity\\Media'),
(219, 4, 26, 10, NULL, 'La bara di Costanzo Ciano accolta dalla folla a Livorno', 1, '2024-05-10 15:43:21', '2024-05-10 15:43:21', 'Omeka\\Entity\\Item'),
(220, 4, NULL, NULL, NULL, 'La bara di Costanzo Ciano accolta dalla folla a Livorno', 1, '2024-05-10 15:43:21', '2024-05-10 15:43:21', 'Omeka\\Entity\\Media'),
(221, 4, 26, 10, NULL, 'Il galletto di Francesco Messina', 1, '2024-05-10 15:46:29', '2024-05-10 15:46:29', 'Omeka\\Entity\\Item'),
(222, 4, NULL, NULL, NULL, 'Il galletto di Francesco Messina', 1, '2024-05-10 15:46:29', '2024-05-10 15:46:29', 'Omeka\\Entity\\Media'),
(223, 4, 26, 10, NULL, 'Arco della vittoria a Genova', 1, '2024-05-10 15:47:58', '2024-05-10 15:47:58', 'Omeka\\Entity\\Item'),
(224, 4, NULL, NULL, NULL, 'Arco della vittoria a Genova', 1, '2024-05-10 15:47:58', '2024-05-10 15:47:58', 'Omeka\\Entity\\Media'),
(225, 4, 26, 10, NULL, 'Giacomo Matteotti', 1, '2024-05-10 15:49:03', '2024-05-10 15:49:37', 'Omeka\\Entity\\Item'),
(226, 4, NULL, NULL, NULL, 'Giacomo Matteotti', 1, '2024-05-10 15:49:03', '2024-05-10 15:49:03', 'Omeka\\Entity\\Media'),
(227, 4, 23, NULL, NULL, 'Opposizione', 1, '2024-05-10 15:49:21', '2024-05-10 15:49:21', 'Omeka\\Entity\\ItemSet'),
(228, 4, 23, NULL, NULL, 'Il nostro percorso', 1, '2024-05-10 15:50:30', '2024-05-10 15:50:30', 'Omeka\\Entity\\ItemSet'),
(229, 4, 26, 10, NULL, 'Incontro con Giorgio Pagano', 1, '2024-05-10 15:58:36', '2024-05-10 15:58:36', 'Omeka\\Entity\\Item'),
(230, 4, NULL, NULL, NULL, 'Incontro con Giorgio Pagano', 1, '2024-05-10 15:58:36', '2024-05-10 15:58:36', 'Omeka\\Entity\\Media'),
(231, 4, 26, 10, NULL, 'Grande torso femminile di Francesco Messina', 1, '2024-05-10 16:09:05', '2024-05-10 16:09:05', 'Omeka\\Entity\\Item'),
(232, 4, NULL, NULL, NULL, 'Grande torso femminile di Francesco Messina', 1, '2024-05-10 16:09:05', '2024-05-10 16:09:05', 'Omeka\\Entity\\Media'),
(233, 4, 26, 10, NULL, 'Costanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni', 1, '2024-05-10 16:19:11', '2024-05-10 16:20:17', 'Omeka\\Entity\\Item'),
(234, 4, NULL, NULL, NULL, 'Costanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni', 1, '2024-05-10 16:19:11', '2024-05-10 16:19:11', 'Omeka\\Entity\\Media'),
(235, 4, 23, NULL, NULL, 'Propaganda fascista', 1, '2024-05-10 16:19:54', '2024-05-10 16:19:54', 'Omeka\\Entity\\ItemSet'),
(236, 4, 26, 10, NULL, 'Prospettiva Palazzo del Governo', 1, '2024-05-10 16:38:17', '2024-05-10 16:38:17', 'Omeka\\Entity\\Item'),
(237, 4, NULL, NULL, NULL, 'Prospettiva Palazzo del Governo', 1, '2024-05-10 16:38:17', '2024-05-10 16:38:17', 'Omeka\\Entity\\Media'),
(238, 4, NULL, NULL, NULL, 'Prospettiva Palazzo del Governo', 1, '2024-05-10 16:38:19', '2024-05-10 16:38:19', 'Omeka\\Entity\\Media'),
(239, 4, 26, 10, NULL, 'Palazzo INPS', 1, '2024-05-10 16:48:08', '2024-05-10 16:48:08', 'Omeka\\Entity\\Item'),
(240, 4, NULL, NULL, NULL, 'Palazzo INPS', 1, '2024-05-10 16:48:08', '2024-05-10 16:48:08', 'Omeka\\Entity\\Media'),
(241, 4, NULL, NULL, NULL, 'Palazzo INPS', 1, '2024-05-10 16:48:10', '2024-05-10 16:48:10', 'Omeka\\Entity\\Media'),
(242, 4, 26, 10, NULL, 'Monumento ai Caduti', 1, '2024-05-10 16:52:28', '2024-05-10 16:52:28', 'Omeka\\Entity\\Item'),
(243, 4, NULL, NULL, NULL, 'Monumento ai Caduti', 1, '2024-05-10 16:52:28', '2024-05-10 16:52:28', 'Omeka\\Entity\\Media'),
(244, 4, NULL, NULL, NULL, 'Monumento ai Caduti', 1, '2024-05-10 16:52:30', '2024-05-10 16:52:30', 'Omeka\\Entity\\Media'),
(245, 4, NULL, NULL, NULL, 'Monumento ai Caduti', 1, '2024-05-10 16:52:32', '2024-05-10 16:52:32', 'Omeka\\Entity\\Media'),
(246, 4, NULL, NULL, NULL, 'Monumento ai Caduti', 1, '2024-05-10 16:52:35', '2024-05-10 16:52:35', 'Omeka\\Entity\\Media'),
(247, 4, NULL, NULL, NULL, 'Monumento ai Caduti', 1, '2024-05-10 16:52:37', '2024-05-10 16:52:37', 'Omeka\\Entity\\Media');

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
(8, 4, NULL, NULL, NULL, 'Fascicolo Ufficio Storico della Marina Militare'),
(9, 4, 26, NULL, NULL, 'Cartolina'),
(10, 4, 26, NULL, NULL, 'Immagine');

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
(45, 8, 1, NULL, NULL, 2, NULL, 0, 0, NULL),
(46, 8, 4, NULL, NULL, 3, NULL, 0, 0, NULL),
(47, 8, 10, NULL, NULL, 1, NULL, 0, 0, NULL),
(48, 8, 8, NULL, NULL, 4, NULL, 0, 0, NULL),
(49, 8, 26, NULL, NULL, 5, NULL, 0, 0, NULL),
(50, 8, 9, NULL, NULL, 6, NULL, 0, 0, NULL),
(51, 8, 51, NULL, NULL, 7, NULL, 0, 0, NULL),
(52, 8, 14, NULL, NULL, 8, NULL, 0, 0, NULL),
(53, 8, 7, NULL, NULL, 9, NULL, 0, 0, NULL),
(54, 9, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(55, 9, 51, NULL, NULL, 2, NULL, 0, 0, NULL),
(56, 9, 7, NULL, NULL, 3, NULL, 0, 0, NULL),
(57, 9, 9, NULL, NULL, 5, NULL, 0, 0, NULL),
(58, 9, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(62, 9, 57, NULL, NULL, 7, NULL, 0, 0, NULL),
(63, 10, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(64, 10, 51, NULL, NULL, 2, NULL, 0, 0, NULL),
(65, 10, 7, NULL, NULL, 3, NULL, 0, 0, NULL),
(66, 10, 11, NULL, NULL, 5, '[\"uri\"]', 0, 0, NULL),
(67, 10, 9, NULL, NULL, 6, NULL, 0, 0, NULL),
(68, 10, 4, NULL, NULL, 7, NULL, 0, 0, NULL),
(69, 10, 40, NULL, NULL, 4, NULL, 0, 0, NULL),
(70, 9, 40, NULL, NULL, 4, NULL, 0, 0, NULL),
(71, 10, 57, NULL, NULL, 8, NULL, 0, 0, NULL);

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
('3ksuhr3sqb9f53vis3tkgouvj6', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731353335393936302e3630353531373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227163696a687361677367683371666d633966706f336374733234223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353335373034333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353336323434393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731353336333330323b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223438663436363833663430396364313931343037643863663766336235633331223b733a33323a223237396130623439653237373236313735396262623833323639386232383363223b733a33323a226539303661646166353030303139313432323439363638643038333636383633223b733a33323a226639343233656436636337363463356463366233333662623136646439663835223b7d733a343a2268617368223b733a36353a2266393432336564366363373634633564633662333336626231366464396638352d6539303661646166353030303139313432323439363638643038333636383633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a36353a7b733a33323a223033336365346436313566613939353961376531633963303632326536316463223b733a33323a223232306131333839616436653366636462656663643963346361326631636463223b733a33323a223839343433353632303139366363643139653261333561653835386663656365223b733a33323a226134326338326235303061393134626136376539636263386433316433363237223b733a33323a226663336638636461323636363438383032353561656338633230343538626262223b733a33323a226566653233636230626266653965303339326336633763386365353236653539223b733a33323a226239356536636162346163366132636364323639633465323039653937623230223b733a33323a223761333866653163373338366561343764313534633637323633666363313262223b733a33323a223936346463623261656461666566656462613732376630333535353866316431223b733a33323a223765636538316431333262373934306130373365643731393137653337643236223b733a33323a223630353464336264343665333165323465323433643638663865396165316431223b733a33323a226330653062393362336139306232373339333737393839363962636135326238223b733a33323a226631623734346439643862393532323530663865363266633166653937343833223b733a33323a223637643765373634623961623564663134323135653662333664643436353963223b733a33323a223866326332326330393137343663616266353666623131623637313365313132223b733a33323a223936383930653331353737313937346331333430626237656633313031663461223b733a33323a223039626136626134316233326236313432313131376234323033366433633632223b733a33323a223866653363306337656433313531393639356239353536626162383130353435223b733a33323a226562383337653138346336316639613131653438366434633538623066376531223b733a33323a223438646333646239656564633934353133613164613161356566396161323735223b733a33323a226462336265356334613432363164326235353838336139373436336166333330223b733a33323a223032643861353464333630643436313537396631626232653063643032396139223b733a33323a223764653836393861646337623866356637326138663138353430373435376630223b733a33323a223437666666326230616434663736633363656638666266636465356335313535223b733a33323a226432386263313364323734666364353361656364646539663135666462643661223b733a33323a223661383765666162336165373961303634396131326238336465646539303834223b733a33323a226136343161386137303261616135613639383732306464353937313865316566223b733a33323a223538643362396139326338386264636364383964616565643032323962633532223b733a33323a226266623931356133613164636339613362336531373930333262623035633530223b733a33323a226364643730346234306538393464383430333838393662663663646137663131223b733a33323a223935613764656532643764623634646232383861653339633338336265306565223b733a33323a223835623665303766626237633132653332306136623637353635303537366365223b733a33323a226630303837646265353465353935313065666264656430656635626363626663223b733a33323a223766373239353730383262316562643337653139643035316331386530383137223b733a33323a223362323865653537666333353365303638363966323934313535663832373235223b733a33323a226630633135623730343266633534323237363164653637346438353937623361223b733a33323a223431306464373361666465663939613534666139663030356236396630313634223b733a33323a223662393534363136653436343732346433376335613266313265356164383337223b733a33323a226162313337633130376631343036353730643132376264343831316261653464223b733a33323a226364373863666331383465333532353132656135323632623832613165666132223b733a33323a223463353833333362303365386533316337636234313930653030323832303334223b733a33323a226366306663636664306134333161343730303866323331303434386433356666223b733a33323a223935613530356532653933396131363030306131383738366462376338353262223b733a33323a226233343239376130313133313765343232653332333135313233616638653730223b733a33323a223534646334383932613066386637376632666535383438336334393130376261223b733a33323a223134396631363635313961623930626639326638333537396632316335633933223b733a33323a223039326130313734636136616363336166663662333734363637303130356565223b733a33323a223531373337666264316362363566373532333534323737626561373433336635223b733a33323a226332313637353732306435616639383665326537373665366366333061316538223b733a33323a226531623834393539366266306437616335356366313939646333326665316436223b733a33323a226535383734333637323138383565303262333239303736396363366361386434223b733a33323a226165623434626139663135336137333439373433636337383533343333303138223b733a33323a223362386331663433396263656262313631623765336433336132643334663666223b733a33323a223161353661316333343463643430343936386132386365303730653634656536223b733a33323a226335633365393036666362323938313536386237643137393632613834303266223b733a33323a223666333662323734303030623738623035393338616263623766323439316230223b733a33323a226434313962653262316533346136306337373138316463383131373739326633223b733a33323a223333613036343062393463343037363436313736656336633936363237313561223b733a33323a223863663561303362663939393739333063643938663261313935363036626133223b733a33323a223362613662333936643830343865643634363934303630316430383064643665223b733a33323a223166626530613963366566633639313634636637633038363763313265333538223b733a33323a223565643133636238333630313232376136623339306133346338303339353131223b733a33323a223363643565336133346163643665363232653165343232313438633535386233223b733a33323a223164303031306635656432373366306430376335383862386665643435316230223b733a33323a223938633738653965373738393639653530366264666538633532633339623133223b733a33323a223738356437356666356232336164623563353139383633623665366333393363223b733a33323a223935333663346261643364323764336131613837653962336466356139326235223b733a33323a226132313033626434393761383737313032323434353132396432666434633638223b733a33323a223165383466313565346139616537633536663162386330646638633332343930223b733a33323a223334353039396661653739393031613439306533353266633662323330383336223b733a33323a226266656430373339373363343333663533393231393636323231636438363361223b733a33323a226466613434316166383663653438626233323838326637313961366430343434223b733a33323a226331396234363934373265353636323161383363363966623739336566636263223b733a33323a226562633762346663643436383932393161373466636236303461666432346462223b733a33323a223263386334333864373336666639303233663536326234396232613238646433223b733a33323a223766643938616538326565613562616339396338646535663366646333323861223b733a33323a226432366534623964333063623434393837303734386662363165353238366562223b733a33323a226661343566376539383961376337316339656634323630626636643061393537223b733a33323a226363393032643539333433346437666664373561346534323234666430326561223b733a33323a223665373333343665386535303532353533333862653661333864303839386236223b733a33323a226464386665663333333835316463363433613835613637303633346561353637223b733a33323a223634353135636236336539356230306461626638623165336361626664613263223b733a33323a223834336565613663376131613939346437346135343739663066353766336338223b733a33323a226537373833303931346135333731353933383634633935316532326461633230223b733a33323a226133333933373461613732616564313435363231343464316536306133366263223b733a33323a226336386363353361666635643535313033396632633864316633636231626638223b733a33323a223631333034633461663165653264333936653733653334383962613538336466223b733a33323a226438373030383164366235633666616262666534333839396134353232333535223b733a33323a223133656631643632643135653637636338653332386437353330663061343564223b733a33323a223434323362313064353565353366346235663330346432366536626265303132223b733a33323a223039656431663162393962616638373063376163336532333133633336353636223b733a33323a226336343766636238373266373765336564653236363538393966373064303235223b733a33323a223930366336363738373561633766326265656662383634396131633133626433223b733a33323a226562313565356635303763383034666266323335663133323164616664383261223b733a33323a223363373936346364613732666531333332633261666437386166326433633433223b733a33323a223536623336376263653965346363306464303566643838643930373166313636223b733a33323a226563366135333666613763303237356561343965333937363365666234323035223b733a33323a223038373531373132323736326637643762386361623130636636386366336236223b733a33323a223738356163646236633832353035323131313037373630313666643539376435223b733a33323a223466373230326436336330366238383733373564303133663539643563373932223b733a33323a223833366435656137333963333737373537366462343533353363643666333264223b733a33323a223830653231623137353362636266653463316465333232363035336663393663223b733a33323a226261396565616338393233663737356437326363303166326331366462353163223b733a33323a226461343766613337373866643465656336303433376161323761663239616266223b733a33323a223462636563623566376163666666613333336166383662623839386639363739223b733a33323a223665363335643831346437656239353266356561393866383166653166373162223b733a33323a223037636639363361336661386134343832323033373437373432656664393235223b733a33323a223833363261636139393263306634393731333433313539313330663339633831223b733a33323a226338316535653935313839616235666366313139346339383536386236366439223b733a33323a226162663564353936316430303732336430353262396239356463656338393537223b733a33323a226437383564643530366230326661383965636463616533646463663263346662223b733a33323a223732646336353133646237323339336336636666373835636631373035663335223b733a33323a223063303765653561333534313238656532306533306232666231346362316434223b733a33323a223736626337346564363833373739663966306161643333646561626265636631223b733a33323a223035666137303236306239313439316333363233313035666532396633323731223b733a33323a223039326530613234613065303032653339313566663661306333626332386565223b733a33323a223465323039636461663336326461666334323164346335353135646535393231223b733a33323a223732353532303535663234353764353239646261643034386235663233633566223b733a33323a223565663636363434643430376263353539316531376364326634353232383235223b733a33323a223331373734616565306562346234376632323137633633643232363431383534223b733a33323a226166313663303966383630333266323537303936316535646363366438666132223b733a33323a226535373337303733346439363637313565323338373464353566633061316433223b733a33323a223662663330373434303466323739623634346636333361656131313235653937223b733a33323a226632633533666265366137323832626361616162306231303434356337353063223b733a33323a223165623338326130646161636138336638306466613863613937636233636631223b733a33323a226438343063326236306538336632366531363162616465383939653663613636223b733a33323a226436656534336234313866643062633830623534393434643338353061663566223b733a33323a226361383239663632396663633661313030313234373763386131323630646432223b733a33323a226434616462656334366263386532333337306331643033336637336135376438223b733a33323a226330333365333365653837653039643166303539323163636466306137633935223b7d733a343a2268617368223b733a36353a2263303333653333656538376530396431663035393231636364663061376339352d6434616462656334366263386532333337306331643033336637336135376438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34343a7b733a33323a223332393438346565333365343638383333373638313235373031653264333036223b733a33323a223364343062336532393838373933313461363735393133356231386464646262223b733a33323a223165633262333531303537386131333834326664353236646364653039333936223b733a33323a223734363962616135373765613635316137346665356666373463396262373033223b733a33323a226631633631306164616430343661343334363637393037656633343131386662223b733a33323a226366356630623535373538313532373137383762366362616665303066323437223b733a33323a226263373661643836626336663365363435353366633534353762633030383765223b733a33323a226138396232396630623764666331386533346138343833623032623437333962223b733a33323a226633653133393434323965346632623139353931633139343966303335363231223b733a33323a223537373934656561623636303638616435376562663262653366356635616237223b733a33323a223162653037616662633963666139363561383539343131663539346633623162223b733a33323a223263613834643336363531666436316463653664383362363834396332653335223b733a33323a226566366233343764316235616161313362656534633739336237353965663839223b733a33323a226335633533343439636434313263303165636334306232613433383432393139223b733a33323a223663613166386663633235336238643666616366643564643231333662663435223b733a33323a223464323332666338666264343135326136616463666539623762363136326436223b733a33323a223038396237636232633236613661383366313831623734646435623334393236223b733a33323a223434306663646434646431623939616533633631383537383136353132396161223b733a33323a226437633966623963356632383832303333623438643038386636396439323038223b733a33323a223130613138323262306366346466636161653436656363633233323730323530223b733a33323a226535386236353132356439343861303133653131643362383637616265323863223b733a33323a226131366532643366383138373531376235356130656339633734363466343131223b733a33323a226339366164303232356130363933373736326133666130393962316233373836223b733a33323a226631326139363935666535376565313638333434613530376435653261336438223b733a33323a223562666466373530326331333564323736346265653763643432623562343730223b733a33323a226536653532653362383430666432323738643630366164616439376262373238223b733a33323a226165326133323032623839663163346139623837353734616162393435313838223b733a33323a226234383030336439373764303638393966343962383433353665316337393531223b733a33323a226331343033656130373462313134633439373164633161633232386164666439223b733a33323a226265313064383565623339653435326337356532653663666265393339333339223b733a33323a226262353731386138353362656663316462353065333266303634303637326337223b733a33323a223363313564626232626462643264373036353666643930643735306365656238223b733a33323a223439633935373832316466373261663164616233386466343537636637616439223b733a33323a223836366431353139633266666636373562313764663561333664643737303634223b733a33323a223633626434663735323663623633313963663864666662333732616564626232223b733a33323a223638656131323835373066316634336333353831323639613038653539383434223b733a33323a223435373036643831343630306437386639363562613637306163333933366366223b733a33323a223130343932336563386238373935323766383363353964363131616239323432223b733a33323a223461623337623135613766633930336362386663666161313365303932613338223b733a33323a223039386334653637626163383037616531356664646331306132656330663138223b733a33323a226131316232396662313038356338666333333633316334353533376237393862223b733a33323a226562386366386634666565383465613533643764376232343334653366633333223b733a33323a223430613636303231663835343835306466303962373830626633316533346632223b733a33323a223538343134316433623131653233316433346231643337626239366665343862223b733a33323a226633393330393564336265623634353538373636666232373661663363383166223b733a33323a226330666630623165666662636331396337333932613634383330323437393434223b733a33323a226163633839353163316334363234376264306131656365313631333930626462223b733a33323a226130636331386633346631613332386136383333623964656431666331396539223b733a33323a223262373939346334666130323866373230633433336436663939333665373335223b733a33323a223232656630383163336338393263333633323865303966656366393165356135223b733a33323a223736613231393765383235343832343039613035643939663262313734326530223b733a33323a223630303430656637666636636236613134393939333534396231393966613733223b733a33323a223962363335646530386662373733623265343833383261303864376636316637223b733a33323a223235366533306339613164376136363331343638366337303666343634663232223b733a33323a223663313532623731303163643664633632346235333130393638646362373335223b733a33323a226535333939323766363036653836616464666439636663623662626664663537223b733a33323a223061383136333631393433393532623565666136303835383133316539336262223b733a33323a223532393639383463626438343534656236626439663430383930383661323438223b733a33323a226332346534373933643063396633363261373362643931653639363937373736223b733a33323a223930633762383264336336663138303933653136313430633330663235646533223b733a33323a226534623736323265353730656466343261633831363934623565633535396166223b733a33323a223734343337393735643732356262636131353533333764613732316330313065223b733a33323a223936343334656231363465346436356238626331623233323266316437376634223b733a33323a226361356537656635316465333137616433646462623761376261356432653731223b733a33323a226365636538303539323335383166356636663761303461366539656265306235223b733a33323a226561623866346139306561303838626563336430383866356461326639623062223b733a33323a223566346165623930316561393834386339326164313632396433616639646532223b733a33323a226133393536613465363063393931653064316137366131323636613938323537223b733a33323a226537356532643463393862643436343262303031663131376539313664323362223b733a33323a226631633639353865633337663839643863383036306435316239303137366330223b733a33323a226439373264306634656339383033366432643865313462336130366364353162223b733a33323a223335366235336161373730613432343761656263396136306261313931393034223b733a33323a223532336133613336336634353461346232643165323938386162613638643631223b733a33323a223430653063653264666561653261613134653466333833386362643038323063223b733a33323a223339303033316265393066323264306565636636323232316333613763363662223b733a33323a223432333831326238643732656235643464643936363236626564346531373336223b733a33323a223266356465623438383932623266353938366430333463343663623131616561223b733a33323a226330626637653331613630393761616532383034666164306665633335656462223b733a33323a223135613731313536353231646638333166313031386338333361336432353530223b733a33323a223764333164323637366431313730653031353137663339323137656636363764223b733a33323a223333303365333334643862643236306239666537656633653962613462366633223b733a33323a223035643237373862666534306233353637643333303436393466663837326439223b733a33323a223962626563363665386236316333343037306362666364346639366337383065223b733a33323a226238316465366233623932373664383332613734313834623661383263306139223b733a33323a223132633939396163626264663666326134373432303831363363636339356264223b733a33323a223737383137613536306337626432343037656639653562663663376337353166223b733a33323a223733323836636666373335663634396233333639653731373037623363626432223b733a33323a226565636633396534656565623134626232303431356238633765613761653036223b7d733a343a2268617368223b733a36353a2265656366333965346565656231346262323034313562386337656137616530362d3733323836636666373335663634396233333639653731373037623363626432223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1715359961),
('62u96pg208891voiqotn8pev3g', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731353136383331382e3639363130353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223565366d6772383466726d63313030386b6c3064387069347576223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353137313038373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353137313530313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731353137313738313b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226363383534346439656136323534396635356463663139343735373035663039223b733a33323a223230613234393835623566323465613536656164656434323565613065626165223b733a33323a223130623431376366313165396238363738313033353034363236333737313938223b733a33323a223765643639343736393130376333646466663966666566663931623332316531223b7d733a343a2268617368223b733a36353a2237656436393437363931303763336464666639666665666639316233323165312d3130623431376366313165396238363738313033353034363236333737313938223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223138353165316533303161383337626236623363373866323633393233323738223b733a33323a223861623536383633636665383732333733306631346361386337313132333935223b733a33323a226238626566323733623465393731333161663130663130303261363435646536223b733a33323a226266373665656339373430663464363761343363636632616461313034333664223b733a33323a226463643263376238643137616563656363613861646162633263653938373537223b733a33323a223964653734363437336566393165653631323162623832663533666431393531223b733a33323a223738376634383639363530623430333034313636383765616630613938343832223b733a33323a226630366635306538653763323964393437663136313830343938316230633461223b733a33323a223964306432393335663332396231623265666266626164366332626439386338223b733a33323a223334383162323965666362356466313838393233633364393534356361353330223b733a33323a226666323831393062623635333463373332393435373261333963343435643164223b733a33323a223564346562346436333536616234343234346336386530353762346633636162223b733a33323a226661323430353562363466623534383534366562306463333837666231353561223b733a33323a223734373138626262623861656561356635313630666231373238333266666461223b733a33323a226437383964616230666137653031336137333934306665353834343661613762223b733a33323a223065336331646666343761643232623064666632633666626334353835323337223b733a33323a223637303066363633313131623265303561356265396639623163656239333534223b733a33323a226464616332323533363838653763636336316333316438353237393362393163223b7d733a343a2268617368223b733a36353a2264646163323235333638386537636363363163333164383532373933623931632d3637303066363633313131623265303561356265396639623163656239333534223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223431303130356161346262396563353933303831373231656434353138646631223b733a33323a226164383863636331666666316430333334626634386263646265333332616131223b733a33323a223665666236633435393064323565386463313739643333663735616465643638223b733a33323a223364326637636331353162643138653462663464616265373938373133633566223b733a33323a223432653634613863613261666339373334323762343466383036373061343066223b733a33323a223266356365626638656534376635653331663661656537346133363638313133223b733a33323a226137633839393739663464666366343466656139323434306131393834306561223b733a33323a223232333333643265373363653033623537626161336338393734323331666665223b733a33323a223737353237666530346566306633633064393666313061316363356137386534223b733a33323a223266393465643561303561653338633434656238356437633530633135306336223b7d733a343a2268617368223b733a36353a2232663934656435613035616533386334346562383564376335306331353063362d3737353237666530346566306633633064393666313061316363356137386534223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1715168320),
('7bara471sph57fi988cvurgoan', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731343831343933312e3938363333313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237626172613437317370683537666939383863767572676f616e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731343831383533323b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223733303461303966633238626532363532356237656435613734373863383239223b733a33323a223865303366383866316134666366373937356263313031333037613837633230223b7d733a343a2268617368223b733a36353a2238653033663838663161346663663739373562633130313330376138376332302d3733303461303966633238626532363532356237656435613734373863383239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1714814933),
('85sck5jjdecvdf0c6bl8qirkid', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731343431373337302e3232343739313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22383573636b356a6a646563766466306336626c387169726b6964223b7d7d, 1714417373);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('gb2es8scoameof8v9mmeehr4fg', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731343932363931302e3230393936323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22703932746137316f676c74677475716973723175763234627236223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731343932343236373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731343933303531313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731343933303439373b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223339376662326261313563373962363635303465613431643066656164323736223b733a33323a226137393766393361343061643036636636643735623937613466373732633735223b7d733a343a2268617368223b733a36353a2261373937663933613430616430366366366437356239376134663737326337352d3339376662326261313563373962363635303465613431643066656164323736223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3134333a7b733a33323a226364623833306238616131623666636635353766613065643936353562376435223b733a33323a226532346162626463393764633962646165356463623133386164666236383434223b733a33323a223831393966363063643731316339396262366432623963656462316331613766223b733a33323a226264623165613564616234306331356531383130313432323162313163353333223b733a33323a223132636231376562383962343837356264313331363164623933613831653434223b733a33323a223934356239363738666136316466343564353666626333393035653565623834223b733a33323a223133616464323062346334396464653131343566346561643430636234323362223b733a33323a226666326536336533623562343933613530333361373733306366643332653637223b733a33323a223265343537623039353165313264633236383237356232383762653666613066223b733a33323a223730366162383635646139353666353365353765636462613362303530643230223b733a33323a226338316535383838326432653039343836393932353463316266376234366139223b733a33323a223766323536366362323137613439656339616536323132376235373263626333223b733a33323a223631613138623239653634316337666133383139663731333630663834663063223b733a33323a226463346133353764663131346437323063356331326135343937643262653538223b733a33323a223866616333336430396666623866646635326662323633346562613764333233223b733a33323a226432373434306634626437366361303963363339373637623330323836636233223b733a33323a223334313135376633313638323831626337323365646363633965373961386365223b733a33323a223631363535323662343432363161396532363438396430323663366265323833223b733a33323a223236613763613065343538336565313838656233353864363733316437656139223b733a33323a226139623664336161353335383236366235613363313262336434393930656232223b733a33323a223734633436343539313339666331393361333466633436353736663432613938223b733a33323a226364303037303935303937316562336134656562363063643463366434656536223b733a33323a223830386130313131336135383039646232373738633663623634636564373535223b733a33323a226239366163666138656365663034383565396539663432353365623831306463223b733a33323a226164353361396337313631666536353037343835393463386361653565393030223b733a33323a226537306563636237633031393865333337396633373334313764643363303134223b733a33323a223230663063393339663530356234313331343261613635373034343536616231223b733a33323a223136326234363839393562646264336239333461383333393266313230623932223b733a33323a223236626233386134356563656232306563646431383837343830326136636637223b733a33323a223436303735326264383162396566353739393365336562303939633733383565223b733a33323a226363346638333833313736636238366561333366376261363633656166653961223b733a33323a223334323336316330643231643266346264653662626232643965316234353566223b733a33323a223733336132363830306263353561363037303036376639376337396564373038223b733a33323a223934363939333833326464343735623437333134646635626361383034626533223b733a33323a223838373266666239656634306463653562386234653830613265633838383538223b733a33323a223733353438613233316438643461353133346664643765363437346466393966223b733a33323a223265356536613133326332386161366338336536663935316538346135633130223b733a33323a223865346532383266643038366435663666323661326435313534643764636637223b733a33323a226265626430353537316631353131386536303066343665386334613866366237223b733a33323a226238633539303033396466353730333864306563646239356163383239376135223b733a33323a223035393231363065363033616132356662313461326239653535313263633135223b733a33323a226232303936646539663639346164356231616462303366646464623634383834223b733a33323a223331306239356339306661626531656363663838643461343563613064353338223b733a33323a226338396536623139376533396339323130393932396464353839333765633237223b733a33323a226332346566333763363538656339646232303735333566356138633361363936223b733a33323a223233666462313037643861316564663031306265323264346138316239313433223b733a33323a226662343032356630303835336236656631633365373637656161383866373133223b733a33323a223938613364393934636338353931373833396437646661323465656539653735223b733a33323a226266643032353034343531613130373138623461323831333435623262353463223b733a33323a223064646164383864346261383264386630623564396632313838383437373261223b733a33323a223230623664643964386635393035326430666462393635356234646430393236223b733a33323a226462383632396233323639343739386564323533623633383139363265383135223b733a33323a223866376636656164306135623636316436353464333766363335353835636130223b733a33323a223330396265353264653932366565343235333334613864313264346136313436223b733a33323a223135303831663332393764313461643035386566663564366261303166343533223b733a33323a226566643831393136316533383734343962363736643932313133303865343235223b733a33323a223862613136346337303138393538373435343837666366666235363535316265223b733a33323a223632386562363739303539666330396263663462363764623664643634396131223b733a33323a223164306162343336376666636465373231303435363763643337373133363939223b733a33323a223833613832333363633865393032393730643336373634313964633064663665223b733a33323a223330666437396430326461633134653263633163363234323661336236383932223b733a33323a226661633364363031333363316661626534313833316662343538666537383330223b733a33323a223166396434383764386233613066316262336462303431633431386663353233223b733a33323a223738353861353238363039303034613232323932356362376562326366356661223b733a33323a226237383565313433326337386438303631323832383965333062393730313734223b733a33323a223432656136326365373861396161646364636430656165383831316262333430223b733a33323a226363653436303130316130323738633962363464663035363736343334313431223b733a33323a223432386664366230646532633466643464376165393331366134613062393334223b733a33323a223632653432326366646431636435663939343139643534633563626562326262223b733a33323a226536333666336564373538343239376538663365303463613332326338353762223b733a33323a223437316663626338343965396536613966313639383436336336376539343963223b733a33323a223730363538653936376335353035623162323562633034663138316235346662223b733a33323a223461366132643466616634366234643762353561383464653034386633383261223b733a33323a223733616262316335346430373863643463323038303438356131316633386439223b733a33323a223632653362386233356161666565383339643339306232333962353964653664223b733a33323a223963326532343261303337343837643938373132613739656630316364376262223b733a33323a226430386433373436376632386538313161613038633736333664613464383338223b733a33323a223563323234373562333765353866333035333535663735366561393631343135223b733a33323a226564363733363937326561306366353034336338636564653136653230643765223b733a33323a223863643336636263373462623333336534356465393131343661373265313766223b733a33323a223936333532383833343832623066383030363833636536323233346232356136223b733a33323a223664363263396639613462336665636232643266343834653033613263663034223b733a33323a226237356538366264316439373563633339653037356231663462626132363237223b733a33323a226439336535396433333532343731653833663033393661653666353135316231223b733a33323a223766343461366632376266383865376432353063653933383332326538383339223b733a33323a223265373662383164383161656535316639373765333662613230653731636366223b733a33323a226431313136373062356632323964326539613663616437646431613135613561223b733a33323a223761303932643437663530626232323934363537643637373936393638666134223b733a33323a223730633636356164643761353331346531613133636263313937323632323539223b733a33323a226132613838363835376266373035323132366130303232313632393433333833223b733a33323a226262363939623362306361393431646131373636383332346361653130633266223b733a33323a223037353530343265393930306162376136336136653066386430393866623938223b733a33323a226130386564633534343264343463326630663561623665623331353332393530223b733a33323a223763363938633538383364376663616566386363633531663332646531626465223b733a33323a223834343632623839386431356531383333613635643434313963316165613436223b733a33323a226430666433353739313061366134623135326463303731316266396432306132223b733a33323a223564356665343534663936663561356238303265623934306263643861323339223b733a33323a226338633036663830316563386239366239396366376334343265366363376364223b733a33323a223965613436383235336166613466663637393634383032653266393766626632223b733a33323a223162323764636639656661346437623038663335376162373832306336306433223b733a33323a226433633235386630383737353436373635646639663462646263356462643231223b733a33323a226163353134396666633133646537623766313662353839633637633538643036223b733a33323a226262363439353831633962646234613536653435333833383763383734643536223b733a33323a226664396239643561653965613237383031343432316530376436363635333765223b733a33323a223334663935353437396331306464623762363265313762613333643730316132223b733a33323a223062323735373932393765616338313132396634326434616332653935366364223b733a33323a226532666330323665613430663632663637353565636133313061373237323130223b733a33323a226330666465326637336664393938393038313139633266383433373830656164223b733a33323a223138333933653737623361666263373663336135353636363231383364303766223b733a33323a223933393830666432663639383864643763343161643630313339393763323932223b733a33323a223337636262306238306632383238323533633563366164386537373237363363223b733a33323a223263356438323764386236613761613836313165376138353363396633373539223b733a33323a223832663762643035663933656134306266366465346233653966343732663635223b733a33323a223962396535643162373762386134306435326564313566646236373132646162223b733a33323a223866613733636262366230653365613237623834333963323965393338306162223b733a33323a223438303162393130613565643437393538336136343132346136323230623866223b733a33323a223436653065373637623234306131363833663363663863333731633131386131223b733a33323a226536386263346465653431303462626130663435343431303534393062336164223b733a33323a226463316365656363643839326164626432363038353930623463323066633030223b733a33323a226363343436386564373663373661666633356161626630343039343961313561223b733a33323a223266323131623163343862636562643464636365383336383963336530303964223b733a33323a223036626234626331326261633034653832356334363662633739616131613866223b733a33323a223938646663626333396133643164376433336234386431303734633937353362223b733a33323a223062636464666531623036386134336530333362393464643661323030663530223b733a33323a226363663333386331623061616461346633616461306639613536616639633761223b733a33323a223461353764636433636132613336636665646330316466323266373362353131223b733a33323a223832373666653761303933386336666435633664313761366331326362643431223b733a33323a223366393330636237373462316133663531303734393831656638633833343761223b733a33323a223639396438623265373463663663663839663036336638383261633963393866223b733a33323a223263633465646236636335303834333662353737643661393830656339613561223b733a33323a226466313631343533336363613266613838303464316230363837386338623564223b733a33323a223264383763626262346166306361656532613937383466303362373636313961223b733a33323a226663616334353031366665333664316433393935666330616335613861333031223b733a33323a223864336461373561613635626131663832303236633938666461323364343666223b733a33323a223535323064666164306166656263343838363535383964653335386164633030223b733a33323a223536613630356164656462396663336331336332623234306430313530623430223b733a33323a223139303739373062353961303561393664646465333063323335666466333065223b733a33323a226565306634363139633335306263363434336538333464383832656332373039223b733a33323a226533383432633230326662393262623034353436626466663130376130633137223b733a33323a226633366161646661653638313666353833653732616330306630313661623863223b733a33323a223638376330613965653065666538303633356235303730366663663961343161223b733a33323a226263326466633139366538616562616631613563623161646364633332613864223b733a33323a226333643361653166393636326138323733613636333833646334373237303638223b733a33323a223734313230666430393362363639336238653538376236613066623238623636223b733a33323a226235363333346235313937383436346130323862353762663331346332346164223b733a33323a226465633761376538663731636231343636356132303430386230306263373534223b733a33323a223663363530613031393461386164326462356439326663666366643339656230223b733a33323a223738633933643231306435373965363536366665326533313861636462616462223b733a33323a223266383338643066336430643231663666333930626561653332633262616539223b733a33323a223763333139626632373934663461666562373836386539316637393132316332223b733a33323a223361393861633731636437646266396363623636626661663865363630313762223b733a33323a223136653764303065616464373464363063653033613562653361326661613265223b733a33323a223663393539336236303237343766383964643030363363656336393635306164223b733a33323a226130623230613565313737376334306139313131343330333364393862613532223b733a33323a223761336530646138623533393665393762383238393462363361613135303337223b733a33323a223235373862323639303466306338306133323834646263653838333862656530223b733a33323a226138653965666161303965643937366633643666316432336561653862643165223b733a33323a223631663233666136313965633664346535316262666634323237613630353765223b733a33323a226635333538326333393664623662386565653136356363383738313136386230223b733a33323a223539336636633238643334336363666665373466643637636132336434396361223b733a33323a223166343234393334633061353932326364306438666330616331376237333963223b733a33323a226437633539313835323335326431623334663332623265393566666334313530223b733a33323a223265346436656432666137626163643638636261393634363830343138633065223b733a33323a226463613132316132386333656165626537636439633564646238373266363535223b733a33323a223834663662616339303332316564363066613232656164653063643366326431223b733a33323a223464653836353230376163306432663336336235656261306132663737303331223b733a33323a223665343038346666393231356135336562393534313131336666626330343030223b733a33323a223236346336346662343836343836666332656638623661316336353030366333223b733a33323a223235343762656635313466313934653264633231373831353562396534633236223b733a33323a223030333764393135653664643936656262346230373131326261393763396238223b733a33323a223636636432303530653762656631333331346531363861393636623635393233223b733a33323a223261363562666266323862643732353930353839373831633263356333303564223b733a33323a226231366365613433363562386433656432343263346436653437363939626232223b733a33323a226263353439643432386330373437623135373333356666353936626538386134223b733a33323a226539636538306532323066633931613566633632356334663634626538623262223b733a33323a226334613462366564653266356433346638643731383132383464626639343737223b733a33323a226136383433663564316561396633333635633664633465366338393735336131223b733a33323a226433316135633233356636333563336364376637666263663863636433343532223b733a33323a226561306439323332343739616634653635623338386133663939643039393764223b733a33323a226436643934363964313330643266346539303237336430396438386333653832223b733a33323a223032656136303262326662303739323964653761373730636335373233386562223b733a33323a226234333939303161646261383633633961396433656566306563336264363563223b733a33323a223133623762366162646365633136656139373231316465306634376437663038223b733a33323a223064323235616462656137653938376439626162643430393932636336636237223b733a33323a223238363933613739616466623763656131316431323733646336366139633436223b733a33323a226164363264336464383538336561366364363165306266643763323834616237223b733a33323a223136383165396634373433343837383762336666393862323564326164396638223b733a33323a226237656532353662303933313031623562353234323265653132346362353431223b733a33323a226563363537303961333434653461333736383338646362636235326130643434223b733a33323a226436386564326563343032303265353336643636616564616336336232636638223b733a33323a223134663736383366376639633636306537653861323933363734306231366261223b733a33323a223865386266343562343338393939303464373333666538376437646430353662223b733a33323a223966366166643238323632626363313933653931323532346532353130616230223b733a33323a223665663533393132663834653165333234623832386638646464613033363130223b733a33323a223264623032663831313963336230386665393536616338343965653932313766223b733a33323a223938613637326438323138376630663633353537353361363536393532396566223b733a33323a226261366334663864366431323965316366323332666536633536383037303565223b733a33323a226565656564313039383831306635636135633939366264313761303735653465223b733a33323a223866663530643439353264306238323038653534306466356637653262336537223b733a33323a226161633838613437646330376164316530353735633630653938396336633931223b733a33323a226238373330666636326437336334616232613635396232343038353131373338223b733a33323a226530653939396237656465356136303635386230353834323362613439623961223b733a33323a223363653736356134333066393239623764643462383935326532633062313035223b733a33323a226461626362363938333562383935393763653132643233373934386531316535223b733a33323a226564643562633363323064353939643165343935646366353666653039373639223b733a33323a223761366539366237346633363266353734653331626564313035396635653864223b733a33323a226531616433646566333735646134363738313162633662356162336463313832223b733a33323a226161376461326266663862636562666166373139383763633532323936363865223b733a33323a226233626363616333653339646138626333323461333934653032653466303639223b733a33323a223334663035326537316330653064643131316330633433613330306661666366223b733a33323a223634616362633430636231303234323762333031323065656238396337653534223b733a33323a223431383165373065353037376566373564303564366161383139386430326136223b733a33323a223338623332646439356235346665393264316331386334633334663963633662223b733a33323a223030626636326436333062333733363833613265386538313739343664373862223b733a33323a226165666466343932343338316661366565653638383561636230306663343165223b733a33323a223330336564636165656264613461643764323530343539623166326530323234223b733a33323a223731323530656562313066623832636264336464643339356537376661646362223b733a33323a223336616335373764396330396666626464303536383639303736353433646133223b733a33323a223934356632613339393564356464326463393564353833316263626264376465223b733a33323a223462326266333963366565336436616337306236643537316537643336623861223b733a33323a223661366130383662626232643363326465326132643263363864303665646463223b733a33323a223261326531313437656164643339663264346238643838306161613738386434223b733a33323a223663343632356436623435363738623035356438396361636132353133353831223b733a33323a223763383331383838346461303338626632333161633537663864323234333263223b733a33323a223735373466343161666635653666643766316238353062666635303132626139223b733a33323a226265613936666166363761386261313461646165333739306433623630646563223b733a33323a223162633837613064313534646532303564616438656430323064376430646235223b733a33323a223363346236653236303262626534306331663066303730343339373130653134223b733a33323a226236353937396661313965326538306538343165343263613434633138376132223b733a33323a226164646533623065333338326333383739316537343338663036653334376164223b733a33323a223765383733613633396633653166363635316265623634663764656464383264223b733a33323a223364313238393231663538306237326664393030383730323064623164656532223b733a33323a223739313362353534333335613934666466326266386363613033373731363238223b733a33323a223631643166343737333062303133613664646131396535303266393164373964223b733a33323a223936633364666366626132323466663665313830656464656435313561633034223b733a33323a226161643361373137383438323037393066366538313030333330303730393962223b733a33323a226264346532353233366530666564313631373463623764316138643063656534223b733a33323a223063326433386166336361326462633661386431333065303766383239393064223b733a33323a226131373633646635396536306262646233316565373938363562656565343565223b733a33323a226337333761393731323939313661303237313766653039643137623734336561223b733a33323a226130376663343533306538396439396561343964323732333531303331373633223b733a33323a223234313539353463613430656131623665386236316337383263646466666338223b733a33323a226135383735323731643330333865323965646338626638666433326533323935223b733a33323a223739643865316339323365306333376638383830386338613062326165333733223b733a33323a226335643036613465646538386431373631313439366532343231636433663332223b733a33323a223832393832323234353535346137383164346436386337636163373265306534223b733a33323a226333633665326261383366633931376265393332343161333435643732663135223b733a33323a223730346465363464656263613366323335316130616163616131373635363333223b733a33323a223066303839626230386631636636326230636431393333333737396237656534223b733a33323a223335356366396335636163616532303134383330333233363934343538656332223b733a33323a226230323062653739626437613163366161613062663666633236383336316233223b733a33323a223061666331613765356635343331623338313535666361333365636431616330223b733a33323a226466633364623461386235306564353736336536653937613837626234643535223b733a33323a223035613633623536666532353264613333356535383737366435653030373036223b733a33323a223036396362366335333131613766323461616664323135616266323838353165223b733a33323a226165323131656633653139653531643534366639323631656366306139383138223b733a33323a223031643361336232653138646639653338303064313164396165373766646536223b733a33323a226164656666376565363136633861653437663230343662373564666263323966223b733a33323a226537373864316637623536623736333236633532396639373931363566626339223b733a33323a226464326434633430303465316335623735386561646665383238383339623066223b733a33323a223366383739366534383763626433626166353539373736663762306635393334223b733a33323a223432386234366435343732336435653832613634353365326134623939646437223b733a33323a223865636162636432643038336163653861383632373339396564333164646361223b733a33323a226339663935643932636565653331373936393663613061623737663966346132223b733a33323a223565383263396231376463623535333833613663303366646132656337396663223b733a33323a226437636237323166396538346165343138343465663161326161623131616261223b733a33323a223437363538633838343165373362303963613837343737313261373465356564223b733a33323a223065643066336239336434646131376263343831353866353466356664616566223b733a33323a223837356537626135393464316638613865376462386538303238336435393764223b733a33323a226466323831653636643066633334353035316261633538633339613031376339223b733a33323a226561373664393236303866383432653333313466356565623637376364373932223b733a33323a223637326333656361313265663831626538666331636564383739646230313663223b733a33323a226363643830653839643031653164353930353063623865363964396230613537223b733a33323a226364653363653836636330616630383537383135336464303663613662376534223b733a33323a223937376436326237636439353565386539636164366464613133626336663730223b733a33323a226633613365666536336266386464643836663430613034303236363631643633223b733a33323a226132343066353663336166333765643962626662633166373266333532663438223b733a33323a226162346634663766613238323539366133303361366332373233393436326362223b733a33323a223431666166303437666232623030396433636164353436653766353335353438223b733a33323a223937363530663361383961336430323235616161323662663365343862623437223b733a33323a223361326235383530316666396564366234313262616334666164633266373963223b733a33323a226536393639343564323535666635303831633561616139646339366239363935223b733a33323a226330623565366333323839623734613262353632323239663132313463396463223b733a33323a223934393536616233353934653764356262376661613733656262653265623462223b733a33323a223936383963633237363930656166396463383937616566386531313935613138223b733a33323a226636623966353932653636626133636466306661616662666231633931656133223b7d733a343a2268617368223b733a36353a2266366239663539326536366261336364663066616166626662316339316561332d3936383963633237363930656166396463383937616566386531313935613138223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35323a7b733a33323a223839356336333565303739393832313331393934366530646235626336386464223b733a33323a223833393439376339383435396233666138323365373930646237333863626530223b733a33323a223434323630646136323364333765663436303537623039626539646263623333223b733a33323a223838336234616430363466393335336261396636376231383930376664346265223b733a33323a223838313438383433333138333766646462376261326633326630353564656263223b733a33323a226261393137363930303938613731313866353531393930663163663831313161223b733a33323a223432653231616563356435353136333761376134346461363563316636646332223b733a33323a223866376636623361343265346238356434333337383266613231636236343631223b733a33323a223361626661636439313533373531663233353962343238346665363230663137223b733a33323a226561323232336665346363646563303766613537373435653238646463303964223b733a33323a223736653430613761343737356231383630353063316630343439656537656434223b733a33323a223131323633366366646564373166363535613737623063373436366337313962223b733a33323a223662326632386533303864336332656662633862616238653638626333636438223b733a33323a226363613334613564643331353936613764326237343561336437313939376235223b733a33323a223666303339666531376433316362383133343731613735393731353363366333223b733a33323a226666626661626363373431343130333230363730313761393538643964633934223b733a33323a226438323864373930333834373633343635613632666236396536346263643862223b733a33323a223331373030663139323065393731643262616465346134356365363639613639223b733a33323a226530663235656165356434303666613262303834613137396262313338366633223b733a33323a223463643161333464663730343166363861376464636161353333326534356639223b733a33323a223737613662633938343765346536356462376535373564653530376338613333223b733a33323a226635653264633136313235376266363462666161313832356431633932383664223b733a33323a226233643834323765333530396661363333346362313635633165396530383965223b733a33323a223466643739386434373066626334363338393765393230656465333931613663223b733a33323a223235653139653336373764373638333737356366646166366364306263663663223b733a33323a223265373533346537653038656336616235323462306164633738333462663365223b733a33323a226163666133613235343039333463643232623062316663373431343630303237223b733a33323a226563326433363337663933396665636166623766623233373634376430666330223b733a33323a226634383536623037646464643531303566326534336236643730376364306133223b733a33323a226330666239393637316239343665626463343032643339386139646461633934223b733a33323a223966313630353231623866656164366331326166393937346336663662356233223b733a33323a223134393537663261623738386364313038313132316262376635346433616631223b733a33323a226466343666313430333863623465326362613634386666366339363536323839223b733a33323a226639633039666631613136323562666236326238666638663232353266643665223b733a33323a223031383766666431336533303663386635386165343164396364623430306666223b733a33323a223662313765316364656132663033393235626561306631626561663131306366223b733a33323a226335333436656162666335396561616262653134613336356234326162313961223b733a33323a223766326563623439643433616232383534393131346331613134313938396464223b733a33323a223435353437623265666237353462386238373630643136393336633331613735223b733a33323a223735373433373332303631363462323231653532653563363031396633346363223b733a33323a223735326361643864616361306263363964623339613436643138373737303735223b733a33323a226266356231663330663562316362303165356339393730336365313130393663223b733a33323a226138646134363263326138313564646661666263373537663239393538346138223b733a33323a223363633133663732613039336237316436633637326261643230326466666266223b733a33323a226636333962653132353066346365626534306531656232653566313033613130223b733a33323a223938393864306464346461653632333936636366323130376562653631353631223b733a33323a226661623264356331346666303434326235636138376234633531376336316431223b733a33323a226266636638346362396334643063633161643030376562363736323035663233223b733a33323a226334353535613430383430323335386632326232366337383465393637353231223b733a33323a223834353032353764373862626536393039393835646531643566303761613766223b733a33323a223064396262643839616265356661356464616662336161356663326135353935223b733a33323a223939336337316135636330663464623165306536326434616135316565373431223b733a33323a223762336266626431333534316132303539383865646136353837616130383435223b733a33323a223132636363306630336231656165393738623039633130313564306165666431223b733a33323a223565363733336336336461323764313931626634363962373030343439633034223b733a33323a223738613230643666343135386262373039363036373266396162353838383433223b733a33323a226530336461336637396433303266363035316230346439616535363263356531223b733a33323a223561326135613262363736636565653733353965663665636239386539646231223b733a33323a223431306130323439633938363466396438346434333961613239393138333765223b733a33323a223061346333376130326665393036323761323164363939323332303662313165223b733a33323a226265373466393834623432363165393962353634363435343538323362306666223b733a33323a226163373933386638373136373161383438636165643735616333323262343833223b733a33323a223234393362306637386566383863393432356462616465376637383831356566223b733a33323a226533313034656636376439393162303632613462633238373932396433343630223b733a33323a223938393136666665626463343963363365393462316136333761656661383536223b733a33323a223638363634616165393537623235623661396435393164376566376237333461223b733a33323a223265323935363432653662643561353133333538393732386261306130633566223b733a33323a223636306437313238623134353662366635636562343538373065373862303436223b733a33323a223332663562386236366462643231333161353762633838393530316538373666223b733a33323a223839386138646439653566333132633737316264353365313866373831353266223b733a33323a223031306662623431356237353234653366643962666564346365363161356562223b733a33323a226136343262323534356566646564353462373138636161653830636235313162223b733a33323a223464356164656532336338653339643937353330383064376462383962623032223b733a33323a223638333139393038333038343737616435653163343139333739343033623639223b733a33323a223966373865333863376534336634643635626238396632343437626161636333223b733a33323a223164393738666665393431636561313632376634366566376662613366323166223b733a33323a226532363962656239626132393963356365343834663965316234636166653864223b733a33323a223365616635386434343264376566323733353663396232653531613938653937223b733a33323a223432306131356164316237363433326239386130353263323734613535383863223b733a33323a223637363333376335623432623062313334333438623534643433373366666131223b733a33323a223362303764643035333565363936326333363137393939393062663337333139223b733a33323a223535316538323635346437633735626564373430653937373662343832633464223b733a33323a226233346437376230303538343762333561613962393339653765383832383839223b733a33323a223931303930303266343137663663626365356439616562306630353034613264223b733a33323a223261633966366664653836376265383738633562306437336132316166316235223b733a33323a226163396165643966653435666465643433653932623662613832636163303237223b733a33323a223031643731323161636637636433356234613661363238313964313562353066223b733a33323a223136633035663765336163326166396533393863663533623462333136333136223b733a33323a223137376539386239376161323966623532393831383231323134393962663338223b733a33323a223835353530366432363732373233316236386132636237376432623533393639223b733a33323a226162326233316234323430383966376637396232373435646431643664646561223b733a33323a223530656162373238343963613932393562633334663837363265366130316432223b733a33323a223339313164323439663762316232316661356335646637303762356133333463223b733a33323a226661313536653264663738666461333633376161323236313734616664343233223b733a33323a226238646635383163623366393038393966373031636662323739636163393861223b733a33323a223433396533633930656266383332356564633930306533333432326330366438223b733a33323a223639343834616264343732626631636361303938323562656136636563653939223b733a33323a223335666337376131373965346237366166633138303764396536373561323965223b733a33323a226535646232663636313430636135306132646135376231346635336231323237223b733a33323a223234383666383233373634613761333833336235373431326661663038633334223b733a33323a226537346435376339333933313931356563623465306461353137663134386565223b733a33323a223464616135646464343062303132343864666332326134653831666538356537223b733a33323a223339386237666330333334656331646137313939653462333830366535366136223b733a33323a226361656264623339396462333463353063326366623238303530636463623566223b7d733a343a2268617368223b733a36353a2263616562646233393964623334633530633263666232383035306364636235662d3339386237666330333334656331646137313939653462333830366535366136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1714926911);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('ibg59bqnkf1apegetd0eu08ufu', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333534353736392e3236353339383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f716c74326d693571656e39727633326e717675643965616976223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534373839383b7d733a35313a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534373639313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731333534393234373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534393236333b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534383738373b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534393230343b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226431633934613265656465356164333436623065363839653033666233616263223b733a33323a223062366635633637393537343738636331303630626362613363316337643233223b733a33323a226334393231646364626161383661646238666334373939316339616234386435223b733a33323a223662313965373266353366333930303239323261376162383932656664663961223b733a33323a223238316133663035393238386462616665633437313063343766363739663435223b733a33323a223735306362363038643037366434363962636239346165663862643636393736223b733a33323a223236663363323731663030623139376662373535633234373633393132323764223b733a33323a226362666332323236636362646164633330623139633935636263656261303238223b733a33323a223431313165373538316339653466643936633936393938373066323331616338223b733a33323a223863353537306361303162633761363465623339623564306366656562353131223b733a33323a223066613836353931306564643838356561383630333332376430643031386339223b733a33323a223030313230383437613566383539653165613234353963663565663136303434223b733a33323a223661636366373936333031636564386132363432306134666666613739303735223b733a33323a223436613630323566333734656337393435353632366363363564663037356130223b733a33323a223465393936656635356566373335306434316264653162623238356534616463223b733a33323a226134313335333933666333653034376362656364303238343130383264343862223b7d733a343a2268617368223b733a36353a2261343133353339336663336530343763626563643032383431303832643438622d3465393936656635356566373335306434316264653162623238356534616463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223066623166363831353230356438303838656564353236663531663332353566223b733a33323a226664393861636430616463616663343731376539656632663966333065333164223b733a33323a223165373466333661316164613939363664636235666431303466646361363337223b733a33323a223437633466353366646364623131663937663738636331366265613331656564223b7d733a343a2268617368223b733a36353a2234376334663533666463646231316639376637386363313662656133316565642d3165373466333661316164613939363664636235666431303466646361363337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a226433356438316235373966373930396266306262346166656237366164636539223b733a33323a223262326432633637326564616365613562346330663032316534623230323138223b733a33323a223833343736623165653965373535613736323162366136366232316432383534223b733a33323a223866396130343961386466396331396432393563386266353936306532363731223b733a33323a223933356236353164373433633536306261616365373065336164353966306234223b733a33323a223136663135666166356539613637326536316136396135303832303964303963223b733a33323a226634663338643566396630363232303363636634376135343733656137326166223b733a33323a226432376534316263663663643738636364373130363330643866303933656166223b733a33323a223038343264646539643035613636363863616333363335373435336437396531223b733a33323a226539613163636564306330623732383962643765323365333531643538613536223b733a33323a226163356465333738353033363364633662336130613265373463303664613437223b733a33323a223238626635326564646638623130666636333866643339346636376234373861223b733a33323a223162663233366230636535343262363166643136303837653238313630336666223b733a33323a223665336333623131623530613838616236356438653464333335623933303263223b733a33323a223432343066646136316265316236656332623337363963636366663763386539223b733a33323a226535336539306530323766316232366362663532613638623637653137343665223b733a33323a223237623733646434623366663463376563323766626436303064663464363262223b733a33323a226639613963663036396561346365313631653631313564383033383331396664223b733a33323a223035323134363438663235333238323631323737643839383936326438313037223b733a33323a226461666336343463323935616636333930366230386135663466313539363036223b733a33323a223036376131656661313634373139643831636661333464633533623930363266223b733a33323a223661373763643962303463363361303830623861366636326139656533333463223b733a33323a223766343862303638333661316662393738393962633662616530316661383136223b733a33323a223733663565353233333232613664656364383963316339663566663963333132223b733a33323a226334616332343434653262306633653735396161343831666337306235363836223b733a33323a226233333838306165336162373239363035306464363436643464306165366564223b733a33323a226236383633396233316638626638643765633961663962623631393266653563223b733a33323a223163656661366639333263663066353964313130316466616138663636616236223b7d733a343a2268617368223b733a36353a2231636566613666393332636630663539643131303164666161386636366162362d6236383633396233316638626638643765633961663962623631393266653563223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33303a7b733a33323a226336303262666633323038363035653632663064323831323966313432636431223b733a33323a223637643762656436343964656365343736393537666235656264353436636563223b733a33323a223833366364363836616636383532646461383562343034353132386635336537223b733a33323a223034643365653538646632646633303263356564666330333563663365303637223b733a33323a223638633134363037623163643661313536636132346534376665313739653462223b733a33323a226633646332653331366530303264316636353635633262623065623639373164223b733a33323a223065633061613835396435383838396162383439643831393437333263336466223b733a33323a226132343365326264326331613836383931383938356230333937386566333839223b733a33323a223638326233383738336261616263656637346139323731626335653735613063223b733a33323a223734363233346238306264396139386135366665313732383531623762343037223b733a33323a226663383738383538653032363134636531346139663831636166323737623564223b733a33323a223835663562326365343463633830393861316131353337386134653865313036223b733a33323a226265356133386539653364356536643762636238313838653730343330326463223b733a33323a226339303762613434623439336235643734366235366430376366376164383061223b733a33323a226535393961633632313037303930313763333137613436613732353862396264223b733a33323a223037343836366235343735333636363264313063613761396535333932356531223b733a33323a226138643437653033353461346361373131353166333333376539616630393235223b733a33323a223439343262353462376338613962306639363134356438623633646232393430223b733a33323a226334366433323736393162383733386133323630383366356266376138653533223b733a33323a226563666566313231363566316133663761636530376138363930386466643865223b733a33323a226533353866383331353035383535313135656261616262373035366666356338223b733a33323a223062616666343935353465313565343230633436636166643633653831316238223b733a33323a226462353762353064383938313131373334376634633562656661346634306134223b733a33323a226132633166643431663233343439656434323138383835666434376634643937223b733a33323a223736393339626237623166633832313533623161356462373962613030343833223b733a33323a226236343761633764303763636230333632333934656332323639373164623731223b733a33323a223161643237666431653032316236343839383662616363363936366236353632223b733a33323a226236356364393732393930333165643934373562616161633664386364633237223b733a33323a223763396630396265633564313632366461633034626138623363353630633136223b733a33323a223735613637386665366564383935333332663234326239643864663062633961223b733a33323a223933376236623063376563653765613031316530653265626433643230633230223b733a33323a226333616561643232653439363532303335363934313134373665383639613538223b733a33323a226131646134326237373338376434623461303563663037383037336164353938223b733a33323a223436333834353230623136306636383862653964623932623661353130323734223b733a33323a226463376235666463653834333732323830303937383864366538666365343831223b733a33323a223634326638623361656666333362663439636536323832323534653039613037223b733a33323a223863653265313638303264376134376562626435396534396437623130313037223b733a33323a223731333330333165333861386534363635353334343361333237393764646265223b733a33323a223931396137333761643632333436343964613663643661653433633262336465223b733a33323a226165636138646537663366303832326533313431613031393734623834356532223b733a33323a226637316261623437353237363664323462396465653766613438363533383034223b733a33323a223332373565663739656362623365343065396435653133643965303033663333223b733a33323a223662613932633334633835373131306337616263363934653561323037643961223b733a33323a226364363561313932306263633365626635353866303865613463313765633063223b733a33323a226462363637366638313365633564663865633231656531356236346261643238223b733a33323a223735356666653938333932646466343462343632303061346433373437626566223b733a33323a223034346265626131613661653734343664623765623032396566396236396461223b733a33323a226631363931346162626265643339336565353739366132303633346130366134223b733a33323a223830336363613938666663383336366238613130303666383461316637313036223b733a33323a226635666561373138393265313539653963616364376561626639386232313739223b733a33323a226266316337626435656664313837336636346336663965303962303735653335223b733a33323a226639393436653661646132346166333631653636616466383265343035373364223b733a33323a226334366635353533626231313536366465333438366464623332313333343964223b733a33323a223333333734633239333431666466333962666634316639633165396265306165223b733a33323a223866336636346232633237306434383537663736666664353031643337366633223b733a33323a223236663562613437613431383362613133636166396631616434353062613835223b733a33323a226565336435373234346535613635636534636236613139636131353233636133223b733a33323a226335393462313666373064633464333931323266336132333231333639396663223b733a33323a223132633766393434623965366137333032623236303863646666363261623064223b733a33323a223966386532373363383636303465383636623138633062336566636661613538223b7d733a343a2268617368223b733a36353a2239663865323733633836363034653836366231386330623365666366616135382d3132633766393434623965366137333032623236303863646666363261623064223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226234353238393835383930666662383730653433663864343162623737353132223b733a33323a223762366364353430343836356333303434303262313437653530366234313265223b733a33323a223139656462666563353561623264353138656133386663623430633966306332223b733a33323a226637306537623661643532613532353666366135626232393539366466663039223b733a33323a226531346564306431613935653466386639643639393130326365386234386262223b733a33323a223861666637353966393136633231623363623131653232396437396631643338223b733a33323a223137633566326463646362353966303838613437303463313164396436386237223b733a33323a223030343836356335336331626135346635643139626363383635663738376236223b733a33323a223061376536633965383166326363363663616330376232356332316131663138223b733a33323a226361393530636433633663616161386131346535373264643231353866356433223b733a33323a223734653636313732633330303232306266353162333631613762306632353430223b733a33323a223637396338363266623330316663393339633030316631346563613238323263223b733a33323a223333316561353438663438656466306439616131326530623364613965306436223b733a33323a226336346237663430303164643134346533666431316534363862663864343736223b733a33323a223961333664323461336230646138376532353561386334343661666536623463223b733a33323a226532323830396332396533343032663865373537613039323331626638343566223b7d733a343a2268617368223b733a36353a2265323238303963323965333430326638653735376130393233316266383435662d3961333664323461336230646138376532353561386334343661666536623463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226232373662653063623538323664643565663235313965303266373432316537223b733a33323a226137363761316234333235643232613862386165353237333863663135663035223b7d733a343a2268617368223b733a36353a2261373637613162343332356432326138623861653532373338636631356630352d6232373662653063623538323664643565663235313965303266373432316537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1713545769),
('ijfog1umqd0bsb27ebb1ags5gs', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731353738383936352e3637323537383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226773657062346c71387666317131366276726a64616265356637223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353739323435393b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226233386262663336663433626264366163363137346566623631316138326339223b733a33323a223432376130306639333362393931323664623438636461303966346431313234223b733a33323a223061323932383666383434653032383334303939373032616562343864383433223b733a33323a223464313431653638376163646266363463663335376231663337396235343731223b7d733a343a2268617368223b733a36353a2234643134316536383761636462663634636633353762316633373962353437312d3061323932383666383434653032383334303939373032616562343864383433223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1715788965),
('iqhc6s83a3u1vnjb7rmioh2cm5', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731353039343332342e3636333237373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6c64336a6b326f706a71336e63376269336a6c6a6d73676361223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353039353733353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353039373932353b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226463316465663031316464666336383631343234656533336564633463656564223b733a33323a223365613663386162306138306533373433346561303965383836636537303635223b733a33323a223565613862666238316162363337313561633332363034666533393230653563223b733a33323a223265646662323765313334653937633362373038346132393163366537623663223b7d733a343a2268617368223b733a36353a2232656466623237653133346539376333623730383461323931633665376236632d3565613862666238316162363337313561633332363034666533393230653563223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226232326661343230653861343965386633353436656132306364393864353764223b733a33323a226137633565386666643636616366333438333330303266373733356563373236223b733a33323a226130616430303035626262323461363932653263366334353362623736336432223b733a33323a226663353938333939626632613062663335316534326539613230653338653935223b733a33323a223030643935363737336131383330626566616132343263613838313866383738223b733a33323a223839396439343639663230616437643133373832303661336565303133386263223b733a33323a223762343763346332633135363135336661643834373630613138303861623237223b733a33323a223965323632383832363630376332613733646265343738353532643463323237223b7d733a343a2268617368223b733a36353a2239653236323838323636303763326137336462653437383535326434633232372d3762343763346332633135363135336661643834373630613138303861623237223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1715094325);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('ll5pcucodd8hp73guktr1lflnh', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731343834313337342e3433383232313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22393062307237396635366163656968616d347536713839707070223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731343833303531313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731343834343336363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731343834343437303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731343834343334303b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226631613933363036643461613366333166376338656364323135346437373931223b733a33323a223133633537626136343665656432623431323031306434386364373432333866223b7d733a343a2268617368223b733a36353a2231336335376261363436656564326234313230313064343863643734323338662d6631613933363036643461613366333166376338656364323135346437373931223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223365323665346236353232633632633431376232663162393738333731373632223b733a33323a223030366463616432316632326366626339393435666531386339663164366465223b733a33323a226537303366623432346261653262373630313638386663383561323537353866223b733a33323a223234323835663561313361336330313830336637623336633132303738656633223b733a33323a223138366233333236386533363465323038323965316430633438333964386162223b733a33323a223465653330303434323533326238306532353532343637373563653165613939223b733a33323a226433333631396537373562623863616333323838616636316639663735643465223b733a33323a226338636536646365636466353238666133306662366335396131646334343831223b733a33323a223864643262353964343630356135316136393136316533346564623538616134223b733a33323a226534633330616531303736386261656636366333386330386536333034626436223b733a33323a226231393765393862346533376365656139363030316263646464363261303534223b733a33323a223035613933343536386433373736653232316363323235653761366632323032223b733a33323a226163656231633563633761663234343437386635616538646538656235343839223b733a33323a226536643030656537636537393139666562353832376636393566316639336364223b733a33323a226239663535643635326366626238613661333133613261656431366665396530223b733a33323a226236303263353432386232393531613030316536616263623930633763316464223b7d733a343a2268617368223b733a36353a2262363032633534323862323935316130303165366162636239306337633164642d6239663535643635326366626238613661333133613261656431366665396530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3133373a7b733a33323a226365303631613166636233346230633139343236363066646162303663633138223b733a33323a223461656664636336333666316330346663356563323739623666353937336632223b733a33323a226262616337373030373431343063313761333531636362643661383634303430223b733a33323a226331366530633564303730646638666131313464643932656663363433393866223b733a33323a226164663163666634323566383034653262393362623538666638356137383435223b733a33323a223438663665353539373039613236633531303161666566346239316136353232223b733a33323a226534633232616332636562383837626463396663653964363233353936643566223b733a33323a223736396665306133643832346361613735396264613930313237643139383334223b733a33323a223332626635306536346563666461316532393662343065613535363963343434223b733a33323a223237376464306232653934376131366637393338356333613463656334643633223b733a33323a223165353664386166343837393464653231323735313666356434326163643265223b733a33323a223132636136636662376337626331613966383066666638626333326165336332223b733a33323a223464353164626530656136643962333035646234306535316539363939323538223b733a33323a226665623738363537303432656364343961323334303164383361613933633138223b733a33323a223963353466643132636138633735663638633537646361323035333539396134223b733a33323a226133666437393235613164353864663135323963643332373761323466346436223b733a33323a223938666162656537366330646261366131616133323263366462376162316334223b733a33323a223664653735653335393562376139376662626133313961666134376133353434223b733a33323a223938376365396633383536666631336261626536656336623861633833653238223b733a33323a226265623730323364316135386638393162626431663233393933666563643939223b733a33323a223935326562333839383534643330326431373663346464376464653632386332223b733a33323a226465303964333030656432336266303462643235653030633334316666353639223b733a33323a223662643061393836343361306130666438626139653636633864633033356534223b733a33323a226530613037643666613961313935363865623032306236613130363937336230223b733a33323a226633343863633537633637326632653733663134366635666333303038636363223b733a33323a226564646433356336653732633265623764663238613366653533623630623962223b733a33323a223534356463626433646633346338316362666432613037333762633166343833223b733a33323a223063353038313963376166353263613839646566333833333432326363383334223b733a33323a223139666533346362626132666432663434613633646566616262333930343866223b733a33323a223436326333623035663234666566623634353463353235303731336530323033223b733a33323a226465623031646462623436653336633766306238313630653239636337643335223b733a33323a223864303837336435353336616432626664346137326234373262653665393265223b733a33323a226330656263303839643432366632306233636438333165313766313034656462223b733a33323a226437333833346230353934666238663261366461373361336135376264343264223b733a33323a223264356131343831313438303464356332646131663963643731373931383866223b733a33323a223466376337656132343931373432353939306565663736363838326564613264223b733a33323a223935633737306564303538643066363530633632393764313439383132656462223b733a33323a226566396535333634323363333735336531643537353265376566306534666238223b733a33323a223531646464653633343163373235383837386634663537383664383339366139223b733a33323a223966313662306237333863653165323965323964306662613836353332633239223b733a33323a223433613963623036653733363338616632393563356138313838386263306330223b733a33323a223736653431303639623632663034393135373966646535356334633466336663223b733a33323a223563316636336136656437353231396361393836383536396365373533393066223b733a33323a223532383666626362623964373239343165333931356138356635303665306464223b733a33323a226336623130393361316231303438633264666630663436623866336631363035223b733a33323a226533363535333335306537653831353837303439613962343432643130623766223b733a33323a223162306636653066653737633434383865323539313437643965356662393134223b733a33323a223862316533343930343832353863306233316533623461666337636462303836223b733a33323a223161663039313738636261323333383866653939323432643738653035393333223b733a33323a226162343262353930326437326361656561323762613430626631343762356432223b733a33323a223434333362313338616264653362623265643339346437373534306365326532223b733a33323a223832616139396439316537356663313732633039333533633836333139353330223b733a33323a223638353833303530323165636466666333343961326163343930333236666639223b733a33323a223832636237323438663533393439656531333236323263623739366230653139223b733a33323a226261323935353039346139353862363337643565346638653337303534303363223b733a33323a223733376436666465346362623434303037323066323438393861306135353731223b733a33323a226564356131303638313133626233313863363237623433353730643164363564223b733a33323a223962643135653862656461363038393630633532653565626339633532386535223b733a33323a223865306339306462616662313132626465616565666263343766373862383463223b733a33323a223339643564373830346465336436363061653333303465363738636532653136223b733a33323a223735313362666636663265363435336439313138663462613064663135373463223b733a33323a223366656362663962316164353335656231396364343234393736386264393662223b733a33323a226666333064646136353134343836393237383162393761653339653839396163223b733a33323a223233663230313830353534353439323030366263653966306438313861663366223b733a33323a223563303563616634666336373234613638333962373630623036393138396564223b733a33323a223536343261643130366664633936393838393465636161663936333835313263223b733a33323a226537386163323539336230316565626134643564323537396135626134363632223b733a33323a226531666134666630653866326361373664326366333737623239396666366661223b733a33323a223366623936633766663364336564333965366666363330613936663561376533223b733a33323a226466623835383432303862363033316539396335653462333763313436346433223b733a33323a226233356366303166663664366635633739633336333534313966643639393439223b733a33323a223339386362343261663539353461313432353037323033616265353830376635223b733a33323a226132663838626364343136336535313631313462326534316431323861306165223b733a33323a226131366135383737346266343932383063313962336263656566383862303763223b733a33323a226535653739643661346231623431336635643263366135633765613135326435223b733a33323a223434656431633766313663363663303137396138633530333936623764356333223b733a33323a226561336662326532373031666536633432653161383732663934666334386566223b733a33323a226133353862396264323063373764316233373531663530323266333736306237223b733a33323a226462303133623136336435356437336438663766326235343632393661393334223b733a33323a226661646634316363303439353235353566646662393531313063353836323862223b733a33323a223538383731343161396634613466616637363664623763353338376436626436223b733a33323a223463393835306365643131643630306532666236343965373530396533303561223b733a33323a223762623064613337393665383263323637366534616566313238353362633866223b733a33323a223236326134623239613836383265653961383661663665386336643232336137223b733a33323a226264363135663364323832326362383165393063646233336337396664303434223b733a33323a223531656336353031346666303365333739356231633638636136353962336463223b733a33323a223563393631353131623936643263376330616133333134303961363636373538223b733a33323a226563333962393264353234303732323662646638393461353363326632653865223b733a33323a223533323236366432396532376630303266316136613361336562396463366531223b733a33323a226135666133333833393431646630653132633235656230336530666466376231223b733a33323a223030323463306163653235373538303235386132386561623833663363383635223b733a33323a226137343530316539396465656538386138646465316532636635393430613061223b733a33323a223865363132313236616162353037636138386430373338363765643233373666223b733a33323a223534316464643631353439366433626266323564386236326135666162393432223b733a33323a223365356165313634656630613931646233333063396630386562376130393363223b733a33323a223431396431656135336632653939653966663864326639656466326431393162223b733a33323a226635666564366536616537373233646262653932326361313638396364356137223b733a33323a223130303662626137643032386230346630663664313836656237356534633237223b733a33323a226135356636633239653663623861353162396433376662336539646438343939223b733a33323a223431363439646366303764326435303761393964333139333362656435663937223b733a33323a226364376130643637643039623135313362396131383363643937356662616636223b733a33323a223137643134313433623132653664393232636638626435616334393438633065223b733a33323a226339653332633563653738366363666238356531346137626437376234636330223b733a33323a223231646334613539313936646462363934666166656632313234623732663361223b733a33323a223134316566383135376363383330373364323736643265666131303531313831223b733a33323a223437643765333336346362366436623363343537636661623662336637303333223b733a33323a223462316536653866313736613035383437663236303164393739336630353635223b733a33323a223461383763326230656636363237373537396261323463613561323630306338223b733a33323a223763393635306365333962386338316461326536333530323962303434663734223b733a33323a223230633966646463643766386562663135353332323230323234316465303263223b733a33323a226162313463623666393362356661636238313037356534636365383932326665223b733a33323a223131373235366236326136663164313731633032376237306265303133633831223b733a33323a223266373066303730333836636661343839366535316636613030643933393838223b733a33323a226438323962326161333239623933643031333630636431653038393337303562223b733a33323a223836653236313738636533616639613939346165653366636434313134336563223b733a33323a223463306635623131613037313334613835313233613464383437663234653861223b733a33323a223132396133373663346263343238626339643231303233656135333665363466223b733a33323a226339633261353138306237353034353565396661353861613165323335363061223b733a33323a226337323465653662633863383634393463393234643563303730666132323265223b733a33323a223164626430313930396332356264313566303131373463633231336137336437223b733a33323a226262353931383635343530326431646164616632383263646433373138626134223b733a33323a226665313635343931356265313033663262376532656537613239373861313565223b733a33323a226631656531336130366430643262353435666235366432363931613562313332223b733a33323a223337306334326534366466626634623034653035326336373366313639313035223b733a33323a223730643763353737316162613965396264366637313563653839363265323236223b733a33323a223234653030323666393938666463623862653231303335393361366633643162223b733a33323a223135613366633939333139383532656639626131646530393837386630613266223b733a33323a223462363464613636663130623663316639313031666463623061663132396332223b733a33323a223339616437333230303666333163623230613636653532306664363430646632223b733a33323a226364643136623536333137373565626665313531303131643231383436633563223b733a33323a223134326232616166653433323537323032313462386336343539303632353132223b733a33323a223663643435623434626666316133346131363230313337393530383539396637223b733a33323a223838373564613031633936386236633862646265363061643165326538356263223b733a33323a223231316233303835373532393138633766306133306666333431326539313137223b733a33323a223430353732663466353238383964316466323636383165366536663231353231223b733a33323a226366626163363132363238386236336533636233646665663533623734373132223b733a33323a223662623166353336633361636436346665616436313638393732386530616537223b733a33323a223332306631303636326262616137323233356265343130363762396139343963223b733a33323a226330376532323431356135623736303133623430643465373536393739363038223b733a33323a223831623762333235386537646636326163376130343565336564356666613061223b733a33323a223361333939353039313065333735333237633136303337623631336139643235223b733a33323a226461643632383564663864333133336663623436363063643139613132383762223b733a33323a223463376663633964663437633362363666356264353466366532383561313661223b733a33323a223664363430666466613766393632306530306439643364333262666161626434223b733a33323a223734316433333538353066376136666536326431353137383037363063396361223b733a33323a223964663664316130653665323137393866666363643939373937383831333437223b733a33323a223264643263356239373236383765343434613733623635313237636438613435223b733a33323a226137653063623239656634623332323638666564316234336137653232336666223b733a33323a223132306631383034636365383435613130336165646639336338666362316139223b733a33323a223130373731633534636562303566313932656232373830653738363335383130223b733a33323a223065303265636433333939303566303831386237363766313338373434346262223b733a33323a226630313736326362393439613330636463623138656530383638383838616131223b733a33323a226134393866376633373066353139376239323533613434373435613765376535223b733a33323a226661366533376236323365393332616530303966613235646334303930326438223b733a33323a223164323762323266353462613364623537383737326638376536636334386561223b733a33323a226232303436326535613461343466363338616465663133313335303930653438223b733a33323a226564303834323531383863383062636537336537346435626338353432663666223b733a33323a223635333232626436666538393337396135333734343839356238636463616432223b733a33323a223633623037376332343339383663346431393331306133333336303631336238223b733a33323a226536383935626262656433386137646632663564323233663139663565316462223b733a33323a226135366330643766326237653162323865653334373132323936353361303965223b733a33323a223638363632646337303535643135306435663431386335346163643263613463223b733a33323a223633646633346136373836333231346661643361313535383631306431643365223b733a33323a223566343533346430373431336436336461393961623030383264323530633761223b733a33323a223936396336363132396131353439656164613139393633643237663737666166223b733a33323a226564303364656561613266366164303136663037643062666462316639333865223b733a33323a226166313563626331373930663765666432353766353733373664613536626433223b733a33323a223334393038646261383334383638633163643461323364323062336239386162223b733a33323a226237343733343937623361396631633539643864363562643638633863303961223b733a33323a223038326337383530386136646563336630393666623964333935373461653939223b733a33323a223566613538346133373133376263393532303666643435363139633330343636223b733a33323a223164363961343935656436336262316638663938626532333563666230343333223b733a33323a226462656264643138653939653331643264353362663234633463356637643165223b733a33323a226563346632363834643233633331336131336561333330656166303133653163223b733a33323a226332346664373664616265393438313966353031313135306362346364323133223b733a33323a226666663861636462333761613562373063623939353138363734373361356664223b733a33323a223366316530356665363863343636386530646262306637396339333061313931223b733a33323a223265356433373664343465376639373533363363343364366134363564613335223b733a33323a223534653365303330363234333038396639383537366631303535313737626332223b733a33323a223162376236376333383433313138333535393163313231383262306634656434223b733a33323a223466383231316366346562353464336330333938303937353732623434373837223b733a33323a223331656665343164386266646165656634333763616362303965373765336666223b733a33323a226431366431656366386237366631663361323762643730633536336239636265223b733a33323a223466646530323466313666353731636235316565646234346136666537356333223b733a33323a226261343864303235353566343366656439613032383166353435333833643862223b733a33323a223035366166333638366538313536663365613062306636616636333737306531223b733a33323a226531643466336339376464373336306136653636333366343134366436396464223b733a33323a223633386332333630663262333532663632316639383565303461623333646233223b733a33323a226461376237656139356361313165396632376531373533623461333663616565223b733a33323a223233663164633263623961646434326131373365316638376362343537313266223b733a33323a223231346361323732353065336233386163346432316561646363343534623936223b733a33323a223866303065643735636465386362383632656565393332613833373333323737223b733a33323a226534613161313561323439363735326233333235383339333165396636356233223b733a33323a226631326239333934346165346665323262373536626437343365616263383765223b733a33323a223532386234396566623165343066336135393037663838316562636332366365223b733a33323a223763383237313137383332376133653930356361303430623632383034393362223b733a33323a223065656430383532306362613832376438326336636262666432386134373432223b733a33323a223838383139393132663563646163326362366162646332616564613161393730223b733a33323a226663363932383463343139313832323365373530306335316264333435313064223b733a33323a223830346532353434396637326230666137346137643734323134626334623030223b733a33323a223737396634666530623035323035666636346131306463626334616136653266223b733a33323a223035633339656337373230613731376232643938356464373262303064306464223b733a33323a223730353733646632613662313161383731653063396539643330646564346263223b733a33323a226433353264636565376530383339306364613234353238303338303739666334223b733a33323a223739643932313634346437663436383537336335313530373763643239356163223b733a33323a226365373930386635643638393230616433656163633862323164353135633930223b733a33323a223134326430623534303132623131666537623864333765396238386565633634223b733a33323a223866653534633265633134303237393632393036373233656134316638373730223b733a33323a226437343635646432313965306463313364373737386565366431366163303839223b733a33323a226636356339653531343138613864383164363263666236633139646630356235223b733a33323a226664353638623365623561326639383362346432613364373561396132633838223b733a33323a223531383535646531343965356337316430653235613537343433653766303031223b733a33323a226238336565613339663934336364363133633632383364303331393666353830223b733a33323a223036323566333939613962643838663131336166313561613435613039623133223b733a33323a223965666234643532336164656266383663386362636236346464663137383633223b733a33323a226134636164313538646666313539613362633530306433396632646339663266223b733a33323a223133383664616564643234303966393562333165323338316461633366653638223b733a33323a226336386336336134353130313039383266643832313731306238633134613635223b733a33323a223066303532636230316632396466663530656231343065393733333963393332223b733a33323a226635626438343133613839353464383235303631386364333763346637643836223b733a33323a226634313931363934643665396366373830363238333533366332653832333738223b733a33323a226631306366383565393165363761386330353139343035656662333438323135223b733a33323a223137303366316532643334353839663536383435346535373765346330643736223b733a33323a226431326536656533626135333733663630303733393338336535666161303362223b733a33323a223037636265343531663033373635346565663032393135636635313534366533223b733a33323a223036373039343162343930393730363766303365353635303366373763653231223b733a33323a223031343837333963633263363535323737633936386436343131643162643465223b733a33323a223162633431316262323238313766303637633065663065633232313333616635223b733a33323a223037393938326634306566653462393265303034363033623530336566623261223b733a33323a226561393562653233623134386461633231303130373864373837303864623666223b733a33323a223434386466643133366630393563653833363436613134653836386136353332223b733a33323a223138633031383239306635346133666566613138323562306239363334626333223b733a33323a223938323336623163343937393137316434336666363162393866653531353862223b733a33323a223763343030663632653537323330376432643661633936363533613830643561223b733a33323a223361313565633762323735326261393734363436666633653837303862396664223b733a33323a223661323235313031306661343761323632633739636365373862386535616165223b733a33323a223035353461663436383564653234633264623062346233353934323330643330223b733a33323a223934613230386339326534633832633438346333373637316237383738313730223b733a33323a226538623531333231306430386563653437616436346633363366346561613330223b733a33323a223366616464366337373234396430353034356231353332636164633065633463223b733a33323a223866356636316336633439643537623464633539336631346137326536366661223b733a33323a223033373966383435633534363838303534383762316336363630393431623330223b733a33323a226361303932373536323861303034653066666361346335626534653263646563223b733a33323a226463313861336665613635633864393063333939623934653032363164373634223b733a33323a226164656239646538303466376433373966626162623763313532363834616163223b733a33323a223033636138336533613638333434313863396336663832643137633234366133223b733a33323a226663366261663539653932643565333731653834656139646166376432636135223b733a33323a226262303265656337313966633061656165313164623134326637633964356264223b733a33323a223230626163396231386530633334363034326233646264353761393862626564223b733a33323a223335323839346630616233613130323830373532376237363038653161633638223b733a33323a226538346134666336303737616331323165386334313830366566613537353732223b733a33323a223831653933656563623433633239356336373136316330363034663230353763223b733a33323a226463366262643963303335633932376664376637323236636666646331306433223b733a33323a223838366431626131663730363035373034386638323465386565363733613461223b733a33323a226530643033373734353763386338343563313366643038323361363337336133223b733a33323a223933383266366335663839643831353134353039356561393162646434356137223b733a33323a223262656662623561363861383462366138666233323534616230353761666165223b733a33323a226637396464343461353236386164616236663066613230353961323765653832223b733a33323a223062613365396539323431643465316334643133653930626536393136393862223b733a33323a226166616463643739633131306433383564373133393030633338356332623761223b733a33323a223765616161643531303736643730363836653165376635323831613336363339223b733a33323a226665313536383232653764656431643032326161393662313139623166653130223b733a33323a226162343535363330636161383933353461623134323565623264306264636663223b733a33323a223934313030343631666363626238366536643863383665663264386533643535223b733a33323a223834613763366534653938333564316235313636326364313737656230383434223b733a33323a226339623361653135323038333633383062313930643434326339613365636334223b733a33323a223864363531343637623861356631313530333138323438383231636337373165223b733a33323a226563633034613162393666616339613037386232353037626261626466386165223b733a33323a223937323037353833623061356365653566613761356463356435613965313562223b733a33323a223561303161393634383966356466666133363934646534613331623332313435223b733a33323a223262363232626132616535323864393433376233353138333233626239373462223b733a33323a223166376635316436306539626236636262396564353333323739386466643335223b733a33323a223562613961663732336337653535646539386461613134313364313265663736223b733a33323a223132643666343134346633393962313562393564373230646437373735353231223b7d733a343a2268617368223b733a36353a2231326436663431343466333939623135623935643732306464373737353532312d3562613961663732336337653535646539386461613134313364313265663736223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33323a7b733a33323a226432613761663362366261356536616562306637383938623966626336626565223b733a33323a226261666466316239383364346238623232613162303636363362303061353762223b733a33323a223434386331376531353763373537633337656239626561656532653739353262223b733a33323a226464373631636461333731663064333964313434303266616161303632653636223b733a33323a223939653136373834666334623037333439363636353966373932316536363861223b733a33323a223762313066383239306464303233356131353666656133393730653464383365223b733a33323a226162393537396439636562636463333734653662613431636361366537333865223b733a33323a226466616366653961386635336636343162663665333765643932336634383663223b733a33323a223234316661346630386437303238653930323764343866353632306134373738223b733a33323a223663646131356431363130316238623062376135336265646365663964393038223b733a33323a223333656261633862663365653062396566323630643437623266313635613963223b733a33323a226462666362303964303166646236653338343633316439363339303266326265223b733a33323a226366366538633662376437653433363031633862626665343961643834333438223b733a33323a223631636661613865303130346136643964363161666630666366373866303032223b733a33323a226335623362623564363466343337313263663663616131353438643538633531223b733a33323a223365383236373933653430383735346163393766363530323430373766373532223b733a33323a223565343562313835363839316536613063666633663264666261353331363136223b733a33323a223966373661383737326164306231343031363961336636616135623739313137223b733a33323a223764643135333664396337333936653631313534336464376233613137326239223b733a33323a223962653165643162653964373063366231373034323765343838316236333665223b733a33323a223935616335353231373635323036666339323532623037633438376133363739223b733a33323a226139663161636466383434663138346234373561376633323564623564353335223b733a33323a223562363134316165373963323335303962623762393533353462393361326130223b733a33323a223930373534383865323935393436306662643334303635626561313966383561223b733a33323a223336373462303064386562343763306237333532366236336639396235616235223b733a33323a223034373963346362666337653933313237373962353262383136313065653632223b733a33323a226531653331336534663632373837623536303761623633643338653736336539223b733a33323a223436316233643164363263313838303661373536373130383932653832393134223b733a33323a223062653938373662346333323932616130336339376339336565393331636662223b733a33323a226231336161363238653635383661613062376634666662333436383232343438223b733a33323a223433613137303438666431656235303635666665363566613032316163613135223b733a33323a226166666334333361633630323732393663396438373534393638613238376437223b733a33323a223036386131663164363436336632323435343839303565363536373832343265223b733a33323a226666393530343937666338393031393438663631646134376539646530323839223b733a33323a226432373032333261653264346466386461373839363533313165313633393265223b733a33323a223063623638383736613331333139383565353238366164656631333538653135223b733a33323a223865356435636336306365353932363065386162366637306466636238333833223b733a33323a226262613739623565316266646439366530313930653036393862383134663238223b733a33323a223231396338643435626333646239323433373465646233313337356135303839223b733a33323a223833393638333039653636366130363839313136373438333966633230653632223b733a33323a223837636361663566633230343436333831306534303163356465303933663864223b733a33323a226334613535633835383166373061363234643437323865613030333634386464223b733a33323a226261313034643838616261333265316239393063383332353563303565396465223b733a33323a223239623635306437633035366161393566356131323837356566386531373964223b733a33323a226637353937333232356433633934383235656534323361373535326235333665223b733a33323a226332356430613261623236613736323436303933616230633433313438313735223b733a33323a223034643562636332396539633061316362346239663536386637326636656264223b733a33323a223138316361376161363639646238326666613930316136376236393435613834223b733a33323a223465653563613631343635626239383638616635623634363964343061386137223b733a33323a226638313236626138663635326263633361623361646166656264623632323561223b733a33323a226139646435653338656531326662373361393463333831666335666661653632223b733a33323a226338626639646139646337326663323465333565343337616564663937393336223b733a33323a226131656134613764306264666463326432353361393764643739616133313362223b733a33323a226663326633663464643636303830663364363835376435373930336462383633223b733a33323a226363623962656266303238386465646465323265306233613934633135326437223b733a33323a223632656464633064393930386531336337616432653465623337653366356261223b733a33323a223432366462363264383231656163343932643034316662333364316364376536223b733a33323a226265343031316264633366326131303334653633323662316466653434303432223b733a33323a226633383761656433653862383363316636666130313231373238346238653332223b733a33323a223538363832363833303839633837353537646466323534646438616534643230223b733a33323a226161316239316165646231333836346632393335343136616437386363663431223b733a33323a223831663032616538306439373732386530356636356639393965386335653136223b733a33323a226361643462656134663635633737326165326630353834656437393630313731223b733a33323a226234333939323264393633333535613232616139323032333031323033626137223b7d733a343a2268617368223b733a36353a2262343339393232643936333335356132326161393230323330313230336261372d6361643462656134663635633737326165326630353834656437393630313731223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1714841374),
('lm6ua3mogsonca5kr9vdp3cnvo', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333838373531302e39383839353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223139697576756338726439696c616f75766f3139617063766239223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839313033343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226236316636653935343761316133343262363638396663303837386336646365223b733a33323a223233656334613065393161323837316261333161373761653961653464336231223b733a33323a223134326261393366626630343037666132666165626631303562346338636334223b733a33323a223936386364373564366662653264353235666330386336313234343833306663223b733a33323a226439336431643936333061663561616238383331356336336161663434393261223b733a33323a223162333863326231666363346137373737313537626364346135356237656234223b733a33323a223965643934316564396663663066343433613133333238633135656334393266223b733a33323a226131393135336135333436623161386332376634616434363638383034616237223b7d733a343a2268617368223b733a36353a2261313931353361353334366231613863323766346164343636383830346162372d3965643934316564396663663066343433613133333238633135656334393266223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1713887511),
('mfri6ofgg0vkbhgsdbsl3eqkck', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731353031363730372e3531363332313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f68756f6e6f723468377664676d3262326b3276636171703838223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353030393133383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353031393536343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731353032303134363b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226333623732333634366533333564653262363634356531393435616232646362223b733a33323a223033393239633466663930323239653238353264636235396130376536366136223b733a33323a226537376236363661336664333463373836616432366539343738336636373839223b733a33323a223461646335336434303430356331303730636231313635353731333636363761223b7d733a343a2268617368223b733a36353a2234616463353364343034303563313037306362313136353537313336363637612d6537376236363661336664333463373836616432366539343738336636373839223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223261303961666338633132646239616233313964343566616233393961333764223b733a33323a226637323639313031303633396134393837303330656532616630616335366366223b733a33323a226262653334373738363765623861396266326261376632333236373961323039223b733a33323a226365333232346435623261303239613230366637656265356133623062643262223b733a33323a226531323564333566336466343962356664366531383839623766306163633266223b733a33323a226235623962373930303265326264383239623537613837623331653937366366223b733a33323a223532303762663931623361393364643939323564396634343137653033356164223b733a33323a223839636538646630313931306663666366646533393961663265636563613833223b733a33323a223265633630666530353737323765333738623633623662333864386361353332223b733a33323a223066623962363864313464623939333365616261646662333262373261396166223b733a33323a226436363163326133373736653336323138333262386336363733326434313730223b733a33323a223536373639633466366666333064653364633863343632353432343938333331223b733a33323a226332376633653632633134306664663234353762333362643131646134393430223b733a33323a223138653034306365656363326665316130356565346562623865646263373735223b733a33323a223934653733313663393332366332363636626434343633656263633064323366223b733a33323a226531373238623265656364633833353665366138343465646664303432326535223b733a33323a223130303932643264663231613336353466376537643561663135386165633532223b733a33323a223362356262393130633936323931613164326536646431356563653762373163223b7d733a343a2268617368223b733a36353a2233623562623931306339363239316131643265366464313565636537623731632d3130303932643264663231613336353466376537643561663135386165633532223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223436303264633662386636333861613039316239396161316131313639396364223b733a33323a223165313333333366393665386265393035633737383536616566383761336531223b733a33323a223639396430653237663332383561316534613462383238643132306236653039223b733a33323a223132363739643339373634623862616161346165333361636135343462663132223b733a33323a226630393838336132323632643830663131393966336637663666613762376363223b733a33323a226264633564366639356136353839646464623135663731363366343434326563223b733a33323a223237376635303936316137663039333966653362323034343661376563613936223b733a33323a226233663564376362633764356165656266616233626231383966313663376630223b733a33323a226338366537306265336631323532363735353130336535376463303431623564223b733a33323a226532666438333263363165633931363966383163333234656366323933373132223b733a33323a226236396562383161623962323962323966623466356465346534343138643636223b733a33323a226337613433616237643130666464346461303230313062616439666366393838223b733a33323a223331323038376134363938353132623464343463393261653235613963626463223b733a33323a226431306166363561653563626638353435306632313532333332386339633261223b733a33323a223662613663306430383135613062613662623435313332623930353638623563223b733a33323a226334636266613361373062633266636538663139393661393633313731353663223b733a33323a223632616236653735333162623439353462366331373236363834363666623861223b733a33323a223530313862353665376130353137336237646463656338346332633333336331223b733a33323a226461333231333630396265663065363731663037376430386462633932383366223b733a33323a226162653132356333663365623961323266663364633733386138663132663834223b733a33323a223363356333393536636161653964353237333135633061343933323466376266223b733a33323a226463656563333964666564343664653664666633613436346662316666646636223b733a33323a223934643866333831303130646262393534393933663366353036633937336166223b733a33323a223661346337326264346565646266393935643134396638326432666136366239223b7d733a343a2268617368223b733a36353a2236613463373262643465656462663939356431343966383264326661363662392d3934643866333831303130646262393534393933663366353036633937336166223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1715016707);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('mhhek8a0urnocvh792vu9ndfvk', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333839343735332e3237303339393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676c6a346f7468343234666672366e3463766f3332316f64326c223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839353036323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839383333353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731333839383136303b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226364353963383031626565653636393237663732316336393337623733633235223b733a33323a226565376337666662386436646135323434636262613739353365306338386165223b7d733a343a2268617368223b733a36353a2265653763376666623864366461353234346362626137393533653063383861652d6364353963383031626565653636393237663732316336393337623733633235223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33383a7b733a33323a223764323065616338363966643164383431346266643635663735623433363237223b733a33323a226231323462636131613166346338663562346166393366653530303064613262223b733a33323a223438633732623966303963393636643138373130383631393162616535663463223b733a33323a226564393362653137376231333737363736373664336230366432616338613537223b733a33323a226533393163326135616234336164633038626637663336313738616132613830223b733a33323a223463613838386562386437356433376661313466393832333738313463323539223b733a33323a223133633563326262313739303632336231373434393261636165366461313462223b733a33323a223738666166326639653263613432363231616436616631616438633832363532223b733a33323a226261643336313438613536653766383763656231666538653131346231333233223b733a33323a223432313231386432326232303939396431326537633732396264336266323135223b733a33323a223030376332303265306666373834656637343965663062633338333531393261223b733a33323a226134626238616635336331303464303766623434636535613336353064343337223b733a33323a223237343566343865666433363430316262376565613637633137333534306539223b733a33323a226331646431346637653365633035633061373936363332613639653739356130223b733a33323a223362663861303166666434326163323431393261636465653634303233356264223b733a33323a226135343362323362323366373639313238393664633237393464383464323065223b733a33323a223532303464663430393237343733653133373864653964323564333336666462223b733a33323a223536656635306266376535663332666332323864396138363236313932616435223b733a33323a226536336362336437336435303632343461343534306431343064633564373131223b733a33323a223534343731393536643433306435666536353533363434323134373462363634223b733a33323a223064303934613831623831333666346536373531393766303639333861626439223b733a33323a226434333730626265396136613931316534303031313039393132333134656662223b733a33323a223930333864363162383634363134393935643237376232653431393536616366223b733a33323a223138626639353863343864323266636233353264303836353732316431653335223b733a33323a223830393134613732313661326538636135303666363434363765376366326161223b733a33323a226535356630643832366637353966616264306465323535663436383330386330223b733a33323a226136623639323232636631656161343134646666626663343938626564663931223b733a33323a223462303138363835323661646432323232616461386134356562636137396163223b733a33323a223139636130376634313161633439646330343763376134353137656166663662223b733a33323a226135343061323163343236616237333130366133646132376632343466343833223b733a33323a223564663538626166393566343137353839333463376630646434333337313136223b733a33323a223665613933383735656638313739396233356464303062653130633933373564223b733a33323a223862316362666332323934626639303835656636336163373230616165396565223b733a33323a223935353061343564653365383964633837353465386266376635303965636465223b733a33323a226266613332623931373738653036653631653962356434336439336163666631223b733a33323a226663626131393666653137353736303961656233363137323263356137666661223b733a33323a223265666166313836346535653563613836636535343638636434616133663762223b733a33323a226639623630373239356430313438303430636464636132663961643466333935223b733a33323a223065636331653036626530396331323334386661386430316636646132616664223b733a33323a223565636363353564343162663665626436313766336538393764386433303264223b733a33323a223464636463663362663439613766633934393338626330323638643865366633223b733a33323a226563303666323738346630393935626534323765383361343730363464633165223b733a33323a226436346433616364646637643435663762396164313966663334376330373863223b733a33323a223136633464643163396231316236363462323735356331396465386432376566223b733a33323a226639656466306431633762386637313034336165663438393930363535326563223b733a33323a223139356663636461356662366661313662303230303861366162363037373030223b733a33323a223065376539613964666136363637623636333466373335333634393139623662223b733a33323a226236326431343434643562363234323535623764653263313961656234646262223b733a33323a223035633236343238393465643663346537313566323761636638393162373431223b733a33323a223330353962346338353531323162646266393839383538366465656565653361223b733a33323a223730393739383835376532626661633131396235366466663963363265653830223b733a33323a226265303331363837396636336665663665643961373136336638346631393962223b733a33323a226132306563626335636566396431613935323565333631343861643831316637223b733a33323a223366663431303566643034623364343638376264613464356166623837663637223b733a33323a223634386164366666353331313639333362313434623663376431313662303536223b733a33323a223766663834363937616563366536356362373138373836653034323832343234223b733a33323a226362653836623764393431613262633865323963393035646365656164396637223b733a33323a226533663736623433366431623862336262643730666630623339313064663163223b733a33323a226130396163663763613539666537313831363136366366613434373666646334223b733a33323a226236333363343537386638663461613233613433663339633162323866383435223b733a33323a223232636433356566326338633036666566653233646239336632366636373366223b733a33323a223631356435313132363064386464633133323137646335343562346237353636223b733a33323a226138326230343637643565386231616435353531353834613235653666393439223b733a33323a223634326466643063346161653363663565306135343730396234396638373138223b733a33323a226336316138653230396432333337363735633833363532363932653763636439223b733a33323a223232643733613034303137623137636437323038623163333339323466383033223b733a33323a226365626539356139376564313730333330383036613864643336373066373365223b733a33323a223236623033366532363261643661613330396630383632383166323438396132223b733a33323a223366336437346466366432333132663765353934653436353739393739366162223b733a33323a226264316133306663663238353439373431613735343536376362663333623738223b733a33323a223130356362343266356232313134373365663435383665373933333261626231223b733a33323a226233613639616664313738343437633137383762313036303932663662663963223b733a33323a226436623364653263316566353866616534333130376238383162336665326230223b733a33323a223762623064633132396633636132636535393835333533336330363561636563223b733a33323a223033303362633365613431363363616262326463373266376664373564313663223b733a33323a226363333131316238376162623362626337636432366161366462373735333734223b7d733a343a2268617368223b733a36353a2263633331313162383761626233626263376364323661613664623737353337342d3033303362633365613431363363616262326463373266376664373564313663223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223834313834363766393532613636663963303932613435313964303663613137223b733a33323a223935396632343434353665316461393037346462303830663636373930373737223b733a33323a223130656433373237623232633162323963353263633762636635383137356538223b733a33323a223538376130343063363738633435363431383362343961653932316232343338223b733a33323a226634363332633061383561303632333365343064363636663165313936343938223b733a33323a223161346536646361303634303161393162656334356462646534376539333062223b733a33323a226636303663356666316239663334313031626232353933653331306137393938223b733a33323a226535393230343932656634313864333133333732636133643837363739356431223b733a33323a226333376233393364363331393335353962326632653131373332343864373262223b733a33323a226638383634623364616136633730333662636635356133326537313338666462223b733a33323a223964383064613166613131363234363637326637656330356330356331353962223b733a33323a223365356231346235356339356262616165343735323131663961393335353735223b733a33323a223762373463646265333261356266303264396265373331613732663865346363223b733a33323a223062306532336139656332383235376633323431626437613637333761303363223b733a33323a226336393164353264373930613730636266386633613739396533666564633762223b733a33323a223435343039663464346530666130343934323766316337396636353935666336223b733a33323a223831303034396437373066313061653832353833366465613630316130616664223b733a33323a223661303165663431353736613736393534646335366162363663376431323564223b733a33323a226136373633613338656361633066636236393938373665303437343332366236223b733a33323a223765656465633266653031633535626661336365373632616639346635386338223b7d733a343a2268617368223b733a36353a2237656564656332666530316335356266613363653736326166393466353863382d6136373633613338656361633066636236393938373665303437343332366236223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1713894753),
('r987rirapbid44r6fh13735hmm', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333839313137332e3633333835393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22653636643931636e6f64746d326a3861676b6f73627575656567223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839313431373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839343737333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731333839343633353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839333234323b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333839343737333b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226635613735653530653966386666343264303334336163396231653031623962223b733a33323a223236636434646630336637366164313062623930653863616638343035663164223b7d733a343a2268617368223b733a36353a2232366364346466303366373661643130626239306538636166383430356631642d6635613735653530653966386666343264303334336163396231653031623962223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34313a7b733a33323a226263383333346531366665376366393438336335336534656330313163653737223b733a33323a226232653535376664326639353138623961633231643731303431646639613265223b733a33323a223166353939316464633034393132326437346163323362626364356635653162223b733a33323a223131646564616236656434303161633934366135653666333532383630656438223b733a33323a226539633134616363663765333136626564623565663737373463646366613338223b733a33323a223463396232663265393037613864376534376138616163613862373233386661223b733a33323a226263313961643464393735356166616236323834303536363662353362376539223b733a33323a226161633331323139336465656537306437306361656561323463633163323362223b733a33323a223939303032383533613534376235653235306462326439343331313065656466223b733a33323a223864616439363766333162316661613566393632323937626131663863353138223b733a33323a223938333237643036653534646533343432353965333433653239643534653135223b733a33323a223362333864626361363164653734326633653236316262316463373937643130223b733a33323a226461306133383364656537373332316238663837306463313732316433383361223b733a33323a223766376539653666326435386636636133356235616561633731363338376263223b733a33323a226632353764363164656534303335333761383866323833386261306431333031223b733a33323a223935343931666362663237613339316134373362363233626263346433353232223b733a33323a223161383462623238303066383237376137376130336136346464653530386339223b733a33323a226164343933316632366564316633376232363564363261653163356539616333223b733a33323a226331666633306464343131663730333463613334613064323766363333393839223b733a33323a223661656566323935313962393565393666633838323638323738323931356239223b733a33323a223332643137616431616265356539613631383835313635316666643364336335223b733a33323a223836343439636266366465356630316339306234336132363838323434303833223b733a33323a226664343234366331376135616633646263363433376630386433366236636364223b733a33323a223836646330626264643537396634653130393062386332633738633035383738223b733a33323a226332643739343438313038323365636162346361626234663266653432666334223b733a33323a226663663966653536636439383665396163356666333666646637343262616630223b733a33323a226634623066646166616539393538393166303233376364623965323764306532223b733a33323a226632653336376336626531343239303163383063303239353466353236363836223b733a33323a226334626465383934303765643566663030663637333963623666353762396130223b733a33323a226665333362336538376330643663396233306632346535336135656531346562223b733a33323a223261393663343937633331653735653564646565316466313364643532393632223b733a33323a223933356430343834666663643839396165643735323864396234353734343331223b733a33323a223162323732363934306437333139613435343739326565303562336663613434223b733a33323a223865303435376365323232313836386665616563303139663236383061323063223b733a33323a223833323332336263343764363531666536643237313931666336396331316138223b733a33323a223139366535393235636134343564316161633636373830393438323332383130223b733a33323a226363326637323436613465663738323239356665356661633363386633333463223b733a33323a223238636235376138643663326234663165343439666638336437666530316439223b733a33323a223831356233336337376137313864323434363933323832383136303262346437223b733a33323a226366366238376161653332633261653137333461616166303563333761316363223b733a33323a223537306635663634323530623736626133396133313562353636386432353837223b733a33323a223463383565363637303065373162653861396136356132393763666630323037223b733a33323a226139353063376639643537656231306666616433663138316164373265303137223b733a33323a223531356363653432653336303237323230653636333034336634313039653266223b733a33323a223465316465356238323665363031623535383765366533653166363430626536223b733a33323a223662386162383631626333303935613932636664396362373932323561366336223b733a33323a226564316464336261356662366362333030303962396233353834353735623833223b733a33323a223839633133333531646164363761653437643830336164383834626439373764223b733a33323a223632323564373632396564353539316437653461333030616264323962643061223b733a33323a226634323234373539666632336237623063633932343534346664373236376439223b733a33323a223462643030383633663732376335323035363939383039373339353261376661223b733a33323a226231376365313239643764636139313130383435623832323536333337643936223b733a33323a223235663262393734396664663962643736313261333664303066313531613838223b733a33323a223061626634316536346566333436303965653966646365346366323066303230223b733a33323a226666646233656661383662623861303230616161646534313762333237643437223b733a33323a223638313637386566633361613437373838663434663931633939666262643866223b733a33323a223234656634313635626661666564643135636238376636626233653461396365223b733a33323a226237646639333264313463356632613161616237306337313435353339343333223b733a33323a223230623032326666616366303636613930643561323638383833653165626464223b733a33323a223230313765373738343235633464373635336333323639653761643236386233223b733a33323a223837306531363961386131303766643965366438396334393330633830333139223b733a33323a223932386239613334336530636461643537373365396562643736363337323933223b733a33323a226530653761303465333830326231383361396338626163653037656337373862223b733a33323a226638663630376534623764326165643466346338633332366435313962643165223b733a33323a226162643631383864653837653735373132663435643365636632356238623563223b733a33323a226232656466613465663563663632323631313330353166393535363466356639223b733a33323a223164383462396231326566343135353066383736346334383331633264336533223b733a33323a223130316134396336343537656166663135616262613232373439313332373938223b733a33323a226534633932386530373661363463396434376335323564613937336566613030223b733a33323a226431646334663533313637333636613439656634656135616363663135653061223b733a33323a226361643835316337333762656564643363623438636431643764636139643238223b733a33323a226462303662343938303763393533316636653466633638316566326537633130223b733a33323a223563396662383038363234383839363938633936653632646539656436616638223b733a33323a223332613731666637376465353136656165653232633034656339663333383662223b733a33323a223465666361303865623830373731383236356430346637386435313137306339223b733a33323a226537646535336564356630346364663530626364396438626137346134666638223b733a33323a223532333436303763366631363863343463323465373533383437613962376636223b733a33323a223138323439623333633961376261643435663763356565653835623835646635223b733a33323a223966633064643231653032373163653938616637303964633263363964313965223b733a33323a223730386433323939363965653731363261346639663062666237346532323964223b733a33323a226338646231383130343264363036663232336361313133313163396165653733223b733a33323a223364656166323932633431326630663137643262346261353939343037633933223b7d733a343a2268617368223b733a36353a2233646561663239326334313266306631376432623462613539393430376339332d6338646231383130343264363036663232336361313133313163396165653733223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223132613832336432333566323338613464396564353037303766353563383561223b733a33323a226431363631303237366561616334613933636563653530376633333362326339223b733a33323a226633646533616465666263333330393133663535626234393536313032663737223b733a33323a226262386439306361623364663766376338646461343162356366633365326438223b733a33323a226666653737353538346334646234646461393930643335346636343565633463223b733a33323a226239663939653631663730386363313930643739396263323130666335356439223b733a33323a223062373066303236343432346636646164323735396332383464663030313431223b733a33323a223461313135633965346166336564646636333738393736653035396530393437223b733a33323a226166653432323038616261663438363262353362646366633561393761666436223b733a33323a223261383032303937343362663334343939356631636666633663393734633936223b733a33323a223236316339646334313233666437643032353838313334393463663837613139223b733a33323a223265653062626263623266373737323964353237663034616332353938393461223b733a33323a226431323435656130626565393637373630396439613964323630393136303561223b733a33323a223239353862343764663039616366343539386337663932613062643934363231223b733a33323a223463663739616462333939633830653238306363373739333931326165616239223b733a33323a223464646362363265333162366539633965376632393333663537346164396661223b733a33323a223162653262653262373831633862323466376430323439303266633736653036223b733a33323a226432333337616464306132356632363464616331653835346532373133333034223b733a33323a226264653761343538656161623338653132346563373834356265663339643966223b733a33323a223834333366333334346439623438666433376538663539643466373935326465223b733a33323a226437353237613434326465636465646136656561633161396162653834343636223b733a33323a223165333066396436636631353234333231346131613666303862356334333764223b733a33323a223932626565613462636537363035303965623465626664636632613530303639223b733a33323a226437326631313831663434383238383137303561386639613265653436633865223b7d733a343a2268617368223b733a36353a2264373266313138316634343832383831373035613866396132656534366338652d3932626565613462636537363035303965623465626664636632613530303639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226562663163623266393336353531383836656461373831366534656239383538223b733a33323a223937383763653364626534646563323961376361656434613936616561346362223b733a33323a226261646136393135343030303663613562356537373538356136376335653030223b733a33323a226233653936306163633665346163666563376665313532353332313434323539223b733a33323a223563663565613062373630353236376561336364653332333730316630643732223b733a33323a226264623263393238383266656266393466366238306264303137313536323530223b733a33323a223232343463333864363633333666363936653730666130326463353433383239223b733a33323a226532383636646464383963326464363730353436313661656665373238386561223b7d733a343a2268617368223b733a36353a2265323836366464643839633264643637303534363136616566653732383865612d3232343463333864363633333666363936653730666130326463353433383239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a226138653830343032653038616132313733396362343238326335386239653166223b733a33323a223832383939643235663734323734376433303038643565303964363537326533223b733a33323a223562383664636433666530666361306262326534613930313130356533363132223b733a33323a226134343537313836656234633837323962616564653535326630666537343931223b733a33323a223939653635353539616630363537656335336330323161396532393434333337223b733a33323a223461353930336265633864653738656331666162306165316232393465383533223b733a33323a226534376164396539396534356132376630323834663963396663636562323963223b733a33323a223962363161623562616363343864616662353862663136316362666263316239223b733a33323a223061353131373765353134663735333838373836333336663032363466633037223b733a33323a226436663665356138373561653430303964653864326563363034356631663566223b733a33323a223965356564643733633065646431666339333437396463653264376137366364223b733a33323a223733396562663334643031313431343666623838353330636363373338306265223b733a33323a223835643134353961353663346366393536313139386666666361343631616130223b733a33323a223330643937306232623738653238336134613961333137383234353464306638223b733a33323a226230333734633536623732396562653361356665383630643430343261356464223b733a33323a226437643038646264303863393665653965343931303362306435656462346666223b733a33323a223262343633643830363139346333643038353964613364366462386638653066223b733a33323a223361626666646564373239333936666363326266383766306366626535323466223b733a33323a226232613632363638383862343435626133323766366664346134393338383038223b733a33323a223034346332376562623135646330376138326439643334336331643137323332223b7d733a343a2268617368223b733a36353a2230343463323765626231356463303761383264396433343363316431373233322d6232613632363638383862343435626133323766366664346134393338383038223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1713891173),
('rmrlrpp86kaq0444ss96i3cjkl', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731353136393637352e3034383536343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626b377661673832726c6a7631327072636b31306b653638636b223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353137333033373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731353137333130363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731353137333230393b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223432343761646165366564633062366432333961643830623834636434353638223b733a33323a223935613639316638346361373434386133333831643132343232303339316138223b7d733a343a2268617368223b733a36353a2239356136393166383463613734343861333338316431323432323033393161382d3432343761646165366564633062366432333961643830623834636434353638223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226161656465663061373761653537653964646535313939343061306533373137223b733a33323a226430656630613665356134333431363038653937613661366361306263313762223b733a33323a226166626139396466643533376361396164303233393835633063626330643433223b733a33323a226466366237663930366437393632393366303036663232326536313738373338223b733a33323a223665303065326662326438376433313139346436396361393838613965313937223b733a33323a226330396137616563616233383835393435653766633436653030333139613164223b733a33323a223238323833663561623435326435643131643863653464323938636666663662223b733a33323a223138316364663362643036623630353130336332613863343066316536356132223b7d733a343a2268617368223b733a36353a2231383163646633626430366236303531303363326138633430663165363561322d3238323833663561623435326435643131643863653464323938636666663662223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223163646565356233303535316561616635363664626263633732386435323662223b733a33323a223931333866633739316331373930656162356266373138623263613064653931223b733a33323a223265353633343737626437353165333237646639366239306664626464316536223b733a33323a223137663232343236663130623962393666653830383364656365656131323937223b733a33323a223739363663343238383033313063363335356631643766303163333266653837223b733a33323a223736663264643761623938643634633534373761666434623632633937366137223b7d733a343a2268617368223b733a36353a2237366632646437616239386436346335343737616664346236326339373661372d3739363663343238383033313063363335356631643766303163333266653837223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1715169675);
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
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"heic\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\",\"alto\",\"atom\",\"ead\",\"feed\",\"fodp\",\"fods\",\"fodt\",\"html\",\"mag\",\"mei\",\"mets\",\"mods\",\"musicxml\",\"mxl\",\"pdf2xml\",\"refnum\",\"rss\",\"svg\",\"tei\",\"xhtml\",\"xml\",\"dtd\",\"xslt\"]'),
('installation_title', '\"Progetto Storia Pubblica Digitale\"'),
('locale', '\"it\"'),
('media_alt_text_property', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/heic\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\",\"application\\/alto+xml\",\"application\\/atom+xml\",\"application\\/marcxml+xml\",\"application\\/mets+xml\",\"application\\/mods+xml\",\"application\\/rss+xml\",\"application\\/tei+xml\",\"application\\/vnd.bnf.refnum+xml\",\"application\\/vnd.ead+xml\",\"application\\/vnd.iccu.mag+xml\",\"application\\/vnd.mei+xml\",\"application\\/vnd.oasis.opendocument.presentation-flat-xml\",\"application\\/vnd.oasis.opendocument.spreadsheet-flat-xml\",\"application\\/vnd.oasis.opendocument.text-flat-xml\",\"application\\/vnd.openarchives.oai-pmh+xml\",\"application\\/vnd.pdf2xml+xml\",\"application\\/vnd.recordare.musicxml\",\"application\\/vnd.recordare.musicxml+xml\",\"application\\/xhtml+xml\",\"application\\/xml\",\"image\\/svg+xml\",\"model\\/vnd.collada+xml\",\"text\\/html\",\"text\\/vnd.omeka+xml\",\"text\\/xml\"]'),
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
(1, NULL, 1, NULL, 'index', 'default', 'Celebrate Culture', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Home\",\"query\":\"\"},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":3,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":4,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":5,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":6,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":7,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":8,\"is_public\":true},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":9,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":10,\"is_public\":true},\"links\":[{\"type\":\"url\",\"data\":{\"label\":\"Fonti primarie\",\"url\":\"\\/spd\\/s\\/index\\/item-set\\/22?page=1&sort_by=created&sort_order=asc\"},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":20,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":12,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":14,\"is_public\":true},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":13,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":15,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":16,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":17,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":18,\"is_public\":true},\"links\":[]}]', '[]', '2024-02-13 20:25:22', '2024-05-04 13:39:03', 1, 1);

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
(114, 47, 1, NULL, 'literal', NULL, NULL, 'XML', NULL, 1),
(166, 63, 1, NULL, 'literal', '', NULL, 'La Spezia - Palazzo del Governo', NULL, 1),
(167, 63, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(168, 63, 7, NULL, 'literal', '', NULL, '22/04/1947', NULL, 1),
(169, 63, 40, NULL, 'literal', '', NULL, 'La Spezia', NULL, 1),
(170, 63, 40, NULL, 'literal', '', NULL, 'Milano', NULL, 1),
(171, 63, 9, NULL, 'literal', '', NULL, 'Cartolina', NULL, 1),
(172, 63, 4, NULL, 'literal', '', NULL, 'Cartolina con fotografia del palazzo del governo a La Spezia', NULL, 1),
(173, 64, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Palazzo del Governo', NULL, 1),
(174, 65, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Palazzo del Governo Retro', NULL, 1),
(177, 67, 1, NULL, 'literal', '', NULL, 'La Spezia - Palazzo del Governo', NULL, 1),
(178, 67, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(179, 67, 40, NULL, 'literal', '', NULL, 'La Spezia', NULL, 1),
(180, 67, 9, NULL, 'literal', '', NULL, 'Cartolina', NULL, 1),
(181, 67, 4, NULL, 'literal', '', NULL, 'Cartolina che ritrae il palazzo del Governo a La Spezia', NULL, 1),
(182, 68, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Palazzo del Governo', NULL, 1),
(183, 69, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Palazzo del Governo Retro', NULL, 1),
(184, 70, 1, NULL, 'literal', '', NULL, 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti', NULL, 1),
(185, 70, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(186, 70, 40, NULL, 'literal', '', NULL, 'La Spezia', NULL, 1),
(187, 71, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti', NULL, 1),
(188, 72, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Piazza Matteotti - Nuovo Monumento ai caduti Retro', NULL, 1),
(189, 73, 1, NULL, 'literal', '', NULL, 'La Spezia - Giardini e Palazzo del Governo', NULL, 1),
(190, 73, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(191, 73, 40, NULL, 'literal', '', NULL, 'La Spezia', NULL, 1),
(192, 73, 9, NULL, 'literal', '', NULL, 'Cartolina', NULL, 1),
(193, 74, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Giardini e Palazzo del Governo', NULL, 1),
(194, 75, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Giardini e Palazzo del Governo Retro', NULL, 1),
(195, 76, 1, NULL, 'literal', '', NULL, 'La Spezia - Giardini - Monumento a Costanzo Ciano', NULL, 1),
(196, 76, 7, NULL, 'literal', '', NULL, '28/04/1944', NULL, 1),
(197, 76, 7, NULL, 'literal', '', NULL, '29/04/1944', NULL, 1),
(198, 76, 40, NULL, 'literal', '', NULL, 'La Spezia', NULL, 1),
(199, 76, 40, NULL, 'literal', '', NULL, 'Cortina', NULL, 1),
(200, 77, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Giardini - Monumento a Costanzo Ciano', NULL, 1),
(201, 78, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Giardini - Monumento a Costanzo Ciano Retro', NULL, 1),
(202, 79, 1, NULL, 'literal', '', NULL, 'La Spezia - Piazza Italia', NULL, 1),
(203, 79, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(204, 79, 7, NULL, 'literal', '', NULL, '9/12/1959', NULL, 1),
(205, 79, 40, NULL, 'literal', '', NULL, 'La Spezia', NULL, 1),
(206, 79, 9, NULL, 'literal', '', NULL, 'Cartolina', NULL, 1),
(207, 79, 4, NULL, 'literal', '', NULL, 'Fotografia che ritrae piazza Italia a La Spezia', NULL, 1),
(208, 80, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Piazza Italia', NULL, 1),
(209, 81, 1, NULL, 'literal', NULL, NULL, 'La Spezia - Piazza Italia Retro', NULL, 1),
(210, 76, 4, NULL, 'literal', '', NULL, 'Foto che ritrae il monumento a Costanzo Ciano nei pressi del Palazzo Civico a La Spezia', NULL, 1),
(214, 83, 1, NULL, 'literal', '', NULL, 'Quartiere Ciano a Piacenza', NULL, 1),
(215, 83, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(216, 83, 40, NULL, 'literal', '', NULL, 'Piacenza', NULL, 1),
(217, 83, 11, NULL, 'uri', '', NULL, 'Foto', 'https://www.movio.beniculturali.it/aspc/piacenzannitrenta/it/56/le-case-popolari', 1),
(218, 83, 9, NULL, 'literal', '', NULL, 'Immagine', NULL, 1),
(219, 84, 1, NULL, 'literal', NULL, NULL, 'Quartiere Ciano a Piacenza', NULL, 1),
(220, 83, 4, NULL, 'literal', '', NULL, 'Foto che ritrae il quartiere popolare a Piacenza tutt\'ora conosciuto come \"quartiere Ciano\", inaugurato il 28 ottobre 1939 e dedicato a Costanzo Ciano', NULL, 1),
(221, 63, 4, NULL, 'literal', '', NULL, 'Retro della cartolina con data e luogo di stesura, saluti, francolbollo delle poste, timbro di La Spezia con data, indirizzo del destinatario presso via Botticelli 22, Milano.', NULL, 1),
(222, 63, 57, NULL, 'literal', '', NULL, 'Sul retro è riportato: \" La Spezia 22-4-47 Cordiali saluti (firma).\' Destinatario (nome e cognome ) Milano, Botticelli 22', NULL, 1),
(223, 67, 4, NULL, 'literal', '', NULL, 'Retro della cartolina', NULL, 1),
(224, 70, 4, NULL, 'literal', '', NULL, 'Cartolina che ritrae il nuovo monumento ai caduti in piazza Matteotti a La Spezia', NULL, 1),
(225, 73, 4, NULL, 'literal', '', NULL, 'Cartolina che ritrae la piazza del Governo a La Spezia con il moumento dei Caduti', NULL, 1),
(226, 76, 4, NULL, 'literal', '', NULL, 'Cartolina indirizzata a Maria Bevati, viale Bassi 17 a Cortina', NULL, 1),
(227, 76, 57, NULL, 'literal', '', NULL, 'Retro con contenuto non significativo', NULL, 1),
(228, 79, 4, NULL, 'literal', '', NULL, 'Dedica di saluti indirizzata a Cosimo Cecinato', NULL, 1),
(229, 85, 1, NULL, 'literal', '', NULL, 'Inaugurazione del monumento a Costanzo Ciano', NULL, 1),
(230, 85, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(231, 85, 7, NULL, 'literal', '', NULL, '20/11/1941', NULL, 1),
(232, 85, 7, NULL, 'literal', '', NULL, '1943', NULL, 1),
(233, 85, 40, NULL, 'literal', '', NULL, 'Genova', NULL, 1),
(234, 85, 11, NULL, 'uri', '', NULL, 'Foto', 'http://www.valbisagno.altervista.org/028-il%20papa%20buono%20e%20il%20busto%20di%20Ciano.html', 1),
(235, 85, 9, NULL, 'literal', '', NULL, 'Immagine', NULL, 1),
(236, 85, 4, NULL, 'literal', '', NULL, 'Immagine che mostra l\'inaugurazione del monumento dedicato a Costanzo Ciano avvenuta il 20 novembre del 1941. La statua si trovava a Genova ed è stata rimossa nel 1943.', NULL, 1),
(237, 86, 1, NULL, 'literal', NULL, NULL, 'Inaugurazione del monumento a Costanzo Ciano (Genova)', NULL, 1),
(238, 87, 1, NULL, 'literal', '', NULL, 'Inaugurazione del monumento a Costanzo Ciano', NULL, 1),
(239, 87, 51, NULL, 'literal', '', NULL, 'Istituto Nazionale LUCE', NULL, 1),
(240, 87, 51, NULL, 'literal', '', NULL, 'Roma', NULL, 1),
(241, 87, 7, NULL, 'literal', '', NULL, '29 giugno 1942', NULL, 1),
(242, 87, 40, NULL, 'literal', '', NULL, 'Ravenna', NULL, 1),
(243, 87, 11, NULL, 'uri', '', NULL, 'Foto', 'https://patrimonio.archivioluce.com/luce-web/detail/IL3000001277/12/gruppo-giovani-della-g-i-l-uniforme-marinara-ripreso-ai-piedi-del-monumento-costanzo-ciano-durante-cerimonia-inaugurale.html', 1),
(244, 87, 9, NULL, 'literal', '', NULL, 'Immagine', NULL, 1),
(245, 87, 4, NULL, 'literal', '', NULL, 'Istituto Nazionale LUCE (Roma)	29 giugno 1942	Inaugurazione del monumento a Costanzo Ciano (Ravenna) 	Fotografia scatta durante l\'inaugurazione del monumento a Costanzo Ciano a Ravenna il 29 giugno 1942.', NULL, 1),
(246, 88, 1, NULL, 'literal', NULL, NULL, 'Inaugurazione del monumento a Costanzo Ciano', NULL, 1),
(247, 89, 1, NULL, 'literal', '', NULL, 'Soldati americani nel collegio Costanzo Ciano', NULL, 1),
(248, 89, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(249, 89, 7, NULL, 'literal', '', NULL, '1944 ca.', NULL, 1),
(250, 89, 40, NULL, 'literal', '', NULL, 'Napoli', NULL, 1),
(251, 89, 11, NULL, 'uri', '', NULL, 'Foto', 'https://www.ww2online.org/image/american-soldiers-front-statue-italy', 1),
(252, 89, 9, NULL, 'literal', '', NULL, 'Immagine', NULL, 1),
(253, 89, 4, NULL, 'literal', '', NULL, 'Foto che mostra un gruppo di soldati americani nel collegio Costanzo Ciano a Napoli.', NULL, 1),
(254, 90, 1, NULL, 'literal', NULL, NULL, 'Soldati americani nel collegio Costanzo Ciano (Napoli)', NULL, 1),
(255, 87, 57, NULL, 'literal', '', NULL, 'Sull\'alto basamento c\'è l\'iscrizione dedicatoria \"Ravenna a Costanzo Ciano\"', NULL, 1),
(258, 92, 1, NULL, 'literal', '', NULL, 'Gli amanti di Francesco Messina', NULL, 1),
(259, 92, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(260, 92, 7, NULL, 'literal', '', NULL, '1928', NULL, 1),
(261, 92, 9, NULL, 'literal', '', NULL, 'Scultura in bronzo', NULL, 1),
(262, 92, 4, NULL, 'literal', '', NULL, 'Opera di Francesco Messina in bronzo, datata 1928', NULL, 1),
(263, 93, 1, NULL, 'literal', NULL, NULL, 'Gli amanti di Francesco Messina', NULL, 1),
(264, 94, 1, NULL, 'literal', NULL, NULL, 'Gli amanti di Francesco Messina', NULL, 1),
(266, 96, 1, NULL, 'literal', '', NULL, 'Architettura fascista di La Spezia', NULL, 1),
(267, 97, 1, NULL, 'literal', '', NULL, 'Il Ventennio a La Spezia', NULL, 1),
(268, 98, 1, NULL, 'literal', '', NULL, 'Altri monumenti di Costanzo Ciano', NULL, 1),
(269, 99, 1, NULL, 'literal', '', NULL, 'Palazzo delle Poste La Spezia', NULL, 1),
(270, 99, 51, NULL, 'literal', '', NULL, 'User Wikipedia: Formkurve92', NULL, 1),
(271, 99, 51, NULL, 'uri', '', NULL, 'Utente (DE)', 'https://de.wikipedia.org/wiki/Benutzer:Formkurve92', 1),
(272, 99, 7, NULL, 'literal', '', NULL, '31 marzo 2018', NULL, 1),
(273, 99, 40, NULL, 'literal', '', NULL, 'La Spezia', NULL, 1),
(274, 99, 11, NULL, 'uri', '', NULL, 'Foto', 'https://it.wikipedia.org/wiki/Palazzo_delle_Poste_%28La_Spezia%29#/media/File:Mazzoni_Post_La_Spezia.JPG', 1),
(275, 99, 4, NULL, 'literal', '', NULL, 'Foto che ritrae il palazzo delle poste di La Spezia inaugurato nel novembre 1933.', NULL, 1),
(276, 100, 1, NULL, 'literal', NULL, NULL, 'Palazzo delle Poste La Spezia', NULL, 1),
(277, 101, 1, NULL, 'literal', '', NULL, 'Palazzo del governo La Spezia', NULL, 1),
(278, 101, 51, NULL, 'literal', '', NULL, 'Gianni Porcellini', NULL, 1),
(279, 101, 40, NULL, 'literal', '', NULL, 'La Spezia', NULL, 1),
(280, 101, 11, NULL, 'uri', '', NULL, 'Foto', 'https://www.artefascista.it/la_spezia__fascismo__arc.htm', 1),
(281, 101, 4, NULL, 'literal', '', NULL, 'Foto che mostra il palazzo del governo di La Spezia.', NULL, 1),
(282, 102, 1, NULL, 'literal', NULL, NULL, 'Palazzo del governo La Spezia', NULL, 1),
(283, 103, 1, NULL, 'literal', '', NULL, 'Teatro civico di La Spezia', NULL, 1),
(284, 103, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(285, 103, 11, NULL, 'uri', '', NULL, 'Foto', 'https://catalogo.beniculturali.it/detail/ArchitecturalOrLandscapeHeritage/0700111222', 1),
(286, 103, 4, NULL, 'literal', '', NULL, 'Immagine che ritrae il teatro civico di La Spezia. ', NULL, 1),
(287, 104, 1, NULL, 'literal', NULL, NULL, 'Teatro civico di La Spezia', NULL, 1),
(288, 105, 1, NULL, 'literal', '', NULL, 'Arte e architettura nel Ventennio', NULL, 1),
(289, 106, 1, NULL, 'literal', '', NULL, 'La città che sale', NULL, 1),
(290, 106, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(291, 106, 51, NULL, 'literal', '', NULL, 'Umberto Boccioni', NULL, 1),
(292, 106, 7, NULL, 'literal', '', NULL, '1910-1911', NULL, 1),
(293, 106, 40, NULL, 'literal', '', NULL, 'MoMa, New York', NULL, 1),
(294, 106, 11, NULL, 'uri', '', NULL, 'Immagine', 'https://mydbook.giuntitvp.it/app/books/GIAC89_G8970105L/html/290', 1),
(295, 106, 9, NULL, 'literal', '', NULL, 'Dipinto', NULL, 1),
(296, 106, 4, NULL, 'literal', '', NULL, 'Opera \"La città che sale\" di Umberto Boccioni realizzata nel 1910-1911, conservata al MoMa di New York.', NULL, 1),
(297, 107, 1, NULL, 'literal', NULL, NULL, 'La città che sale', NULL, 1),
(298, 108, 1, NULL, 'literal', '', NULL, 'L\'Italia corporativa', NULL, 1),
(299, 108, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(300, 108, 51, NULL, 'literal', '', NULL, 'Mario Sironi', NULL, 1),
(301, 108, 7, NULL, 'literal', '', NULL, '1936', NULL, 1),
(302, 108, 40, NULL, 'literal', '', NULL, 'Palazzo dell\'Informazione, Milano', NULL, 1),
(303, 108, 11, NULL, 'uri', '', NULL, 'Immagine', 'https://www.panorama.it/il-sironi-che-si-vede-con-una-telefonata', 1),
(304, 108, 9, NULL, 'literal', '', NULL, 'Mosaico', NULL, 1),
(305, 108, 4, NULL, 'literal', '', NULL, 'Opera \"L\'Italia corporativa\" di Mario Sironi, datata al 1936, che si trova a Milano nel palazzo dell\'Informazione. ', NULL, 1),
(306, 109, 1, NULL, 'literal', NULL, NULL, 'L\'Italia corporativa', NULL, 1),
(307, 110, 1, NULL, 'literal', '', NULL, 'Manifesto pubblicitario mostra Novecento Italiano', NULL, 1),
(308, 110, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(309, 110, 51, NULL, 'literal', '', NULL, 'Mario Sironi', NULL, 1),
(310, 110, 7, NULL, 'literal', '', NULL, '1926 ca.', NULL, 1),
(311, 110, 11, NULL, 'uri', '', NULL, 'Foto', 'https://catalogo.beniculturali.it/detail/HistoricOrArtisticProperty/0500659418', 1),
(312, 110, 9, NULL, 'literal', '', NULL, 'Manifesto pubblicitario', NULL, 1),
(313, 110, 4, NULL, 'literal', '', NULL, 'Manifesto pubblicitario della mostra Novecento Italiano realizzato da Mario Sironi intorno al 1926.', NULL, 1),
(314, 111, 1, NULL, 'literal', NULL, NULL, 'Manifesto pubblicitario mostra Novecento Italiano', NULL, 1),
(315, 112, 1, NULL, 'literal', '', NULL, 'Opere di Francesco Messina', NULL, 1),
(316, 113, 1, NULL, 'literal', '', NULL, 'Autoritratto di Francesco Messina', NULL, 1),
(317, 113, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(318, 113, 51, NULL, 'literal', '', NULL, 'Francesco Messina', NULL, 1),
(319, 113, 7, NULL, 'literal', '', NULL, '1974', NULL, 1),
(320, 113, 9, NULL, 'literal', '', NULL, 'Schizzo su carta', NULL, 1),
(321, 114, 1, NULL, 'literal', NULL, NULL, 'Autoritratto di Francesco Messina', NULL, 1),
(322, 115, 1, NULL, 'literal', '', NULL, 'Bagnante di Francesco Messina', NULL, 1),
(323, 115, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(324, 115, 51, NULL, 'literal', '', NULL, 'Francesco Messina', NULL, 1),
(325, 115, 7, NULL, 'literal', '', NULL, '1929', NULL, 1),
(326, 115, 9, NULL, 'literal', '', NULL, 'Scultura in bronzo', NULL, 1),
(327, 115, 4, NULL, 'literal', '', NULL, 'Opera di Francesco Messina datata 1929 in bronzo', NULL, 1),
(328, 116, 1, NULL, 'literal', NULL, NULL, 'Bagnante di Francesco Messina', NULL, 1),
(329, 113, 4, NULL, 'literal', '', NULL, 'Opera matita su carta di Francesco Messina datata 1974', NULL, 1),
(330, 117, 1, NULL, 'literal', '', NULL, 'Monumento alla Vittoria a Bolzano', NULL, 1),
(331, 117, 51, NULL, 'literal', '', NULL, 'Sailko', NULL, 1),
(332, 117, 7, NULL, 'literal', '', NULL, '25/09/2016', NULL, 1),
(333, 117, 40, NULL, 'literal', '', NULL, 'Bolzano', NULL, 1),
(334, 117, 4, NULL, 'literal', '', NULL, 'Il monumento alla Vittoria a Bolzano è un monumentale complesso marmoreo celebrativo della vittoria italiana nella prima guerra mondiale sull\'Austria-Ungheria, progettato dall\'architetto Marcello Piacentini e costruito tra il 1926 e il 1928. Si trova in piazza della Vittoria, a pochi passi dal ponte sul torrente Talvera. Il regime fascista lo creò a proprio simbolo.', NULL, 1),
(335, 118, 1, NULL, 'literal', NULL, NULL, 'Monumento alla Vittoria a Bolzano', NULL, 1),
(336, 119, 1, NULL, 'literal', '', NULL, 'Statua di Costanzo Ciano', NULL, 1),
(337, 119, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(338, 119, 40, NULL, 'literal', '', NULL, 'Isola di Santo Stefano, Livorno', NULL, 1),
(339, 119, 4, NULL, 'literal', '', NULL, 'Busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno', NULL, 1),
(340, 119, 4, NULL, 'literal', '', NULL, 'Profilo del busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno attualmente situato sull\'isola di Santo Stefano', NULL, 1),
(341, 119, 4, NULL, 'literal', '', NULL, 'Vista frontale del busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno attualmente situato sull\'isola di Santo Stefano', NULL, 1),
(342, 119, 4, NULL, 'literal', '', NULL, 'Volto della statua di Costanzo Ciano incompiuta concepita per il mausoleo di Livorno attualmente situato sull\'isola di Santo Stefano', NULL, 1),
(343, 120, 1, NULL, 'literal', NULL, NULL, 'Busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno', NULL, 1),
(344, 121, 1, NULL, 'literal', NULL, NULL, 'Busto di Costanzo Ciano di profilo incompiuto concepito per il mausoleo di Livorno', NULL, 1),
(345, 122, 1, NULL, 'literal', NULL, NULL, 'Busto di Costanzo Ciano incompiuto concepito per il mausoleo di Livorno vista frontale', NULL, 1),
(346, 123, 1, NULL, 'literal', NULL, NULL, 'Busto di Costanzo Ciano di profilo incompiuto concepito per il mausoleo di Livorno', NULL, 1),
(347, 124, 1, NULL, 'literal', NULL, NULL, 'Volto della statua di Costanzo Ciano incompiuta concepita per il mausoleo di Livorno', NULL, 1),
(348, 125, 1, NULL, 'literal', '', NULL, 'Cancel Culture', NULL, 1),
(349, 126, 1, NULL, 'literal', '', NULL, 'Monumento Kit Carson', NULL, 1),
(350, 126, 51, NULL, 'literal', '', NULL, 'User Flickr: cmh2315fl', NULL, 1),
(351, 126, 51, NULL, 'uri', '', NULL, 'Profilo', 'https://www.flickr.com/photos/cmhpictures/', 1),
(352, 126, 7, NULL, 'literal', '', NULL, '31/12/2016', NULL, 1),
(353, 126, 40, NULL, 'literal', '', NULL, 'Santa Fé, New Mexico', NULL, 1),
(354, 126, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(355, 126, 4, NULL, 'literal', '', NULL, '\"Foto che ritrae il monumento dedicato a Kit Carson di fronte al tribunale degli Stati Uniti nel centro di Santa Fe, nel New Mexico. L\'obelisco fu eretto nel 1884 dal Grande Esercito della Repubblica. Kit Carson era un veterano della guerra messicano-americana e della guerra civile. Il monumento è stato danneggiato più volte, nel 2022 è stato schizzato di vernice rossa dagli\nattivisti in occasione della Giornata dei popoli indigeni.\"', NULL, 1),
(356, 126, 4, NULL, 'literal', '', NULL, 'Dettaglio del monumento dedicato a Kit Carson di fronte al tribunale degli Stati Uniti nel centro di Santa Fe, nel New Mexico. L\'incisione riporta la data della sua morte, avvenuta il 23 maggio 1868, quando aveva 59 anni.', NULL, 1),
(357, 126, 4, NULL, 'literal', '', NULL, 'Dettaglio del monumento dedicato a Kit Carson di fronte al tribunale degli Stati Uniti nel centro di Santa Fe, nel New Mexico. L\'incisione riporta \"Pioneer Pathfinder Soldier\".', NULL, 1),
(358, 127, 1, NULL, 'literal', NULL, NULL, 'Monumento Kit Carson (Santa Fé, New Mexico)', NULL, 1),
(359, 128, 1, NULL, 'literal', NULL, NULL, 'Dettaglio del monumento Kit Carson 1', NULL, 1),
(360, 129, 1, NULL, 'literal', NULL, NULL, 'Dettaglio del monumento Kit Carson 2', NULL, 1),
(361, 130, 1, NULL, 'literal', '', NULL, 'Kit Carson', NULL, 1),
(362, 130, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(363, 130, 7, NULL, 'literal', '', NULL, '1860 ca.', NULL, 1),
(364, 130, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(365, 130, 4, NULL, 'literal', '', NULL, '\"Foto che ritrae Christopher Carson, meglio noto come Kit Carson (1809-1868), è stato un esploratore e militare statunitense.\nFu un celebre \"\"uomo di frontiera\"\" statunitense del XIX secolo: fu esploratore, guida, agente indiano, trapper, cacciatore e soldato. Figura quasi leggendaria, rappresenta nell\'immaginario collettivo una delle icone del Far West.\"', NULL, 1),
(366, 131, 1, NULL, 'literal', NULL, NULL, 'Kit Carson', NULL, 1),
(367, 132, 1, NULL, 'literal', '', NULL, 'Kit Carson 2', NULL, 1),
(368, 132, 51, NULL, 'literal', '', NULL, 'Mathew Brady', NULL, 1),
(369, 132, 51, NULL, 'literal', '', NULL, 'Levin C. Handy', NULL, 1),
(370, 132, 7, NULL, 'literal', '', NULL, '1860-1875', NULL, 1),
(371, 132, 9, NULL, 'literal', '', NULL, 'Fotografia con stampa negativa realizzata con la tecnica del collodio umido.', NULL, 1),
(372, 133, 1, NULL, 'literal', NULL, NULL, 'Kit Carson 2', NULL, 1),
(373, 132, 4, NULL, 'literal', '', NULL, 'Foto che ritrae Kit Carson tra il 1860 e il 1875.', NULL, 1),
(374, 134, 1, NULL, 'literal', '', NULL, 'Stato attuale dell\'ex obelisco dedicato a Kit Carson', NULL, 1),
(375, 134, 51, NULL, 'literal', '', NULL, 'Enrica Salvatori', NULL, 1),
(376, 134, 7, NULL, 'literal', '', NULL, '09/2023', NULL, 1),
(377, 134, 40, NULL, 'literal', '', NULL, 'Santa Fé, New Mexico', NULL, 1),
(378, 134, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(379, 134, 4, NULL, 'literal', '', NULL, 'Foto che ritrae lo stato attuale del monumento dedicato a Kit Carson, situato a Santa Fé. L\'obelisco è scomparso, il basamento è coperto ed è presente un\'epigrafe pacificatoria con QRCode. Si trova nella pagina 3 delle slides della prima lezione.', NULL, 1),
(380, 135, 1, NULL, 'literal', NULL, NULL, 'Stato attuale dell\'ex obelisco dedicato a Kit Carson', NULL, 1),
(381, 136, 1, NULL, 'literal', '', NULL, 'Kit Carson', NULL, 1),
(382, 137, 1, NULL, 'literal', '', NULL, 'Cartolina Giardini e Palazzo del Governo La Spezia', NULL, 1),
(383, 137, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(384, 137, 9, NULL, 'literal', '', NULL, 'Cartolina', NULL, 1),
(385, 137, 4, NULL, 'literal', '', NULL, 'Foto che ritrae la piazza dove c\'è il Palazzo del Governo, la statua sembra non esserci nella foto', NULL, 1),
(386, 137, 4, NULL, 'literal', '', NULL, 'Retro della cartolina che ritrae i giardini e il Palazzo del Governo a La Spezia', NULL, 1),
(387, 137, 57, NULL, 'literal', '', NULL, 'Sul retro è riportato: \"Gentilissima Famiglia Brunetto, Via Vernazza 14C Torino. Ringraziamenti e saluti affettuosi Alfredo Lidia Giovanna Gigi(?) altro nome 8-10-1943', NULL, 1),
(388, 138, 1, NULL, 'literal', NULL, NULL, 'Cartolina Giardini e Palazzo del Governo La Spezia', NULL, 1),
(389, 139, 1, NULL, 'literal', NULL, NULL, 'Cartolina Giardini e Palazzo del Governo La Spezia Retro', NULL, 1),
(390, 140, 1, NULL, 'literal', '', NULL, 'Cavallo Morente di Francesco Messina', NULL, 1),
(391, 140, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(392, 140, 51, NULL, 'literal', '', NULL, 'Francesco Messina', NULL, 1),
(393, 140, 40, NULL, 'literal', '', NULL, 'Viale Mazzini, Roma', NULL, 1),
(394, 140, 9, NULL, 'literal', '', NULL, 'Scultura', NULL, 1),
(395, 140, 4, NULL, 'literal', '', NULL, 'Cavallo Morente di Franscesco Messina collocata alla sede della Direzione Generale di viale Mazzini a Roma', NULL, 1),
(396, 141, 1, NULL, 'literal', NULL, NULL, 'Cavallo Morente di Francesco Messina', NULL, 1),
(397, 142, 1, NULL, 'literal', '', NULL, 'Censura della Comunicazione', NULL, 1),
(398, 143, 1, NULL, 'literal', '', NULL, 'Mussolini, la figlia e altri gerarchi durante una parata', NULL, 1),
(399, 143, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(400, 143, 7, NULL, 'literal', '', NULL, 'ante 1945', NULL, 1),
(401, 143, 40, NULL, 'literal', '', NULL, 'Foro Italico, Roma', NULL, 1),
(402, 143, 11, NULL, 'uri', '', NULL, 'Foto', 'https://it.wikipedia.org/wiki/File:Censura_Fascismo_2.jpg', 1),
(403, 143, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(404, 143, 4, NULL, 'literal', '', NULL, 'Foto vietata che ritrae, in una parata al Foro Italico di Roma, Benito Mussolini, la figlia Edda Ciano e altri gerarchi bagnati da un\'innaffiatrice.', NULL, 1),
(405, 144, 1, NULL, 'literal', NULL, NULL, 'Mussolini, la figlia e altri gerarchi durante una parata', NULL, 1),
(406, 145, 1, NULL, 'literal', '', NULL, 'Soldato ferito in battaglia', NULL, 1),
(407, 145, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(408, 145, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(409, 145, 11, NULL, 'uri', '', NULL, 'Foto', 'https://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/', 1),
(410, 145, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(411, 145, 4, NULL, 'literal', '', NULL, 'La foto è stata censurata perché mostra un soldato ferito in battaglia.', NULL, 1),
(412, 146, 1, NULL, 'literal', NULL, NULL, 'Soldato ferito in battaglia', NULL, 1),
(413, 147, 1, NULL, 'literal', '', NULL, 'Uomo prega in ginocchio', NULL, 1),
(414, 147, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(415, 147, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(416, 147, 11, NULL, 'uri', '', NULL, 'Foto', 'https://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/.', 1),
(417, 147, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(418, 147, 4, NULL, 'literal', '', NULL, 'La foto è stata censurata perché mostra un uomo, in preda alla disperazione, che prega in ginocchio.\n', NULL, 1),
(419, 148, 1, NULL, 'literal', NULL, NULL, 'Uomo prega in ginocchio', NULL, 1),
(420, 149, 1, NULL, 'literal', '', NULL, 'Soldati con camicia strappata e scarpe rotte', NULL, 1),
(421, 149, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(422, 149, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(423, 149, 11, NULL, 'uri', '', NULL, 'Foto', 'https://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/.', 1),
(424, 149, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(425, 149, 4, NULL, 'literal', '', NULL, 'Immagine censurata perché i soldati hanno la camicia strappata e le scarpe rotte.', NULL, 1),
(426, 150, 1, NULL, 'literal', NULL, NULL, 'Soldati con camicia strappata e scarpe rotte', NULL, 1),
(427, 151, 1, NULL, 'literal', '', NULL, 'Soldati con camicia strappata, cappelli e scarpe rotte', NULL, 1),
(428, 151, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(429, 151, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(430, 151, 11, NULL, 'uri', '', NULL, 'Foto', 'https://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/', 1),
(431, 151, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(432, 151, 4, NULL, 'literal', '', NULL, 'Immagine censurata perché i soldati hanno la camicia strappata e i cappelli e le scarpe rotte.	', NULL, 1),
(433, 152, 1, NULL, 'literal', NULL, NULL, 'Soldati con camicia strappata, cappelli e scarpe rotte 2', NULL, 1),
(434, 153, 1, NULL, 'literal', '', NULL, 'Tre soldati pensierosi e preoccupati', NULL, 1),
(435, 153, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(436, 153, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(437, 153, 11, NULL, 'uri', '', NULL, 'Foto', 'https://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/', 1),
(438, 153, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(439, 153, 4, NULL, 'literal', '', NULL, 'Immagine censurata perché i soldati sembrano preoccupati e pensierosi.', NULL, 1),
(440, 154, 1, NULL, 'literal', NULL, NULL, 'Tre soldati pensierosi e preoccupati', NULL, 1),
(441, 155, 1, NULL, 'literal', '', NULL, 'Mussolini saluta il re Vittorio Emanuele III', NULL, 1),
(442, 155, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(443, 155, 7, NULL, 'literal', '', NULL, 'ante 1945', NULL, 1),
(444, 155, 11, NULL, 'uri', '', NULL, 'Foto', 'https://it.wikipedia.org/wiki/File:Censura_Fascismo_1.jpg', 1),
(445, 155, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(446, 155, 4, NULL, 'literal', '', NULL, 'Fotografia che mostra Mussolini che saluta il re Vittorio Emanuele III, ma l\'inchino e la stretta di mano erano vietati dal regime: la foto fu censurata.', NULL, 1),
(447, 156, 1, NULL, 'literal', NULL, NULL, 'Mussolini saluta il re Vittorio Emanuele III', NULL, 1),
(448, 157, 1, NULL, 'literal', '', NULL, 'Gerarca inciampa comicamente', NULL, 1),
(449, 157, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(450, 157, 7, NULL, 'literal', '', NULL, '1937', NULL, 1),
(451, 157, 11, NULL, 'uri', '', NULL, 'Foto', 'https://it.wikipedia.org/wiki/File:Censura_Fascimo_3.jpg', 1),
(452, 157, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(453, 157, 4, NULL, 'literal', '', NULL, 'Immagine che ritrae un gerarca, durante una visita di Mussolini nel 1937, che inciampa comicamente: la foto venne vietata poiché non si atteneva alla marzialità fascista.', NULL, 1),
(454, 158, 1, NULL, 'literal', NULL, NULL, 'Gerarca inciampa comicamente', NULL, 1),
(455, 159, 1, NULL, 'literal', '', NULL, 'Funerali e rientro delle salme', NULL, 1),
(456, 159, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(457, 159, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(458, 159, 11, NULL, 'uri', '', NULL, 'Foto', 'http://www.lafotografiacomeattopolitico.it/2019/02/06/la-censura/	', 1),
(459, 159, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(460, 159, 4, NULL, 'literal', '', NULL, 'Immagine censurata che ritrae il rientro delle salme; è stata archiviata sotto la dicitura “riservata”. ', NULL, 1),
(461, 160, 1, NULL, 'literal', NULL, NULL, 'Funerali e rientro delle salme', NULL, 1),
(462, 161, 1, NULL, 'literal', '', NULL, 'Tre soldati sul fronte del Nordafrica', NULL, 1),
(463, 161, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(464, 161, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(465, 161, 11, NULL, 'uri', '', NULL, 'Foto', 'http://www.lafotografiacomeattopolitico.it/2019/02/06/la-censura/', 1),
(466, 161, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(467, 161, 4, NULL, 'literal', '', NULL, 'Foto che ritrae tre soldati sul fronte del Nordafrica mentre parlano tra loro. La foto fu censurata ed archiviata come \"riservata\" in quanto i loro atteggiamenti non mostrano fierezza bensì paura e sciatteria sono occultati. Inoltre nella foto alcune camicie sono strappate e uno di loro sta fumando.', NULL, 1),
(468, 162, 1, NULL, 'literal', NULL, NULL, 'Tre soldati sul fronte del Nordafrica', NULL, 1),
(469, 163, 1, NULL, 'literal', '', NULL, 'Spari sul fronte del Nordafrica', NULL, 1),
(470, 163, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(471, 163, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(472, 163, 11, NULL, 'uri', '', NULL, 'Foto', 'http://www.lafotografiacomeattopolitico.it/2019/02/06/la-censura/', 1),
(473, 163, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(474, 163, 4, NULL, 'literal', '', NULL, 'Fotografia che ritrae dei soldati mentre stanno sparando con il cannone; la foto fu censurata ed archiviata come \"riservata\" perché alcuni si stavano tappando le orecchie per paura dello sparo.', NULL, 1),
(475, 164, 1, NULL, 'literal', NULL, NULL, 'Spari sul fronte del Nordafrica', NULL, 1),
(476, 165, 1, NULL, 'literal', '', NULL, 'Due uomini suonano sul fronte del Nordafrica', NULL, 1),
(477, 165, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(478, 165, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(479, 165, 11, NULL, 'uri', '', NULL, 'Foto', 'http://www.lafotografiacomeattopolitico.it/2019/02/06/la-censura/', 1),
(480, 165, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(481, 165, 4, NULL, 'literal', '', NULL, 'Foto che ritrae due soldati mentre stanno suonando. La foto fu censurata ed archiviata come \"riservata\" perché vengono definiti come \"accattoni\" e la sciatteria veniva occultata.', NULL, 1),
(482, 166, 1, NULL, 'literal', NULL, NULL, 'Due uomini suonano sul fronte del Nordafrica', NULL, 1),
(483, 167, 1, NULL, 'literal', '', NULL, 'Lo sguardo terrorizzato del soldato verso il Duce', NULL, 1),
(484, 167, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(485, 167, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(486, 167, 11, NULL, 'uri', '', NULL, 'Foto', 'https://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/', 1),
(487, 167, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(488, 167, 4, NULL, 'literal', '', NULL, 'Lo sguardo terrorizzato del soldato verso il duce	Immagine che mostra Mussolini visita ad un soldato, la foto è stata censurata perché il soldato lo guarda in modo ostile e denso di paura.', NULL, 1),
(489, 168, 1, NULL, 'literal', NULL, NULL, 'Lo sguardo terrorizzato del soldato verso il Duce', NULL, 1),
(490, 169, 1, NULL, 'literal', '', NULL, 'Soldati feriti', NULL, 1),
(491, 169, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(492, 169, 7, NULL, 'literal', '', NULL, '1940-1943', NULL, 1),
(493, 169, 11, NULL, 'uri', '', NULL, 'Foto', 'https://www.archivioluce.com/larchivio-inedito-le-foto-censurate-del-reparto-guerra/', 1),
(494, 169, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(495, 169, 4, NULL, 'literal', '', NULL, 'Fotografia censurata perché mostra i soldati feriti.', NULL, 1),
(496, 170, 1, NULL, 'literal', NULL, NULL, 'Soldati feriti', NULL, 1),
(497, 149, 57, NULL, 'literal', '', NULL, 'Sulla foto è riportato \"Camicia strappata! Scarpe rotte!\"', NULL, 1),
(498, 151, 57, NULL, 'literal', '', NULL, 'Sulla fotografia è riportato \"Se pubblicassimo foto di questo genere ci faremmo una bella figura\"', NULL, 1),
(499, 153, 57, NULL, 'literal', '', NULL, 'Sulla foto è riportato \"Ammirare la fierezza (!) che traspare da questo gruppo!\"', NULL, 1),
(500, 161, 57, NULL, 'literal', '', NULL, 'Sulla foto è riportato \"Per fotografie di questo genere o si scelgono dei bellissimi figli di razza italiana - ben vestiti ed in atteggiamento veramente austero- o non si fanno!\"', NULL, 1),
(501, 163, 57, NULL, 'literal', '', NULL, 'Sull\'immagine è riportato \"Hanno tutti paura dello sparo\"', NULL, 1),
(502, 165, 57, NULL, 'literal', '', NULL, 'Sull\'immagine è riportato \"Sono accattoni o soldati?\"', NULL, 1),
(503, 171, 1, NULL, 'literal', '', NULL, 'Cocaina di Francesco Messina', NULL, 1),
(504, 171, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(505, 171, 7, NULL, 'literal', '', NULL, '1920-1921', NULL, 1),
(506, 171, 9, NULL, 'literal', '', NULL, 'Scultura', NULL, 1),
(507, 171, 4, NULL, 'literal', '', NULL, 'Opera di Francesco Messina datata 1920-21', NULL, 1),
(508, 172, 1, NULL, 'literal', NULL, NULL, 'Cocaina di Francesco Messina', NULL, 1),
(509, 173, 1, NULL, 'literal', '', NULL, 'Edward Colston', NULL, 1),
(510, 174, 1, NULL, 'literal', '', NULL, 'Statua di Edward Colston', NULL, 1),
(511, 175, 1, NULL, 'literal', NULL, NULL, 'Statua di Edward Colston', NULL, 1),
(512, 174, 51, NULL, 'literal', '', NULL, 'Simon Cobb', NULL, 1),
(513, 174, 7, NULL, 'literal', '', NULL, '24/06/2019', NULL, 1),
(514, 174, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(515, 174, 4, NULL, 'literal', '', NULL, 'Foto che ritrae la statua di bronzo dedicata a Edward Colston e realizzata nel 1865 da John Cassidy. Si trova nel parco pubblico \"The Centre\" di Bristol. C\'è stato un dibattito sulla moralità della statua ed è stata danneggiata nel 2020. Ora si trova al M-Shed museum di Bristol.', NULL, 1),
(516, 176, 1, NULL, 'literal', '', NULL, 'Abbattimento statua Colston', NULL, 1),
(517, 176, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(518, 176, 7, NULL, 'literal', '', NULL, '06/2020', NULL, 1),
(519, 176, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(520, 176, 4, NULL, 'literal', '', NULL, 'Foto che ritrae la folla mentre cerca di gettare la statua dedicata a Colston nel fiume.', NULL, 1),
(521, 177, 1, NULL, 'literal', NULL, NULL, 'Abbattimento statua Colston', NULL, 1),
(522, 178, 1, NULL, 'literal', '', NULL, 'Il piedistallo vuoto della statua di Edward Colton a Bristol', NULL, 1),
(523, 178, 51, NULL, 'literal', '', NULL, 'Caitlin Hobbs', NULL, 1),
(524, 178, 7, NULL, 'literal', '', NULL, '07/06/2020', NULL, 1),
(525, 178, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(526, 178, 4, NULL, 'literal', '', NULL, 'Il piedistallo vuoto della statua di Edward Colton a Bristol, il giorno dopo che i manifestanti avevano abbattuto la statua e l\'avevano fatta rotolare nel fiume. Il terreno è ricoperto di cartelli Black Lives Matter.', NULL, 1),
(527, 179, 1, NULL, 'literal', NULL, NULL, 'Il piedistallo vuoto della statua di Edward Colton a Bristol', NULL, 1),
(528, 180, 1, NULL, 'literal', '', NULL, 'Degrado della scultura di E.Colston', NULL, 1),
(529, 180, 51, NULL, 'literal', '', NULL, 'Adrian Boliston', NULL, 1),
(530, 180, 7, NULL, 'literal', '', NULL, '08/06/2021', NULL, 1),
(531, 180, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(532, 180, 4, NULL, 'literal', '', NULL, 'Foto che ritrae la statua deturpata di Colston conservata al museo M Shed, a Bristol.', NULL, 1),
(533, 181, 1, NULL, 'literal', NULL, NULL, 'Degrado della scultura di E.Colston', NULL, 1),
(534, 182, 1, NULL, 'literal', '', NULL, 'Installazione artistica statua Colston', NULL, 1),
(535, 182, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(536, 182, 7, NULL, 'literal', '', NULL, '2018', NULL, 1),
(537, 182, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(538, 182, 4, NULL, 'literal', '', NULL, 'Foto che ritrae l\'installazione artistica del 2018, realizzata intorno alla statua di Colston, che rappresenta gli schiavi come bare su una nave negriera.', NULL, 1),
(539, 183, 1, NULL, 'literal', NULL, NULL, 'Installazione artistica statua Colston', NULL, 1),
(540, 184, 1, NULL, 'literal', '', NULL, 'Folla rovescia la statua di E.Colston', NULL, 1),
(541, 184, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(542, 184, 7, NULL, 'literal', '', NULL, '7 giugno 2020', NULL, 1),
(543, 184, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(544, 184, 4, NULL, 'literal', '', NULL, 'Foto che ritrae la folla mentre rovescia la statua di E.Colston durante una protesta di protestanti anti-razzisti avvenuta il 7 giugno 2020. La statua è poi stata gettata nel fiume.', NULL, 1),
(545, 185, 1, NULL, 'literal', NULL, NULL, 'Folla rovescia la statua di E.Colston', NULL, 1),
(546, 186, 1, NULL, 'literal', '', NULL, 'La persona di Costanzo Ciano', NULL, 1),
(547, 187, 1, NULL, 'literal', '', NULL, 'Costanzo Ciano inaugura il 12 novembre 1933 il Palazzo delle Poste', NULL, 1),
(548, 187, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(549, 187, 7, NULL, 'literal', '', NULL, '12/11/1933', NULL, 1),
(550, 187, 40, NULL, 'literal', '', NULL, 'La Spezia', NULL, 1),
(551, 187, 4, NULL, 'literal', '', NULL, 'Foto che ritrae le celebrazioni per l\'inaugurazione del Palazzo delle Poste avvenuta il 12 novembre 1933 a La Spezia.', NULL, 1),
(552, 188, 1, NULL, 'literal', NULL, NULL, 'Costanzo Ciano inaugura il 12 novembre 1933 il Palazzo delle Poste', NULL, 1),
(553, 189, 1, NULL, 'literal', '', NULL, 'Luogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno', NULL, 1),
(554, 189, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(555, 189, 7, NULL, 'literal', '', NULL, '1959', NULL, 1),
(556, 189, 40, NULL, 'literal', '', NULL, 'Santo Stefano', NULL, 1),
(557, 189, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(558, 189, 4, NULL, 'literal', '', NULL, 'Fotografia che ritrae il luogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno nel 1959', NULL, 1),
(559, 190, 1, NULL, 'literal', NULL, NULL, 'Luogo costruzione statua di Ciano a Santo Stefano per il mausoleo di Livorno', NULL, 1),
(560, 191, 1, NULL, 'literal', '', NULL, 'Obelisco di Marconi', NULL, 1),
(561, 191, 51, NULL, 'literal', '', NULL, 'Blackcat', NULL, 1),
(562, 191, 7, NULL, 'literal', '', NULL, '09/05/2011', NULL, 1),
(563, 191, 40, NULL, 'literal', '', NULL, 'Roma', NULL, 1),
(564, 191, 4, NULL, 'literal', '', NULL, 'L\'obelisco di Marconi, o obelisco dell\'EUR, è un obelisco di Roma, annoverato tra i più moderni insieme al Novecento, a quello del Foro Italico, a quelli di villa Torlonia e a quello di villa Medici. Opera dello scultore Arturo Dazzi, è intitolato al fisico, inventore e senatore Guglielmo Marconi.', NULL, 1),
(565, 192, 1, NULL, 'literal', NULL, NULL, 'Obelisco di Marconi', NULL, 1),
(566, 193, 1, NULL, 'literal', '', NULL, 'Squadrismo', NULL, 1),
(567, 194, 1, NULL, 'literal', '', NULL, 'Roberto Farinacci (1892-1945)', NULL, 1),
(568, 194, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(569, 194, 7, NULL, 'literal', '', NULL, '1925', NULL, 1),
(570, 194, 9, NULL, 'literal', '', NULL, 'Fotografia', NULL, 1),
(571, 194, 4, NULL, 'literal', '', NULL, 'Fotografia che ritrae Roberto Farinacci, politico, giornalista e generale italiano che nel 1925 era capo dello squadrismo intransigente. L\'immagine è tratta da Storia della Rivoluzione Fascista (1919-1922) di Giorgio Alberto Chiurco, Volume IV, Anno 1922, parte I, pag 327.', NULL, 1),
(572, 195, 1, NULL, 'literal', NULL, NULL, 'Roberto Farinacci (1892-1945)', NULL, 1),
(573, 196, 1, NULL, 'literal', '', NULL, 'Foro Italico', NULL, 1),
(574, 196, 51, NULL, 'literal', '', NULL, 'Mister No', NULL, 1),
(575, 196, 7, NULL, 'literal', '', NULL, '12/09/2015', NULL, 1),
(576, 196, 9, NULL, 'literal', '', NULL, 'Scultura', NULL, 1);
INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value_annotation_id`, `value`, `uri`, `is_public`) VALUES
(577, 196, 4, NULL, 'literal', '', NULL, 'Il Foro Italico (inaugurato nel 1932 con il nome di Foro Mussolini) è un vasto complesso sportivo che si trova alla base di Monte Mario a Roma, ideato e realizzato da Enrico Del Debbio fra il 1927 e il 1933 e completato dopo la guerra fra il 1956 e il 1968.', NULL, 1),
(578, 197, 1, NULL, 'literal', NULL, NULL, 'Foro Italico', NULL, 1),
(580, 198, 1, NULL, 'literal', '', NULL, 'Statua Costanzo Ciano', NULL, 1),
(581, 198, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(582, 198, 4, NULL, 'literal', '', NULL, 'Foto che ritrae la statua di Costanzo Ciano realizzata dallo scultore Francesco Messina.', NULL, 1),
(583, 198, 57, NULL, 'literal', '', NULL, 'In basso è riportato: \"La Spezia- Monumento a Costanzo Ciano - Piazza Cortellazzo (Scultore Francesco Messina)', NULL, 1),
(584, 200, 1, NULL, 'literal', '', NULL, 'Storia della statua di Costanzo Ciano', NULL, 1),
(586, 202, 1, NULL, 'literal', NULL, NULL, 'Statua Costanzo Ciano', NULL, 1),
(587, 203, 1, NULL, 'literal', '', NULL, 'Statua di Santa Caterina da Siena', NULL, 1),
(588, 203, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(589, 203, 4, NULL, 'literal', '', NULL, 'Foto che ritrae la statua di Santa Caterina da Siena, realizzata dallo scultore Francesco Messina nel 1962, che si trova in Largo Giovanni XXIII a Roma. ', NULL, 1),
(590, 204, 1, NULL, 'literal', NULL, NULL, 'Statua di Santa Caterina da Siena', NULL, 1),
(591, 205, 1, NULL, 'literal', '', NULL, 'Fotografia monumento a Costanzo Ciano La Spezia', NULL, 1),
(592, 205, 7, NULL, 'literal', '', NULL, '30/09/1940', NULL, 1),
(593, 205, 40, NULL, 'literal', '', NULL, 'La Spezia', NULL, 1),
(594, 205, 4, NULL, 'literal', '', NULL, 'Fotografia che ritrae il monumento a Costanzo Ciano a La Spezia', NULL, 1),
(595, 205, 4, NULL, 'literal', '', NULL, 'Sul retro una scritta in tedesco che specifica il nome e la dedica del monumento', NULL, 1),
(596, 206, 1, NULL, 'literal', NULL, NULL, 'Fotografia monumento a Costanzo Ciano La Spezia', NULL, 1),
(597, 207, 1, NULL, 'literal', NULL, NULL, 'Fotografia monumento a Costanzo Ciano La Spezia - Retro', NULL, 1),
(598, 208, 1, NULL, 'literal', '', NULL, 'Propaganda post mortem', NULL, 1),
(599, 209, 1, NULL, 'literal', '', NULL, 'La morte di Costanzo Ciano e l\'omaggio del Duce', NULL, 1),
(600, 209, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(601, 209, 7, NULL, 'literal', '', NULL, '02/07/1939', NULL, 1),
(602, 209, 4, NULL, 'literal', '', NULL, 'Il Duce lascia la villa di Ponte a Moriano dopo aver reso omaggio alla salma di COstanzo Ciano', NULL, 1),
(603, 210, 1, NULL, 'literal', NULL, NULL, 'La morte di Costanzo Ciano e l\'omaggio del Duce', NULL, 1),
(604, 211, 1, NULL, 'literal', '', NULL, 'La bara di Costanzo Ciano nella sala della Casa Littoria a Livorno', NULL, 1),
(605, 211, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(606, 211, 7, NULL, 'literal', '', NULL, '02/07/1939', NULL, 1),
(607, 211, 4, NULL, 'literal', '', NULL, 'La bara di Costanzo Ciano vestito in uniforme da ammiraglio nella sala della Casa Littoria a Livorno', NULL, 1),
(608, 212, 1, NULL, 'literal', NULL, NULL, 'La bara di Costanzo Ciano nella sala della Casa Littoria a Livorno', NULL, 1),
(609, 213, 1, NULL, 'literal', '', NULL, 'La bara di Costanzo Ciano vestito da ammiraglio', NULL, 1),
(610, 213, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(611, 213, 7, NULL, 'literal', '', NULL, '02/07/1939', NULL, 1),
(612, 213, 4, NULL, 'literal', '', NULL, 'La bara di Costanzo Ciano sull\'affusto di cannone', NULL, 1),
(613, 214, 1, NULL, 'literal', NULL, NULL, 'La bara di Costanzo Ciano vestito da ammiraglio', NULL, 1),
(614, 215, 1, NULL, 'literal', '', NULL, 'Il furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza', NULL, 1),
(615, 215, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(616, 215, 7, NULL, 'literal', '', NULL, '02/07/1939', NULL, 1),
(617, 215, 4, NULL, 'literal', '', NULL, 'Il furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza prima di prendere posto nell\'automobile', NULL, 1),
(618, 216, 1, NULL, 'literal', NULL, NULL, 'Il furgone funebre di Costanzo Ciano e il conte Galeazzo che assiste alla partenza', NULL, 1),
(619, 217, 1, NULL, 'literal', '', NULL, 'La bara di Costanzo Ciano a Livorno', NULL, 1),
(620, 217, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(621, 217, 7, NULL, 'literal', '', NULL, '02/07/1939', NULL, 1),
(622, 217, 4, NULL, 'literal', '', NULL, 'La bara di Costanzo Ciano a Livorno tra la folla', NULL, 1),
(623, 218, 1, NULL, 'literal', NULL, NULL, 'La bara di Costanzo Ciano a Livorno', NULL, 1),
(624, 219, 1, NULL, 'literal', '', NULL, 'La bara di Costanzo Ciano accolta dalla folla a Livorno', NULL, 1),
(625, 219, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(626, 219, 7, NULL, 'literal', '', NULL, '02/07/1939', NULL, 1),
(627, 219, 4, NULL, 'literal', '', NULL, 'La bara di Ciano accolta dalla folla a Livorno', NULL, 1),
(628, 220, 1, NULL, 'literal', NULL, NULL, 'La bara di Costanzo Ciano accolta dalla folla a Livorno', NULL, 1),
(629, 221, 1, NULL, 'literal', '', NULL, 'Il galletto di Francesco Messina', NULL, 1),
(630, 221, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(631, 221, 4, NULL, 'literal', '', NULL, 'Il galletto ritratto di fanciullo busto datato 1920 - 1980', NULL, 1),
(632, 222, 1, NULL, 'literal', NULL, NULL, 'Il galletto di Francesco Messina', NULL, 1),
(633, 223, 1, NULL, 'literal', '', NULL, 'Arco della vittoria a Genova', NULL, 1),
(634, 223, 51, NULL, 'literal', '', NULL, 'Domenico Lucà', NULL, 1),
(635, 223, 7, NULL, 'literal', '', NULL, '24/05/2014', NULL, 1),
(636, 223, 4, NULL, 'literal', '', NULL, 'L\'Arco della Vittoria, detto anche Monumento ai caduti o Arco dei Caduti, è un imponente arco di trionfo, realizzato durante il regime fascista, situato in piazza della Vittoria a Genova. È dedicato ai genovesi caduti nel corso della prima guerra mondiale e fu inaugurato il 31 maggio del 1931.', NULL, 1),
(637, 224, 1, NULL, 'literal', NULL, NULL, 'Arco della vittoria a Genova', NULL, 1),
(638, 225, 1, NULL, 'literal', '', NULL, 'Giacomo Matteotti', NULL, 1),
(639, 225, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(640, 225, 7, NULL, 'literal', '', NULL, 'ante 1924', NULL, 1),
(641, 225, 4, NULL, 'literal', '', NULL, 'Fotografia che ritrae Giacomo Matteotti, politico, giornalista e antifascista italiano, segretario del Partito Socialista Unitario.', NULL, 1),
(642, 226, 1, NULL, 'literal', NULL, NULL, 'Giacomo Matteotti', NULL, 1),
(643, 227, 1, NULL, 'literal', '', NULL, 'Opposizione', NULL, 1),
(644, 228, 1, NULL, 'literal', '', NULL, 'Il nostro percorso', NULL, 1),
(645, 229, 1, NULL, 'literal', '', NULL, 'Incontro con Giorgio Pagano', NULL, 1),
(646, 229, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(647, 229, 7, NULL, 'literal', '', NULL, '04/12/2023', NULL, 1),
(648, 229, 4, NULL, 'literal', '', NULL, 'Foto che ritrae Giorgio Pagano, ex sindaco della\nSpezia (Comitato provinciale unitario della Resistenza) durante un incontro che si è tenuto il 4 dicembre 2023 nell\'ora di lezione del corso.', NULL, 1),
(649, 230, 1, NULL, 'literal', NULL, NULL, 'Incontro con Giorgio Pagano', NULL, 1),
(650, 231, 1, NULL, 'literal', '', NULL, 'Grande torso femminile di Francesco Messina', NULL, 1),
(651, 231, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(652, 231, 4, NULL, 'literal', '', NULL, 'Scultura in bronzo datata 1970', NULL, 1),
(653, 232, 1, NULL, 'literal', NULL, NULL, 'Grande torso femminile di Francesco Messina', NULL, 1),
(654, 233, 1, NULL, 'literal', '', NULL, 'Costanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni', NULL, 1),
(655, 233, 51, NULL, 'literal', '', NULL, 'Anonimo', NULL, 1),
(656, 233, 7, NULL, 'literal', '', NULL, '23/03/1939', NULL, 1),
(657, 233, 9, NULL, 'literal', '', NULL, 'Gelatina a sviluppo', NULL, 1),
(658, 233, 4, NULL, 'literal', '', NULL, 'Foto in cui sono presenti Costanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni il 23 marzo 1939. Ultima foto di Ciano.', NULL, 1),
(659, 233, 57, NULL, 'literal', '', NULL, 'Tit. e data del catalogatore da nota ms. sul verso. Riproduzione di fotografia originale.  Ultima foto di C. Ciano.', NULL, 1),
(660, 234, 1, NULL, 'literal', NULL, NULL, 'Costanzo Ciano, Benito Mussolini, Achille Starace e Galeazzo Ciano all\'apertura della nuova Camera dei Fasci e delle Corporazioni', NULL, 1),
(661, 235, 1, NULL, 'literal', '', NULL, 'Propaganda fascista', NULL, 1),
(662, 236, 1, NULL, 'literal', '', NULL, 'Prospettiva Palazzo del Governo', NULL, 1),
(663, 236, 51, NULL, 'literal', '', NULL, 'Enrica Salvatori', NULL, 1),
(664, 236, 7, NULL, 'literal', '', NULL, '11/11/2023', NULL, 1),
(665, 236, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(666, 236, 4, NULL, 'literal', '', NULL, 'Ripresa attuale cartoline antiche', NULL, 1),
(667, 236, 4, NULL, 'literal', '', NULL, 'Prospettiva del palazzo del governo, in primo piano NH hotel ', NULL, 1),
(668, 236, 57, NULL, 'literal', '', NULL, 'Palazzo del governo visto da dietro, in primo piano NH hotel', NULL, 1),
(669, 236, 57, NULL, 'literal', '', NULL, 'Ripresa attuale cartoline antiche', NULL, 1),
(670, 237, 1, NULL, 'literal', NULL, NULL, 'Prospettiva Palazzo del Governo', NULL, 1),
(671, 238, 1, NULL, 'literal', NULL, NULL, 'Prospettiva Palazzo del Governo', NULL, 1),
(672, 239, 1, NULL, 'literal', '', NULL, 'Palazzo INPS', NULL, 1),
(673, 239, 51, NULL, 'literal', '', NULL, 'Enrica Salvatori', NULL, 1),
(674, 239, 7, NULL, 'literal', '', NULL, '11/11/2023', NULL, 1),
(675, 239, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(676, 239, 4, NULL, 'literal', '', NULL, 'Vista e vista dal basso della statua di Ercole presente all\'angolo del palazzo dell\'INPS', NULL, 1),
(677, 239, 57, NULL, 'literal', '', NULL, 'Probabile sostituzione fascio littorio in data ignota', NULL, 1),
(678, 240, 1, NULL, 'literal', NULL, NULL, 'Palazzo INPS', NULL, 1),
(679, 241, 1, NULL, 'literal', NULL, NULL, 'Palazzo INPS', NULL, 1),
(680, 242, 1, NULL, 'literal', '', NULL, 'Monumento ai Caduti', NULL, 1),
(681, 242, 51, NULL, 'literal', '', NULL, 'Enrica Salvatori', NULL, 1),
(682, 242, 7, NULL, 'literal', '', NULL, '11/11/2023', NULL, 1),
(683, 242, 9, NULL, 'literal', '', NULL, 'Fotografia digitale', NULL, 1),
(684, 242, 4, NULL, 'literal', '', NULL, 'Vista laterale del Monumento ai Caduti in Piazza del Marinaio a La Spezia', NULL, 1),
(685, 242, 4, NULL, 'literal', '', NULL, 'Dettaglio del Monumento ai Caduti in Piazza del Marinaio a La Spezia', NULL, 1),
(686, 242, 4, NULL, 'literal', '', NULL, 'Monumento ai Caduti in Piazza del Marinaio a La Spezia', NULL, 1),
(687, 242, 57, NULL, 'literal', '', NULL, 'Dedica a C. Bergamini e ai marinai caduti alla Maddalena nel 1943', NULL, 1),
(688, 242, 57, NULL, 'literal', '', NULL, 'Vista laterale', NULL, 1),
(689, 243, 1, NULL, 'literal', NULL, NULL, 'Monumento ai Caduti', NULL, 1),
(690, 244, 1, NULL, 'literal', NULL, NULL, 'Monumento ai Caduti', NULL, 1),
(691, 245, 1, NULL, 'literal', NULL, NULL, 'Monumento ai Caduti', NULL, 1),
(692, 246, 1, NULL, 'literal', NULL, NULL, 'Monumento ai Caduti', NULL, 1),
(693, 247, 1, NULL, 'literal', NULL, NULL, 'Monumento ai Caduti', NULL, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT per la tabella `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT per la tabella `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=694;

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
