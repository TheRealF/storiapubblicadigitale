-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 19, 2024 alle 18:57
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
(2, 'items', NULL, 1, 'C\'è una statua «nascosta» in Arsenale', 'C\'è una statua «nascosta» in Arsenale\nCollocata nel giardino del museo navale ritrae Costanzo Ciano, opera dello scultore Francesco Messina\n27 giugno 1991\nLa Nazione\nAdriana Boverini\nArticolo La Nazione giugno 1991\nXML'),
(3, 'media', 4, 1, 'Articolo La Nazione giugno 1991', 'Articolo La Nazione giugno 1991'),
(3, 'site_pages', NULL, 1, 'Il progetto', ''),
(4, 'media', 4, 1, NULL, ''),
(4, 'site_pages', NULL, 1, 'Cancel Culture', ''),
(5, 'media', 4, 1, 'XML', 'XML'),
(5, 'site_pages', NULL, 1, 'Crowdsourcing', ''),
(6, 'site_pages', NULL, 1, 'Parlano di noi', ''),
(7, 'site_pages', NULL, 1, 'Biografia', ''),
(8, 'site_pages', NULL, 1, 'La statua', ''),
(9, 'site_pages', NULL, 1, 'Modello 3D', ''),
(10, 'site_pages', NULL, 1, 'Fonti', ''),
(11, 'site_pages', NULL, 1, 'Fonti primarie', 'C\'è una statua «nascosta» in Arsenale'),
(12, 'site_pages', NULL, 1, 'Fonti secondarie', ''),
(13, 'site_pages', NULL, 1, 'Galleria', ''),
(14, 'site_pages', NULL, 1, 'Media', ''),
(15, 'site_pages', NULL, 1, 'Interviste', ''),
(16, 'site_pages', NULL, 1, 'Istituto Luce', ''),
(17, 'site_pages', NULL, 1, 'Mappe', ''),
(18, 'site_pages', NULL, 1, 'Credits', '');

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
(2, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 1);

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
(5, 2, 'upload', 'file', NULL, 'LL1_6.xml', 'application/tei+xml', '4da050974a09b417050218974a5886ab627146cd', 'xml', '68e85e85db58eebab9226d3ad0fa9324d00256467c4646a017b809254242775a', 46329, 1, 0, 3, NULL, NULL);

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
(2, NULL, 72, 6, NULL, 'C\'è una statua «nascosta» in Arsenale', 1, '2024-02-22 15:56:37', '2024-04-19 16:39:08', 'Omeka\\Entity\\Item'),
(3, 4, NULL, NULL, NULL, 'Articolo La Nazione giugno 1991', 1, '2024-04-15 16:35:44', '2024-04-15 16:35:44', 'Omeka\\Entity\\Media'),
(4, 4, NULL, NULL, NULL, NULL, 1, '2024-04-19 16:36:14', '2024-04-19 16:36:14', 'Omeka\\Entity\\Media'),
(5, 4, NULL, NULL, NULL, 'XML', 1, '2024-04-19 16:39:08', '2024-04-19 16:39:08', 'Omeka\\Entity\\Media');

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
(7, NULL, 66, NULL, NULL, 'Lettera');

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
(44, 7, 4, NULL, NULL, 2, NULL, 0, 0, NULL);

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
('0t3lo6690bu8ncgci9rcd6ag73', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323732333233392e3839303235323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223074336c6f363639306275386e63676369397263643661673733223b7d7d, 1712723239),
('1qurupnbjj0jcrmcnc4bbphf0o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323338313133302e3634363031353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223171757275706e626a6a306a63726d636e63346262706866306f223b7d7d, 1712381130),
('210n7nq6eatnie5rnnfjnnl6cu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323838303036392e3037303238333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223231306e376e71366561746e696535726e6e666a6e6e6c366375223b7d7d, 1712880069),
('3jgmado0r6mh0adb7hcjb4p3h4', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323637373531372e3037353637393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336a676d61646f3072366d68306164623768636a623470336834223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323638313131373b7d7d72656469726563745f75726c7c733a33363a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223636316662323661616536386665303431633038383332633363646634353530223b733a33323a223238313963666333343432666333633731363136316637373831383335333864223b7d733a343a2268617368223b733a36353a2232383139636663333434326663336337313631363166373738313833353338642d3636316662323661616536386665303431633038383332633363646634353530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1712677517),
('5cuu4f9fg2tstmgabubs92h5ll', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323934313635322e3237363935373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234647537376c7231377567736f68743075753974313473387172223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323934333033393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731323934353233363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323934353233363b7d7d72656469726563745f75726c7c733a33363a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223764366561643264313366363539353134333831303661353036363330383734223b733a33323a223161656231376536366432656365383836383936643334613239373362663932223b7d733a343a2268617368223b733a36353a2231616562313765363664326563653838363839366433346132393733626639322d3764366561643264313366363539353134333831303661353036363330383734223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223963393730633664646365326462343634323333386665643635393736396163223b733a33323a226235636132643533343233313464626663346163303865663365326663366439223b733a33323a223462323363653936316336663063396663613536363138323837326263333738223b733a33323a226663303839653330313539646232303136643863396631653138303866303032223b733a33323a226630666632663562313337356533366631383466376365386630623631333733223b733a33323a223332623632353939643435323636346336666437626564656330626333656566223b733a33323a226439613363613333623738613066363735373434313138666537396330353263223b733a33323a223263303836643165636266626636633637316661353863373064326131633663223b7d733a343a2268617368223b733a36353a2232633038366431656362666266366336373166613538633730643261316336632d6439613363613333623738613066363735373434313138666537396330353263223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a226661646663303563373230626332383136623237333862333238353637303065223b733a33323a223733653633326266333062643966643365613664643136623663643334343033223b733a33323a223166643361333166393161343566386362383766616461303739643238366131223b733a33323a223137353363326339326639343135373936316366383465336232616635373837223b733a33323a223034393166393231313536396464383135623562373939313061643563373164223b733a33323a223739646132376638633462633539336332396335613962643039323736343163223b733a33323a223139636135353366653337353235316530303433313137306539363232333932223b733a33323a223666646338643961346639616238306561383130316166626131316333366664223b733a33323a223531393261326664343864333262346337363539626133316331636135363861223b733a33323a223532336362396132353937303465633864656436663131653337376237626361223b733a33323a223530306439616636616530656636393532346333383766383538623061376632223b733a33323a223664613332326561343838343536653363643466363436393239373963383164223b733a33323a226366373835633330613336363731636436633839316665316462633534636163223b733a33323a223665383864313737323137346339386132313230316162386334353137663336223b733a33323a226131666230326130386563383663366235653763366262626339646632366432223b733a33323a223632323661643965626436353032323066623466626665373562323638613834223b733a33323a226438626332343936653266326532623261356536313435623161626464346634223b733a33323a223530353536346332633633323534366563383363666262356335663366326131223b733a33323a226162336435346363333163366265363934323762643835663061363966306362223b733a33323a226431613538303863613236303837386530326338383233653466373831396432223b733a33323a223134653931383139366463616266393465313562323235376137396365613130223b733a33323a226430346164656462313763333736393333626265613461656637326134333564223b7d733a343a2268617368223b733a36353a2264303461646564623137633337363933336262656134616566373261343335642d3134653931383139366463616266393465313562323235376137396365613130223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1712941652),
('5kdlgie0o5ndp13tjo1bc6m8rb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323735343730382e3031343934343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356b646c676965306f356e64703133746a6f316263366d387262223b7d7d, 1712754708),
('5t599b01bdtftvar5qme5jc0gl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323732333234302e3034333637323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223574353939623031626474667476617235716d65356a6330676c223b7d7d, 1712723240),
('70e1op48t538hegb30pr7pqqo9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323838303036392e3235383237373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22373065316f703438743533386865676233307072377071716f39223b7d7d, 1712880069),
('74e1lcfro7q57iflte0ulncq33', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323530333535392e3330353536343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22373465316c6366726f3771353769666c746530756c6e63713333223b7d7d, 1712503559),
('8cb2bm8dpuv3ornk1icrnjv28t', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323637373534352e3934323335383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366c6d6d34726f67336a3030366c393062673931736873743467223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323638303536383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323638313134353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731323638313034313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323638313133393b7d7d72656469726563745f75726c7c733a34313a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e2f6974656d223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223338666363303735656534376164363563663336623837363864346263393965223b733a33323a226165346336643062656532313330663336336332363833356537323962616137223b7d733a343a2268617368223b733a36353a2261653463366430626565323133306633363363323638333565373239626161372d3338666363303735656534376164363563663336623837363864346263393965223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223061643731346636323232393335386139386266653738613832643063333931223b733a33323a223837386266633464336131316137313730343135663135643139356466623834223b733a33323a226465613936396666373438303665373233356362383466656163663839313530223b733a33323a223466623939353032363961653633336238663666306261393530663735363036223b733a33323a226266373439643435393831316535653535643730656633653039343964373163223b733a33323a223538623838336361336637633337306233326336353137396561313833616131223b733a33323a223834653762303261303638313230353537316363376631326639393936623561223b733a33323a226635333162303863373762353661323035633333363230393064343834616236223b733a33323a223835376532633632653265313930653033326263333061323431343332353265223b733a33323a223337393464613339393666356134623730303539323166353762373838356263223b733a33323a223033313738643138353263346161616335343632616439616238356336633438223b733a33323a223938666130393632323238326137666266646232653961323461656430663138223b733a33323a226631353065633166653334376539636136343831646236656532633538366664223b733a33323a223936316133336132636636643731376437613763363232363436326637363463223b733a33323a223665383765626134326237373236373962643333303962306565343066653238223b733a33323a226434623537646432303734343033363165313834656466363366316564613435223b733a33323a223336326263333261623530626633346364316331656636616661353539666363223b733a33323a223166396561383864643666336434366537346137313661356361343634303865223b733a33323a223864333466663031333663326366633266646131323330316133306130306333223b733a33323a223237666635383034333138363861316464316631646664363465393434376635223b733a33323a223633353937626163346666646638623735666436393732376665393630373566223b733a33323a223834393166663732313063633430623366373635326563376535643338373338223b733a33323a226239326536393466316637333164356430613535666231333931633537343930223b733a33323a223834636137396462353162346462363139343733616238656530653131323365223b7d733a343a2268617368223b733a36353a2238346361373964623531623464623631393437336162386565306531313233652d6239326536393466316637333164356430613535666231333931633537343930223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223837643064623638316438306261316465626262356232373462613934626263223b733a33323a223235353833333336383339386538613864663936393536373562393831393238223b733a33323a226364613530353762663661393136343033326437303238323765383134643638223b733a33323a226339636237363538366132653130653062316464616330356639643630346662223b733a33323a223933303565626133626435316434353266616231666165623563663465373061223b733a33323a223832616139663264623338626366346662376265326234653966653930393531223b733a33323a226366373064623238383737363431343134373763316364393731356464303561223b733a33323a223438343361376637383363363663313132323331343539303562346535653263223b733a33323a223464643062386533653335646364656264633864656262623363656635633230223b733a33323a223437373434653866643230363730376466343465386166393664373639393234223b733a33323a223530373334643632643330383665303336656134653136313134373263656666223b733a33323a226361343936306665653264306664343562353737323264346134643939313764223b7d733a343a2268617368223b733a36353a2263613439363066656532643066643435623537373232643461346439393137642d3530373334643632643330383665303336656134653136313134373263656666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226131333632376438663038376330663533326361323062386436306438663738223b733a33323a226432333134366531633137356636613132373031306162376363383364643763223b7d733a343a2268617368223b733a36353a2264323331343665316331373566366131323730313061623763633833646437632d6131333632376438663038376330663533326361323062386436306438663738223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1712677545),
('9cbptnn44obp85vfeobpggffad', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323830393634302e3133323534393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239636270746e6e34346f627038357666656f6270676766666164223b7d7d, 1712809640),
('9qu8bpeoikd0a44jfsi1rv6fv6', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323934343133322e3034383430393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223032757037316a3335767330713737747062336f3733346d646e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323934323938343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731323934353931363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323934353931363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223331326265323138376261363234383665333562626237336534363931646564223b733a33323a226530366635393536336364613739333932323331643234653461316338646230223b7d733a343a2268617368223b733a36353a2265303666353935363363646137393339323233316432346534613163386462302d3331326265323138376261363234383665333562626237336534363931646564223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a226464636637313661333132376162393037326436356138353836343565336266223b733a33323a226563656130646238323362333464613936383739323632323937353738376233223b733a33323a223862366463613838313363636432346638326364383266363531653130633736223b733a33323a223266616262313561626462366364353536303137343432373266366434383765223b733a33323a223039663137343037303034346332633234343433646632646463363036353061223b733a33323a226232343264636662306337316536663939393462653961323562656339306661223b733a33323a223962636161313239343731646131623834613139363366643666396638626562223b733a33323a223430613032333663353166303062303966666637313065623539366166313832223b733a33323a226164336637373338393261663632636230616638323532646466616232353164223b733a33323a226536303563333665393435346536303537623131336165313764356138316566223b733a33323a226339323538613362313562653338376231336261613035373130326337333937223b733a33323a226462623438386539613765643232366238653461396130666461663261633866223b733a33323a226630653666346261363236316233653661643862383435363435393535663734223b733a33323a223037383831613332646338663537363135343239333765333231616239396664223b733a33323a223563636161353363356161346664376434636261343530313166343962333039223b733a33323a223036623732346430613137353339343431653365323131653464623336333530223b733a33323a223836626462643866333536613766346362313739373263333864656330663331223b733a33323a226633303131333264363435316633333961643235356366643863653765333839223b733a33323a223366626336616665656332663636393533336339323231636664363637623136223b733a33323a223237656465653361613933353766333831326162303437646163376633613639223b733a33323a226238366136346261353735643138386637643164303062393331346466633537223b733a33323a223664636263636537646330666336386330343330623262626231306666386564223b733a33323a223233656236363164623564386135643736633733613537386331623934643036223b733a33323a223065306563623638313566653264323534366635343231306435656638353466223b733a33323a223635333937636261666462393936346237393032656563343935306336306138223b733a33323a223463653730333265313939386161613139633839306430333538613734373563223b733a33323a223234663237343836636564656332306265303266303739656139363230306566223b733a33323a223436323534323730353231613037376334306634646438336533393230353833223b733a33323a223265343736373432313533626263316562623331306566616134313436616561223b733a33323a223031616164333663383064303731373032346538663330393230383663386331223b7d733a343a2268617368223b733a36353a2230316161643336633830643037313730323465386633303932303836633863312d3265343736373432313533626263316562623331306566616134313436616561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32373a7b733a33323a226666663065356232316664626664656635633130303235396430313761313737223b733a33323a223532346530343037383434356638663435366336376136356135376662643566223b733a33323a223637366335373631316366633639363533386532383163653362623838636434223b733a33323a223032373563343461356634393832363262313431666465383463366436313933223b733a33323a223937303961343232613036656264306538643530376537363631366239363836223b733a33323a223138626434636532643361633731323736353966613664313362316132353139223b733a33323a223931333035383338393535373936386363363963643963313133326631393536223b733a33323a223738326261376432623137323363336133373835333663643234316335326431223b733a33323a226537646162623765346339623662646634346335663135633863653631393866223b733a33323a223634346337376334663938343661386664323637646162333532303161336361223b733a33323a223435333236316461343765333462356633656530376266323763643839626165223b733a33323a223235393632613339633935633063313962626132306665373762323538643463223b733a33323a223766333064666630653032303737623863356432313033646161323366303235223b733a33323a223061616139653233663364646661616666383534643338633236303537343430223b733a33323a223133643439356166616265353832653930636630626332343936363839396535223b733a33323a223764653061653436313464383836343231633437306336653866313038393238223b733a33323a223332353831623238306263343432643830656561626439343832303262306563223b733a33323a223063306531623238646532626165633737356366653466626635313232333131223b733a33323a223634376536636632613230663732653133373635376230313266626236313237223b733a33323a223530326363333634373730626532346232396634653238306536306264316133223b733a33323a223039613064666463346233616430346330316335613839313761326561353863223b733a33323a223734623837623431636337646133623036633336643937346237383135326361223b733a33323a226664346562613030653137663161663762326363633935623330646665353462223b733a33323a223437636433323633613039613062346665623633366538376336353466303663223b733a33323a226663386566626234646336383035396665656564313739353032663433666561223b733a33323a223732653830633766333034393539356261303339613638393238336137313338223b733a33323a226432336332626665623735373265313163396363653335646231633365326361223b733a33323a223832393731393861393138303864313435613236623939343133323566613132223b733a33323a226333363137613764386264363232633434316430663863366336613338623732223b733a33323a226164383237626365373362333032333434373037623666613933633136393236223b733a33323a223134623062376231393364626430626161656238663565313265356631393065223b733a33323a223733386334396134383065316237626264613664633239613465616630333263223b733a33323a223336326265326464393661613133373863653765383531306139343335623566223b733a33323a226264343262346635623861623664383538313966643434383238346331303761223b733a33323a226431303836646336663864353663383364346664366565653961653831636534223b733a33323a226164373037333037613836336437616535653335323761636638346262386631223b733a33323a223938386432363263636665376432313664353864356531313061396566613762223b733a33323a226239383330666564623961363361393766656161643534366238613033653666223b733a33323a226634666463633661653135326162623734323936333637343536363064613938223b733a33323a223938653166613233326231323033323237383837346564353434356661646335223b733a33323a226465616334373832613834383038366132616661396464306438653962656564223b733a33323a226435663166383031666237343464666632643539346131633961363266376633223b733a33323a223131656463393663643661303230646130343536326532343734363836303430223b733a33323a226638653736663030653433323033333930323533663734636534306563633939223b733a33323a226566613466633462663535343365626639393463303461656137666633346532223b733a33323a226566623364643230626463383031336362313536336661343634663533666261223b733a33323a226239383333323831373735653134356332636133363735393563653638316331223b733a33323a226161663663383162623339613261353230656364363161363666613334666662223b733a33323a226134333539376230346562656465376632316664393965383666323363616266223b733a33323a223032626437326137613232333832373537316566393061393761393934653532223b733a33323a223339373462363362373931366639373839633837656565363038323766353438223b733a33323a223965656639353762316363323437656533343936313239653765666264316632223b733a33323a223664393530373866656562306564393534303635376338323830386266633763223b733a33323a226265326530363932346162626432323834643563346363343266626537663035223b7d733a343a2268617368223b733a36353a2262653265303639323461626264323238346435633463633432666265376630352d3664393530373866656562306564393534303635376338323830386266633763223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1712944132),
('bho72gbrivkm138dcfc5vem764', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323735343730382e3130353930343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262686f373267627269766b6d313338646366633576656d373634223b7d7d, 1712754708),
('eflq69r0c6hlu73ts69pj3ju1m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323839363033392e3931383330343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265666c71363972306336686c75373374733639706a336a75316d223b7d7d, 1712896039),
('f1g07m5p4mtsg72b1hn8jeguqe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323835353339332e38323934343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266316730376d3570346d74736737326231686e386a6567757165223b7d7d, 1712855393),
('f52kq65h9503n97s7tct3ob7u7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323732333234302e3131323430393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226635326b71363568393530336e39377337746374336f62377537223b7d7d, 1712723240),
('g3umaaic0gi18kdjek4o7e4kor', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323436343034302e3031343135363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226733756d6161696330676931386b646a656b346f3765346b6f72223b7d7d, 1712464040),
('he2df02lv8ihukd0tbfq5hctd0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323436343033392e3835303436343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686532646630326c76386968756b643074626671356863746430223b7d7d, 1712464039),
('heitpa8tigft1b0uks9esf9cdp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323436343033392e3936353532333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686569747061387469676674316230756b733965736639636470223b7d7d, 1712464039),
('ho952f386d2roc0dbqg5ibac7s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323633363833392e3930393231373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686f393532663338366432726f63306462716735696261633773223b7d7d, 1712636840),
('i5udgn6qdp26j7portvp4u5l4p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323633363834302e3036303538343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269357564676e3671647032366a37706f727476703475356c3470223b7d7d, 1712636840);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('ibg59bqnkf1apegetd0eu08ufu', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333534353736392e3236353339383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f716c74326d693571656e39727633326e717675643965616976223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534373839383b7d733a35313a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534373639313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731333534393234373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534393236333b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534383738373b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333534393230343b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226431633934613265656465356164333436623065363839653033666233616263223b733a33323a223062366635633637393537343738636331303630626362613363316337643233223b733a33323a226334393231646364626161383661646238666334373939316339616234386435223b733a33323a223662313965373266353366333930303239323261376162383932656664663961223b733a33323a223238316133663035393238386462616665633437313063343766363739663435223b733a33323a223735306362363038643037366434363962636239346165663862643636393736223b733a33323a223236663363323731663030623139376662373535633234373633393132323764223b733a33323a226362666332323236636362646164633330623139633935636263656261303238223b733a33323a223431313165373538316339653466643936633936393938373066323331616338223b733a33323a223863353537306361303162633761363465623339623564306366656562353131223b733a33323a223066613836353931306564643838356561383630333332376430643031386339223b733a33323a223030313230383437613566383539653165613234353963663565663136303434223b733a33323a223661636366373936333031636564386132363432306134666666613739303735223b733a33323a223436613630323566333734656337393435353632366363363564663037356130223b733a33323a223465393936656635356566373335306434316264653162623238356534616463223b733a33323a226134313335333933666333653034376362656364303238343130383264343862223b7d733a343a2268617368223b733a36353a2261343133353339336663336530343763626563643032383431303832643438622d3465393936656635356566373335306434316264653162623238356534616463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223066623166363831353230356438303838656564353236663531663332353566223b733a33323a226664393861636430616463616663343731376539656632663966333065333164223b733a33323a223165373466333661316164613939363664636235666431303466646361363337223b733a33323a223437633466353366646364623131663937663738636331366265613331656564223b7d733a343a2268617368223b733a36353a2234376334663533666463646231316639376637386363313662656133316565642d3165373466333661316164613939363664636235666431303466646361363337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a226433356438316235373966373930396266306262346166656237366164636539223b733a33323a223262326432633637326564616365613562346330663032316534623230323138223b733a33323a223833343736623165653965373535613736323162366136366232316432383534223b733a33323a223866396130343961386466396331396432393563386266353936306532363731223b733a33323a223933356236353164373433633536306261616365373065336164353966306234223b733a33323a223136663135666166356539613637326536316136396135303832303964303963223b733a33323a226634663338643566396630363232303363636634376135343733656137326166223b733a33323a226432376534316263663663643738636364373130363330643866303933656166223b733a33323a223038343264646539643035613636363863616333363335373435336437396531223b733a33323a226539613163636564306330623732383962643765323365333531643538613536223b733a33323a226163356465333738353033363364633662336130613265373463303664613437223b733a33323a223238626635326564646638623130666636333866643339346636376234373861223b733a33323a223162663233366230636535343262363166643136303837653238313630336666223b733a33323a223665336333623131623530613838616236356438653464333335623933303263223b733a33323a223432343066646136316265316236656332623337363963636366663763386539223b733a33323a226535336539306530323766316232366362663532613638623637653137343665223b733a33323a223237623733646434623366663463376563323766626436303064663464363262223b733a33323a226639613963663036396561346365313631653631313564383033383331396664223b733a33323a223035323134363438663235333238323631323737643839383936326438313037223b733a33323a226461666336343463323935616636333930366230386135663466313539363036223b733a33323a223036376131656661313634373139643831636661333464633533623930363266223b733a33323a223661373763643962303463363361303830623861366636326139656533333463223b733a33323a223766343862303638333661316662393738393962633662616530316661383136223b733a33323a223733663565353233333232613664656364383963316339663566663963333132223b733a33323a226334616332343434653262306633653735396161343831666337306235363836223b733a33323a226233333838306165336162373239363035306464363436643464306165366564223b733a33323a226236383633396233316638626638643765633961663962623631393266653563223b733a33323a223163656661366639333263663066353964313130316466616138663636616236223b7d733a343a2268617368223b733a36353a2231636566613666393332636630663539643131303164666161386636366162362d6236383633396233316638626638643765633961663962623631393266653563223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33303a7b733a33323a226336303262666633323038363035653632663064323831323966313432636431223b733a33323a223637643762656436343964656365343736393537666235656264353436636563223b733a33323a223833366364363836616636383532646461383562343034353132386635336537223b733a33323a223034643365653538646632646633303263356564666330333563663365303637223b733a33323a223638633134363037623163643661313536636132346534376665313739653462223b733a33323a226633646332653331366530303264316636353635633262623065623639373164223b733a33323a223065633061613835396435383838396162383439643831393437333263336466223b733a33323a226132343365326264326331613836383931383938356230333937386566333839223b733a33323a223638326233383738336261616263656637346139323731626335653735613063223b733a33323a223734363233346238306264396139386135366665313732383531623762343037223b733a33323a226663383738383538653032363134636531346139663831636166323737623564223b733a33323a223835663562326365343463633830393861316131353337386134653865313036223b733a33323a226265356133386539653364356536643762636238313838653730343330326463223b733a33323a226339303762613434623439336235643734366235366430376366376164383061223b733a33323a226535393961633632313037303930313763333137613436613732353862396264223b733a33323a223037343836366235343735333636363264313063613761396535333932356531223b733a33323a226138643437653033353461346361373131353166333333376539616630393235223b733a33323a223439343262353462376338613962306639363134356438623633646232393430223b733a33323a226334366433323736393162383733386133323630383366356266376138653533223b733a33323a226563666566313231363566316133663761636530376138363930386466643865223b733a33323a226533353866383331353035383535313135656261616262373035366666356338223b733a33323a223062616666343935353465313565343230633436636166643633653831316238223b733a33323a226462353762353064383938313131373334376634633562656661346634306134223b733a33323a226132633166643431663233343439656434323138383835666434376634643937223b733a33323a223736393339626237623166633832313533623161356462373962613030343833223b733a33323a226236343761633764303763636230333632333934656332323639373164623731223b733a33323a223161643237666431653032316236343839383662616363363936366236353632223b733a33323a226236356364393732393930333165643934373562616161633664386364633237223b733a33323a223763396630396265633564313632366461633034626138623363353630633136223b733a33323a223735613637386665366564383935333332663234326239643864663062633961223b733a33323a223933376236623063376563653765613031316530653265626433643230633230223b733a33323a226333616561643232653439363532303335363934313134373665383639613538223b733a33323a226131646134326237373338376434623461303563663037383037336164353938223b733a33323a223436333834353230623136306636383862653964623932623661353130323734223b733a33323a226463376235666463653834333732323830303937383864366538666365343831223b733a33323a223634326638623361656666333362663439636536323832323534653039613037223b733a33323a223863653265313638303264376134376562626435396534396437623130313037223b733a33323a223731333330333165333861386534363635353334343361333237393764646265223b733a33323a223931396137333761643632333436343964613663643661653433633262336465223b733a33323a226165636138646537663366303832326533313431613031393734623834356532223b733a33323a226637316261623437353237363664323462396465653766613438363533383034223b733a33323a223332373565663739656362623365343065396435653133643965303033663333223b733a33323a223662613932633334633835373131306337616263363934653561323037643961223b733a33323a226364363561313932306263633365626635353866303865613463313765633063223b733a33323a226462363637366638313365633564663865633231656531356236346261643238223b733a33323a223735356666653938333932646466343462343632303061346433373437626566223b733a33323a223034346265626131613661653734343664623765623032396566396236396461223b733a33323a226631363931346162626265643339336565353739366132303633346130366134223b733a33323a223830336363613938666663383336366238613130303666383461316637313036223b733a33323a226635666561373138393265313539653963616364376561626639386232313739223b733a33323a226266316337626435656664313837336636346336663965303962303735653335223b733a33323a226639393436653661646132346166333631653636616466383265343035373364223b733a33323a226334366635353533626231313536366465333438366464623332313333343964223b733a33323a223333333734633239333431666466333962666634316639633165396265306165223b733a33323a223866336636346232633237306434383537663736666664353031643337366633223b733a33323a223236663562613437613431383362613133636166396631616434353062613835223b733a33323a226565336435373234346535613635636534636236613139636131353233636133223b733a33323a226335393462313666373064633464333931323266336132333231333639396663223b733a33323a223132633766393434623965366137333032623236303863646666363261623064223b733a33323a223966386532373363383636303465383636623138633062336566636661613538223b7d733a343a2268617368223b733a36353a2239663865323733633836363034653836366231386330623365666366616135382d3132633766393434623965366137333032623236303863646666363261623064223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226234353238393835383930666662383730653433663864343162623737353132223b733a33323a223762366364353430343836356333303434303262313437653530366234313265223b733a33323a223139656462666563353561623264353138656133386663623430633966306332223b733a33323a226637306537623661643532613532353666366135626232393539366466663039223b733a33323a226531346564306431613935653466386639643639393130326365386234386262223b733a33323a223861666637353966393136633231623363623131653232396437396631643338223b733a33323a223137633566326463646362353966303838613437303463313164396436386237223b733a33323a223030343836356335336331626135346635643139626363383635663738376236223b733a33323a223061376536633965383166326363363663616330376232356332316131663138223b733a33323a226361393530636433633663616161386131346535373264643231353866356433223b733a33323a223734653636313732633330303232306266353162333631613762306632353430223b733a33323a223637396338363266623330316663393339633030316631346563613238323263223b733a33323a223333316561353438663438656466306439616131326530623364613965306436223b733a33323a226336346237663430303164643134346533666431316534363862663864343736223b733a33323a223961333664323461336230646138376532353561386334343661666536623463223b733a33323a226532323830396332396533343032663865373537613039323331626638343566223b7d733a343a2268617368223b733a36353a2265323238303963323965333430326638653735376130393233316266383435662d3961333664323461336230646138376532353561386334343661666536623463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226232373662653063623538323664643565663235313965303266373432316537223b733a33323a226137363761316234333235643232613862386165353237333863663135663035223b7d733a343a2268617368223b733a36353a2261373637613162343332356432326138623861653532373338636631356630352d6232373662653063623538323664643565663235313965303266373432316537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1713545769),
('j3nli27vqb1k0p0p13o9d6rm9t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323535303434302e3031383237313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a336e6c693237767162316b3070307031336f396436726d3974223b7d7d, 1712550440),
('jhaae0cb0kt4eadmdl7lg46tsu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323735343730372e38373638333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a68616165306362306b74346561646d646c376c673436747375223b7d7d, 1712754707),
('jl9n701g6uk9pb0r62a9ulbj7d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323430363635302e3931383432383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a6c396e3730316736756b397062307236326139756c626a3764223b7d7d, 1712406650),
('ktab46of8cjp5ntt1lb5qgc7ps', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323633363834302e3131313832313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b74616234366f6638636a70356e7474316c6235716763377073223b7d7d, 1712636840),
('msd6vjk7d8ba0eplt7t5anmaum', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333031393739332e3033323736323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226436716c69393939766474343773387072746763376e62386239223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333031383236313b7d733a35313a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333031383234313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731333032333338343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333032333339303b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223533656632636337313837356133323163336234646565623061396137343039223b733a33323a226438373237626563616634633735643133666634623733336133333062363566223b733a33323a226131643332306562373537373633383663353061353464633662306136363035223b733a33323a223062633333646633623365633566643230633839353336343130333437653965223b733a33323a223738613764326230373734313733393138383666626531393732333333303166223b733a33323a226438636338643034653830356464656564303339383466333336656434663261223b733a33323a226136343935653235616231316162636463663564376637303931353237633837223b733a33323a226637303832666666336463623363316266616531353032353164306433383063223b733a33323a223261326166666264626235343334643965613333646330393632356532656138223b733a33323a223233623263663166313634653936313133666332313738373333323761383563223b733a33323a223930336466323966613038383438336531666231313439623433613833373731223b733a33323a226164333137613430626138366136316164306666396261616538633233313365223b733a33323a223439653934363064643937343933343233313364656133313837663734326233223b733a33323a226266663535306438356161663763313765613638663439336235333635363339223b733a33323a226530363462386531616532343138366134333439323462353335653530396436223b733a33323a226665336562373134393964356663636361633265366438393036623365663031223b733a33323a223030316331373235323163653765326365356630383061623736623634373334223b733a33323a226330326337643066643262656632623331646233306339363639313432336535223b733a33323a223132633765386664363030633861323833633736393163636132636532343262223b733a33323a226465613663663435613162636632316361396133663461323638306436376361223b7d733a343a2268617368223b733a36353a2264656136636634356131626366323163613961336634613236383064363763612d3132633765386664363030633861323833633736393163636132636532343262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223464613235623237326233623433393936346565353532346532313435363662223b733a33323a223764363265623335643830643930653934376165393735636565303539343531223b733a33323a226438366266653031643739346330623236643265656561326639656566373561223b733a33323a226463613662303862643263643161393333346530356236646261343632616537223b733a33323a223237653962346231623634353832313532386265343666346530376564313433223b733a33323a223734396161633464663965363131376537323164663462643536653730643639223b733a33323a223163383434663263386230613432646131613433623436333334343335633437223b733a33323a226231333962653764376536363338643963356665333535353431303034353363223b7d733a343a2268617368223b733a36353a2262313339626537643765363633386439633566653335353534313030343533632d3163383434663263386230613432646131613433623436333334343335633437223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3132323a7b733a33323a223537343066316639323139363131343161366630383331653863393034646634223b733a33323a226261643430623633303238646431353236373837653131393438643439663062223b733a33323a226161633432333139363332663334666238323662633663363036633332666161223b733a33323a226334623032393562363139303535656666396563373036366534613732666265223b733a33323a223365623036646464396462643234303037343861623235316436643035313163223b733a33323a223565376333663538616239613865623437626334396337323230643331326531223b733a33323a226434343034323230383361643763613537363836633031383065663161346535223b733a33323a223862613066313265386664366661626439396531663736316166303965623937223b733a33323a226339313531346436623634366231373462303164613039306466326238306233223b733a33323a223263626462323539396232363864383562656430646464376436663531653261223b733a33323a223961613432356132323862333435336166323433343434623235303034383236223b733a33323a223961303562316562316336613737623235316562313034623866363362656135223b733a33323a223539323163376634363563613739346562326632373836353764373635373364223b733a33323a223733356332623366326365666662323531613663633735363364303661336561223b733a33323a223730646339383464353030333763663332306531386539343762366637326463223b733a33323a223366376465396531646237636534306137393064323734386236336362346534223b733a33323a223234323936333035343762393866636261323065313563643132313135313661223b733a33323a223163353663643539616464363333353637363538383364396233353562613834223b733a33323a226333386336333866303339613336656637613163653461613963303735656266223b733a33323a226164616265373739313263363834666666303036363535323836353162666166223b733a33323a223739656633306439616431383265323538313936643238363633313538386632223b733a33323a223662613534323964306566646138326332663631636536613466613630666338223b733a33323a226263316339623037653065633264326438343634616235366166323139653931223b733a33323a223430356565333934663063373363333733333038373535343739316636333430223b733a33323a223462376561373537326435623839306631653065343830643132383865656134223b733a33323a223066626438316433343432663133343632383435656631316530333339336538223b733a33323a223464323130313763313734386238383636373631363531633034623561613538223b733a33323a223738363638386231623332623935666339636636306564396337353638393030223b733a33323a226338376262656537663432643730313764656132326365623934303362666236223b733a33323a226339653733356430613831306433373666363035646336313963626635313633223b733a33323a223961373964333066303364613465396536636564366336336362643033303435223b733a33323a223063313930313230623139306530313732313531346437333762643738613834223b733a33323a226264336437333838666533316465356330363630383634386664373730353265223b733a33323a223932333763666232353731356235646366613135636663343031333938373936223b733a33323a223937323463643034653531313635363566363334376133393230643731306361223b733a33323a226630363265303936393336646263316236356437376530393961623532366538223b733a33323a223764326363323966386238376234613464626262663631336435306439356634223b733a33323a223539396332303061383330613737333234313463306637656336373639376136223b733a33323a226134353136386234336661386634396561336332366137613265326564353634223b733a33323a223963306465346239323134333463643361613430663133373035663535656338223b733a33323a223866643230666130626239383365383838653339383139376333346163356436223b733a33323a226139396135316431656164616636313739363062626262616430356236636164223b733a33323a226230303631346433383565613033306464333264613365656436396162396332223b733a33323a223064366332613263633737613637623531656532306561663630666535323635223b733a33323a223437363434306431323232653730343264636562393636363739376261303263223b733a33323a223265393738363764336533383863303734376162353935343262333335656532223b733a33323a223338363631653730363134343033396466653663316436303861646634366666223b733a33323a223466613530363331393533376666333962323834376530306436656639316334223b733a33323a223536373132396131373034633837373733663862383837313235646161376530223b733a33323a223964326531666630303234616361623338653234393230636365656436393532223b733a33323a226366336632646361363436373936313264306637616138343165666131366430223b733a33323a223332356538383031346334303530323961336231643761656236316466643634223b733a33323a223562363563333234336663373335623634653231356232373635386236303835223b733a33323a223562316466353164626261376165616163326639373633306638376336663661223b733a33323a226165653431353365333830336663383161613930336466346538636137386536223b733a33323a223032643239303665326363303736626634333933313737323330643230623331223b733a33323a223331643731396430616165313662363162343230363166646339313639623563223b733a33323a223937363663653365326131646135323839616663393162643232623064383230223b733a33323a223935336339633365313931303035373231393935313834313162353236326463223b733a33323a223932363239646164666562396639616239613330663838656134343961626332223b733a33323a223366646633613236336537643664373530373432313739303237656366643737223b733a33323a226437616565373862613761383833393931663530623038366266633037623433223b733a33323a223039646635343936616264373339353733386336363462326236303831623134223b733a33323a223037646465333361363034643831343735303935616261366563613632333233223b733a33323a223363656635613361653933303637383164306164396538363361653434616366223b733a33323a226339643866396638663732396635633462396435623862626437363935383862223b733a33323a223236643734343633396634366234323137633138396636616630346138393636223b733a33323a223062356530613130616430393466613462373130633330303763343963323961223b733a33323a223837353233643862653163613461623931326666333833373930366464663335223b733a33323a223965396330653935643732333839623236383166633165316661326134376464223b733a33323a223434373137386138353633303264653337373739326431383933626231633362223b733a33323a223864363039306338623237373566616131393832623465383665373830386535223b733a33323a223933383935343362323262373735343265346130376638373433393731623765223b733a33323a226131613837313238303932313931313236396230636265373961376333306434223b733a33323a223135623364616563663232313363613033303430646237613934633361356466223b733a33323a223837363634626639613035303663396564313264643166383062616463643635223b733a33323a223231376161303031623561633731333830376362666462396337653335323761223b733a33323a223237643539376632303866336561353339656432333137623436366364613163223b733a33323a223865363863393333373436633663323964303338326138343930356132333666223b733a33323a226231386636346535303235663566396463396236613537383565383133346234223b733a33323a223265333438316666326565666266313731386236366234663866393635393463223b733a33323a223837663961333133356135383532326230343932363266313464343135666433223b733a33323a223966323732643231303061356330626363316466633932616564363764326538223b733a33323a226434343461346530623638633561626236663033633937613437656333643139223b733a33323a223762643831363365613335333130623466353436383263653463333863343434223b733a33323a223335393534386133396135633762333439393663303631646361613531613566223b733a33323a226134333164646538306333323864356437316634303166346663663136326531223b733a33323a223337306239656535663232333936366638636363396135363437653733616435223b733a33323a223865333938346639386261626431636331366436623137383830323335643034223b733a33323a226466333561393461356164663332356464396464633937353131626530623334223b733a33323a226130663833306161626333363432326335623666333736663862363561383261223b733a33323a223634366239326530626665303361343334333066666663613764336136323066223b733a33323a223462386266303162356234653639313463396138373563643835636533626465223b733a33323a223661396232613835363930663130306333333462316566303436306334373138223b733a33323a223163343335656439636135353934663361326339356131343338333133303061223b733a33323a226562303838343063323761383631333433363162313861323864353563633465223b733a33323a226565613634366534373465306438333833396661343365353565323662383532223b733a33323a223562633266333337646132663632306534623131343939336162636135333832223b733a33323a223064353964653964383930633061613435656631383464383234636534656634223b733a33323a223664336530363934303333613830636239373764663161363439313639623931223b733a33323a226533383362303766353733653139313761663262393133356637333139346563223b733a33323a226131333137613238353736343566316565626665303633663062616432366633223b733a33323a223964353731326536646237383362653732613236643132666363383063396133223b733a33323a223539343237623033663966393962363663336635343665333632623031346365223b733a33323a226363323431333237353730633134333030343461653738656361623636313266223b733a33323a226131616638323437663738663837326363643861336666393533636165343434223b733a33323a226662393139333666376563643537326336386433353362346636346464313234223b733a33323a223766363534613764636566623263393235323165313636633335366664323538223b733a33323a226432353136643563316364653434666234366633653135643437326635303235223b733a33323a226433636665333631353535373531303435643730313738323135366630633862223b733a33323a223766636361336561396335333362623635666332326231643934393636663832223b733a33323a223637613662643761393136323736623635376539306466653764386238383265223b733a33323a223765646330323931616265653632353339333636396138393335396331666164223b733a33323a223662383061353961633632383032653535353966333937393961346333343933223b733a33323a226264643765323537633536353565353162343966383534643064656137323864223b733a33323a223364396233356462626330326132666437353136333735313531383239663033223b733a33323a223662633734613638323266343739343665383230383035643361383461306264223b733a33323a226163663430353433383636613331623131353431626465373431633936383461223b733a33323a223365393131353761343764336261363136656464306238353830396532643239223b733a33323a223336366237666137616165626164363034333632353366393266623063356330223b733a33323a223336393661663734356164636634323161343732306231356230633434653033223b733a33323a226437623931313435323965346330383161633839333636613961613537643332223b733a33323a223531333534663034313961626366616365323939306562373630393864616139223b733a33323a223235373765353133373162663639666162343434613566613138643235343361223b733a33323a223636356533363631663731316635393231653462376333373661393834313362223b733a33323a226538363336343635633535616234303838343736646166366234316266356238223b733a33323a223539613761663231356231613964666533386364626564353139653133626439223b733a33323a223635643862393432396665386239333136363330623533376335346137643264223b733a33323a223133306335326437323863356365383833323339373538623637363331346261223b733a33323a226138306536646632626333356464333066323165643839356630653565353661223b733a33323a226666396263643139646639663463363938633436376432366561303531643034223b733a33323a226366626432306664333239363935663261333530623331353963316265393332223b733a33323a223038623234303361653136643935343338393232353561353861363033616338223b733a33323a226164336139343035613733386130303430623936626532653738383235393962223b733a33323a223133383139636232306466613636383466313166376466646536656639373539223b733a33323a226665373264353138366162393834333131306230616136323065353062653433223b733a33323a226561626630633430623230393231626566613039386138636636326239306361223b733a33323a223531373861326564323631616435326438386338336232396132323666636262223b733a33323a226639343132363530643161653130633562313030633565613663636230656131223b733a33323a226231646335333561363064646335373034323638373037353039616165383839223b733a33323a223739653061313132346266393732656463626637383561616361653762306333223b733a33323a223439383830303230616365626532303365303339396465323537383837666433223b733a33323a226366613362653734656662636462633939656537623565623337393761623831223b733a33323a223264616237646236316537663663623562393033373065376131656337363039223b733a33323a223532376364663564636361366161643432303530313034653766386462643333223b733a33323a226330613830336231626633363733396138636339373031623864323165323861223b733a33323a226337343537653230313861636632376662633236623662653961636530643564223b733a33323a226566646430336536636435383366613038633531303934333037383131643638223b733a33323a223665376238376466303134363333636130633366636231633730326163636631223b733a33323a223064653262623535303731623835653938613961656135373735616366363462223b733a33323a223761316333356532306332363034373832343462373762343234393439383636223b733a33323a223233633630373030386232386338636266613562323466343862383765303134223b733a33323a223332356538303164646136386261656133666238663233666432396465386163223b733a33323a223433393133633733383737366262646532663936346362383537323635326662223b733a33323a223862636131366533626239633833353766323837306135326266363062646237223b733a33323a223837386335653532316265353935616438393432393239636130666432343835223b733a33323a226439646466323435636465326139613936633031323034366466383562643639223b733a33323a223238316638636565383866353036343939353664313766363830653934666235223b733a33323a223737356232383739393564646538303936346665353431336463323934306331223b733a33323a223530636230323566653630303265363133386164653164383730333132653830223b733a33323a223636643439646239633938653666643564326166313166356236303761343533223b733a33323a223864393332633033353039393061313837343664336132386665623239646230223b733a33323a223334633239306664613636396639333366303033306234373064333633343563223b733a33323a226137346262326330346161353635376335313361623537376536316232666132223b733a33323a223465343937376236626636633266616161663136663739643332663235646634223b733a33323a223461663936373730346537366465663834623833363835626664333238313139223b733a33323a223631333237373730613463643364303135643935333933393632636539656366223b733a33323a226264633035626363346637623935373566343837376262346530373365376564223b733a33323a226265356636303439613730303133653533313838306337646333636562636133223b733a33323a226461353164363631396466643465663166666162386439363836303264376265223b733a33323a223465633964376134646561353831366432366564356665653936623330363531223b733a33323a223366643134393262636366353134316636336134376536653632643462356233223b733a33323a226138623965663831353635373165616563343665366539653161343930363231223b733a33323a226437613236646537623164333964646434393062393064376132356537353665223b733a33323a223063393537373232333739323263356565396162383636656535313838376437223b733a33323a223364633839353739386332656430336663643565366437313530663565363166223b733a33323a223231366239666538386536303066303461366431363930386235616439363535223b733a33323a226638306437346232396264666636393836353735653865366435336366393466223b733a33323a223930373533646430656635633236393035653630363939656163646430616435223b733a33323a223839613963303030316161343332623835303937346138376164366632343433223b733a33323a226232636335303264396162656639353135333330396536396263313164613231223b733a33323a226665323766643565303731373434343936613031303266333166626130633837223b733a33323a223235333064316362636535333932613664373162313861633531373031613363223b733a33323a226333346136636361396633616135633934636439636637646535333332373563223b733a33323a223066643762333130613535646539373064313362323964623731623931626437223b733a33323a223536616565643730653731373966646334653831363963373032666231346534223b733a33323a223838396133376231313464643565643663643735333931363234353039616366223b733a33323a223561316132623935303538616365326638393764383561313066333262653134223b733a33323a226331303363363139646464323831313562666566623333396137363261383634223b733a33323a226265343031656162343831306164326261663365623562396464623965623335223b733a33323a226236316536326236306364393961323163376239316664626636366539376232223b733a33323a223833613664323263326637346639313837316666333738396266376366623165223b733a33323a226333356361353563343162373137613566646661633465343437656530363530223b733a33323a223062333864653663343736353664656536303832666634333937343739646432223b733a33323a223165363263386463383233346235613665383734383032636663316164336438223b733a33323a226138386339626463326630363031306138643761396432623434313164303936223b733a33323a226435346236663938323464313762313639633264313137626337616433353963223b733a33323a226564356161396339316138363433363932366130366561326535383631643334223b733a33323a223434656362333133363236653565366431623437346431336436306139636562223b733a33323a223630313365333465626332353536666565333635376330646132633966653133223b733a33323a226239613062323739373430306564653064323731363439386263623064333531223b733a33323a223265383632636262633230333631306535323666323363626639353333393066223b733a33323a223961393763343863326133626133643363393231326566353830313537383133223b733a33323a226662326337373435356466313463323235636262303633623036643033316139223b733a33323a223162643239653737636362396462373339303836323665613235636262386433223b733a33323a223166386663303335663566353435623166663035616464306331336335323339223b733a33323a223433373536333835646266356266373762373966346663336361646666613431223b733a33323a226661643539333534656339666134393634656166393631346164386361376630223b733a33323a223264653961363439363830616136376336643165333936643833623335343435223b733a33323a223932373266623064623136626233623431353964626532373539393866663434223b733a33323a226135373330303563336665393030663664623465623632363031363038313764223b733a33323a226364383837303234613566306238306439613966653335366432613139623737223b733a33323a223638363035393566653937643462643234663934343230663665373434626234223b733a33323a226565623163303765363465613763376162356666353237333639323463623638223b733a33323a226335343930363563636534383365636630333361393934313038396566666435223b733a33323a223965656663666336303530663030623165306332653039666531646539616333223b733a33323a223035363539356239656535313664626536356166613362383432316334393766223b733a33323a226664646361626136303963663232393537373832363733386166653136323839223b733a33323a223930356664353036653935383436366439303135646637636531343261383635223b733a33323a226161663632366537303165353765613433336164623737626539306564373435223b733a33323a223262653439623161366237363339313063393231623530376633633564626464223b733a33323a223235316462316538356564646539653164366233313335376437663536613931223b733a33323a223336333836376139353335333438396437313665363232336665396265333463223b733a33323a226436343431633865663333323931303232626661363663306233616137383539223b733a33323a223534376563333130386363303537343465366265646231303039613933393238223b733a33323a223933656661643136623836643764663666333335623737363132656164363061223b733a33323a226338333632653439396333636331383762326462663736326138313862656433223b733a33323a223762373232636531666438353966356162623136356235316535343463343633223b733a33323a223636366561346331353536646638323034353162616631356664653138383436223b733a33323a226664656561306562363366303663323361306135626634636136303866633038223b733a33323a223539653236383266613864316433313561643161316333666632643032396639223b733a33323a226132303539623138643633333663316332626438313035383365316639643134223b733a33323a223138636361383331353563393639633230383663373065666236336334373334223b733a33323a226562663134323138643463313530306336313637623564363034613737616631223b733a33323a223761363864656561303337353937633731396634626438343766646236346539223b733a33323a226566316533616636643966663263323135653837636432313662393162393661223b733a33323a226466333930646234383165306164373664346661366330613135633938316361223b733a33323a223531363937623138393564373834663365336539376135373065633631656464223b733a33323a223563383038646239636338393235383435353833636135303432303231343132223b733a33323a223735336665373666343565363464613661653862383239303332616263353136223b733a33323a223266633935613332643961336366623563336361643530363134356236346363223b733a33323a223163326132626537346430616566643938326430393139376531326235303664223b733a33323a226437356464663037393336346136656338343264383235623332666639396564223b733a33323a223533643539336132333137653462336662313065326534623230376662383962223b7d733a343a2268617368223b733a36353a2235336435393361323331376534623366623130653265346232303766623839622d6437356464663037393336346136656338343264383235623332666639396564223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223264313731356662303833353664303834383361316365663965303333306530223b733a33323a226130366163323232663732653531333461636265666132623730336361366566223b733a33323a223565326365326232303766366232636432383735386638643634396131363266223b733a33323a226338653363633462303063383838303038346432633237646461326365353362223b733a33323a223231323432323463373339663134326638383963663339653631336464306237223b733a33323a226661396163366136623438306237306332323961303836333335633163613633223b733a33323a223438383633303462653439363635656161343462383038316434663138393564223b733a33323a223134356335666331613339643061316561366465626139616665333332373433223b733a33323a223365376530363430313737393736653438623961616535363933373935346231223b733a33323a223966656230386433326336616231373334363733653434656563333964373266223b733a33323a223930306637326162363364366432343138303366396561383239303634663062223b733a33323a223338343765363238636337386632373666656233336532643531323938363338223b733a33323a226238313635303761623565376437363633306263383966663030646134663731223b733a33323a223465303838333230633866646635636462666338636163336138663231613761223b733a33323a223663313263343235633430316566653462646562323162386437626433333333223b733a33323a223538333939303737663863383232663233363735643233636465353732653465223b733a33323a223562663564353734616336333962646365376665663164623837343961663361223b733a33323a223531373033663734646533616164636434626566363631643333393261316134223b733a33323a223231613433346432386539663037623833643862366465396437333537656235223b733a33323a223365613339376432666433313831646630663030623131336162663531656136223b733a33323a223034396239396135656264613638336164353132336439663866616363633362223b733a33323a226364666462366266393931323638623938653337363162393336666132313930223b733a33323a226334656135623466393061363837363233343139633066363966626430303665223b733a33323a223234313331393766663139313533313839346639393136393339383866643432223b7d733a343a2268617368223b733a36353a2232343133313937666631393135333138393466393931363933393838666434322d6334656135623466393061363837363233343139633066363966626430303665223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1713019793),
('n0f0f7bsmke66u0g8v7681rup1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323535303434302e3134323137383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e306630663762736d6b65363675306738763736383172757031223b7d7d, 1712550440),
('q5pkt160l6t5ge99odej6ndf8t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323830393634302e3037353137323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227135706b743136306c367435676539396f64656a366e64663874223b7d7d, 1712809640),
('rbaum7hlqmovkggclb0uddjdhe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323338313133302e3736373538323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726261756d37686c716d6f766b6767636c62307564646a646865223b7d7d, 1712381130),
('ri4cgcgslmvd1f2fj8vfa2vooo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323830393633392e3936363133393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272693463676367736c6d7664316632666a3876666132766f6f6f223b7d7d, 1712809640),
('siqmphod909s8morcp0nvnan0i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323839363034302e3039373730313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227369716d70686f6439303973386d6f726370306e766e616e3069223b7d7d, 1712896040),
('t860kkbe21h55sls2nsr19ulg9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323637373439382e3339383936323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22743836306b6b62653231683535736c73326e73723139756c6739223b7d7d, 1712677498);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('tfaagos8jvrr1qs6jvvu51k8un', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323839363034302e3034313535353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274666161676f73386a767272317173366a76767535316b38756e223b7d7d, 1712896040),
('tj543of21iak1cuql2e11aa6vm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323535303434302e3230343738373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746a3534336f66323169616b316375716c32653131616136766d223b7d7d, 1712550440),
('tolrlm3ut7rl8th857h1o4jq7a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323338313133302e38333639313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746f6c726c6d33757437726c38746838353768316f346a713761223b7d7d, 1712381130),
('tombvn76ig24e0o7v1t2pjfltt', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731333139393038392e3235323639313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d34303067306b376975396d3031346869306f39746a6766316e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333230313334383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731333230323539363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731333230323532353b7d7d72656469726563745f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f7370642f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226163303132316664393035613966646533313064356665653564663561653864223b733a33323a226264613631633237316563376664323463666164643065383762303832363832223b7d733a343a2268617368223b733a36353a2262646136316332373165633766643234636661646430653837623038323638322d6163303132316664393035613966646533313064356665653564663561653864223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a343b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a226565336265653734326234393136633865306361326466343132343739393035223b733a33323a226330303332363038353030356235643531363338333834393433643162383761223b733a33323a223966363933643932343034326535306336636632323161616664363134363763223b733a33323a223864306563653231343334336261393061336633613036633231316263626230223b733a33323a226135666237386165343537653832386663363563633731623562353930306437223b733a33323a226466633265396462323661643366623835616539666637616334663461616362223b733a33323a223934633032323233333536363836363439613230636332323031653935316535223b733a33323a223030366337376139613862373735613161366366613031633166646236303365223b733a33323a226261666236613361303332323036346666333239663532626365313839346238223b733a33323a226661323164336231383836336362326666666265383034313463626134383636223b733a33323a223735353936326334366630663538653536323263613937643734643734633339223b733a33323a226432313937313636663566616264656431323632373563633062343433643661223b733a33323a223066333032623232383564383164393637306264663737626131303930313961223b733a33323a223730333165633132323464373537333462653430333764356337323766646633223b733a33323a223232613230663634623234633834316565353566333633643362303566316636223b733a33323a223737336139346334363865343161623735316162303036363261356337656237223b733a33323a223364316431356339356139386561633230376230613930316233396163363363223b733a33323a223038363966376534613461316666643635343832396331373166353937656136223b733a33323a223737363733383962343562633565376534323730303063346366373233306361223b733a33323a223335616462323134343635333031626663613362613133316530623266303366223b733a33323a223131343530336261303838653835646332386630623438303733386163616630223b733a33323a223362383666356334643130333232366636366535643936623562633163306663223b733a33323a226635346166393265343531383639396333663736383462333362646365636237223b733a33323a223937633432613732346134376235623661613062313136343936303835613361223b733a33323a223835303030306361326139386232373436626435636336306436613833333838223b733a33323a223966313961373533363065326633633966373438383435343539333266386164223b733a33323a226633306466656134343864363939316362383165653936653861323461613933223b733a33323a223434363364656434356161373034666430383936326535633533316430393764223b7d733a343a2268617368223b733a36353a2234343633646564343561613730346664303839363265356335333164303937642d6633306466656134343864363939316362383165653936653861323461613933223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34303a7b733a33323a226536393166356463343762663138393434313162626531393035386235653765223b733a33323a223334646530373632396232313733333138313365313666376461366534333330223b733a33323a223164316539353965363833366433613036613965653563306561623238306161223b733a33323a226265663535373839373035396437633938303531333132643539613536366532223b733a33323a223331306561323933353738363439353463363561326139336239303861306362223b733a33323a223337323736393334663939336464653165313632643734313965323432313232223b733a33323a223436343632343564366137366166303337326366663533643334353666353762223b733a33323a223335643139653762333765343535313930636563346237373164363166353830223b733a33323a226464343133653138363662363165303565346564623631396436643463643766223b733a33323a223532663037383363376233316164366165653038656439353136313635376636223b733a33323a223862333963663235653761356533653238363231393037623465303934383535223b733a33323a223764323932353131613862616237356461336136386536346332613439616138223b733a33323a223763326433323332323235623833646565326432636563353062306136306661223b733a33323a223430656438393839323461396166323437363837663730653366333461666430223b733a33323a223137316435393766336339656465643935643061386131616439633835363964223b733a33323a226362653663353134366139653465346532333761373261353331363463653034223b733a33323a223733363566653337666437343838336538396361633038313932343537633266223b733a33323a223238666637316536336462336430613239616530643239313831316535306531223b733a33323a226439616435626364633561636634366665363130646234363666323434656430223b733a33323a226162303737336662326238353234363162356637396465353435613638356238223b733a33323a223837636462633032306266373132623664386334393834613437303966643131223b733a33323a223765366466633564356164323764633961626538653739616438313365326130223b733a33323a223864326263663633323836396163303263636263303636313364653164316439223b733a33323a226166363964623061363764636234613661666132383936656533623036373066223b733a33323a226365363631663966393136343165373966616537663664343239346362633332223b733a33323a226534306639633936633432663564646439386137363463373264333262613235223b733a33323a223533636137616239356162376131643335643833646535353262393832346466223b733a33323a223261653830663331363230666136656662353962613265386235376135386566223b733a33323a223065653738333363333665323538333061313361346238343932386237613935223b733a33323a226463653931633539346566646363343833633665613936303030613130373635223b733a33323a226161336136306534643736363936366131356166346461303061343762383763223b733a33323a223534636333326535373261363936393334346332353330366637383635353036223b733a33323a226239643036386432636566616165333637386631356166326364656131333932223b733a33323a223231303738666465373834373531653466366631356435393963376534623138223b733a33323a223232373262376361303362643031623630366330333636336164393938663637223b733a33323a226163373537366462613939376236396361333534373966616335353663633264223b733a33323a223433623364666438653538393365333465336335313234373732666532353634223b733a33323a223936616135306163383937616131643834346632323435663961323630373937223b733a33323a223734663838616661356235666133663034653838666338383935313764323632223b733a33323a223038323830653532366232363037616130613334646237393463623963386138223b733a33323a223233353030373864623465373736353238363261326665363131376162646330223b733a33323a223932363439393865653863653666663838313332666137636634343765653465223b733a33323a223262376435323739623062396263633936336436343566633432356336643930223b733a33323a223934303538313833613034376230643364396434386463383164616361633938223b733a33323a223535316133313432653935353762653535636237643761333131633462666161223b733a33323a226561363764633138386333643863363861313435616438353532336539623766223b733a33323a223966643935316635623935343761613239303832363462653630373232313538223b733a33323a223939376366323831323964326233626435393366383432646538366139373136223b733a33323a223637346437306463643436663562666562376333623661313832376265316262223b733a33323a223033303039653333333534343539366563383466373634663664363437626264223b733a33323a223761626534303237643835373331373737323930353136386632393364643037223b733a33323a223337343432303563303934653938323064373066623832313338313839363066223b733a33323a223130633463653337343433316635393336333235643363303662363333643235223b733a33323a223164663634656531666430383639376534353731316131613164376237346235223b733a33323a223834343230343364343536663934356630613837633630613865643961313737223b733a33323a223632633265363732663361363164333537393364346437303739376365646432223b733a33323a226632353533316631386334323832303432663637346530383534616135313264223b733a33323a226335343961363734613865323531636430663861313165353933376162396136223b733a33323a223031353564666465356130623237346137663437613566643637326138663463223b733a33323a223830363239643431353731353134613366303164356334636339656337656262223b733a33323a223837303938383034613763303332376563653266316436623433353765656366223b733a33323a223261373539666436383262353264656334356633616131626436396332653335223b733a33323a223735333531356364353238376131636538343634373363323539623766373133223b733a33323a223637633766616663323935623933366231343636366536613437333732323932223b733a33323a223530353131393831366366376231653362323336343639626266383434383363223b733a33323a223262306661353165653132386639353666623739393764336334653465343939223b733a33323a223034313962333161366633633231383831643033663133353933336464616635223b733a33323a226138643864653430643463306233383435383161343931353839356262373162223b733a33323a223539613937373133323262616232633036633132663039383735656566333134223b733a33323a226231383231356330306465383836616535373832653232313637626130326563223b733a33323a223162326338343462616661303364626235313135373930336639393139636238223b733a33323a223333393736653262313130366461353663656636393733663765353366613866223b733a33323a223063353765333966636362303439633162613366663463653337353539653563223b733a33323a223763333830666239356566653836306266343237343034633834633633333062223b733a33323a223964386466393436373035623831613136653462356162356563306536356163223b733a33323a226262616139663462343232653664666163383364316165306437393133363066223b733a33323a223134656131393833323032636535626234653739323764626635663732356130223b733a33323a226362343639306137653033636139616139656437653231363461313536363262223b733a33323a223230336662646161333735376634646166633764313463636435303765313665223b733a33323a223437666131663638393330393938613837323737313663313562333234326634223b7d733a343a2268617368223b733a36353a2234376661316636383933303939386138373237373136633135623332343266342d3230336662646161333735376634646166633764313463636435303765313665223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1713199089),
('vuk7dehb242b3gpvk45fofh9i8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323530333536332e3237363538353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276756b376465686232343262336770766b3435666f6668396938223b7d7d, 1712503563),
('vv9jvuts0224tu15dqr6vs0cpu', 0x5f5f4c616d696e61737c613a31303a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323834393639342e3534333738333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227276316a3431716268323567306937316c386864747174627139223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835313438393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333239343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333134343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333234363b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333038393b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333038323b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835323639383b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333234323b7d7d72656469726563745f75726c7c733a34313a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e2f6974656d223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223830613662316563313763336465333163626663363861613561396137346434223b733a33323a223732373430363561366364373232316336616363653961346263316566386363223b7d733a343a2268617368223b733a36353a2237323734303635613663643732323163366163636539613462633165663863632d3830613662316563313763336465333163626663363861613561396137346434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33313a7b733a33323a223862323437396132343035383631663434623532396330646132383661323634223b733a33323a223061343962346362633435646264373439333335663938666530616135316666223b733a33323a226565353263353430636539366332383864393865396265623565303533633537223b733a33323a223962623132656533633330373663356335616661643933666130666462376431223b733a33323a223964393935343032653565386362363266643637663665666465636237336533223b733a33323a223133613463353564396630613265636535353734323535646636373966633437223b733a33323a223030373338623830316630653230363363346464663837616138303331373631223b733a33323a223662363039373737303062613436626230616361666161626332656332396461223b733a33323a223931653938366139366338333861636335366164613435383266323165323866223b733a33323a226662386339356136616562643630393337616334613865666534383663643132223b733a33323a226132306330653663333235656230313430626662376366353364323030646263223b733a33323a223337616236646138373938393566343733303435393933333235633735643964223b733a33323a223865316135616336366363336265636165666432383734303962323464313462223b733a33323a226230366534616638623863646232383535346233353866383733626430663235223b733a33323a223133366437643034623965393531626635623264306537363632316530303130223b733a33323a226165633934316236336366313432333233323038353361396337663136366464223b733a33323a223430336462373032386530366564393162336530376564343332653932623137223b733a33323a223333343235666530623262663832373131663238613132373532333331636435223b733a33323a226632366663316133646532646462323237313638616638653865316666623530223b733a33323a223937613039353563323366343437343134663661323765383163346364393630223b733a33323a223565373461643465393438373437653339356332303365633262363263636431223b733a33323a226232643432336331656336396437376333353832323039396637363232636532223b733a33323a223331323461383836373432366162326535643561653461366232643837366235223b733a33323a223439306166633932646335383131376563363463346335616230623866373031223b733a33323a223465316630636661636334323930663935373066303165623361616638383136223b733a33323a223737336138343836313061396164646362656664323132356335363336373261223b733a33323a223339313032363464303838303761313532393330353761303538653039336461223b733a33323a226237396539396662386364643538383238346538343234646333653639613336223b733a33323a226463393237663632386531313631373063343561343837313638386437656362223b733a33323a226132326133383662303333653439306337393338386631613563636230336436223b733a33323a223966653536613031653163393135363866353231363339306236306634623439223b733a33323a223235656361303437353033343439383564656630353162636437373831343534223b733a33323a226563623038313533633134653063393566313637363532656636646166316361223b733a33323a223065383862643437623762653935396531643339636163353465316461663762223b733a33323a226662306536633661663032633633346231306665386566313162666137303566223b733a33323a223330663532396333353132343634656337336635353739643066333731306465223b733a33323a223535666565653666343934323133646466303266386262373062666636303465223b733a33323a223835363763663536666565303161633161353131303735653434383438363236223b733a33323a226436643136323263313437666361346565656565623066383961653532653534223b733a33323a223738316433626265616638653638326662616265613837313963326331333236223b733a33323a226332623066316666636638323239633833356230656166396638306636393831223b733a33323a226336333636666366316431636332333032666265643937373138613338646565223b733a33323a223731313862636130613665643639346365616438366163353737356466373932223b733a33323a226330343361633163333661383166643933396235393465393938363562306536223b733a33323a223032323239363134393735323365366631356362663931386330663764656636223b733a33323a226236373965323733663537313165353636356137663035646238353933376339223b733a33323a226632383664653435386662636564303939373833343961356230616235386437223b733a33323a226233646335303763313234383133333238613931316566616231343164646261223b733a33323a223333333365343765663033313434346432333434613764316133393835353130223b733a33323a223464313263633165393365386163613662383636623933656233393063666339223b733a33323a226465663132306633653661386231353431353039326166356361616164356231223b733a33323a223162613339666636626330626366386163313238393133383236396563353332223b733a33323a223531653136666132373738346265366131306663663435303864363332376439223b733a33323a226234626662646630393433643430373236306164613738313465313064623435223b733a33323a226662656230373661623863653234653861313438366638656231643464323064223b733a33323a223638323461636561613330336234343830633134653232376163313261663766223b733a33323a226339633830376139643963336662333864653366316634396337613266363364223b733a33323a226662636439363062346262653834333235346239613066613132326465376135223b733a33323a223834373333623936353364376638323938646439653830623037383031363739223b733a33323a223633336533643864643336343162313134323765393562333735613531616237223b733a33323a223062643930653833396331316161646264393061363134626238653832366233223b733a33323a226538656634646233653964346435366365313634396162373962313536393663223b7d733a343a2268617368223b733a36353a2265386566346462336539643464353663653136343961623739623135363936632d3062643930653833396331316161646264393061363134626238653832366233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a226131623633633838306465623736616337653838656565363830343437363334223b733a33323a226234313665373439396634346462386264306663646165356432386333613162223b733a33323a223730643132623761346561613036356633343562363464393035353963336531223b733a33323a223636643934326536646335303263343332373535343738656439346232393930223b733a33323a226666306636366263316461373162623965323937613561383231313164373161223b733a33323a223638346336663462613465396532336130653238373436343433613836376162223b733a33323a226333366165316634646533663433653631343762323738383864633830373032223b733a33323a223966303431636539323134333930333934363830363035663135653464353538223b733a33323a223631346539613933373130623335356362376463376336343330356361653639223b733a33323a223337386639646533646363303032353833386533366366393632343638656366223b733a33323a223835336163663863386238303833663939663537636235616161383264623864223b733a33323a223536663933653738366333336663336433373430376137326562323638656532223b733a33323a226638613536653739323764396537393434333432393762336362303963643739223b733a33323a223535313166326137663934373237653364323937656163393061643436666137223b733a33323a223134643666346531396462653338326436623738373630366535616666626665223b733a33323a223366323535323437373739396235656563643738616138653232666137316532223b733a33323a223535386362643762326638353038663961613361653239323739333262316139223b733a33323a223266316561613036623030396166383531336134356639343130343361373031223b733a33323a226338363831306337313733363161376337396431633764333231303661396362223b733a33323a226663653532616235646464666435646234383137356233666337313835303561223b733a33323a226563646265313836366332303738613030383665626238373963393862313737223b733a33323a223533666537656464353836363432353363633736613935373661653161316438223b733a33323a223863306536396339393439303433643661613666633637313261663137303038223b733a33323a223161343662333030623164323439393135323434346139663761363462343233223b733a33323a223264383966613234306664343665386230346566626238343535356430653265223b733a33323a223534316366316134346162353065366537656461623035386366373832303830223b733a33323a226664343339373839653238363733613666373061623234303366343961356231223b733a33323a223561363264626132383866626561306434333462383538376437363334353135223b733a33323a226236366536383434376230383365333665313836633535663033663537313035223b733a33323a223661336234643537303530373037396137333563613831383834396130346233223b733a33323a223261366131356433373532316236363031643832656634623733633537333739223b733a33323a223630363633656661343234366466376165336164323761653535666233653833223b733a33323a223135303066306462623633346439303665313335643831316364636431326163223b733a33323a223161363133663762333465666538306237663332343266656461346233653030223b7d733a343a2268617368223b733a36353a2231613631336637623334656665383062376633323432666564613462336530302d3135303066306462623633346439303665313335643831316364636431326163223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223965346161616338653039313863376237653265373161613237663336636562223b733a33323a226565333365343139353932616262633064333636636531623838386162633264223b733a33323a226263666666386135363362356463646435373566373939646138316364306463223b733a33323a223862386336343936633166646665313032313539303437643037613636363462223b7d733a343a2268617368223b733a36353a2238623863363439366331666466653130323135393034376430376136363634622d6263666666386135363362356463646435373566373939646138316364306463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a223534306635363734646364323664636330623962316133373331336564343166223b733a33323a223137313063653833316539666535336565326663646537303939343064626462223b733a33323a223738326238643339313866616136303337633961643461643634613962383732223b733a33323a226464316131653035656331333263326135653063383034666634386439336630223b733a33323a226566333533353164623632376231383566613035343233356333353332316631223b733a33323a223661396364363132306637356637393834653861363535303663646138613235223b733a33323a223730396631626162646535333935613630663964326333366334363465326363223b733a33323a226539663561616435666231633265333336653765393465333364646366323963223b733a33323a223035393064323532643134363038643032336130333135366565313537313733223b733a33323a226138383534343933386635633930656562656436336263653131306536383833223b733a33323a226639653430323365393935356663393237663866613538316366303539366438223b733a33323a223366663631343164333131386435613031616333303538356137396366666364223b733a33323a223333366261623532656566363431653366356637383834653533626663393462223b733a33323a223239613163373165323630316438363562333335393632336432313933646636223b733a33323a226365363530663435373363306432323462663534303039653563656137616539223b733a33323a223566616466653533303161386234343964386331393839616637393835356232223b733a33323a226332663532633638383264323162336234346563616562323362313239656139223b733a33323a226434336535326265643965393266623866666336386234653735356432356638223b733a33323a223663383765623434356434653635366634376365323531353934393633363832223b733a33323a223530623435353664376330343336353735313862663834646466626666626635223b733a33323a226639366261343039343061386634653835366232613530663362636663393464223b733a33323a223061616431343739326638306561653361363939656336306632663837613737223b733a33323a223839373334353534383161633732633130303764653164346561643431326664223b733a33323a226562353438323435376238313063656536343130343966333132353565393963223b733a33323a226564363539393465616565306233396339643038353137633162383839636165223b733a33323a226132653436346166333764613361353437353931653331323065313730306163223b733a33323a226565353035316339653836663061393661623836343661643062396261313333223b733a33323a226330623437633361613761643432303664303932643039656130303637363831223b733a33323a223464343963373139663139626639646561613464373334623335643236633739223b733a33323a226232393933343434356237366263643861336538363963653231646337343530223b733a33323a223731653634616164633263633835303233666535663666613932623433386161223b733a33323a226234636434323138653330633439626262373839303661323537663361393132223b733a33323a223561396366316265363239636231373235633535663634623963616162346465223b733a33323a226231646264633131306237386436623137646637383134643365396631333963223b7d733a343a2268617368223b733a36353a2262316462646331313062373864366231376466373831346433653966313339632d3561396366316265363239636231373235633535663634623963616162346465223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223537363932306139646636643464643535653362363763383536393436373666223b733a33323a223234653135376135376539633964366632363061626634643835303762643833223b733a33323a223734626161623964303331316635353366656265353864386130323237353166223b733a33323a226363323962356334356366666436626163376339333634313263343532666166223b733a33323a223839373238316436663064353737363139336437643863353033326439656239223b733a33323a223335646530623363663131353061653038346633646432393562643063313332223b7d733a343a2268617368223b733a36353a2233356465306233636631313530616530383466336464323935626430633133322d3839373238316436663064353737363139336437643863353033326439656239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223237353639366636303239333864633033626335383235366536656433393461223b733a33323a223933316537623436353031356665313730636665616631353563623031633064223b7d733a343a2268617368223b733a36353a2239333165376234363530313566653137306366656166313535636230316330642d3237353639366636303239333864633033626335383235366536656433393461223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223738623239303863336565666261313761313735363734356533396666613963223b733a33323a226233306561653938376431363134653737663035363365633536646363646333223b7d733a343a2268617368223b733a36353a2262333065616539383764313631346537376630353633656335366463636463332d3738623239303863336565666261313761313735363734356533396666613963223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1712849694);

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
('xmlviewer_renderings', '{\"text\\/xml\":\"xsl\\/xml-html.xslt\",\"application\\/xml\":\"xsl\\/xml-html.xslt\",\"application\\/alto+xml\":\"xsl\\/xml-alto-html.xslt\",\"application\\/tei+xml\":\"xsl\\/style_conversion.xslt\"}');

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
(1, NULL, 1, NULL, 'index', 'default', 'Cancel Culture — Costanzo Ciano', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Home\",\"query\":\"\"},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":3,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":4,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":5,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":6,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":7,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":8,\"is_public\":true},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":9,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":10,\"is_public\":true},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":11,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":12,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":14,\"is_public\":true},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":13,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":15,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":16,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":17,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":18,\"is_public\":true},\"links\":[]}]', '[]', '2024-02-13 20:25:22', '2024-04-11 15:24:43', 1, 1);

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
(3, 24, 2, NULL, '', 1);

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
(11, 1, 'fonti-primarie', 'Fonti primarie', 1, '2024-02-22 15:00:40', '2024-04-19 16:46:27'),
(12, 1, 'fonti-secondarie', 'Fonti secondarie', 1, '2024-02-22 15:00:58', '2024-02-22 15:00:58'),
(13, 1, 'gallery', 'Galleria', 1, '2024-02-22 15:01:18', '2024-02-22 15:01:18'),
(14, 1, 'media', 'Media', 1, '2024-02-22 15:01:39', '2024-02-22 15:01:39'),
(15, 1, 'interviste', 'Interviste', 1, '2024-02-22 15:01:56', '2024-02-22 15:01:56'),
(16, 1, 'istituto-luce', 'Istituto Luce', 1, '2024-02-22 15:02:11', '2024-02-22 15:02:11'),
(17, 1, 'mappe', 'Mappe', 1, '2024-02-22 15:02:46', '2024-02-22 15:02:46'),
(18, 1, 'about', 'Credits', 1, '2024-02-22 15:02:59', '2024-02-22 15:04:29');

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
(15, 11, 'pageTitle', '[]', 1),
(16, 12, 'pageTitle', '[]', 1),
(17, 13, 'pageTitle', '[]', 1),
(18, 14, 'pageTitle', '[]', 1),
(19, 15, 'pageTitle', '[]', 1),
(20, 16, 'pageTitle', '[]', 1),
(21, 17, 'pageTitle', '[]', 1),
(22, 18, 'pageTitle', '[]', 1),
(23, 11, 'media', '{\"thumbnail_type\":\"large\",\"alignment\":\"left\",\"show_title_option\":\"item_title\"}', 2),
(24, 11, 'itemWithMetadata', '[]', 3);

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
('blocksdisposition_item_browse', 1, '[]'),
('blocksdisposition_item_set_browse', 1, '[]'),
('blocksdisposition_item_set_show', 1, '[]'),
('blocksdisposition_item_show', 1, '[]'),
('blocksdisposition_media_show', 1, '[]'),
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
('xmlviewer_renderings', 1, '{\"text\\/xml\":\"xsl\\/xml-html.xslt\",\"application\\/xml\":\"xsl\\/xml-html.xslt\",\"application\\/alto+xml\":\"xsl\\/xml-alto-html.xslt\"}');

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
(5, 2, 1, NULL, 'literal', '', NULL, 'C\'è una statua «nascosta» in Arsenale', NULL, 1),
(6, 2, 4, NULL, 'literal', '', NULL, 'Collocata nel giardino del museo navale ritrae Costanzo Ciano, opera dello scultore Francesco Messina', NULL, 1),
(7, 2, 7, NULL, 'literal', '', NULL, '27 giugno 1991', NULL, 1),
(8, 2, 5, NULL, 'literal', '', NULL, 'La Nazione', NULL, 1),
(9, 2, 58, NULL, 'literal', '', NULL, 'Adriana Boverini', NULL, 1),
(10, 3, 1, NULL, 'literal', NULL, NULL, 'Articolo La Nazione giugno 1991', NULL, 1),
(11, 5, 1, NULL, 'literal', NULL, NULL, 'XML', NULL, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT per la tabella `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT per la tabella `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
