-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Apr 13, 2024 alle 13:13
-- Versione del server: 10.11.7-MariaDB-cll-lve
-- Versione PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u223577557_Progetto`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
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
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(1, 'site_pages', 1, 1, 'Home', 'Welcome to your new site. This is an example page.\n\n\n	This is a bullet list.\n	Second entry.\n\n\nBack to normal again.\n\n\n	This is an ordered list.\n	Second entry.\n\n\nBack to normal again.\n\nThis is a blockquote.\n\nBack to normal again.\n\nThis text is a link, which currently points to nothing.\n\nThis text is bold, in a &lt;strong&gt; tag.\n\nThis text is italicized, in an &lt;em&gt; tag.\n\nThis text is underlined, in a &lt;u&gt; tag.\n\nThis text has a strikethrough, in a &lt;s&gt; tag.\n\nThis text is subscript and superscript using &lt;sub&gt; and &lt;sup&gt;, which can be used for adding notes and citations.\n\n\nThis is an H1 title. It is bigger than the Page Title, which is rendered in H2.\n\nThis is an H2 header, the same size as the Page Title.\n\nThis is an H3 subheader.\n\nThis is an H4 subheader.\n\nThis is an H5 subheader.\n\nThis is an H6 subheader.\n\nThis is the \"Italic Title\" block style.\n\nThis is the \"Subtitle\" block style.\n\nThis is the \"Special Container\" block style.\n\nThis is the \"Marker\" inline style. \n\nThis is the \"Big\" inline style. This is normal text.\n\nThis text is inside a \"small\" inline style. This is normal text.\n\nThis is the \"Computer Code\" inline style.\n\nلكن لا بد أن أوضح لك أن كل هذه الأفكار المغلوطة حول استنكار النشوة وتمجيد الألم يعرض هذا النص من اليمين إلى اليسار.\n'),
(2, 'items', 2, 1, 'C\'è una statua «nascosta» in Arsenale', 'C\'è una statua «nascosta» in Arsenale\nCollocata nel giardino del museo navale ritrae Costanzo Ciano, opera dello scultore Francesco Messina\n27 giugno 1991\nLa Nazione\nAdriana Boverini'),
(3, 'site_pages', 1, 1, 'Il progetto', ''),
(4, 'site_pages', 1, 1, 'Cancel Culture', ''),
(5, 'site_pages', 1, 1, 'Crowdsourcing', ''),
(6, 'site_pages', 1, 1, 'Parlano di noi', ''),
(7, 'site_pages', 1, 1, 'Biografia', ''),
(8, 'site_pages', 1, 1, 'La statua', ''),
(9, 'site_pages', 1, 1, 'Modello 3D', ''),
(10, 'site_pages', 1, 1, 'Fonti', ''),
(11, 'site_pages', 1, 1, 'Fonti primarie', ''),
(12, 'site_pages', 1, 1, 'Fonti secondarie', ''),
(13, 'site_pages', 1, 1, 'Galleria', ''),
(14, 'site_pages', 1, 1, 'Media', ''),
(15, 'site_pages', 1, 1, 'Interviste', ''),
(16, 'site_pages', 1, 1, 'Istituto Luce', ''),
(17, 'site_pages', 1, 1, 'Mappe', ''),
(18, 'site_pages', 1, 1, 'Credits', '');

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
(2, NULL);

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
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
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
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
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
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('TXRkMOn3SpQOwDa2qosyhy78UT2OEcCZ', 2, '2024-02-13 20:23:06', 1),
('qkbNgOrXzvvHMTCzlxcGRG4p59gKLvY7', 4, '2024-04-09 15:43:38', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
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
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(2, 2, 72, 6, NULL, 'C\'è una statua «nascosta» in Arsenale', 1, '2024-02-22 15:56:37', '2024-04-11 15:22:20', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
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
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(6, 2, 72, NULL, NULL, 'Articolo di giornale'),
(7, 2, 66, NULL, NULL, 'Lettera');

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
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
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('02jnb07mub0ltge04ar2s5o4jl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323239343733302e3732393436333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230326a6e6230376d7562306c746765303461723273356f346a6c223b7d7d, 1712294730),
('03qqcq7l9b6c6teo9q308mgeh2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383330303638352e3339373331393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22303371716371376c396236633674656f39713330386d67656832223b7d7d, 1708300685),
('041ktrgeods86bj10nkqlkna4s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313439393534332e33313436343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223034316b747267656f64733836626a31306e6b716c6b6e613473223b7d7d, 1711499543),
('0f96gud48n3aqaooasjh8e8pd7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373931383837352e3637373333383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223066393667756434386e336171616f6f61736a68386538706437223b7d7d, 1707918875),
('0hglnmhrfq8bnvh3hm15v6kbr8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393634333238382e3436333139383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223068676c6e6d6872667138626e766833686d313576366b627238223b7d7d, 1709643288),
('0jq71bojo27e9f27qo118c9pia', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383032353739382e3434303234323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306a713731626f6a6f32376539663237716f3131386339706961223b7d7d, 1708025798),
('0spnahcvp12i39ngifie16q2eu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313332363734332e34363131363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223073706e616863767031326933396e6769666965313671326575223b7d7d, 1711326743),
('0t3lo6690bu8ncgci9rcd6ag73', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323732333233392e3839303235323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223074336c6f363639306275386e63676369397263643661673733223b7d7d, 1712723239),
('10vo2uln8b7nh3vmps5p82dmlo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323033353533302e3731313330363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223130766f32756c6e3862376e6833766d707335703832646d6c6f223b7d7d, 1712035530),
('11brv92sjf6fl4787s2qmpjo9c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313431333134332e3433323736363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231316272763932736a6636666c343738377332716d706a6f3963223b7d7d, 1711413143),
('12mbqulj2c73fp93mqsk756s3g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393536353836362e3334353436363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231326d6271756c6a32633733667039336d71736b373536733367223b7d7d, 1709565866),
('13pmpcdsbciij2pub5g07ltujk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303535343237302e3035323136333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223133706d70636473626369696a32707562356730376c74756a6b223b7d7d, 1710554270),
('161ugctp4i3uaui90qq9nvag6f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303535343236392e3932333332313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231363175676374703469337561756939307171396e7661673666223b7d7d, 1710554269),
('18cvo6p596s5asgncu58mi18i8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303639333539392e3930373732373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22313863766f367035393673356173676e637535386d6931386938223b7d7d, 1710693599),
('18d09ilohqn58g4opvvshhgluh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033353837302e3231373536353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223138643039696c6f68716e353867346f707676736868676c7568223b7d7d, 1710035870),
('197fiflvfpu1qsfa160b37n9n6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323232363337332e3738343534353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223139376669666c7666707531717366613136306233376e396e36223b7d7d, 1712226373),
('1ga8k234pvmdv5do2u6o92rn94', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313637323334332e34333330373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316761386b32333470766d647635646f3275366f3932726e3934223b7d7d, 1711672343),
('1qurupnbjj0jcrmcnc4bbphf0o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323338313133302e3634363031353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223171757275706e626a6a306a63726d636e63346262706866306f223b7d7d, 1712381130),
('1v1j1rbvjv7it2rrslo57e048g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303239353037302e3430323931353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223176316a317262766a76376974327272736c6f35376530343867223b7d7d, 1710295070),
('210n7nq6eatnie5rnnfjnnl6cu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323838303036392e3037303238333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223231306e376e71366561746e696535726e6e666a6e6e6c366375223b7d7d, 1712880069),
('23uc2pt8kujvcboid52nq3eoiv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313239393432302e3930303831333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232337563327074386b756a7663626f696435326e7133656f6976223b7d7d, 1711299420),
('251lfuh3cav8fmn0b1lbnds4au', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383031313938382e3130353031353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276373073626b396571663366616b767231736273757064396362223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383031353036353b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383031353230363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730383031353535323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383031353535323b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383031353532313b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383031353532363b7d7d72656469726563745f75726c7c733a33363a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223937333434356131323962616563323538383339643533313438376634656137223b733a33323a223732363533643262323166373939353835373564373061386434363162323034223b7d733a343a2268617368223b733a36353a2237323635336432623231663739393538353735643730613864343631623230342d3937333434356131323962616563323538383339643533313438376634656137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226261653630333663393963626532326132346339366634313331336634326530223b733a33323a223362613765353563656635313734636633363437326236663038383564646566223b7d733a343a2268617368223b733a36353a2233626137653535636566353137346366333634373262366630383835646465662d6261653630333663393963626532326132346339366634313331336634326530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223764303030306531633330643261636161633630393936623836376266313934223b733a33323a226662653439373833643664356233326439333632316437656638633135623434223b733a33323a226134366139343130666261316637653762383934656535326239303161376535223b733a33323a226635376530343965336132366339653437636366323837343636386633636666223b733a33323a223131323134643436623338376666313861353637633262346130386266646631223b733a33323a223163626263613132623831326537353939613233306439316631356461613830223b733a33323a223733393932636361626636376262356466336462313237336333356439616566223b733a33323a226230613031656339356536303132333539363532336566633162326564613738223b733a33323a226365363562363834323032626464643862326131363339353963313165646132223b733a33323a223562376436363938303137373430366636356630663434653237313634343866223b733a33323a226265363765326137653333336165346235336236613830636538393561663461223b733a33323a226262383261383861663464666537336633306163653332303539633763306263223b733a33323a226163383436623637633665323335653935623731313832366465323863353831223b733a33323a223630373831353162373032653361653062633637643733323964306235396239223b7d733a343a2268617368223b733a36353a2236303738313531623730326533616530626336376437333239643062353962392d6163383436623637633665323335653935623731313832366465323863353831223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226237626331366431623235623134343831613939306136663936313730306331223b733a33323a226332396134303837666461316234663863373061373264396633666432666261223b733a33323a223332383435333934626564323632316435613031343536323061383634393064223b733a33323a226465363032646438343264633664613830323432393162333134663038613438223b733a33323a223365363638623063393430633063666661366237393462396333333537313064223b733a33323a223531666330653361313830616263396334633937666434323564313032363761223b7d733a343a2268617368223b733a36353a2235316663306533613138306162633963346339376664343235643130323637612d3365363638623063393430633063666661366237393462396333333537313064223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226261376137333963623434376263666238643231303966343731613662323433223b733a33323a226466373438333437383634326237373965386231343538303239643161666361223b7d733a343a2268617368223b733a36353a2264663734383334373836343262373739653862313435383032396431616663612d6261376137333963623434376263666238643231303966343731613662323433223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223463353135303264646164303436636361623532373234323461366331316261223b733a33323a223362346163623065663962366364356665383134386339623636396537316638223b7d733a343a2268617368223b733a36353a2233623461636230656639623663643566653831343863396236363965373166382d3463353135303264646164303436636361623532373234323461366331316261223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1708011988),
('2f1glj9j8mrhtvgj5bhcarrpn7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303532313936312e3031313738363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326631676c6a396a386d72687476676a35626863617272706e37223b7d7d, 1710521961),
('2o0gbr7s4eonsfiso6j9a8q6v9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393836393036302e3733323938323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326f30676272377334656f6e736669736f366a39613871367639223b7d7d, 1709869060),
('2rh261tl86dn6iduam9qk1njs9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313836363337362e3834373332343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22327268323631746c3836646e36696475616d39716b316e6a7339223b7d7d, 1711866376),
('2rhvrlch6oiv6km2if0uphf0pn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393536353836342e3430383232373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232726876726c6368366f6976366b6d326966307570686630706e223b7d7d, 1709565864),
('2vcjthvsm3kbtu4smosa71en94', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303239353037302e3230393534363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223276636a746876736d336b62747534736d6f73613731656e3934223b7d7d, 1710295070),
('340ahnnph1js486ccqc20f6fib', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393331393139312e3335303434373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233343061686e6e7068316a733438366363716332306636666962223b7d7d, 1709319191),
('389k1n703cagnhriqo88ejutov', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393638353636382e3533373336363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223338396b316e3730336361676e687269716f3838656a75746f76223b7d7d, 1709685668),
('39nc59ri0ue54jv5n2q28434lk', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383030333136352e3538323431383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272673073683834703337726669326868736b6f6e657030696630223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383030363335343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730383030363736353b7d7d72656469726563745f75726c7c733a33363a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223931363863656461343165396636386633366465616163643333326537616162223b733a33323a226236653738303134643262643863616664366536383665346461393037633061223b7d733a343a2268617368223b733a36353a2262366537383031346432626438636166643665363836653464613930376330612d3931363863656461343165396636386633366465616163643333326537616162223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226338653461366236636337623932633062383234643662653836613736393565223b733a33323a223938663166376464663734623534653334633237316139346666316163323534223b7d733a343a2268617368223b733a36353a2239386631663764646637346235346533346332373161393466663161633235342d6338653461366236636337623932633062383234643662653836613736393565223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1708003165),
('3b9a4npcd3juv5mdvqedcp157v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393137353035342e3339353430393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233623961346e706364336a7576356d6476716564637031353776223b7d7d, 1709175054),
('3hcvboohu19h1ihsba5l1e9rjq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303831363135352e3737313538353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233686376626f6f6875313968316968736261356c316539726a71223b7d7d, 1710816155),
('3jgmado0r6mh0adb7hcjb4p3h4', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323637373531372e3037353637393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336a676d61646f3072366d68306164623768636a623470336834223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323638313131373b7d7d72656469726563745f75726c7c733a33363a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223636316662323661616536386665303431633038383332633363646634353530223b733a33323a223238313963666333343432666333633731363136316637373831383335333864223b7d733a343a2268617368223b733a36353a2232383139636663333434326663336337313631363166373738313833353338642d3636316662323661616536386665303431633038383332633363646634353530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1712677517),
('3k20l6l9gij222v4ov6vdsg8cc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313037353335352e3933333036333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336b32306c366c3967696a32323276346f763676647367386363223b7d7d, 1711075356),
('3kr5ra0kjkknuuj78lj66t3864', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313538353934332e3239363432323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336b72357261306b6a6b6b6e75756a37386c6a36367433383634223b7d7d, 1711585943),
('3n3n0t5n7suv19q85uhbrrfd0g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313836323733302e3733333636333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336e336e3074356e377375763139713835756862727266643067223b7d7d, 1711862730),
('3q3vpqkb5k9m05gvld1og4rgmv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323132313933302e3639383438373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223371337670716b62356b396d303567766c64316f673472676d76223b7d7d, 1712121930),
('3rqct8tu6g4d9517ik2s3utadk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373839303138382e3831343736393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233727163743874753667346439353137696b327333757461646b223b7d7d, 1707890188),
('3s975nrqa6j9mdt892vjltajbe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383231363037302e3833393634323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233733937356e727161366a396d6474383932766a6c74616a6265223b7d7d, 1708216070),
('3v1ekroqgbjqc1l0pqv7ucab70', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373839303335382e3036363532363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22337631656b726f7167626a7163316c3070717637756361623730223b7d7d, 1707890358),
('411jkdrehcc1bvjvi2ucvqd3r6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323132313933302e3838303438323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223431316a6b6472656863633162766a7669327563767164337236223b7d7d, 1712121930),
('41rp9fhgj0jau0kl19p0oupish', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373932323631322e3237363130323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234317270396668676a306a6175306b6c313970306f7570697368223b7d7d, 1707922612),
('44q0qup7glvj78b3jk8hfbbnua', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383034303532392e3236383238353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223434713071757037676c766a373862336a6b38686662626e7561223b7d7d, 1708040529),
('46sf6q7vk9t59reag818c9n4bv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393430333437392e36383132343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234367366367137766b397435397265616738313863396e346276223b7d7d, 1709403479),
('473qolu3mqq8hmu3ipikhp8e51', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323230383333302e3834323030393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22343733716f6c75336d717138686d75336970696b687038653531223b7d7d, 1712208330),
('497mv52u4hc844k243dedhn1o1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393334373835342e3431333739363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223439376d763532753468633834346b323433646564686e316f31223b7d7d, 1709347854),
('49k69qs46a20qtnq73ntid2384', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373836383937382e3133303035383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234396b36397173343661323071746e7137336e74696432333834223b7d7d, 1707868978),
('4gus3kagnp2p08p3774b05188c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303132373538372e3531313130363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234677573336b61676e7032703038703337373462303531383863223b7d7d, 1710127587),
('4j4sfq0ds9ulisuoujii63v29i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303132373639382e3539323137383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346a3473667130647339756c6973756f756a6969363376323969223b7d7d, 1710127698),
('4jn6ib7r73q1jdbjj8hi43ii48', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383033303038312e3738323232323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346a6e3669623772373371316a64626a6a386869343369693438223b7d7d, 1708030081),
('4m97juknj4d0aq307c1402sno3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383231343436312e3936333532343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346d39376a756b6e6a34643061713330376331343032736e6f33223b7d7d, 1708214462),
('4qgg9o4an8cmuh0uaqk6hutic1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373835373632372e3839313134333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234716767396f34616e38636d7568307561716b36687574696331223b7d7d, 1707857627),
('4t2qhecgg2n5cbdud0388v0tiu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393639363236302e3631383337313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22347432716865636767326e356362647564303338387630746975223b7d7d, 1709696260),
('4to712049r4th94ppkv6pjkn26', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383734323131352e3031363731333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234746f37313230343972347468393470706b7636706a6b6e3236223b7d7d, 1708742115),
('4u86rrmtcu9gemautvs5k3eq21', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383330303831372e3039353631353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223475383672726d7463753967656d6175747673356b3365713231223b7d7d, 1708300817),
('53q4o5nkub2cf8jdupckcdh9om', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323230383333302e3633303833313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22353371346f356e6b7562326366386a647570636b636468396f6d223b7d7d, 1712208330),
('59q49ckbdshl7qpn3tvkt2sjo8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383132383532392e31343936333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223539713439636b626473686c3771706e3374766b7432736a6f38223b7d7d, 1708128529),
('5c3mnd8ca9r7lpoe1fi38jc3s9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313439393534332e3134313231313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223563336d6e643863613972376c706f6531666933386a63337339223b7d7d, 1711499543),
('5cuu4f9fg2tstmgabubs92h5ll', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323934313635322e3237363935373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234647537376c7231377567736f68743075753974313473387172223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323934333033393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731323934353233363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323934353233363b7d7d72656469726563745f75726c7c733a33363a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223764366561643264313366363539353134333831303661353036363330383734223b733a33323a223161656231376536366432656365383836383936643334613239373362663932223b7d733a343a2268617368223b733a36353a2231616562313765363664326563653838363839366433346132393733626639322d3764366561643264313366363539353134333831303661353036363330383734223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223963393730633664646365326462343634323333386665643635393736396163223b733a33323a226235636132643533343233313464626663346163303865663365326663366439223b733a33323a223462323363653936316336663063396663613536363138323837326263333738223b733a33323a226663303839653330313539646232303136643863396631653138303866303032223b733a33323a226630666632663562313337356533366631383466376365386630623631333733223b733a33323a223332623632353939643435323636346336666437626564656330626333656566223b733a33323a226439613363613333623738613066363735373434313138666537396330353263223b733a33323a223263303836643165636266626636633637316661353863373064326131633663223b7d733a343a2268617368223b733a36353a2232633038366431656362666266366336373166613538633730643261316336632d6439613363613333623738613066363735373434313138666537396330353263223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a226661646663303563373230626332383136623237333862333238353637303065223b733a33323a223733653633326266333062643966643365613664643136623663643334343033223b733a33323a223166643361333166393161343566386362383766616461303739643238366131223b733a33323a223137353363326339326639343135373936316366383465336232616635373837223b733a33323a223034393166393231313536396464383135623562373939313061643563373164223b733a33323a223739646132376638633462633539336332396335613962643039323736343163223b733a33323a223139636135353366653337353235316530303433313137306539363232333932223b733a33323a223666646338643961346639616238306561383130316166626131316333366664223b733a33323a223531393261326664343864333262346337363539626133316331636135363861223b733a33323a223532336362396132353937303465633864656436663131653337376237626361223b733a33323a223530306439616636616530656636393532346333383766383538623061376632223b733a33323a223664613332326561343838343536653363643466363436393239373963383164223b733a33323a226366373835633330613336363731636436633839316665316462633534636163223b733a33323a223665383864313737323137346339386132313230316162386334353137663336223b733a33323a226131666230326130386563383663366235653763366262626339646632366432223b733a33323a223632323661643965626436353032323066623466626665373562323638613834223b733a33323a226438626332343936653266326532623261356536313435623161626464346634223b733a33323a223530353536346332633633323534366563383363666262356335663366326131223b733a33323a226162336435346363333163366265363934323762643835663061363966306362223b733a33323a226431613538303863613236303837386530326338383233653466373831396432223b733a33323a223134653931383139366463616266393465313562323235376137396365613130223b733a33323a226430346164656462313763333736393333626265613461656637326134333564223b7d733a343a2268617368223b733a36353a2264303461646564623137633337363933336262656134616566373261343335642d3134653931383139366463616266393465313562323235376137396365613130223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1712941652),
('5ehocv1tm091ak8a62nadvdif5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373934363932302e3436363734363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223565686f637631746d303931616b386136326e61647664696635223b7d7d, 1707946920),
('5i9g9ogce928ak7n2jb3geaanl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313037353539352e3732363631323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235693967396f676365393238616b376e326a6233676561616e6c223b7d7d, 1711075595),
('5kdlgie0o5ndp13tjo1bc6m8rb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323735343730382e3031343934343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356b646c676965306f356e64703133746a6f316263366d387262223b7d7d, 1712754708),
('5m0hpl008slpthr6asau1hjj31', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393638353638322e3331333833393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356d3068706c303038736c70746872366173617531686a6a3331223b7d7d, 1709685682),
('5nmvm3m1d0s7p5dqb8sg77kom7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373837303331302e3335303839393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356e6d766d336d3164307337703564716238736737376b6f6d37223b7d7d, 1707870310),
('5t599b01bdtftvar5qme5jc0gl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323732333234302e3034333637323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223574353939623031626474667476617235716d65356a6330676c223b7d7d, 1712723240),
('5tefm7ijcif61nm203qs7rl4qv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303131383536352e3838383737363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22357465666d37696a63696636316e6d323033717337726c347176223b7d7d, 1710118565),
('5v5hjfhovoruvm9b2uq7oqtov2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383232333731342e3736333932323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22357635686a66686f766f7275766d3962327571376f71746f7632223b7d7d, 1708223714),
('5vv7k1e9f17v9gu3kns54drfah', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393630393836302e393034393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22357676376b31653966313776396775336b6e7335346472666168223b7d7d, 1709609860),
('66af55gg61oe0kaoh18ai4fmke', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033383334362e3334323737353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22363661663535676736316f65306b616f683138616934666d6b65223b7d7d, 1710038346),
('677k7vjaeejufd4dkjgadvdlkq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393734343038312e31363930333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223637376b37766a6165656a75666434646b6a67616476646c6b71223b7d7d, 1709744081),
('68lqskdmcfgto6v94v584uehph', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033373331302e3532353138373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236386c71736b646d636667746f36763934763538347565687068223b7d7d, 1710037310),
('6dlmjdpn74k989i2vmag22ll5t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373835353935332e3530373536333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236646c6d6a64706e37346b3938396932766d616732326c6c3574223b7d7d, 1707855953),
('6gj4v3amru4vdi239e7otoj6ra', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393738323636302e3833353434363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236676a347633616d72753476646932333965376f746f6a367261223b7d7d, 1709782660),
('6gmnsvbijf5puo7t7cctsr006a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383238393336392e3032303638343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236676d6e737662696a663570756f377437636374737230303661223b7d7d, 1708289369),
('6jba8thbkvr20rlnq4ic9tbe7c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393836393036302e3834393632373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366a6261387468626b76723230726c6e71346963397462653763223b7d7d, 1709869060),
('6kt4eiqjo6rv61hi4jp2g65cjb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323031343837342e3232393438343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366b74346569716a6f36727636316869346a7032673635636a62223b7d7d, 1712014874),
('6mrfg5ejhvsqd7nuhr7hor7adc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393532333436302e3835323035353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366d72666735656a6876737164376e75687237686f7237616463223b7d7d, 1709523460),
('6ni0j77gtdne0bptmtl9e9g2o9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383132383137382e3134373935383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366e69306a37376774646e65306270746d746c39653967326f39223b7d7d, 1708128178),
('6qnk8orlmibcfqotje9hnv67vc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393630393836302e3731363136393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236716e6b386f726c6d69626366716f746a6539686e7636377663223b7d7d, 1709609860),
('6u331j7lb38f1kp0ht3vqvop8o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393233353030392e3430313735363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236753333316a376c62333866316b70306874337671766f70386f223b7d7d, 1709235009),
('70e1op48t538hegb30pr7pqqo9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323838303036392e3235383237373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22373065316f703438743533386865676233307072377071716f39223b7d7d, 1712880069),
('70igu985eeb95vfj9sbre50i7m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373931343835332e3931353035353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223730696775393835656562393576666a3973627265353069376d223b7d7d, 1707914853),
('74e1lcfro7q57iflte0ulncq33', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323530333535392e3330353536343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22373465316c6366726f3771353769666c746530756c6e63713333223b7d7d, 1712503559),
('75ns4kaertv6mgl2lo372pv3o4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303930323535352e39363938383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237356e73346b6165727476366d676c326c6f3337327076336f34223b7d7d, 1710902556),
('76m21isf5do7e76r63mkvodpoh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393436383238382e3339333333333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237366d323169736635646f376537367236336d6b766f64706f68223b7d7d, 1709468288);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('7feddvkom8ckamvfvigd4i0lri', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313037353335352e3632303538353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223766656464766b6f6d38636b616d7666766967643469306c7269223b7d7d, 1711075355),
('7fjpmhsd43coke5saqq1cb68p4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383338363238352e3032313430373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237666a706d6873643433636f6b65357361717131636236387034223b7d7d, 1708386285),
('7g7aq4k0d5q9r8mol33b46la92', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303336333939322e3630383139373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223767376171346b306435713972386d6f6c33336234366c613932223b7d7d, 1710363992),
('7hpb97h95p9q251jjp2fu0u03g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373930373033362e3232353335363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223768706239376839357039713235316a6a703266753075303367223b7d7d, 1707907036),
('7hsco05mkc87l4tmjh7lek0ibe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393137353035342e3736393533343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376873636f30356d6b6338376c34746d6a68376c656b30696265223b7d7d, 1709175054),
('7ki6360ggnm6fluesauer05n0u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303436373837302e3237313734353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376b693633363067676e6d36666c7565736175657230356e3075223b7d7d, 1710467870),
('7lc9dtfsaisjbotqhd6h6857jb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303532303838312e3134333631383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376c6339647466736169736a626f747168643668363835376a62223b7d7d, 1710520881),
('7pfqe9ehqsdeaq7agkshvod8ms', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393935353436302e3836333634323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237706671653965687173646561713761676b7368766f64386d73223b7d7d, 1709955460),
('7sl05vc2rl7jtrrfdvug4d8gcv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373930303338382e37353639373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237736c3035766332726c376a7472726664767567346438676376223b7d7d, 1707900388),
('86igi98gtvtkjor3059lpm68ip', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383033303038302e3832383830353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238366967693938677476746b6a6f72333035396c706d36386970223b7d7d, 1708030080),
('8a5s88s11b5f0rj9k37pka5dki', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393236313435342e3337393936383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238613573383873313162356630726a396b3337706b6135646b69223b7d7d, 1709261454),
('8ahbbur938evvbj7mbm7rhi45p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383635353731342e3938303832353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238616862627572393338657676626a376d626d37726869343570223b7d7d, 1708655715),
('8cb2bm8dpuv3ornk1icrnjv28t', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323637373534352e3934323335383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366c6d6d34726f67336a3030366c393062673931736873743467223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323638303536383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323638313134353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731323638313034313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323638313133393b7d7d72656469726563745f75726c7c733a34313a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e2f6974656d223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223338666363303735656534376164363563663336623837363864346263393965223b733a33323a226165346336643062656532313330663336336332363833356537323962616137223b7d733a343a2268617368223b733a36353a2261653463366430626565323133306633363363323638333565373239626161372d3338666363303735656534376164363563663336623837363864346263393965223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223061643731346636323232393335386139386266653738613832643063333931223b733a33323a223837386266633464336131316137313730343135663135643139356466623834223b733a33323a226465613936396666373438303665373233356362383466656163663839313530223b733a33323a223466623939353032363961653633336238663666306261393530663735363036223b733a33323a226266373439643435393831316535653535643730656633653039343964373163223b733a33323a223538623838336361336637633337306233326336353137396561313833616131223b733a33323a223834653762303261303638313230353537316363376631326639393936623561223b733a33323a226635333162303863373762353661323035633333363230393064343834616236223b733a33323a223835376532633632653265313930653033326263333061323431343332353265223b733a33323a223337393464613339393666356134623730303539323166353762373838356263223b733a33323a223033313738643138353263346161616335343632616439616238356336633438223b733a33323a223938666130393632323238326137666266646232653961323461656430663138223b733a33323a226631353065633166653334376539636136343831646236656532633538366664223b733a33323a223936316133336132636636643731376437613763363232363436326637363463223b733a33323a223665383765626134326237373236373962643333303962306565343066653238223b733a33323a226434623537646432303734343033363165313834656466363366316564613435223b733a33323a223336326263333261623530626633346364316331656636616661353539666363223b733a33323a223166396561383864643666336434366537346137313661356361343634303865223b733a33323a223864333466663031333663326366633266646131323330316133306130306333223b733a33323a223237666635383034333138363861316464316631646664363465393434376635223b733a33323a223633353937626163346666646638623735666436393732376665393630373566223b733a33323a223834393166663732313063633430623366373635326563376535643338373338223b733a33323a226239326536393466316637333164356430613535666231333931633537343930223b733a33323a223834636137396462353162346462363139343733616238656530653131323365223b7d733a343a2268617368223b733a36353a2238346361373964623531623464623631393437336162386565306531313233652d6239326536393466316637333164356430613535666231333931633537343930223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223837643064623638316438306261316465626262356232373462613934626263223b733a33323a223235353833333336383339386538613864663936393536373562393831393238223b733a33323a226364613530353762663661393136343033326437303238323765383134643638223b733a33323a226339636237363538366132653130653062316464616330356639643630346662223b733a33323a223933303565626133626435316434353266616231666165623563663465373061223b733a33323a223832616139663264623338626366346662376265326234653966653930393531223b733a33323a226366373064623238383737363431343134373763316364393731356464303561223b733a33323a223438343361376637383363363663313132323331343539303562346535653263223b733a33323a223464643062386533653335646364656264633864656262623363656635633230223b733a33323a223437373434653866643230363730376466343465386166393664373639393234223b733a33323a223530373334643632643330383665303336656134653136313134373263656666223b733a33323a226361343936306665653264306664343562353737323264346134643939313764223b7d733a343a2268617368223b733a36353a2263613439363066656532643066643435623537373232643461346439393137642d3530373334643632643330383665303336656134653136313134373263656666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226131333632376438663038376330663533326361323062386436306438663738223b733a33323a226432333134366531633137356636613132373031306162376363383364643763223b7d733a343a2268617368223b733a36353a2264323331343665316331373566366131323730313061623763633833646437632d6131333632376438663038376330663533326361323062386436306438663738223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1712677545),
('8gl8rn3tv056bqqbf59c3t3o9h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303938383935352e3635343334353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238676c38726e33747630353662717162663539633374336f3968223b7d7d, 1710988955),
('8ii31nfqi4iisccejusobg5abo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033353837302e3038343436323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238696933316e667169346969736363656a75736f62673561626f223b7d7d, 1710035870),
('8j0j5hfqb00tikb1vu15nfkrof', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383631343738372e3036313331363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386a306a3568667162303074696b6231767531356e666b726f66223b7d7d, 1708614787),
('8m65msin7ntkigon187c7b32mj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373835363832302e3638393333363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386d36356d73696e376e746b69676f6e31383763376233326d6a223b7d7d, 1707856820),
('8um9jlno7n9t0ilui9nunmv1ra', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383931353835342e3339383839383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238756d396a6c6e6f376e397430696c7569396e756e6d76317261223b7d7d, 1708915854),
('91d4gjfdjbgretmb7qk6173ijl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393030323235342e3536333138323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239316434676a66646a62677265746d6237716b36313733696a6c223b7d7d, 1709002254),
('93qenah8c9egjvtph8squss17u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383931353835342e3335323632383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22393371656e616838633965676a76747068387371757373313775223b7d7d, 1708915854),
('94kq0jh24nulpavi4lrs62pqca', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393430333437392e3630383139323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239346b71306a6832346e756c70617669346c7273363270716361223b7d7d, 1709403479),
('9ar6kipvpfnpmp8dtrlj0ce95r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303336333939322e3938343330353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396172366b69707670666e706d70386474726c6a306365393572223b7d7d, 1710363993),
('9cbptnn44obp85vfeobpggffad', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323830393634302e3133323534393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239636270746e6e34346f627038357666656f6270676766666164223b7d7d, 1712809640),
('9m5bnkmd3i9js08ohn2h3gm8at', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323232363337332e3938363836313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396d35626e6b6d643369396a7330386f686e326833676d386174223b7d7d, 1712226374),
('9q9ccr42kic0aasb5adlks0c1p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393638353637342e3338333833393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239713963637234326b696330616173623561646c6b7330633170223b7d7d, 1709685674),
('9qu8bpeoikd0a44jfsi1rv6fv6', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323934343133322e3034383430393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223032757037316a3335767330713737747062336f3733346d646e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323934323938343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731323934353931363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323934353931363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223331326265323138376261363234383665333562626237336534363931646564223b733a33323a226530366635393536336364613739333932323331643234653461316338646230223b7d733a343a2268617368223b733a36353a2265303666353935363363646137393339323233316432346534613163386462302d3331326265323138376261363234383665333562626237336534363931646564223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a226464636637313661333132376162393037326436356138353836343565336266223b733a33323a226563656130646238323362333464613936383739323632323937353738376233223b733a33323a223862366463613838313363636432346638326364383266363531653130633736223b733a33323a223266616262313561626462366364353536303137343432373266366434383765223b733a33323a223039663137343037303034346332633234343433646632646463363036353061223b733a33323a226232343264636662306337316536663939393462653961323562656339306661223b733a33323a223962636161313239343731646131623834613139363366643666396638626562223b733a33323a223430613032333663353166303062303966666637313065623539366166313832223b733a33323a226164336637373338393261663632636230616638323532646466616232353164223b733a33323a226536303563333665393435346536303537623131336165313764356138316566223b733a33323a226339323538613362313562653338376231336261613035373130326337333937223b733a33323a226462623438386539613765643232366238653461396130666461663261633866223b733a33323a226630653666346261363236316233653661643862383435363435393535663734223b733a33323a223037383831613332646338663537363135343239333765333231616239396664223b733a33323a223563636161353363356161346664376434636261343530313166343962333039223b733a33323a223036623732346430613137353339343431653365323131653464623336333530223b733a33323a223836626462643866333536613766346362313739373263333864656330663331223b733a33323a226633303131333264363435316633333961643235356366643863653765333839223b733a33323a223366626336616665656332663636393533336339323231636664363637623136223b733a33323a223237656465653361613933353766333831326162303437646163376633613639223b733a33323a226238366136346261353735643138386637643164303062393331346466633537223b733a33323a223664636263636537646330666336386330343330623262626231306666386564223b733a33323a223233656236363164623564386135643736633733613537386331623934643036223b733a33323a223065306563623638313566653264323534366635343231306435656638353466223b733a33323a223635333937636261666462393936346237393032656563343935306336306138223b733a33323a223463653730333265313939386161613139633839306430333538613734373563223b733a33323a223234663237343836636564656332306265303266303739656139363230306566223b733a33323a223436323534323730353231613037376334306634646438336533393230353833223b733a33323a223265343736373432313533626263316562623331306566616134313436616561223b733a33323a223031616164333663383064303731373032346538663330393230383663386331223b7d733a343a2268617368223b733a36353a2230316161643336633830643037313730323465386633303932303836633863312d3265343736373432313533626263316562623331306566616134313436616561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32373a7b733a33323a226666663065356232316664626664656635633130303235396430313761313737223b733a33323a223532346530343037383434356638663435366336376136356135376662643566223b733a33323a223637366335373631316366633639363533386532383163653362623838636434223b733a33323a223032373563343461356634393832363262313431666465383463366436313933223b733a33323a223937303961343232613036656264306538643530376537363631366239363836223b733a33323a223138626434636532643361633731323736353966613664313362316132353139223b733a33323a223931333035383338393535373936386363363963643963313133326631393536223b733a33323a223738326261376432623137323363336133373835333663643234316335326431223b733a33323a226537646162623765346339623662646634346335663135633863653631393866223b733a33323a223634346337376334663938343661386664323637646162333532303161336361223b733a33323a223435333236316461343765333462356633656530376266323763643839626165223b733a33323a223235393632613339633935633063313962626132306665373762323538643463223b733a33323a223766333064666630653032303737623863356432313033646161323366303235223b733a33323a223061616139653233663364646661616666383534643338633236303537343430223b733a33323a223133643439356166616265353832653930636630626332343936363839396535223b733a33323a223764653061653436313464383836343231633437306336653866313038393238223b733a33323a223332353831623238306263343432643830656561626439343832303262306563223b733a33323a223063306531623238646532626165633737356366653466626635313232333131223b733a33323a223634376536636632613230663732653133373635376230313266626236313237223b733a33323a223530326363333634373730626532346232396634653238306536306264316133223b733a33323a223039613064666463346233616430346330316335613839313761326561353863223b733a33323a223734623837623431636337646133623036633336643937346237383135326361223b733a33323a226664346562613030653137663161663762326363633935623330646665353462223b733a33323a223437636433323633613039613062346665623633366538376336353466303663223b733a33323a226663386566626234646336383035396665656564313739353032663433666561223b733a33323a223732653830633766333034393539356261303339613638393238336137313338223b733a33323a226432336332626665623735373265313163396363653335646231633365326361223b733a33323a223832393731393861393138303864313435613236623939343133323566613132223b733a33323a226333363137613764386264363232633434316430663863366336613338623732223b733a33323a226164383237626365373362333032333434373037623666613933633136393236223b733a33323a223134623062376231393364626430626161656238663565313265356631393065223b733a33323a223733386334396134383065316237626264613664633239613465616630333263223b733a33323a223336326265326464393661613133373863653765383531306139343335623566223b733a33323a226264343262346635623861623664383538313966643434383238346331303761223b733a33323a226431303836646336663864353663383364346664366565653961653831636534223b733a33323a226164373037333037613836336437616535653335323761636638346262386631223b733a33323a223938386432363263636665376432313664353864356531313061396566613762223b733a33323a226239383330666564623961363361393766656161643534366238613033653666223b733a33323a226634666463633661653135326162623734323936333637343536363064613938223b733a33323a223938653166613233326231323033323237383837346564353434356661646335223b733a33323a226465616334373832613834383038366132616661396464306438653962656564223b733a33323a226435663166383031666237343464666632643539346131633961363266376633223b733a33323a223131656463393663643661303230646130343536326532343734363836303430223b733a33323a226638653736663030653433323033333930323533663734636534306563633939223b733a33323a226566613466633462663535343365626639393463303461656137666633346532223b733a33323a226566623364643230626463383031336362313536336661343634663533666261223b733a33323a226239383333323831373735653134356332636133363735393563653638316331223b733a33323a226161663663383162623339613261353230656364363161363666613334666662223b733a33323a226134333539376230346562656465376632316664393965383666323363616266223b733a33323a223032626437326137613232333832373537316566393061393761393934653532223b733a33323a223339373462363362373931366639373839633837656565363038323766353438223b733a33323a223965656639353762316363323437656533343936313239653765666264316632223b733a33323a223664393530373866656562306564393534303635376338323830386266633763223b733a33323a226265326530363932346162626432323834643563346363343266626537663035223b7d733a343a2268617368223b733a36353a2262653265303639323461626264323238346435633463633432666265376630352d3664393530373866656562306564393534303635376338323830386266633763223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1712944132),
('9rcrk8l8ss6vd6n0hdljvta4nt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393539373037312e3239343431343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22397263726b386c387373367664366e3068646c6a767461346e74223b7d7d, 1709597071),
('9st5h23f4bhhfmu529n835o7qa', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393433373036302e3830333237393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22397374356832336634626868666d753532396e3833356f377161223b7d7d, 1709437060),
('9ubl60ha0b5e1ron8tdbgv65e5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303338313437302e30353734373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223975626c363068613062356531726f6e38746462677636356535223b7d7d, 1710381470),
('9vjhisri15tsjg06qvd5u8msdn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383032353739362e3431313033363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239766a6869737269313574736a6730367176643575386d73646e223b7d7d, 1708025796),
('a6qtilp5lqkvtj4e10bg3aq0hj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303132323236392e39333338383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261367174696c70356c716b76746a34653130626733617130686a223b7d7d, 1710122269),
('a8gitif5kgvbdlutkhknmmcqok', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383530393330362e3631393032383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261386769746966356b677662646c75746b686b6e6d6d63716f6b223b7d7d, 1708509306),
('ac70loantp883b68qiiji1lg6h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393236313435342e3439353731343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616337306c6f616e74703838336236387169696a69316c673668223b7d7d, 1709261454),
('achbjkc3rgsit9eipof08l60bb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313735383734332e3330393730323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616368626a6b63337267736974396569706f6630386c36306262223b7d7d, 1711758743),
('aig65hvflerrhln4rkne83ago4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393137353035342e3630303935373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261696736356876666c657272686c6e34726b6e65383361676f34223b7d7d, 1709175054),
('akkci9cagvgan19tm8s1eeqgr9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303937343834392e3237323335363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616b6b6369396361677667616e3139746d387331656571677239223b7d7d, 1710974849),
('al3p2kjpnvd0t0mc2dkimcr1d8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033383334352e37393332373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616c3370326b6a706e76643074306d6332646b696d6372316438223b7d7d, 1710038345),
('ao33tgqe1uiioe35de5dgh7cr3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383635353731342e3734323137363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616f333374677165317569696f65333564653564676837637233223b7d7d, 1708655714),
('aqfr2pm53jdjoduf7paplpl6cv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373930373033332e3031353138323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226171667232706d35336a646a6f647566377061706c706c366376223b7d7d, 1707907033),
('ari2abr358rhco51aj1rh7acik', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313434313437342e3333323530373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22617269326162723335387268636f3531616a317268376163696b223b7d7d, 1711441474),
('b2cad9gg3t6o3psqgo66pod7q8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303338313436392e3936303135373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262326361643967673374366f33707371676f3636706f64377138223b7d7d, 1710381470),
('b69ig08ril3l37qcqkbikkrtcv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303938383935352e3535323035373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226236396967303872696c336c33377163716b62696b6b72746376223b7d7d, 1710988955),
('b6mkahguli6o35ec1k3m2qsvol', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313637323334332e3333343532323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262366d6b616867756c69366f33356563316b336d327173766f6c223b7d7d, 1711672343),
('b6q0p59r9ai7oi6vif3b213it7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033373331332e3131383732353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226236713070353972396169376f69367669663362323133697437223b7d7d, 1710037313),
('bho72gbrivkm138dcfc5vem764', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323735343730382e3130353930343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262686f373267627269766b6d313338646366633576656d373634223b7d7d, 1712754708),
('bluinptnmro43np1q6vu61n59c', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383130343737372e3835393131343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273736d716d64346167683236726767626b6b65356c693063396a223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383130383337343b7d7d72656469726563745f75726c7c733a33363a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223037643735306335393334306638616532636139643538316537613262386162223b733a33323a223434643832323833376539376334343538343237316166346533383236663663223b7d733a343a2268617368223b733a36353a2234346438323238333765393763343435383432373161663465333832366636632d3037643735306335393334306638616532636139643538316537613262386162223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1708104777),
('bou7gcqn84o95ahahlietpstrk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303634333335352e3833323734313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626f75376763716e38346f3935616861686c696574707374726b223b7d7d, 1710643355),
('bp70vgnh600p423q67n6e63fqm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323031343837362e3533303639353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226270373076676e68363030703432337136376e3665363366716d223b7d7d, 1712014876),
('c1bgdpvukbd7u448th18j4r0jq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393133323537342e3339343732393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263316267647076756b62643775343438746831386a3472306a71223b7d7d, 1709132574),
('c5h283b8nlmo6nvl8mgm7tl8nd', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373835363138322e3433323035373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235666a6171726b7468736f396862673231326b32686b69367035223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373835393335333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373835393635333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730373835393635333b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373835393736343b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373835393634393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226538313339366433666666623366353434613231633562633433396535376231223b733a33323a226661623062373839613365663733613365356163383134656266373636636663223b733a33323a226536383438346631653336343564343138306162393163366139316239336565223b733a33323a223535363166626335643531336533636266353838346230353531363461306433223b7d733a343a2268617368223b733a36353a2235353631666263356435313365336362663538383462303535313634613064332d6536383438346631653336343564343138306162393163366139316239336565223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a226461633032626333663132363535633733356366323966316665343433623433223b733a33323a223864303161623732373164313338303339643561323638623431326636313531223b733a33323a226536396534323736336534333030326133386535653831386264616333646466223b733a33323a223665653366313334616138636363656336386263373962616635393862646338223b733a33323a223232306136376631383863396433393639616264323132343931626539643239223b733a33323a226139376435303633363932646164356661646464663763313836643739623738223b733a33323a223361616338613463626536353464666566663031376537323337623532306139223b733a33323a223261353131653831353232356133303538623961373661626636363738306133223b733a33323a226338316632373664653263646130643638653966636630643332626330633936223b733a33323a226638363430336539326662396164326136656366363066626166356338386234223b7d733a343a2268617368223b733a36353a2266383634303365393266623961643261366563663630666261663563383862342d6338316632373664653263646130643638653966636630643332626330633936223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223432376236656466326532383638333661383836333031616166303165373666223b733a33323a223833343030356462363432613137393434393065326335336434306664613565223b733a33323a223339393433306439646361306634656632613539633137306137313962633239223b733a33323a223036376664393530353762656666393064623738653230363464333331363664223b733a33323a223835616539343164373634666535393366663461353162343666363432636635223b733a33323a223737333665333164623234316663373239386436623865623963303535376436223b733a33323a226136383332313230656339343934363466346337356466663134323530643962223b733a33323a226434356532663539346335623836366638643530393661303738366536376165223b733a33323a226430343632376364623861633434343033623862653565613034616337303636223b733a33323a223138346339373764623037626665653765373430313361343636333066663466223b733a33323a223665313665656137353738613063336165343365643461636330336166376561223b733a33323a226535303630386332373334653935623431623866653438313339313661396437223b733a33323a223731343439356562653334653333653635343635376662633537663162323333223b733a33323a223636353535383835373137383533613338623131366332633235353766383631223b733a33323a223362623836316334373663616535306166373435323361636139383162376561223b733a33323a226664626137303066343866643735373733343235316561663536353366383331223b733a33323a223935626264356534633233356563376336613763613261323865383234616235223b733a33323a226439316138313661336138643532396339363364633339646131356634346564223b733a33323a223666343737356363383532613735656463346435306464663537643362373032223b733a33323a223134343334663434646434373835636431303835353364363462383337346330223b733a33323a223666376536666237363563313862626438333631646135653431386132616261223b733a33323a223233313237613530393033353430653037373438326662663366363731616162223b733a33323a226364306537363132313964666533366336343130663332396436323535346331223b733a33323a223138306537313537336235613764323535343637353430616333396631356133223b7d733a343a2268617368223b733a36353a2231383065373135373362356137643235353436373534306163333966313561332d6364306537363132313964666533366336343130663332396436323535346331223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223839353033353635643739343563383262373334646533393935333238613464223b733a33323a223237343636323966343734346464353335633939303663653735316365643037223b733a33323a226637643135363736303331653439323132366434343337613264663236366135223b733a33323a223564656630306561376131616565613364313238333432656363646439626230223b733a33323a226339656564326463303439326438636465626132316133343932373333613438223b733a33323a223162336630366530393636373635373837623563653764306433303765326133223b733a33323a223531313634363830643738383366326164626165613730626665346238306666223b733a33323a226634663766373162353732653339316265666533653232333637383564316635223b733a33323a223934366432383838633737343062323263383231333036326264343666643232223b733a33323a223563623366343236653364343631356133353666346161396235383964313235223b7d733a343a2268617368223b733a36353a2235636233663432366533643436313561333536663461613962353839643132352d3934366432383838633737343062323263383231333036326264343666643232223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223634333166656661343962363365393662343931353831376538616661383636223b733a33323a223632306630303863396132306532633535633262306664383765376463343161223b7d733a343a2268617368223b733a36353a2236323066303038633961323065326335356332623066643837653764633431612d3634333166656661343962363365393662343931353831376538616661383636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1707856182),
('ccnc11b4at03ssmapsosc5kc50', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313431333134332e33323030373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263636e63313162346174303373736d6170736f7363356b633530223b7d7d, 1711413143),
('cp3vtibhqad6g4ht2j9fhv20dg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313332363734332e3532333431373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263703376746962687161643667346874326a3966687632306467223b7d7d, 1711326743),
('cr24h1g85kroe8t1tdaagttdoh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303831363135352e3630373733383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226372323468316738356b726f6538743174646161677474646f68223b7d7d, 1710816155),
('csubhblkn3hfh0mqe7q383hpn5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313136313735352e3832333232313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226373756268626c6b6e33686668306d7165377133383368706e35223b7d7d, 1711161755);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('d12klq9g1tm12rk0roc8mgtod3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393334373835342e3437343932393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226431326b6c71396731746d3132726b30726f63386d67746f6433223b7d7d, 1709347854),
('d1vdf001of1s0kv0ma6c5ovje1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393030323235342e3530373735363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264317664663030316f663173306b76306d613663356f766a6531223b7d7d, 1709002254),
('d2lg4jq8uc6oep4oe2mqfbuink', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303436373837302e3135393433313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264326c67346a71387563366f6570346f65326d71666275696e6b223b7d7d, 1710467870),
('d2poag32uhtvaenrp10ecfokvs', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383137333331352e3239393435393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226432706f616733327568747661656e727031306563666f6b7673223b7d7d, 1708173315),
('d4p92sa8nfbvp2ldgk04l4kcie', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393438383732322e3937323032353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264347039327361386e66627670326c64676b30346c346b636965223b7d7d, 1709488723),
('d6sk7o70guhjk8bf3klbgep13o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303239353037302e3334333538343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226436736b376f37306775686a6b386266336b6c6267657031336f223b7d7d, 1710295070),
('dbajp528h10def3m08nq990cpo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383438323137302e3130303830383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226462616a70353238683130646566336d30386e7139393063706f223b7d7d, 1708482170),
('dj6qpmvufvct8vv0l7e6omebgg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393436383238392e3435363039313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646a3671706d767566766374387676306c3765366f6d65626767223b7d7d, 1709468289),
('dmn0m537pcleqs2c7c2tsjbln6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383839323936302e3735353938363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646d6e306d35333770636c657173326337633274736a626c6e36223b7d7d, 1708892960),
('dslai2io1kq5grv7v6jhhr0j2c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313934393133302e3533313434323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264736c616932696f316b71356772763776366a686872306a3263223b7d7d, 1711949130),
('dv8p2m757phheitgcvuo71dtep', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383034313237322e3034333535393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264763870326d373537706868656974676376756f373164746570223b7d7d, 1708041272),
('e18aen6u60ntn8k28p6u1lqu5b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393236313435342e3535313138363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265313861656e367536306e746e386b3238703675316c71753562223b7d7d, 1709261454),
('e2icgu4msqrm8v5ftto6h7692a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373837363439332e3931373030323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22653269636775346d7371726d3876356674746f36683736393261223b7d7d, 1707876493),
('e7kto3pn4efepktg5qvh1sj1f4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033383334352e33333434313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265376b746f33706e34656665706b74673571766831736a316634223b7d7d, 1710038345),
('e8l3ij5ig14jtvg0i1slo65ovt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313234303334332e3332363031323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265386c33696a35696731346a747667306931736c6f36356f7674223b7d7d, 1711240343),
('ecdu080k1qvc44h1vkrk1l89je', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393038383635342e3835363833353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656364753038306b3171766334346831766b726b316c38396a65223b7d7d, 1709088654),
('eflq69r0c6hlu73ts69pj3ju1m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323839363033392e3931383330343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265666c71363972306336686c75373374733639706a336a75316d223b7d7d, 1712896039),
('ej62gc4s662f9liqc50off4ssh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313231313333382e3230313736373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656a36326763347336363266396c69716335306f666634737368223b7d7d, 1711211338),
('em3i2roki5110bbtlttj29dj38', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303336333939322e37393832393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656d336932726f6b69353131306262746c74746a3239646a3338223b7d7d, 1710363992),
('er8elrthrs17nfhfv6kbvqks29', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323239343733302e3630323739313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22657238656c727468727331376e66686676366b6276716b733239223b7d7d, 1712294730),
('ervk203c3pah70tus1ovg4ph2o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393133323537342e3232383638383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226572766b32303363337061683730747573316f7667347068326f223b7d7d, 1709132574),
('f0lbh5k8k82ndk8q4trgq3u7ts', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383632303430302e3236393639353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266306c6268356b386b38326e646b387134747267713375377473223b7d7d, 1708620400),
('f1g07m5p4mtsg72b1hn8jeguqe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323835353339332e38323934343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266316730376d3570346d74736737326231686e386a6567757165223b7d7d, 1712855393),
('f2vlu90m1g6g9ae4u8aa7860dd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303938383935352e3731333632333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226632766c7539306d316736673961653475386161373836306464223b7d7d, 1710988955),
('f3h4be3vjlromvaka8a2k0nkig', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373839363035352e3031353432373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266336834626533766a6c726f6d76616b613861326b306e6b6967223b7d7d, 1707896055),
('f52kq65h9503n97s7tct3ob7u7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323732333234302e3131323430393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226635326b71363568393530336e39377337746374336f62377537223b7d7d, 1712723240),
('f5586hm9o8si8t0e2mv7aqg35u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313339363338372e3734373833363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226635353836686d396f38736938743065326d7637617167333575223b7d7d, 1711396387),
('f5a60nbh7a5coie9qccg87tosk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303532303836382e3034343736373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266356136306e6268376135636f696539716363673837746f736b223b7d7d, 1710520868),
('f7690ulbf56lpvag37juqhqe5u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373930303338372e3439363435393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226637363930756c626635366c7076616733376a75716871653575223b7d7d, 1707900387),
('fa42a2mvnrmfer1rt5qd6os1a6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373839303139312e3833323133353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226661343261326d766e726d666572317274357164366f73316136223b7d7d, 1707890191),
('fjh5jbhpgi0ftv8rs5ovro9oj3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393532333436302e3730373431353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666a68356a626870676930667476387273356f76726f396f6a33223b7d7d, 1709523460),
('fjocapi1g94p5331tr14f99bdi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373934323336312e3732393030393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666a6f6361706931673934703533333174723134663939626469223b7d7d, 1707942361),
('fnokhid348tvrmr9klire5p7np', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393935353436302e36373335393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666e6f6b6869643334387476726d72396b6c6972653570376e70223b7d7d, 1709955460),
('fo6gutcrcom93t2vebftmfltgq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383034363537352e3239353031323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666f366775746372636f6d3933743276656266746d666c746771223b7d7d, 1708046575),
('fr9fa04md9d99mitvt58jub07j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383530363738382e3830353735323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22667239666130346d64396439396d6974767435386a756230376a223b7d7d, 1708506788),
('g02kgegovksp2a5u7154rtg4f5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373837313731352e3130333231363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226730326b6765676f766b73703261357537313534727467346635223b7d7d, 1707871715),
('g21ra9ijqvj6ea5nfhci16b15n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313836363337372e3030343232323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22673231726139696a71766a366561356e6668636931366231356e223b7d7d, 1711866377),
('g3umaaic0gi18kdjek4o7e4kor', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323436343034302e3031343135363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226733756d6161696330676931386b646a656b346f3765346b6f72223b7d7d, 1712464040),
('gaur43pmda06sb2ojanr0nhfi0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303131393937322e3131323835333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676175723433706d646130367362326f6a616e72306e68666930223b7d7d, 1710119972),
('gcatjj8h5dn8j9n3q5636sen0n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303732393735352e3836323131353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676361746a6a386835646e386a396e33713536333673656e306e223b7d7d, 1710729755),
('gnpknu6devv886ikc3uoe9h1d0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033383334372e3831393038383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676e706b6e753664657676383836696b6333756f653968316430223b7d7d, 1710038347),
('gpetilh87vbqohb7fq82jr8l6r', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373934303034362e3333353935333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326575683067706b3865306767376534706e73326a6435336f33223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373934303534393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730373934333630383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373934333539333b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373934333634363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223438656234313263346635663865643462626263633666343934643436626537223b733a33323a226266616635323832323738643366366631366135346662363234353664613365223b7d733a343a2268617368223b733a36353a2262666166353238323237386433663666313661353466623632343536646133652d3438656234313263346635663865643462626263633666343934643436626537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223637326638306634323839316132653464623935333836303165396431336166223b733a33323a223533353637316130353661303330333039626536346630333966353936636431223b733a33323a226463386661346536343464376332393766396232363461616338623738616336223b733a33323a223463356233613338303838653561616164613764396639663032653433393932223b733a33323a226430393162653338343864376635336231366438393036636539663739656261223b733a33323a223337613334363532366437346563656361323062323439306261643439643331223b733a33323a226336663232303538316434666434383666316530303537376163326538396264223b733a33323a223166613831376530366166343762373261323062333137396433393963613034223b733a33323a223633626335373264303438666131626236323630643139303331613539303432223b733a33323a223937643536656365366634373262636638323336653335623536346263383434223b733a33323a226461333164616237333039343062333165353532393538346639626136636137223b733a33323a223930343962643530366665353332663830363563613138656536623235623731223b733a33323a223536633833306435383362316432383163613834363533633066653561303461223b733a33323a223964636261663762653162326231383065306536343363363633353233663434223b733a33323a226565643461323535646333393838393935643163363037653434656666376337223b733a33323a226662383832303665356333396561633264313031633539306433633461323939223b733a33323a226235306566653731636536663362386264653162363931653436663335343535223b733a33323a226537636162343235633265333234336632636534646562323232313635353431223b733a33323a223964316530353732383037363465386333363464326537336435376661666162223b733a33323a223639613630316333653965383434383530656432323664393138383363613132223b733a33323a223030316234383434383435393734383163646664343336363135643163326361223b733a33323a226332653163303938383436393531366265333531353334356333363461386465223b733a33323a223036333466313837316465363937626265366465306531623163326331366337223b733a33323a226239373938313631643631323830333866643830363532643363303439323539223b733a33323a223365333366336266363866633065376132306138643332633465373566386136223b733a33323a223561666535326537336565363262633062666536663161663762343564363164223b733a33323a223831383565316538303130663037666337363537643961366164323965613930223b733a33323a223138326263313833663263613035336236653963333365303366336263376161223b733a33323a223462626565383034356137306332323664333439396136343465316432613535223b733a33323a223431306133636138643133613666383662333564326232633335306139633864223b7d733a343a2268617368223b733a36353a2234313061336361386431336136663836623335643262326333353061396338642d3462626565383034356137306332323664333439396136343465316432613535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223536363832366436336531353665663136626136646537386465616164383439223b733a33323a223665363864666636333165353462396566643439616432653434346335373030223b733a33323a226661306163663332353662623133636333326239316131633966383133383236223b733a33323a226162306662643966623765636530356162613035613263633836313636376132223b733a33323a226266613239303539663066366465336338303732306562633865373064363635223b733a33323a223036393561326264306538613533363631323236383731323636386466326235223b733a33323a223337663533353363323036633534303763636230666435316535626330633738223b733a33323a223133643364613030386335383834613235306437343332653663646433643339223b733a33323a223165613033633730363461353434373238316264393531623263346234623366223b733a33323a223235353335623936393636336266343262316330343731663461356335316231223b733a33323a226562663862366662366465333530343935333433643031623963383863323032223b733a33323a226438323065393636383166663461366233333031326366393361393933353762223b733a33323a223830353664653063633438613633316630356362646437643935616466323866223b733a33323a223564393739383133663034323963666262623731643361303430343531363031223b733a33323a226136363631316636353266376131343037363665383863653834633339343936223b733a33323a226335323061313934616163326665663864343164633264613335356630306530223b733a33323a226433636265613637313338383533643832343062653166613866393435316431223b733a33323a223633643638353137636661393665306136306662393565396331336366623865223b733a33323a223064663931643233643331356264303864303036303136376132646632653333223b733a33323a226434633861323935363162326130376665376233323038613866653363663561223b7d733a343a2268617368223b733a36353a2264346338613239353631623261303766653762333230386138666533636635612d3064663931643233643331356264303864303036303136376132646632653333223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223338623234396230653265646135396261316331363039383836636165616631223b733a33323a226164653437636465363363313036356265373364653138633161643430663062223b733a33323a226237306338333630353863646263653832366235646532646364343663353631223b733a33323a223233613937376165363136653761313730653863653532363139336136343438223b7d733a343a2268617368223b733a36353a2232336139373761653631366537613137306538636535323631393361363434382d6237306338333630353863646263653832366235646532646364343663353631223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1707940046),
('grmgpabhpkgbrqd8h4on83ga7a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393630393836312e3033323937353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267726d6770616268706b67627271643868346f6e383367613761223b7d7d, 1709609861),
('gs0po3kr64cci4g2dhme9pep7l', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313735383734332e3137373937363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22677330706f336b72363463636934673264686d6539706570376c223b7d7d, 1711758743),
('gs8qnfqflr7m3ibn1nqtimuu6c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393233353238332e3138323338343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22677338716e6671666c72376d3369626e316e7174696d75753663223b7d7d, 1709235283),
('gu95d5b286ccq5h2ks59lica8d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033373330392e3831383231323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22677539356435623238366363713568326b7335396c6963613864223b7d7d, 1710037309),
('gutp75vnegas36t29uqf4ppbts', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313637323334332e3139383134323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22677574703735766e656761733336743239757166347070627473223b7d7d, 1711672343),
('h26db6ffnl4k3fulslvt3a8rc5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373935353639382e3336343036383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268323664623666666e6c346b3366756c736c7674336138726335223b7d7d, 1707955698),
('h3fstt65lbgu54tittgar3744b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383832393435342e3330363938373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268336673747436356c6267753534746974746761723337343462223b7d7d, 1708829454),
('h9mhio6gqegl2b6o8uaas10f7u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393738323636302e3739313639343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268396d68696f36677165676c3262366f38756161733130663775223b7d7d, 1709782660),
('hcd1fk2frka0aoimkdkqasik62', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393639363236302e3836333837343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268636431666b3266726b6130616f696d6b646b716173696b3632223b7d7d, 1709696260),
('he2df02lv8ihukd0tbfq5hctd0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323436343033392e3835303436343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686532646630326c76386968756b643074626671356863746430223b7d7d, 1712464039),
('heitpa8tigft1b0uks9esf9cdp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323436343033392e3936353532333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686569747061387469676674316230756b733965736639636470223b7d7d, 1712464039),
('hf96q9ogar2ueadvbfba9nkfun', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383034313737372e3935383837343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226866393671396f67617232756561647662666261396e6b66756e223b7d7d, 1708041777),
('hgqsvq74c5bd4b25ctdroaorhq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313836323733302e3630353133383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268677173767137346335626434623235637464726f616f726871223b7d7d, 1711862730),
('hj3k4an7hcvslc479um5s46fv3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303132323236392e3838353232333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686a336b34616e37686376736c63343739756d35733436667633223b7d7d, 1710122269),
('hjk2jp4at8nbsj83elea0svfso', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373835353931312e3532333137333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686a6b326a70346174386e62736a3833656c656130737666736f223b7d7d, 1707855911),
('hnp142lkb60vl05s2due6taq56', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373935353337382e3138373832323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686e703134326c6b623630766c30357332647565367461713536223b7d7d, 1707955378),
('ho952f386d2roc0dbqg5ibac7s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323633363833392e3930393231373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22686f393532663338366432726f63306462716735696261633773223b7d7d, 1712636840),
('hq4grnrec7rnopjipqgfm5d8lg', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303132303130312e3233323131363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268713467726e72656337726e6f706a69707167666d3564386c67223b7d7d, 1710120101),
('hrq6s30re0o0mqiv77te5lbhrb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383536393331342e3839323936323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22687271367333307265306f306d71697637377465356c62687262223b7d7d, 1708569315),
('hsauug15nl5bfqhgbmmmgbuo17', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303831363135352e3839303033343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268736175756731356e6c356266716867626d6d6d6762756f3137223b7d7d, 1710816155);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('hubt07b2k8jsei1gpafp5uslfa', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383631343337302e35343130383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276766634717664716a61706130393136676d72676f7669706575223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383631353937343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383631373934383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730383631373934383b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383631373836393b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383631373934343b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383631373933393b7d7d72656469726563745f75726c7c733a33363a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226361363234343930313135393538303538623562356664346632626332626639223b733a33323a226638313134313566343562613762333966633462393130663764356466636331223b7d733a343a2268617368223b733a36353a2266383131343135663435626137623339666334623931306637643564666363312d6361363234343930313135393538303538623562356664346632626332626639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33373a7b733a33323a223061363861663862613864346639343238336136633166666537346337623638223b733a33323a226362633462633531643066666636616532363037303335383032356234313039223b733a33323a226437623339333332326661616139303761653436643265643232326361393866223b733a33323a226432636635663566313532343436333538333538366166636562336437633864223b733a33323a226163383830363030326139303964333930363631346338376264626436663337223b733a33323a223034353764343937323837663866336634303635306566666561633564313133223b733a33323a226135646435343436356266653262396262393636393433336330626630313637223b733a33323a226238626336666337663961393965353533623137316165386663386666353464223b733a33323a223139363132306439353962646531653136653466643261386336653435623636223b733a33323a226339383565363963306539356130383266353835306666316661373732313236223b733a33323a223035653730626638393763643639303934323833656538373065356531393036223b733a33323a226366306564333733646431663930316535373661663837333131653532356265223b733a33323a223535343735343863383466303361636431653066646666326163306238326161223b733a33323a223933633130653235346166323239333331353539363064636562396565643264223b733a33323a226361333431353264393932613736623034383837326331616233363364376231223b733a33323a223134643361646664366135623234316264656630346539336365356361393066223b733a33323a223532343132666330386536333838313434393761613161356534383566343161223b733a33323a223861346663323935346566313238636633343162363330643034393565626566223b733a33323a226630613432306230613630613434633332323434376137656132636265613561223b733a33323a226333376235306163333534623862663463656462633565633134373536396661223b733a33323a223762623434653366316366636362336133623238626230303262353661663938223b733a33323a226135616630353230363064343736653435633833643861336136303966303338223b733a33323a223337633034643730653566373833666333303139376164323063356162326235223b733a33323a226162633532373037303830386631383164646261366337343261313463346466223b733a33323a226563613739623862306434393339633935313766633835303832616261386564223b733a33323a226663646363666339653263653631326335653833396665396366373031663161223b733a33323a223639376337373038623439333661366230393563363563623239393066353230223b733a33323a226366643161616536356134653531616263313662626433366334303565366431223b733a33323a226437613636613764373066616364663766373437616636663234636234393435223b733a33323a226164343532303661613464306634386639353133643363383733643638333431223b733a33323a226133383166643736316532386135666163343366653838653233373433393830223b733a33323a223966626562333465663736373433636534316535633132343737323639386366223b733a33323a223330633265383433656363306338623762363230616530393632363666653764223b733a33323a223038366130353839303333613638373764373065383234623364313564633231223b733a33323a223361643064613963386537663737303438333064613264646231326163336632223b733a33323a226638323339323162323730383064383734616334666230313663303961313737223b733a33323a226162346631633232643432306432326132363965373065303865306461396135223b733a33323a223031663633656561613439343738356238613038383462366366386136373262223b733a33323a223232396534646133663236616138323535343261376665353562303030366133223b733a33323a223333613934663864353261396330363762323532386235333265643363303535223b733a33323a226635643733353638393234363739383537646366653730346439666561313161223b733a33323a223633343132353831373866363635633563313637646437323264303735646634223b733a33323a226335306661343464646335323435356666626265636462313832393036303161223b733a33323a223930323361643135383865356663376130613435386139383739323232363562223b733a33323a226530633633376564643432636539616464663039363965646362353430323331223b733a33323a223936323363316234626231333366656639373661303733356365313431303365223b733a33323a223464343131393834376466313339366532366632663833313866666537363862223b733a33323a223538353934623362373961343434633434306466623439663265363236646530223b733a33323a223336383632623631393738383633643832303763633739376634383564396661223b733a33323a223766633131663866383863356331306662656661326132393163303663633062223b733a33323a223031303632386636643530356236376137666630323837653461363864313633223b733a33323a223035633464623437613535356530363533343261363736323338366537366638223b733a33323a223833623834333131383662383564306234623731396161326562336562653862223b733a33323a223833306534663336343035363736333538663337626161373836306263623535223b733a33323a223163386137343731383239343337613435373463653237376233333038363139223b733a33323a223731303538343034326336653038633434363539653365376433373561373236223b733a33323a223938666139613938386337653433393838353038316339353964353631363465223b733a33323a223161356661616632613531353764396534323836366633333731616632383331223b733a33323a223565386630616634376134366265323563396536666338366232633539336134223b733a33323a226461346436333166396466313364373262313663313964323535613664646233223b733a33323a223362636231346638626635613632663536663961646662336239353866643535223b733a33323a223737653163656338333163623236663232643064643433343537323838636562223b733a33323a223338363634626230663330333637313366633534373535356431303230376135223b733a33323a226131386234333465373462306233633131616237616562333733366432633561223b733a33323a223166303330346136343863636364373739333061316565363664623663313936223b733a33323a223039366136633861386662616665373733353232623334616133396565633662223b733a33323a223536666633386439643263663365623832346465613837373232313661326165223b733a33323a226137336230613962306439663137636531353030313238356437326165313066223b733a33323a223435383766303938336632633135623135663966316134653562386164623161223b733a33323a223239626435373135386264616136343762346534626538373265353535666462223b733a33323a223035643836383133666464383963646439363031313061633333383036343361223b733a33323a226433363166626134623764636236623734306337346366636137333937383266223b733a33323a223330643261336336303765336437656336393234343437633835356565663161223b733a33323a223631646261373838313138366138613231656139373163323935656431306232223b7d733a343a2268617368223b733a36353a2236316462613738383131383661386132316561393731633239356564313062322d3330643261336336303765336437656336393234343437633835356565663161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31383a7b733a33323a223731303438633735613039356137653234313662366566656630343337396461223b733a33323a223334353132393764353833613366363933386330353365663738303634666563223b733a33323a223338653939346662663064383061363231343430396361343536353930303433223b733a33323a226135313331616334616637306663646362376533636239626366663834643064223b733a33323a226437306463666266636332386131313735653839363463323364306164646639223b733a33323a223662616235376333336164646463323465303832326663646532353035333732223b733a33323a223065366534653331623561303439636661373565336337323863306366353062223b733a33323a223563316466363761316337346165303034623362313930313537376561346562223b733a33323a223935363564343764353736376639653335626464663762383935633133616664223b733a33323a226431303565666663643035373239656237366664353763623562306637616335223b733a33323a223635363230623132313634656630653961653030313565623534336431363535223b733a33323a223965333338326337376666303137613866636433316137306535343464343365223b733a33323a226236633362343835396234613636313166383333376565313762663234623831223b733a33323a226563313961363765363763326363343630303231653265383430643031376433223b733a33323a223338316566333464643061613962373630663931376461356137313635393731223b733a33323a226131316632363033333831373534666339346266386630663863326132303066223b733a33323a223665353136353132613463303161356630386138303965306564326663366263223b733a33323a226632373230356136646539326366326338393635343666366463306639366637223b733a33323a226235316636366366373163626535326136353431313939663538356335303937223b733a33323a223064313933316161383239366534303363376536653135336336663731363935223b733a33323a223765306434626432353064663937343663386534323931303734653138356131223b733a33323a223536396333666461336432323838346534646435623866633237653335343065223b733a33323a223764313334346465353564366564313266636239356435633331663038643633223b733a33323a223834376531626236613931636135343739326462326533646466313535323437223b733a33323a223961396634363766326334326165366266356335363134393631366339393932223b733a33323a223033623934313064653932383862643038633362663062343761353439336164223b733a33323a223031646530653536363236306665343065613135663631386633323232633838223b733a33323a223265383637626535393038396466326637323734323766313665353237386535223b733a33323a223764333262393737393233616137656433646165656663353137623933336234223b733a33323a223533616338353733336462316636316538626237313062356134663464333561223b733a33323a223035656330633437626562376235376363643137326638653735643964646332223b733a33323a223931393632633965623033336539623666623733363036663936636564303137223b733a33323a223763653436663766373737373434633230623635393566353437383837653838223b733a33323a226333303265386534346465313832346164366137636330643433303063346232223b733a33323a226631363062336465393062653436663734353337356266666365303939653363223b733a33323a223337346164633437613434313761333730326230623731646266303434623233223b7d733a343a2268617368223b733a36353a2233373461646334376134343137613337303262306237316462663034346232332d6631363062336465393062653436663734353337356266666365303939653363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34333a7b733a33323a223439613464613531656638356265366538363438383031616333353036316535223b733a33323a226162616136353030623339363265303034646135626262323562316432646364223b733a33323a223365643862353836353761623166336430666230353939346364303766663166223b733a33323a226164666264353434303664643936653634626663376431303938633533636239223b733a33323a223337393638396134643633393732323864663831346364323137666164633466223b733a33323a226634343363346162613466306132366163356163313437316230323134353065223b733a33323a223534303862393934626532353331666561376136306661323532653331303038223b733a33323a223062313238363531653438316237353439666166373839363166333364343164223b733a33323a223338396535613335346435333366383335653236306433373262666337613066223b733a33323a223564333139623931383436373131343131363038366235613361373839373535223b733a33323a223637633633646630633165343539326137386466613164353239363138613166223b733a33323a223163363538646332663362363930653766393036646339333063386361316438223b733a33323a226564303761336265366363353735336230366632393736383334653161643061223b733a33323a223339353663356332343930383933326132383662613465373933363965333639223b733a33323a223637316531393036326431336233663836646162623464363362346235626133223b733a33323a223163643361376665313533343837636535663239633330643933303736373964223b733a33323a223062376538366466643436666362663662316333366334383563616234376666223b733a33323a226530393634626362656665313432353436313763306164323733663034626633223b733a33323a226265656431353139373061633665656533663932646635623230643232356434223b733a33323a226438656435323963343162343431393132376533653731306162633437633765223b733a33323a223434643561336164346263623639346238646461313965383061373161326237223b733a33323a223533383834303965326238316436306232316634633637376532373833303835223b733a33323a223631653230633336396162303163383739383133343564663161653630393865223b733a33323a226565323431313333636561303133363432346263376564346239633539356263223b733a33323a226231643437396436323836346231356239346536653538636165333539396136223b733a33323a223830343639656339393038323065643936653930336531323161303139316261223b733a33323a223962623966653834323764383432653630346463613931626430356266366231223b733a33323a223162373132366166663065393630633838373337336139343036333965313936223b733a33323a223962666333626666363134653866303035326433336166613938313539386661223b733a33323a226462316265396366303132383538396236666639316530353439613262326664223b733a33323a223064316131663739363033653031343734623434616163643431643030383939223b733a33323a226163386232613164306137626639386539646136643561383562636136353433223b733a33323a226364643831666331306363366465623064356263336164373035373136613462223b733a33323a226534363964626361396430343239366432353439393034616437333565663230223b733a33323a226634636332663033653564626236646162396537376339393136333038383961223b733a33323a226632303530346232366638613937616461623539313430663065626666393733223b733a33323a223764393936383136386464353134626639393630623038633536393532313732223b733a33323a223131343635633066303537623738386165373733386435613164643930663165223b733a33323a226331326134386534656633626466346461643731653237316461393538666166223b733a33323a223563346364373530653961373065373136373432646531663464643739303636223b733a33323a223232353164383937383837666133353637313565326161633232643630313764223b733a33323a223865333436373639366338313734333165326334373764356264326466356431223b733a33323a223062393565646131356266623337306262316534363764366336383761373734223b733a33323a226365353933663538653238613861663837383962396233366461646135616338223b733a33323a223462373332333433653862383438656430646533373730346565623761323938223b733a33323a226633626136343232353834356364393831323766656463623063616232346638223b733a33323a226134653835626138356535666339356335326530626137613461616337343731223b733a33323a223865373561663363616663383465303735653034313634326636376637353938223b733a33323a226333353361316463376436366138363731306334646432633633313938353531223b733a33323a223963636161616633366139366637373963303265373530666166383461386433223b733a33323a223833326633643638373564393432376439616362386365343563363662343534223b733a33323a223338386338663733636561616533383534633630613939336339353763653436223b733a33323a223661336264633939393066313432303431376265373533363132396138383634223b733a33323a223735393039623632383434336463353036333836316637306538306666353135223b733a33323a226337643037653965343363353735303130323239613734633731616336376130223b733a33323a223232633730626432363336336265633961356333373735386564386333383831223b733a33323a226363323730373161646461326539346235323037663838363631663166346435223b733a33323a226432386165393564326439623731353332343466656437616262363430633865223b733a33323a226537386335366161643663373738383163663733376665666630326362336635223b733a33323a223663616262353133336164333465396333643464383237626362643533623332223b733a33323a223962373638656435326131313532316334376433636633393635316233383164223b733a33323a226662343337626237386138393835303861306631653037633737373164373439223b733a33323a226439343165353037666633376165343132383261383637333937333461356463223b733a33323a223965643363313238306664376233643833366335663836333066633332383236223b733a33323a223639643538663137386339356139653233316232366365613234356231646335223b733a33323a223863653963333335316437616538306534663461313537383239376535353362223b733a33323a223731326636343263613933376666636364376562633361636134636636366361223b733a33323a226237353263623464333765346132656538373234376563373236373661356534223b733a33323a223730646661313366653038633630383736363630633530313334353763346333223b733a33323a223866306334653064373765303864636435656465366236656366663336386161223b733a33323a223963333239656436636539396164633233643437306664383566663031633435223b733a33323a223162396432633465646339633630313163376462616439326138653338316335223b733a33323a223134636639346530633233363763326137363665343031376332383461326466223b733a33323a223965373662623439646662666265323333333537316165633066643233633634223b733a33323a223237393239333436326136396363363362323138373865663862636139383864223b733a33323a223532323764383333396430303431373437316431316265343834363635336461223b733a33323a226431653334326437623831333430373835333332663835626636623436303863223b733a33323a223464373064306634633932396233383632613063376165393762313862373436223b733a33323a223338323538616136636564363435326530353330393061383264303132353433223b733a33323a223638306238333861303733623635363936636539373337623633303839646630223b733a33323a223236666139663639313838353833393837396334346662653962353130653430223b733a33323a223263386435646536366366353464343731613863633766353563616537376562223b733a33323a223939353031386232383137326135613831326363393962343032613463626235223b733a33323a226339623234623132653132303038643935326562383138393430353631376431223b733a33323a223235396536393438333038363565323231376338336331333364636563396135223b733a33323a223465333437323666396333383139316531616465323564383164313731343736223b7d733a343a2268617368223b733a36353a2234653334373236663963333831393165316164653235643831643137313437362d3235396536393438333038363565323231376338336331333364636563396135223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a223532346262626138323562616439323938656136306334363064316531336631223b733a33323a226333663963313130626430633433343963343330393939303335376635383135223b733a33323a223063386263376364623335323263626631373364633061373230323761386334223b733a33323a223564383330323439313331376433383832306435346661366162336562636132223b733a33323a223465313662316131623434383238653235653033636332373133663064313532223b733a33323a223630616264373534363136653036643632653562636263666338666436656533223b733a33323a223935383835623139646462623936393862633037656134626139653766393866223b733a33323a226137333430386265373032393266396266306434616532623834663830643030223b733a33323a223062653365386332643334366261376337303030653137653033636233643561223b733a33323a223334323731633862623031636135343334386435363361666433643433656165223b733a33323a223861633665646431356333623938366266356164306361643366353732323631223b733a33323a223134366333323663623030613937303661656366363564626265373564333030223b733a33323a223632373136653232383538656631333066393038636233626566313336373761223b733a33323a226430386638356235666530363237663835363239363563376638363534363862223b733a33323a223138306437386435326434623131636365633336653063376464373735393132223b733a33323a223136376131323938653030346635616434616139633366336466396266343339223b733a33323a223139653136393537643432326364613364636633386639366536336462383238223b733a33323a223132663234613437363030656535613538613266623631313239353234663131223b733a33323a226431333731663163666361363362656266613038363864636161653836383637223b733a33323a226631383931373535386335393839333134396532356132306264366437383339223b733a33323a226162636137363139396235313161346335643634613932643639306265353239223b733a33323a226336396530626632333033636636333263353665326538666465346466633164223b733a33323a223363613233346365653936363930336163383436303631633239323032333239223b733a33323a223939346563643261626630383036386439666661356131313538633632663438223b733a33323a223764366133363531623861613839303862616233383731656539613463333565223b733a33323a223831343538653731643861343064616261316665303461616431313663336539223b733a33323a223962323261666263343637616231646333616639653639323761353965306461223b733a33323a226631363264616538386361356431313937666230613632323333376561656234223b733a33323a223935356431326665636135373264613661343633393232666362633831616232223b733a33323a223233313063633865663731626535646366656230636564303635623133393465223b733a33323a223136383762333633333930653966376161303566336237663837666536396363223b733a33323a223735393038356333383831373238366539316132646561636631323763616233223b7d733a343a2268617368223b733a36353a2237353930383563333838313732383665393161326465616366313237636162332d3136383762333633333930653966376161303566336237663837666536396363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223163613562326562656136383064376237376163326532333964653938303530223b733a33323a223737383836363464303761333566663062643437373837373233396337373338223b7d733a343a2268617368223b733a36353a2237373838363634643037613335666630626434373738373732333963373733382d3163613562326562656136383064376237376163326532333964653938303530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1708614370),
('i2promilrbrd32dl041cgneq0u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383832393435342e3436343737323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22693270726f6d696c726272643332646c30343163676e65713075223b7d7d, 1708829454),
('i5ti1q94fdobhqh20i4f3tbmkr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313538353934332e3032363734323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22693574693171393466646f6268716832306934663374626d6b72223b7d7d, 1711585943),
('i5udgn6qdp26j7portvp4u5l4p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323633363834302e3036303538343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269357564676e3671647032366a37706f727476703475356c3470223b7d7d, 1712636840),
('ibtad16to3bshd6dm8821glbsl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323033353533302e3539383030383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269627461643136746f336273686436646d38383231676c62736c223b7d7d, 1712035530),
('ibtthajtu4v3so4d4moeja19hs', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313037353539362e3533343238313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226962747468616a7475347633736f3464346d6f656a6131396873223b7d7d, 1711075596),
('inqa3681talb48lttjfjmb76k4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313037353335352e3739343939343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696e71613336383174616c6234386c74746a666a6d6237366b34223b7d7d, 1711075355),
('ipgshngefvg14thafnmktggk5g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393130343836322e3437333433383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269706773686e67656676673134746861666e6d6b7467676b3567223b7d7d, 1709104862),
('ir72tk9iavfacn3ahdm5kjv4ub', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383737313031332e3835363634343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269723732746b396961766661636e336168646d356b6a76347562223b7d7d, 1708771013),
('j005fr7oos1mmumor46knu83uh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313934393133302e37313035343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a3030356672376f6f73316d6d756d6f7234366b6e7538337568223b7d7d, 1711949130),
('j3nli27vqb1k0p0p13o9d6rm9t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323535303434302e3031383237313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a336e6c693237767162316b3070307031336f396436726d3974223b7d7d, 1712550440),
('j5h8ip8ma0vl6jmkggmdr2pouo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303132373538342e3138313533383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a3568386970386d6130766c366a6d6b67676d647232706f756f223b7d7d, 1710127584),
('jc24dimctdcve8mggpv942k2c2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383130333631342e3735393831333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a63323464696d637464637665386d676770763934326b326332223b7d7d, 1708103614),
('jda5es7sig8sktgf522vunh04o', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373933363834342e3532333831363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a64613565733773696738736b74676635323276756e6830346f223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373934303434343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223133313633633338393464333839343135346537623536643462373839363365223b733a33323a223933363465303762386438636262366135323835653162623134306139366433223b7d733a343a2268617368223b733a36353a2239333634653037623864386362623661353238356531626231343061393664332d3133313633633338393464333839343135346537623536643462373839363365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1707936844),
('jhaae0cb0kt4eadmdl7lg46tsu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323735343730372e38373638333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a68616165306362306b74346561646d646c376c673436747375223b7d7d, 1712754707),
('jl9n701g6uk9pb0r62a9ulbj7d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323430363635302e3931383432383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a6c396e3730316736756b397062307236326139756c626a3764223b7d7d, 1712406650),
('jpoim07mck46iu5nbeu8qmdbpj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313434373036352e3437373839313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a706f696d30376d636b34366975356e62657538716d6462706a223b7d7d, 1711447065),
('jr4uam9ubuhkuiovop2e9ve03i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303035323734352e3430323739363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a723475616d39756275686b75696f766f703265397665303369223b7d7d, 1710052745),
('jr6tqk7inoa3t5qh6296r46ehl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383339363531342e3737383030393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a723674716b37696e6f6133743571683632393672343665686c223b7d7d, 1708396514),
('k2njpl3ovs7mehjnva5130fek9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303538353836392e3336383730393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b326e6a706c336f7673376d65686a6e76613531333066656b39223b7d7d, 1710585869),
('k5bhb8hi5hjiru3o21asjvjb9j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323239343733302e3739383230313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b3562686238686935686a697275336f323161736a766a62396a223b7d7d, 1712294730),
('k6ps3gjn29fpkts52s59s5edm0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373839303335362e3431353032383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b36707333676a6e323966706b74733532733539733565646d30223b7d7d, 1707890356),
('k9mp5fsruu3eak04lehoh1tida', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313533383133322e3035303438323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b396d703566737275753365616b30346c65686f683174696461223b7d7d, 1711538132),
('kbifdp0d5k8degg5fmlhso412v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313434383530382e3438343435343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b62696664703064356b386465676735666d6c68736f34313276223b7d7d, 1711448508),
('kjq0i7n4to43glpmg9if0vn49c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393536353836392e3237313935383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6a713069376e34746f3433676c706d6739696630766e343963223b7d7d, 1709565869),
('ko85tvi3og95spch7lcsnsinb5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383231363232332e3935333735373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6f3835747669336f67393573706368376c63736e73696e6235223b7d7d, 1708216223),
('ktab46of8cjp5ntt1lb5qgc7ps', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323633363834302e3131313832313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b74616234366f6638636a70356e7474316c6235716763377073223b7d7d, 1712636840),
('l0rlga8kuohasle6fvkb1ellm3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033373331322e3631323432313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c30726c6761386b756f6861736c653666766b6231656c6c6d33223b7d7d, 1710037312),
('l5p6d8ah188bl8u757brrku8k5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303132373731332e3632363234323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c35703664386168313838626c38753735376272726b75386b35223b7d7d, 1710127713),
('lcma8dfq26l0uoe8af17e0pugc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303930323535352e38323132313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c636d613864667132366c30756f653861663137653070756763223b7d7d, 1710902555),
('ld1aotlopf8qljtmasat5nu23h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393133323537342e3438313330393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6431616f746c6f706638716c6a746d61736174356e75323368223b7d7d, 1709132574),
('lf92uhpj3e4gv3cjseb4mdp2f8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303732393735352e3638343737323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6639327568706a336534677633636a736562346d6470326638223b7d7d, 1710729755),
('lfbp0ktirvnr3t6eged67rvk34', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393935353436302e3831333631343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c666270306b746972766e7233743665676564363772766b3334223b7d7d, 1709955460),
('lgo824tb0mvrjmlkq7urf827lv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303230383637302e3031353134393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c676f3832347462306d76726a6d6c6b71377572663832376c76223b7d7d, 1710208670),
('lkh11d2c6mdtoba4gbm5q8kgd0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303937343834392e3131353137393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6b683131643263366d64746f62613467626d3571386b676430223b7d7d, 1710974849),
('lmpo6g9fnecsg9fnqh2ttv4ka6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313439393534332e3235393031393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6d706f366739666e6563736739666e716832747476346b6136223b7d7d, 1711499543),
('lnsejdtmgdcpb4ap2l39917nee', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313239393432302e3330353839323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6e73656a64746d6764637062346170326c33393931376e6565223b7d7d, 1711299420),
('lo7m1kl33eso8kb042nmdktuln', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393433373036302e3631343832383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6f376d316b6c333365736f386b623034326e6d646b74756c6e223b7d7d, 1709437060),
('lod3kvb67e4mc8oqu0j0bniuv6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383338353930382e3535323730363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6f64336b7662363765346d63386f7175306a30626e69757636223b7d7d, 1708385908),
('lpna41brokec64i70q7enghp3i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393734343038312e3038333739373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c706e61343162726f6b656336346937307137656e6768703369223b7d7d, 1709744081);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('lt0l8lv2lfedavrpfo2h3s6npi', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383631373936372e3938363430323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356f716f61697039613973356971327173306364666568373366223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383631383431313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730383632313336343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383632313536363b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383631383533373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383632313036373b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383632303034313b7d7d72656469726563745f75726c7c733a33363a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226136663830636266316138323035323064626130353439383331303334366636223b733a33323a223761616161656662306162343230396631363237633163393230353838636363223b7d733a343a2268617368223b733a36353a2237616161616566623061623432303966313632376331633932303538386363632d6136663830636266316138323035323064626130353439383331303334366636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a223361636238613666636637666238343930356234666263623633356366633266223b733a33323a226538303563316266653163313065363235333365363365646432383862353234223b733a33323a223331393261396562626333346663366237353336333939663937353430323032223b733a33323a223032653262333331366162616336336334616535373661643366363335313661223b733a33323a223661666534323765393937336532396566323230613032666161366131663836223b733a33323a223163613130636631396633303132336437353130323138353962656239316435223b733a33323a223261643863373161303834313362363539623832616261633061633837363634223b733a33323a223464643365363137346138393738663764353731316430666335646465613664223b733a33323a223063646666303936333935376330653032613038656239653261636436373639223b733a33323a226631373366386537356662333031626464333363336665663031326436346437223b733a33323a226364663331363065353631613737323462393635363661666261613337666366223b733a33323a226361663931346339656337353664393264616333303739313766316531613738223b733a33323a223234623866376534366365373238353536656462613465636364303961643034223b733a33323a226462346534313463386331313662356565393439663235306462323234663731223b733a33323a226661366462323931633537386264376631653364653134626264373562643432223b733a33323a223733376134616565663336343830363731323933663439373532323332386139223b733a33323a226433666135313039316134663630356364383637336539363130616466636461223b733a33323a223434353538363935353334383539393161326564383463396663636132396161223b733a33323a223537363238613361343036393163626361643564393463653261356432323561223b733a33323a223462343233366639653139666432663463373066326664343938646535643861223b733a33323a223865393933313763643031376430636237386437633661613332663130653934223b733a33323a226139323534623865653935653835633664326533326330646332656535643165223b733a33323a223364633134633632373563306330623263376436653937666235643137623832223b733a33323a226435613333623066323666633233323230316664353131613030626362643365223b733a33323a223663373935636637316437336535663736666130633731613161383866303261223b733a33323a223233346639323539353139363030373531353232333932303731323435306161223b733a33323a223265663634396461343733343331323665356462336361623563393465303262223b733a33323a226333353566353965663265366462386363383437323439373235316336316164223b733a33323a223833363738663762343063303435386230343838326132666163616139303933223b733a33323a223866323333303738376662326665666234383966316266623935396465353766223b733a33323a226338613962616561613331636635653738656162626331613865636262623661223b733a33323a226130613038623230613439396538643034363133376635616136363635663533223b7d733a343a2268617368223b733a36353a2261306130386232306134393965386430343631333766356161363636356635332d6338613962616561613331636635653738656162626331613865636262623661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32363a7b733a33323a223336626534656630326236646336323265623762643732383063353438373161223b733a33323a226631313566393532626663303632646566396465326636343135653663343831223b733a33323a226335616438653661376162623332323133343534353135326533626439646136223b733a33323a226339363634346466326436306238393938383463363665643536623064663366223b733a33323a223238323935313032643833356130393931656661353232363966336664633566223b733a33323a223566373330326364643937646232363839393764313361623238323861613666223b733a33323a223663306465383133386532633061346233353539396338653963633162633035223b733a33323a223038393261623961636237366533343234396565363663323864303832326162223b733a33323a223463616366303364643161373661306166653037323933333463363030663666223b733a33323a226362663561383435373661326535326637373365363432316633393130663762223b733a33323a226432646537366333306664366430623530666237396533646663393664643134223b733a33323a223933396661373032646635663065396233643761303135386131383531353064223b733a33323a226161363761663362393166323534633563633937633533326637653734316665223b733a33323a223635623764346137303263313538653932316562303535343032626137666166223b733a33323a226561326236623039333662386638323931316138633836316438616537306262223b733a33323a223333623833306662386531666666666363623865363734323262636237333934223b733a33323a223164613539313961643561326334626334373936353262646634363233396430223b733a33323a223338363933616635326364653863333436356139313666353331306431623131223b733a33323a226566343233643264383531303539303535626439646464343038616536343938223b733a33323a226633626263316432393164333366343930616639376636383834666538303663223b733a33323a223931663639633336333531353435363166306164633637633138373634653435223b733a33323a226334373263643135343565386163373538643936383163323830313562383738223b733a33323a226230383235386536633639613433626237633034353566333535613332356239223b733a33323a223539343235383631616361623039313837356264396266613031656561303639223b733a33323a226435623932616666343563613435323030323165316361393666643936393737223b733a33323a223766646366353066323031313965386465366231353336393236396634373732223b733a33323a226535303766616439346439376638616666333331333861663566643937666433223b733a33323a223335643636646662313031326236653934333233633339313166373135373163223b733a33323a223831346633623536323332643439356134396339363931393833363562303334223b733a33323a226431313566303936613364623366326531656366353561333166653631306362223b733a33323a223038663466666234373664366432313763653265633662666261633564383866223b733a33323a226630303039303930646331313938303265616436343836346565373063356339223b733a33323a223865633331623831373231336434356433326331633334393961663466613064223b733a33323a223531336337393836373837346530363838666264633338636131313836373530223b733a33323a226332323932636564373936386533316133353839306533323638386238656264223b733a33323a223531353238313536356138623633343834373037386366633262633264366263223b733a33323a223266613666636332396136386161383262333931646632616634663736343939223b733a33323a223564316438346335653964656134663638313532623833613762333237613734223b733a33323a226231353139363730656631333266353439316233633535353133653833383939223b733a33323a223965346561303830616339333361383731356338616135633066643763613236223b733a33323a223939373164356430656133343061313237336163396461396436376338613863223b733a33323a226563393131383530353735666535313330316463316135333434656331666436223b733a33323a226662363165613831653762393434383736366638633466323362336637303861223b733a33323a223237626630643832313865333064623164316236353435623965303566356266223b733a33323a223038356132656562393634376635396535353061353266623666316436336133223b733a33323a226235653738313561623462613236393665323763653438633330393039343662223b733a33323a223435623535346562303865353066643463336131643330643866386566366166223b733a33323a223664326330316632626230303232656363613063616433383734636566393666223b733a33323a223963663336383430396563666634633438633362643162376134306531353664223b733a33323a223031306161333534326563333166376162366164613636653537353366326463223b733a33323a223763336330386335666466643035333463393538343334316231633231376431223b733a33323a226664396636633939363030616338353532323966313636323233373139306661223b7d733a343a2268617368223b733a36353a2266643966366339393630306163383535323239663136363232333731393066612d3763336330386335666466643035333463393538343334316231633231376431223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226366323761653238323635653639356136393438393931316265663362316466223b733a33323a226433656364393031353762626565643131353766626238316232343734333866223b733a33323a223062636134383561383232633961643366303233313366333562663338663139223b733a33323a223332313734633065336135363532346132626230343661656263383865663233223b7d733a343a2268617368223b733a36353a2233323137346330653361353635323461326262303436616562633838656632332d3062636134383561383232633961643366303233313366333562663338663139223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226531646261386662363938306236316566663038333061646161303036346236223b733a33323a226630336538363131643934663064363232333064363735383638363231343430223b733a33323a223465316637376332663536396362666130356464376439623935353762376434223b733a33323a226661363936643333346435396637346633333361366564653364326539613739223b733a33323a223532343739653632303734346532623662656265376263313837396663613762223b733a33323a226437373635633936323238393533396333626136666466663662636462313830223b733a33323a226430623632303561623961396639306365386239373835356366313666613233223b733a33323a223430383536303639316365303038306365356366376562356463363665313931223b733a33323a226630303465653939613235636538333461653637383631653161623334303736223b733a33323a226235313764653033393439383032343461366439373935616334646535396363223b733a33323a223066663462303565366366393233336436323432653161623265356264303463223b733a33323a223663363639366264326661306266626431653566316632663230393661613936223b733a33323a223566633864323635306338366237376366626636333961333736323130303139223b733a33323a223330646664393761393234323232356633616462643966306534663763633062223b733a33323a223030316537653464306434396238336265626161623165366431613330306638223b733a33323a223439373739623864393062653639363339313862376635343035623233323634223b7d733a343a2268617368223b733a36353a2234393737396238643930626536393633393138623766353430356232333236342d3030316537653464306434396238336265626161623165366431613330306638223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226138646561653766326634343138343430353235643435376635383039663233223b733a33323a223565656437363464663739336539333762366363623366366662373466333431223b7d733a343a2268617368223b733a36353a2235656564373634646637393365393337623663636233663666623734663334312d6138646561653766326634343138343430353235643435376635383039663233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1708617968),
('lu5bjjdk7oum2sej06mpl461is', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383437343139362e3938373037333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c7535626a6a646b376f756d3273656a30366d706c3436316973223b7d7d, 1708474197),
('mb2ot95hp5g7re1hdba5gtic7e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313538353934332e3135393037393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d62326f74393568703567377265316864626135677469633765223b7d7d, 1711585943),
('megsapaoja0ul2d3bqdd5acb90', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393734343038302e3931353534343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6567736170616f6a6130756c32643362716464356163623930223b7d7d, 1709744081),
('mgbej2n9su8557r41vmaq0fgft', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033353836392e3933393939393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6762656a326e39737538353537723431766d61713066676674223b7d7d, 1710035869),
('mjsv1urfamud0rhgqqi4ltg9gn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393539373037312e3533313839343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6a737631757266616d756430726867717169346c746739676e223b7d7d, 1709597071),
('mutogp7jvvkl2ghk9c2hbum53h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303532303837362e3030393830333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d75746f6770376a76766b6c3267686b3963326862756d353368223b7d7d, 1710520876),
('n0f0f7bsmke66u0g8v7681rup1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323535303434302e3134323137383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e306630663762736d6b65363675306738763736383172757031223b7d7d, 1712550440),
('n3ppe5bv0dr5opeq7dn48ged1h', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303131393937302e3334333838323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e33707065356276306472356f70657137646e34386765643168223b7d7d, 1710119970),
('n4c98sugo1d3sk34brdnln2bt4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033373331312e3134343936373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e346339387375676f316433736b33346272646e6c6e32627434223b7d7d, 1710037311),
('n7rr8f62rsggeif1vemmo66592', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383238353033352e3931303131333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e37727238663632727367676569663176656d6d6f3636353932223b7d7d, 1708285035),
('nb6g06ondsr9hkn71n0a1q52rd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393539373037312e3434333731333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e62366730366f6e64737239686b6e37316e3061317135327264223b7d7d, 1709597071),
('nedd3pb61egilo9cs05q5n1rgm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323232363337342e3136323531343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e65646433706236316567696c6f396373303571356e3172676d223b7d7d, 1712226374),
('ng7p31ka0306grjco3fep0840p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393334373835342e3330313637333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e67377033316b613033303667726a636f336665703038343070223b7d7d, 1709347854),
('ngo35o6lkakgi6ic8bc2qddshf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313836363337372e3130373031353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e676f33356f366c6b616b676936696338626332716464736866223b7d7d, 1711866377),
('nh17c8k8o4ahu68fq804skvrtb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383238393336392e3931353735333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e68313763386b386f3461687536386671383034736b76727462223b7d7d, 1708289369),
('no8jsr3sce2gds2rgn10c3lcu3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393836393036302e3931303737383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6f386a737233736365326764733272676e313063336c637533223b7d7d, 1709869060),
('nslflro2509kcforpkv0r81sht', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383633303234362e3532303831373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e736c666c726f323530396b63666f72706b7630723831736874223b7d7d, 1708630246),
('o456i3r15h67oknc676hjo6ud5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383333313434332e3232393838373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f34353669337231356836376f6b6e63363736686a6f36756435223b7d7d, 1708331443),
('o46ffllrb64g1lqqlr4lar4dql', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033383334362e3831333437383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f343666666c6c7262363467316c71716c72346c61723464716c223b7d7d, 1710038346),
('o6h467p6034hlbvvupl66f5s9q', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323132313933302e3831353734353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f36683436377036303334686c62767675706c36366635733971223b7d7d, 1712121930),
('o6qkmtequpdfa54d5q072mrqic', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383931353835342e3236343430353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f36716b6d746571757064666135346435713037326d72716963223b7d7d, 1708915854),
('oasdmvdqnok60jqetklpmocl1q', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373933383638362e3234333530353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223338766f736e6f3035326167746175617567667469686d343571223b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f6163746976617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373934323135383b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373934323138303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6163746976617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226339306336363565653566306163326562366231396632333661303036663766223b733a33323a223634383363623065373966643965393662353938356234353235326536333866223b7d733a343a2268617368223b733a36353a2236343833636230653739666439653936623539383562343532353265363338662d6339306336363565653566306163326562366231396632333661303036663766223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223531636165633332636361343066346538353836623961383561303462393834223b733a33323a226363346563643164303366653630396266653764383665643063613738616535223b7d733a343a2268617368223b733a36353a2263633465636431643033666536303962666537643836656430636137386165352d3531636165633332636361343066346538353836623961383561303462393834223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a333b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1707938686),
('obkovp98h0seercnpkkj4saj5t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303732393735352e3830333432333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f626b6f76703938683073656572636e706b6b6a3473616a3574223b7d7d, 1710729755),
('og9ktreiu7l68vl3fqhqtrg798', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323031343837382e3730333737373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f67396b7472656975376c3638766c3366716871747267373938223b7d7d, 1712014878),
('oh2b4d4adv7aut8vi2jsrm9h0b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313431333134332e3230323739363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f68326234643461647637617574387669326a73726d39683062223b7d7d, 1711413143),
('oqdl2ma9ema6i63k2snmp4po1o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383331303131342e3637343033363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f71646c326d6139656d61366936336b32736e6d7034706f316f223b7d7d, 1708310114),
('p8c75209iu7spkcnha8ohqt8if', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303131383434332e3939373730363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22703863373532303969753773706b636e6861386f687174386966223b7d7d, 1710118444),
('pdvdg2u101vg3ulg922nroenec', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323136323332332e3738353138333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270647664673275313031766733756c673932326e726f656e6563223b7d7d, 1712162323),
('pik0svd8vjh9m8nvv0qm4tt6m7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033383334372e3331363035323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270696b3073766438766a68396d386e767630716d347474366d37223b7d7d, 1710038347),
('pov3ge1pn0rug1n1e2645s4vf7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313234303334332e3237323631353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22706f7633676531706e30727567316e3165323634357334766637223b7d7d, 1711240343),
('pp4uq0ho9gi45ea0iec2529da2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383133313338342e3835383435323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22707034757130686f396769343565613069656332353239646132223b7d7d, 1708131384),
('q1qtgvgkbgfsfmlafridnb8nsu', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383533373233322e3634323830353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272363932613063306432396c6831623664656e6761323834346b223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383534303630353b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383534303731363b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383534303731333b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730383534303732303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730383534303734343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223232396233303839306134303864663964636439373836306364616339383766223b733a33323a223532393665356463653533613561383137343061666262373839373131666166223b7d733a343a2268617368223b733a36353a2235323936653564636535336135613831373430616662623738393731316661662d3232396233303839306134303864663964636439373836306364616339383766223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223433326134313935346662646233353666346233613835346462663230363833223b733a33323a223538373765633836326537393862383731303039393162386638633731396634223b733a33323a223833376163663463666436373032666264386531336132623961666134656139223b733a33323a226231303639353165356534376239306662373964313331646465643837333432223b733a33323a226361313337366461356535386333313136653562323862343461613264343032223b733a33323a223033393430326631626438663363653430623035626539356136346165366534223b733a33323a223663396237393437333936313961616366383837613134643339663066623135223b733a33323a223235646430623234373865313934343932336133623764396164383131663631223b733a33323a223836616332656639643564633162323639663232613633636363363536363437223b733a33323a223561346535343134666539623665373438323731333262383338343561636564223b733a33323a223236653466633232323165373336613631653033316233303338663932656462223b733a33323a223937386362306632663263333333633334373963316264303361646566326564223b7d733a343a2268617368223b733a36353a2239373863623066326632633333336333343739633162643033616465663265642d3236653466633232323165373336613631653033316233303338663932656462223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223235636333383534346534666665396665376435316631326534666563303438223b733a33323a226164393837343435313836663932643965326630613037376165376662626562223b733a33323a223538613731633963646137306231383539613062316138393935663564643665223b733a33323a223735323562666634346665613831373663303963666336383031323135613161223b733a33323a226665393363346362656661663764336138666134653965636563663061616236223b733a33323a223036373463613737656232353030303561653135366433666632323333306336223b733a33323a223530363736643339323032346439643061313337396565343861633862313732223b733a33323a226431353562663461633235626462646637643962393363353133343634303331223b7d733a343a2268617368223b733a36353a2264313535626634616332356264626466376439623933633531333436343033312d3530363736643339323032346439643061313337396565343861633862313732223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223337333539366663373838653038386435326136616365323661333739656161223b733a33323a226531306639343261353564376439316461623836343437373038306336663764223b7d733a343a2268617368223b733a36353a2265313066393432613535643764393164616238363434373730383063366637642d3337333539366663373838653038386435326136616365323661333739656161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223137623361343933396135633933316636613039373630343035356338353763223b733a33323a223263383637613030646461386361313363653630333736316266663038376663223b7d733a343a2268617368223b733a36353a2232633836376130306464613863613133636536303337363162666630383766632d3137623361343933396135633933316636613039373630343035356338353763223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1708537232),
('q2vifkkbhhaovlnm06muq156q1', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373933383639372e3433333838393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c3769616f65726c7232383465343238616d756b63666a743033223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373934323135313b7d733a35313a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373934303730353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730373934323237393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730373934323238373b7d7d72656469726563745f75726c7c733a33363a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a223962643663353531323963393961313137386234313730393963663763313962223b733a33323a223836643165386437323039303162386464363264376662363066383739626535223b733a33323a226263636462326132386636633365303562333261373436613632353635633035223b733a33323a226434643865323064393964323637623161346164336530663464373336346230223b733a33323a226239646162353864636133333332313931663230656337343136623938613935223b733a33323a223030623233343238393433323262666164626462386537393330663964626162223b733a33323a226262633866303365393132356666326431643437396634636564646134366633223b733a33323a223262303639313738613838336433373439616466376439633933613632393564223b733a33323a226333356464623835326361366263353536326166643030636566666365643739223b733a33323a226637656233333566306462383632383933663066633833626636346365623130223b733a33323a223535376337623765316536313531643937313138356435666261633066373263223b733a33323a226430383030393034653364653066323131666366323030393636396635383864223b733a33323a226661393966356236376665373832303962666439323264653536303533653662223b733a33323a223834623530303364316664663133666435323030346336323230623262643565223b733a33323a226338386432393937323137633831373837326137353337343066613635633932223b733a33323a223039373863373362313532386534653565363833653930393935343337623966223b733a33323a226432323434306237323631653133386562396462303262646430346230343763223b733a33323a223536393863313166323036643732343563386130383832643533663435653265223b733a33323a223062383935613637343034623637323835616661623535356164386366643632223b733a33323a223637616130663732616233303966633461323638663466366562313936313665223b733a33323a223461383237363163326264306337343032346638373631376531366261303833223b733a33323a223362616434656533663664323730613337346138386137613839653733346538223b7d733a343a2268617368223b733a36353a2233626164346565336636643237306133373461383861376138396537333465382d3461383237363163326264306337343032346638373631376531366261303833223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223662386530666236353333643038636633346465316331656636373061663135223b733a33323a223337636461333831666565393037643535616462383236646536353463643031223b7d733a343a2268617368223b733a36353a2233376364613338316665653930376435356164623832366465363534636430312d3662386530666236353333643038636633346465316331656636373061663135223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223765373264313735393562306334363166363939313466633232333134623739223b733a33323a223131613837353664666630656439653863653038343334323163313433343037223b733a33323a226530363932356136393466343837393534333463306332323665613031656537223b733a33323a223763316666323631366665653261353733653364396563356437613130656139223b7d733a343a2268617368223b733a36353a2237633166663236313666656532613537336533643965633564376131306561392d6530363932356136393466343837393534333463306332323665613031656537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226237313237636230386565383134343537316535366135333636353938356530223b733a33323a223136613930613636376163626161336131353839363234303561626435666465223b7d733a343a2268617368223b733a36353a2231366139306136363761636261613361313538393632343035616264356664652d6237313237636230386565383134343537316535366135333636353938356530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1707938697),
('q3kph7r1j65dp14fkijn0f1t51', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303436373836392e3939343439393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271336b70683772316a363564703134666b696a6e306631743531223b7d7d, 1710467870),
('q5pkt160l6t5ge99odej6ndf8t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323830393634302e3037353137323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227135706b743136306c367435676539396f64656a366e64663874223b7d7d, 1712809640),
('q6j39v4jipia7u90guobcrsv37', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373935353239332e3538313339313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271366a333976346a697069613775393067756f62637273763337223b7d7d, 1707955293),
('q7gkrsaccn258o8msdokthl17m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313434383533322e3234333339353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227137676b72736163636e3235386f386d73646f6b74686c31376d223b7d7d, 1711448532),
('qhfcasuu1rjdnkjse31hql68jn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383236373834342e3832393936373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716866636173757531726a646e6b6a7365333168716c36386a6e223b7d7d, 1708267844),
('qk47ij27mpivvp48jv81q2kr89', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393038383635342e3732333934323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716b3437696a32376d706976767034386a76383171326b723839223b7d7d, 1709088654),
('qkkcho9qrlj6vmq46q7uuntojl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313234303334332e3137393732313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716b6b63686f3971726c6a36766d713436713775756e746f6a6c223b7d7d, 1711240343),
('qnt2qjjpvono0p9jc9d64cl9kq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393532333436302e3537353034323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716e7432716a6a70766f6e6f3070396a6339643634636c396b71223b7d7d, 1709523460),
('qqfb43r72sre45qgrgqqfog8u2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383437333636332e3735303338383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227171666234337237327372653435716772677171666f67387532223b7d7d, 1708473663),
('qrg9b49vunmdilv91egqk7o6g6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303033383334362e3830313435363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227172673962343976756e6d64696c7639316567716b376f366736223b7d7d, 1710038346),
('qsc3aossrtt9akjhoqqhir3vho', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373934323438322e3931383234393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271736333616f737372747439616b6a686f71716869723376686f223b7d7d, 1707942482);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('qseqgsvjgh1fqo4ot9p2eh3dja', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383238353033362e3833363933353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22717365716773766a67683166716f346f74397032656833646a61223b7d7d, 1708285036),
('r2pn8isjoe08denlrg02mect2l', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383836313934322e3936373637333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227232706e3869736a6f65303864656e6c726730326d656374326c223b7d7d, 1708861943),
('r6u6rivr52ajjai9abbndklls1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303131383434362e3435363433313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272367536726976723532616a6a6169396162626e646b6c6c7331223b7d7d, 1710118446),
('rbaum7hlqmovkggclb0uddjdhe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323338313133302e3736373538323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726261756d37686c716d6f766b6767636c62307564646a646865223b7d7d, 1712381130),
('rc24l4n14kf5b7ncvip02erg9o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303532303930392e3530313434353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726332346c346e31346b663562376e637669703032657267396f223b7d7d, 1710520909),
('rfbol04a4hoqig6dq7uhbb5h03', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303338313437302e3131333638373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227266626f6c30346134686f716967366471377568626235683033223b7d7d, 1710381470),
('rg03ks3qept3v9mm4df86o0dls', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303634333335352e3737383130383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726730336b7333716570743376396d6d34646638366f30646c73223b7d7d, 1710643355),
('rg9g17tjp5bjcjkc4bbci7ui0n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393433373036302e3734303332343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726739673137746a7035626a636a6b633462626369377569306e223b7d7d, 1709437060),
('ri4cgcgslmvd1f2fj8vfa2vooo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323830393633392e3936363133393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272693463676367736c6d7664316632666a3876666132766f6f6f223b7d7d, 1712809640),
('rrl8e4gb0oag9akpcmdk703cl3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393738323636302e3638393638343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272726c3865346762306f616739616b70636d646b373033636c33223b7d7d, 1709782660),
('ruhn1ahl1jdf0csbpg30q866d1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373835363831392e37353339343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227275686e3161686c316a64663063736270673330713836366431223b7d7d, 1707856819),
('s4pijmihka9fchsdebogns5a4k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373839363035342e31353031383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22733470696a6d69686b6139666368736465626f676e733561346b223b7d7d, 1707896054),
('s783571sq6plempeegcj83high', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313836323733302e3738393139313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273373833353731737136706c656d70656567636a383368696768223b7d7d, 1711862730),
('sc13oj6nnn4flanjmbu0531975', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313136313735352e3633333038313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736331336f6a366e6e6e34666c616e6a6d627530353331393735223b7d7d, 1711161755),
('sft351drjik10ucgaadlnhg1t9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303535343237302e3137323832393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273667433353164726a696b31307563676161646c6e6867317439223b7d7d, 1710554270),
('siqmphod909s8morcp0nvnan0i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323839363034302e3039373730313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227369716d70686f6439303973386d6f726370306e766e616e3069223b7d7d, 1712896040),
('skmk3d38fak6roht83v1bnbovp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303132303038372e31323538383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736b6d6b3364333866616b36726f687438337631626e626f7670223b7d7d, 1710120087),
('sluaebruenvjuemuf4gtdvk53l', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313037353539342e3930353337383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736c756165627275656e766a75656d756634677464766b35336c223b7d7d, 1711075594),
('sn89ge8o1u5ip5j15lhvs1uld9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303930323535352e3639303838343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736e38396765386f3175356970356a31356c68767331756c6439223b7d7d, 1710902555),
('so5mac5867kv91dvej44pnpfu6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313735383734332e3432363835363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736f356d6163353836376b7639316476656a3434706e70667536223b7d7d, 1711758743),
('sreitoo5dbndvaicvbdjjqpi44', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313136313735352e3736303833383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273726569746f6f3564626e64766169637662646a6a7170693434223b7d7d, 1711161755),
('t28lohfbmli5pm1a14cmoq181a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303532313030322e30313534393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227432386c6f6866626d6c6935706d31613134636d6f7131383161223b7d7d, 1710521002),
('t4hlted1so5vntiielimes8dh7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383734323131342e3936373233383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227434686c74656431736f35766e746969656c696d657338646837223b7d7d, 1708742114),
('t860kkbe21h55sls2nsr19ulg9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323637373439382e3339383936323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22743836306b6b62653231683535736c73326e73723139756c6739223b7d7d, 1712677498),
('tbvgtk02knqtpub387110llis4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303634333335352e3634393437343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274627667746b30326b6e71747075623338373131306c6c697334223b7d7d, 1710643355),
('tfaagos8jvrr1qs6jvvu51k8un', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323839363034302e3034313535353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274666161676f73386a767272317173366a76767535316b38756e223b7d7d, 1712896040),
('tj543of21iak1cuql2e11aa6vm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323535303434302e3230343738373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746a3534336f66323169616b316375716c32653131616136766d223b7d7d, 1712550440),
('tja1u6ohfr922ftt94lqbnbrin', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383635353731342e38373137373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746a613175366f68667239323266747439346c71626e6272696e223b7d7d, 1708655714),
('tolrlm3ut7rl8th857h1o4jq7a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323338313133302e38333639313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746f6c726c6d33757437726c38746838353768316f346a713761223b7d7d, 1712381130),
('tvtp50biusp2b96pcninqpds0a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393639363236302e3735313636343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274767470353062697573703262393670636e696e717064733061223b7d7d, 1709696260),
('u1oeeliatutrtbqc01dlnd3k4s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303132323236392e3833343633363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275316f65656c696174757472746271633031646c6e64336b3473223b7d7d, 1710122269),
('u2kr4mu022c2jh1savne87cvq5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303230383637302e3138303434343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275326b72346d7530323263326a68317361766e65383763767135223b7d7d, 1710208670),
('u4k7np0uvkdiqa117hskt8lola', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393030323235342e3338303235353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275346b376e703075766b6469716131313768736b74386c6f6c61223b7d7d, 1709002254),
('u66fmrmi8rujh6l5ce60dur8gj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393337323736312e3933353432373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22753636666d726d693872756a68366c356365363064757238676a223b7d7d, 1709372762),
('u7ssp20vicr0j6febgc53u5564', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393135353731332e3531363030353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227537737370323076696372306a36666562676335337535353634223b7d7d, 1709155713),
('u86usqj61igjhjmlc9pfbgotb7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313934393133302e3833353136333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227538367573716a363169676a686a6d6c6339706662676f746237223b7d7d, 1711949130),
('udecet4lt2v8b3ushbqkha4isr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313533383133322e3134323736363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756465636574346c74327638623375736862716b686134697372223b7d7d, 1711538132),
('uf7m69erheceenr93nf1466990', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303937343834392e3335373438333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227566376d3639657268656365656e7239336e6631343636393930223b7d7d, 1710974849),
('up5nmfbklmrnpgksskcs72ki5g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383734323131342e3833373833353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227570356e6d66626b6c6d726e70676b73736b637337326b693567223b7d7d, 1708742114),
('v08qr7gr1j98t4sthpgfagbd5f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383832393435342e3431353632393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227630387172376772316a39387434737468706766616762643566223b7d7d, 1708829454),
('v2r7fmhhp6km2rgn8lkgpq2v0s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730383438323931342e3731343436353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276327237666d686870366b6d3272676e386c6b67707132763073223b7d7d, 1708482914),
('v31njtmf0pf91msbh7to6fcjqb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313533383133312e3933303530353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227633316e6a746d6630706639316d73626837746f3666636a7162223b7d7d, 1711538131),
('v3o60q1md0mbqtrn05cpg7jmng', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303230383637302e3332323138393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276336f363071316d64306d627174726e3035637067376a6d6e67223b7d7d, 1710208670),
('v5gkrifp146rq09c7htslf1049', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393038383635342e393138353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227635676b726966703134367271303963376874736c6631303439223b7d7d, 1709088654),
('v68t9v2j07al7hjkokj4r56flv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731313332363734332e3239323534313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22763638743976326a3037616c37686a6b6f6b6a34723536666c76223b7d7d, 1711326743),
('ve3tnbiteo5o237okmva3hpjce', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303532303838312e3136323232383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766533746e626974656f356f3233376f6b6d76613368706a6365223b7d7d, 1710520881),
('vf9nnf942m6s6loua05ft717q6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323230383333302e3738363138323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227666396e6e663934326d3673366c6f7561303566743731377136223b7d7d, 1712208330),
('vk3rduq5h9n5rb3lpnqgmisll6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730393430333437392e3436323335363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766b33726475713568396e357262336c706e71676d69736c6c36223b7d7d, 1709403479),
('vlnkicicq7v5nvbqkr385cqs21', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323033353533302e37363138343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766c6e6b69636963713776356e7662716b723338356371733231223b7d7d, 1712035530),
('vpeg1922mcl57ps0054l47m8jf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731303131383534342e3030343339383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276706567313932326d636c35377073303035346c34376d386a66223b7d7d, 1710118544),
('vr9j0pm80bi6jdkdlj6bpku36p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730373836393037382e3539343734383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227672396a30706d38306269366a646b646c6a3662706b75333670223b7d7d, 1707869078),
('vuk7dehb242b3gpvk45fofh9i8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323530333536332e3237363538353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276756b376465686232343262336770766b3435666f6668396938223b7d7d, 1712503563),
('vv9jvuts0224tu15dqr6vs0cpu', 0x5f5f4c616d696e61737c613a31303a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313731323834393639342e3534333738333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227276316a3431716268323567306937316c386864747174627139223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835313438393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333239343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333134343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333234363b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333038393b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333038323b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835323639383b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313731323835333234323b7d7d72656469726563745f75726c7c733a34313a2268747470733a2f2f6b616c6f65666564652e62696e61746f6d792e636f6d2f61646d696e2f6974656d223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223830613662316563313763336465333163626663363861613561396137346434223b733a33323a223732373430363561366364373232316336616363653961346263316566386363223b7d733a343a2268617368223b733a36353a2237323734303635613663643732323163366163636539613462633165663863632d3830613662316563313763336465333163626663363861613561396137346434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33313a7b733a33323a223862323437396132343035383631663434623532396330646132383661323634223b733a33323a223061343962346362633435646264373439333335663938666530616135316666223b733a33323a226565353263353430636539366332383864393865396265623565303533633537223b733a33323a223962623132656533633330373663356335616661643933666130666462376431223b733a33323a223964393935343032653565386362363266643637663665666465636237336533223b733a33323a223133613463353564396630613265636535353734323535646636373966633437223b733a33323a223030373338623830316630653230363363346464663837616138303331373631223b733a33323a223662363039373737303062613436626230616361666161626332656332396461223b733a33323a223931653938366139366338333861636335366164613435383266323165323866223b733a33323a226662386339356136616562643630393337616334613865666534383663643132223b733a33323a226132306330653663333235656230313430626662376366353364323030646263223b733a33323a223337616236646138373938393566343733303435393933333235633735643964223b733a33323a223865316135616336366363336265636165666432383734303962323464313462223b733a33323a226230366534616638623863646232383535346233353866383733626430663235223b733a33323a223133366437643034623965393531626635623264306537363632316530303130223b733a33323a226165633934316236336366313432333233323038353361396337663136366464223b733a33323a223430336462373032386530366564393162336530376564343332653932623137223b733a33323a223333343235666530623262663832373131663238613132373532333331636435223b733a33323a226632366663316133646532646462323237313638616638653865316666623530223b733a33323a223937613039353563323366343437343134663661323765383163346364393630223b733a33323a223565373461643465393438373437653339356332303365633262363263636431223b733a33323a226232643432336331656336396437376333353832323039396637363232636532223b733a33323a223331323461383836373432366162326535643561653461366232643837366235223b733a33323a223439306166633932646335383131376563363463346335616230623866373031223b733a33323a223465316630636661636334323930663935373066303165623361616638383136223b733a33323a223737336138343836313061396164646362656664323132356335363336373261223b733a33323a223339313032363464303838303761313532393330353761303538653039336461223b733a33323a226237396539396662386364643538383238346538343234646333653639613336223b733a33323a226463393237663632386531313631373063343561343837313638386437656362223b733a33323a226132326133383662303333653439306337393338386631613563636230336436223b733a33323a223966653536613031653163393135363866353231363339306236306634623439223b733a33323a223235656361303437353033343439383564656630353162636437373831343534223b733a33323a226563623038313533633134653063393566313637363532656636646166316361223b733a33323a223065383862643437623762653935396531643339636163353465316461663762223b733a33323a226662306536633661663032633633346231306665386566313162666137303566223b733a33323a223330663532396333353132343634656337336635353739643066333731306465223b733a33323a223535666565653666343934323133646466303266386262373062666636303465223b733a33323a223835363763663536666565303161633161353131303735653434383438363236223b733a33323a226436643136323263313437666361346565656565623066383961653532653534223b733a33323a223738316433626265616638653638326662616265613837313963326331333236223b733a33323a226332623066316666636638323239633833356230656166396638306636393831223b733a33323a226336333636666366316431636332333032666265643937373138613338646565223b733a33323a223731313862636130613665643639346365616438366163353737356466373932223b733a33323a226330343361633163333661383166643933396235393465393938363562306536223b733a33323a223032323239363134393735323365366631356362663931386330663764656636223b733a33323a226236373965323733663537313165353636356137663035646238353933376339223b733a33323a226632383664653435386662636564303939373833343961356230616235386437223b733a33323a226233646335303763313234383133333238613931316566616231343164646261223b733a33323a223333333365343765663033313434346432333434613764316133393835353130223b733a33323a223464313263633165393365386163613662383636623933656233393063666339223b733a33323a226465663132306633653661386231353431353039326166356361616164356231223b733a33323a223162613339666636626330626366386163313238393133383236396563353332223b733a33323a223531653136666132373738346265366131306663663435303864363332376439223b733a33323a226234626662646630393433643430373236306164613738313465313064623435223b733a33323a226662656230373661623863653234653861313438366638656231643464323064223b733a33323a223638323461636561613330336234343830633134653232376163313261663766223b733a33323a226339633830376139643963336662333864653366316634396337613266363364223b733a33323a226662636439363062346262653834333235346239613066613132326465376135223b733a33323a223834373333623936353364376638323938646439653830623037383031363739223b733a33323a223633336533643864643336343162313134323765393562333735613531616237223b733a33323a223062643930653833396331316161646264393061363134626238653832366233223b733a33323a226538656634646233653964346435366365313634396162373962313536393663223b7d733a343a2268617368223b733a36353a2265386566346462336539643464353663653136343961623739623135363936632d3062643930653833396331316161646264393061363134626238653832366233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a226131623633633838306465623736616337653838656565363830343437363334223b733a33323a226234313665373439396634346462386264306663646165356432386333613162223b733a33323a223730643132623761346561613036356633343562363464393035353963336531223b733a33323a223636643934326536646335303263343332373535343738656439346232393930223b733a33323a226666306636366263316461373162623965323937613561383231313164373161223b733a33323a223638346336663462613465396532336130653238373436343433613836376162223b733a33323a226333366165316634646533663433653631343762323738383864633830373032223b733a33323a223966303431636539323134333930333934363830363035663135653464353538223b733a33323a223631346539613933373130623335356362376463376336343330356361653639223b733a33323a223337386639646533646363303032353833386533366366393632343638656366223b733a33323a223835336163663863386238303833663939663537636235616161383264623864223b733a33323a223536663933653738366333336663336433373430376137326562323638656532223b733a33323a226638613536653739323764396537393434333432393762336362303963643739223b733a33323a223535313166326137663934373237653364323937656163393061643436666137223b733a33323a223134643666346531396462653338326436623738373630366535616666626665223b733a33323a223366323535323437373739396235656563643738616138653232666137316532223b733a33323a223535386362643762326638353038663961613361653239323739333262316139223b733a33323a223266316561613036623030396166383531336134356639343130343361373031223b733a33323a226338363831306337313733363161376337396431633764333231303661396362223b733a33323a226663653532616235646464666435646234383137356233666337313835303561223b733a33323a226563646265313836366332303738613030383665626238373963393862313737223b733a33323a223533666537656464353836363432353363633736613935373661653161316438223b733a33323a223863306536396339393439303433643661613666633637313261663137303038223b733a33323a223161343662333030623164323439393135323434346139663761363462343233223b733a33323a223264383966613234306664343665386230346566626238343535356430653265223b733a33323a223534316366316134346162353065366537656461623035386366373832303830223b733a33323a226664343339373839653238363733613666373061623234303366343961356231223b733a33323a223561363264626132383866626561306434333462383538376437363334353135223b733a33323a226236366536383434376230383365333665313836633535663033663537313035223b733a33323a223661336234643537303530373037396137333563613831383834396130346233223b733a33323a223261366131356433373532316236363031643832656634623733633537333739223b733a33323a223630363633656661343234366466376165336164323761653535666233653833223b733a33323a223135303066306462623633346439303665313335643831316364636431326163223b733a33323a223161363133663762333465666538306237663332343266656461346233653030223b7d733a343a2268617368223b733a36353a2231613631336637623334656665383062376633323432666564613462336530302d3135303066306462623633346439303665313335643831316364636431326163223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223965346161616338653039313863376237653265373161613237663336636562223b733a33323a226565333365343139353932616262633064333636636531623838386162633264223b733a33323a226263666666386135363362356463646435373566373939646138316364306463223b733a33323a223862386336343936633166646665313032313539303437643037613636363462223b7d733a343a2268617368223b733a36353a2238623863363439366331666466653130323135393034376430376136363634622d6263666666386135363362356463646435373566373939646138316364306463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a223534306635363734646364323664636330623962316133373331336564343166223b733a33323a223137313063653833316539666535336565326663646537303939343064626462223b733a33323a223738326238643339313866616136303337633961643461643634613962383732223b733a33323a226464316131653035656331333263326135653063383034666634386439336630223b733a33323a226566333533353164623632376231383566613035343233356333353332316631223b733a33323a223661396364363132306637356637393834653861363535303663646138613235223b733a33323a223730396631626162646535333935613630663964326333366334363465326363223b733a33323a226539663561616435666231633265333336653765393465333364646366323963223b733a33323a223035393064323532643134363038643032336130333135366565313537313733223b733a33323a226138383534343933386635633930656562656436336263653131306536383833223b733a33323a226639653430323365393935356663393237663866613538316366303539366438223b733a33323a223366663631343164333131386435613031616333303538356137396366666364223b733a33323a223333366261623532656566363431653366356637383834653533626663393462223b733a33323a223239613163373165323630316438363562333335393632336432313933646636223b733a33323a226365363530663435373363306432323462663534303039653563656137616539223b733a33323a223566616466653533303161386234343964386331393839616637393835356232223b733a33323a226332663532633638383264323162336234346563616562323362313239656139223b733a33323a226434336535326265643965393266623866666336386234653735356432356638223b733a33323a223663383765623434356434653635366634376365323531353934393633363832223b733a33323a223530623435353664376330343336353735313862663834646466626666626635223b733a33323a226639366261343039343061386634653835366232613530663362636663393464223b733a33323a223061616431343739326638306561653361363939656336306632663837613737223b733a33323a223839373334353534383161633732633130303764653164346561643431326664223b733a33323a226562353438323435376238313063656536343130343966333132353565393963223b733a33323a226564363539393465616565306233396339643038353137633162383839636165223b733a33323a226132653436346166333764613361353437353931653331323065313730306163223b733a33323a226565353035316339653836663061393661623836343661643062396261313333223b733a33323a226330623437633361613761643432303664303932643039656130303637363831223b733a33323a223464343963373139663139626639646561613464373334623335643236633739223b733a33323a226232393933343434356237366263643861336538363963653231646337343530223b733a33323a223731653634616164633263633835303233666535663666613932623433386161223b733a33323a226234636434323138653330633439626262373839303661323537663361393132223b733a33323a223561396366316265363239636231373235633535663634623963616162346465223b733a33323a226231646264633131306237386436623137646637383134643365396631333963223b7d733a343a2268617368223b733a36353a2262316462646331313062373864366231376466373831346433653966313339632d3561396366316265363239636231373235633535663634623963616162346465223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223537363932306139646636643464643535653362363763383536393436373666223b733a33323a223234653135376135376539633964366632363061626634643835303762643833223b733a33323a223734626161623964303331316635353366656265353864386130323237353166223b733a33323a226363323962356334356366666436626163376339333634313263343532666166223b733a33323a223839373238316436663064353737363139336437643863353033326439656239223b733a33323a223335646530623363663131353061653038346633646432393562643063313332223b7d733a343a2268617368223b733a36353a2233356465306233636631313530616530383466336464323935626430633133322d3839373238316436663064353737363139336437643863353033326439656239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223237353639366636303239333864633033626335383235366536656433393461223b733a33323a223933316537623436353031356665313730636665616631353563623031633064223b7d733a343a2268617368223b733a36353a2239333165376234363530313566653137306366656166313535636230316330642d3237353639366636303239333864633033626335383235366536656433393461223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223738623239303863336565666261313761313735363734356533396666613963223b733a33323a226233306561653938376431363134653737663035363365633536646363646333223b7d733a343a2268617368223b733a36353a2262333065616539383764313631346537376630353633656335366463636463332d3738623239303863336565666261313761313735363734356533396666613963223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1712849694);

-- --------------------------------------------------------

--
-- Struttura della tabella `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"federicoboggia96@gmail.com\"'),
('default_site', '\"1\"'),
('default_to_private', '\"0\"'),
('disable_file_validation', '\"0\"'),
('disable_jsonld_embed', '\"0\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"heic\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Progetto Storia Pubblica Digitale\"'),
('locale', '\"it\"'),
('media_alt_text_property', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"image\\/heic\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '\"25\"'),
('property_label_information', '\"none\"'),
('recaptcha_secret_key', '\"\"'),
('recaptcha_site_key', '\"\"'),
('time_zone', '\"UTC\"'),
('use_htmlpurifier', '\"1\"'),
('value_languages', '[]'),
('version', '\"4.0.4\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Struttura della tabella `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site`
--

INSERT INTO `site` (`id`, `thumbnail_id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(1, NULL, 1, 1, 'index', 'default', 'Cancel Culture — Costanzo Ciano', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Home\",\"query\":\"\"},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":3,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":4,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":5,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":6,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":7,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":8,\"is_public\":true},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":9,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":10,\"is_public\":true},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":11,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":12,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":14,\"is_public\":true},\"links\":[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":13,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":15,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":16,\"is_public\":true},\"links\":[]}]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":17,\"is_public\":true},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":18,\"is_public\":true},\"links\":[]}]', '[]', '2024-02-13 20:25:22', '2024-04-11 15:24:43', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
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
(11, 1, 'fonti-primarie', 'Fonti primarie', 1, '2024-02-22 15:00:40', '2024-02-22 15:00:40'),
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
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
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
(22, 18, 'pageTitle', '[]', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(1, 1, 1, 'admin'),
(3, 1, 2, 'admin'),
(4, 1, 4, 'admin'),
(5, 1, 3, 'admin');

-- --------------------------------------------------------

--
-- Struttura della tabella `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
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
('vocabulary_scope', 1, '\"\"');

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'federicoboggia96@gmail.com', 'TheRealF', '2024-02-13 20:22:23', '2024-02-13 20:22:23', '$2y$10$eHONFxV8vibiVUKC790CeuXfD6BuRx4uKm.EyS0cOEIPaC8IDZOlm', 'global_admin', 1),
(2, 'kalo@binatomy.com', 'Kalo', '2024-02-13 20:23:06', '2024-02-14 19:23:36', '$2y$10$FSgj.Qf5leXqSdKyf8WwPusiZAnr00FpOglrFWAT0Bxok26.yzN7u', 'global_admin', 1),
(3, 'michelespa997@gmail.com', 'Michele Espa', '2024-02-14 18:58:05', '2024-02-14 19:23:00', '$2y$10$FReiv4XrTvG7PGpNYZeOneCEis7/g0Zl5f69NNS5dwOwfkhYXrkfe', 'global_admin', 1),
(4, 'g.graniero@studenti.unipi.it', 'Joe', '2024-04-09 15:43:38', '2024-04-09 15:44:00', '$2y$10$qUuZHDjcUgpMogqkdZ0C8uA4OAxG7u6iwUFUZOUKAdVSg89eXDv3K', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 4, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 4, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 4, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 4, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 4, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 4, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 4, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 4, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('default_resource_template', 2, '\"\"'),
('default_resource_template', 4, '\"\"'),
('locale', 2, '\"it\"'),
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
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(5, 2, 1, NULL, NULL, 'literal', '', 'C\'è una statua «nascosta» in Arsenale', NULL, 1),
(6, 2, 4, NULL, NULL, 'literal', '', 'Collocata nel giardino del museo navale ritrae Costanzo Ciano, opera dello scultore Francesco Messina', NULL, 1),
(7, 2, 7, NULL, NULL, 'literal', '', '27 giugno 1991', NULL, 1),
(8, 2, 5, NULL, NULL, 'literal', '', 'La Nazione', NULL, 1),
(9, 2, 58, NULL, NULL, 'literal', '', 'Adriana Boverini', NULL, 1);

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
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
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
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
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
  ADD KEY `item_position` (`item_id`,`position`);

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
  ADD KEY `uri` (`uri`(190));

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
