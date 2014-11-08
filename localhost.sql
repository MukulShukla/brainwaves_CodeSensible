-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 08, 2014 at 11:19 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bank`
--
CREATE DATABASE IF NOT EXISTS `bank` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bank`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `custlogin`
--

CREATE TABLE IF NOT EXISTS `custlogin` (
  `CustId` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`CustId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custlogin`
--

INSERT INTO `custlogin` (`CustId`, `Username`, `Password`) VALUES
(1, 'cust1', 'pass1'),
(2, 'cust2', 'pass2'),
(3, 'cust3', 'pass3'),
(4, 'cust4', 'pass4');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `CustId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `Balance` int(10) NOT NULL,
  PRIMARY KEY (`CustId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustId`, `Name`, `Balance`) VALUES
(1, 'Customer1', 12000),
(2, 'Customer2', 24342),
(3, 'Customer3', 15000),
(4, 'Customer4', 12056);

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE IF NOT EXISTS `dept` (
  `DeptId` int(11) NOT NULL AUTO_INCREMENT,
  `DeptName` varchar(20) NOT NULL,
  PRIMARY KEY (`DeptId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`DeptId`, `DeptName`) VALUES
(31, 'loan'),
(32, 'cash'),
(33, 'customer_service'),
(34, 'account');

-- --------------------------------------------------------

--
-- Table structure for table `emplogin`
--

CREATE TABLE IF NOT EXISTS `emplogin` (
  `EmpId` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `loggedIn` tinyint(1) NOT NULL,
  PRIMARY KEY (`EmpId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emplogin`
--

INSERT INTO `emplogin` (`EmpId`, `Username`, `Password`, `loggedIn`) VALUES
(11, 'emp11', 'pass11', 1),
(12, 'emp12', 'pass12', 0),
(13, 'emp13', 'pass13', 0),
(14, 'emp14', 'pass14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `EmpId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `DeptId` int(10) NOT NULL,
  PRIMARY KEY (`EmpId`),
  KEY `DeptId` (`DeptId`),
  KEY `DeptId_2` (`DeptId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpId`, `Name`, `DeptId`) VALUES
(11, 'Employee1', 0),
(12, 'Employee2', 0),
(13, 'Employee3', 0),
(14, 'Employee4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `JobId` int(11) NOT NULL AUTO_INCREMENT,
  `CustId` int(11) NOT NULL,
  `AssignedEmpId` int(11) NOT NULL,
  `InTime` varchar(20) NOT NULL,
  `OutTime` varchar(20) NOT NULL,
  `Pan` varchar(10) NOT NULL,
  `DeptId` int(10) NOT NULL,
  PRIMARY KEY (`JobId`),
  KEY `DeptId` (`DeptId`),
  KEY `DeptId_2` (`DeptId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`JobId`, `CustId`, `AssignedEmpId`, `InTime`, `OutTime`, `Pan`, `DeptId`) VALUES
(1, 1, 11, '00:00:00', '00:00:00', '', 0),
(2, 1, 11, '00:00:00', '00:00:00', '', 0),
(3, 1, 11, '00:00:00', '00:00:00', '', 0),
(4, 1, 11, '00:00:00', '00:00:00', '', 0),
(5, 1, 11, '00:00:00', '00:00:00', '', 0),
(6, 1, 11, '00:00:00', '00:00:00', '', 0),
(7, 1, 11, '00:00:00', '00:00:00', '', 32),
(8, 1, 11, '10am', '10am', '', 32);

-- --------------------------------------------------------

--
-- Table structure for table `pligg_additional_categories`
--

CREATE TABLE IF NOT EXISTS `pligg_additional_categories` (
  `ac_link_id` int(11) NOT NULL,
  `ac_cat_id` int(11) NOT NULL,
  UNIQUE KEY `ac_link_id` (`ac_link_id`,`ac_cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_categories`
--

CREATE TABLE IF NOT EXISTS `pligg_categories` (
  `category__auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_lang` varchar(2) NOT NULL DEFAULT 'en',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `category_parent` int(11) NOT NULL DEFAULT '0',
  `category_name` varchar(64) NOT NULL DEFAULT '',
  `category_safe_name` varchar(64) NOT NULL DEFAULT '',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `category_enabled` int(11) NOT NULL DEFAULT '1',
  `category_order` int(11) NOT NULL DEFAULT '0',
  `category_desc` varchar(255) NOT NULL,
  `category_keywords` varchar(255) NOT NULL,
  `category_author_level` enum('normal','moderator','admin') NOT NULL DEFAULT 'normal',
  `category_author_group` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `category_votes` varchar(4) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `category_karma` varchar(4) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`category__auto_id`),
  KEY `category_id` (`category_id`),
  KEY `category_parent` (`category_parent`),
  KEY `category_safe_name` (`category_safe_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pligg_categories`
--

INSERT INTO `pligg_categories` (`category__auto_id`, `category_lang`, `category_id`, `category_parent`, `category_name`, `category_safe_name`, `rgt`, `lft`, `category_enabled`, `category_order`, `category_desc`, `category_keywords`, `category_author_level`, `category_author_group`, `category_votes`, `category_karma`) VALUES
(0, 'en', 0, 0, 'all', 'all', 3, 0, 2, 0, '', '', 'normal', '', '', ''),
(1, 'en', 1, 0, 'News', 'News', 2, 1, 1, 0, '', '', 'normal', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pligg_comments`
--

CREATE TABLE IF NOT EXISTS `pligg_comments` (
  `comment_id` int(20) NOT NULL AUTO_INCREMENT,
  `comment_randkey` int(11) NOT NULL DEFAULT '0',
  `comment_parent` int(20) DEFAULT '0',
  `comment_link_id` int(20) NOT NULL DEFAULT '0',
  `comment_user_id` int(20) NOT NULL DEFAULT '0',
  `comment_date` datetime NOT NULL,
  `comment_karma` smallint(6) NOT NULL DEFAULT '0',
  `comment_content` text,
  `comment_votes` int(20) NOT NULL DEFAULT '0',
  `comment_status` enum('discard','moderated','published','spam') NOT NULL DEFAULT 'published',
  PRIMARY KEY (`comment_id`),
  UNIQUE KEY `comments_randkey` (`comment_randkey`,`comment_link_id`,`comment_user_id`,`comment_parent`),
  KEY `comment_link_id` (`comment_link_id`,`comment_parent`,`comment_date`),
  KEY `comment_link_id_2` (`comment_link_id`,`comment_date`),
  KEY `comment_date` (`comment_date`),
  KEY `comment_parent` (`comment_parent`,`comment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_config`
--

CREATE TABLE IF NOT EXISTS `pligg_config` (
  `var_id` int(11) NOT NULL AUTO_INCREMENT,
  `var_page` varchar(50) NOT NULL,
  `var_name` varchar(100) NOT NULL,
  `var_value` varchar(255) NOT NULL,
  `var_defaultvalue` varchar(50) NOT NULL,
  `var_optiontext` varchar(200) NOT NULL,
  `var_title` varchar(200) NOT NULL,
  `var_desc` text NOT NULL,
  `var_method` varchar(10) NOT NULL,
  `var_enclosein` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`var_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `pligg_config`
--

INSERT INTO `pligg_config` (`var_id`, `var_page`, `var_name`, `var_value`, `var_defaultvalue`, `var_optiontext`, `var_title`, `var_desc`, `var_method`, `var_enclosein`) VALUES
(1, 'SEO', '$URLMethod', '1', '1', '1 or 2', 'URL Method', '<strong>1</strong> = Non-SEO Links.<br /> Example: /story.php?title=Example-Title<br /><strong>2</strong> SEO Method. <br />Example: /Category-Title/Story-title/.<br /><strong>Note:</strong> You must rename htaccess.default to .htaccess', 'normal', NULL),
(2, 'SEO', 'enable_friendly_urls', 'true', 'true', 'true / false', 'Friendly URL''s for stories', 'Use the story title in the url by setting this value to true. Example: /story/(story title)/<br />Keep this setting as TRUE if using URL Method 1', 'define', NULL),
(3, 'Voting', 'votes_to_publish', '5', '5', 'number', 'Votes to publish', 'Number of votes before story is sent to the front page.', 'define', NULL),
(4, 'Voting', 'days_to_publish', '10', '10', 'number', 'Days to publish', 'After this many days posts will not be eligible to move from new to published pages', 'define', NULL),
(5, 'Misc', '$trackbackURL', 'pligg.com', 'pligg.com', 'pligg.com', 'Trackback URL', 'The url to be used in <a href="http://en.wikipedia.org/wiki/Trackback">trackbacks</a>.', 'normal', '"'),
(6, 'Location Installed', '$my_base_url', 'http://localhost', 'http://localhost', 'http://(your site name)(no trailing /)', 'Base URL', '<strong>Examples</strong>\r\n<br />\r\nhttp://demo.pligg.com<br />\r\nhttp://localhost<br />\r\nhttp://www.pligg.com', 'normal', ''''),
(7, 'Location Installed', '$my_pligg_base', '/pligg', '', '/(folder name)', 'Pligg Base Folder', '<strong>Examples</strong>\r\n<br />\r\n/pligg -- if installed in the /pligg subfolder<br />\r\nLeave blank if installed in the site root folder.', 'normal', ''''),
(8, 'Tags', 'Enable_Tags', 'true', 'true', 'true / false', 'Enable Tags', 'Enable the use of tags and the tag cloud.', 'define', NULL),
(9, 'Tags', '$tags_min_pts', '8', '8', 'number (should be at least 8)', 'Tag Minimum Font Size', '<strong>Only used if Tags are enabled.</strong> How small should the text for the smallest tags be.', 'normal', NULL),
(10, 'Tags', '$tags_max_pts', '36', '36', 'number', 'Tags Maximum Font Size', '<strong>Only used if Tags are enabled.</strong> How large should the text for the largest tags be.', 'normal', NULL),
(11, 'Tags', '$tags_words_limit', '100', '100', 'number', 'Tag Cloud Word Limit', '<strong>Only used if Tags are enabled.</strong> The most tags to show in the cloud.', 'normal', NULL),
(12, 'AntiSpam', 'CHECK_SPAM', 'false', 'false', 'true / false', 'Enable Spam Checking', 'Checks submitted domains to see if they''re on a blacklist.', 'define', NULL),
(13, 'AntiSpam', '$MAIN_SPAM_RULESET', 'logs/antispam.log', 'logs/antispam.log', 'Text File', 'Main Spam Ruleset', 'What file should be used to check for spam domains?', 'normal', '"'),
(14, 'AntiSpam', '$USER_SPAM_RULESET', 'logs/domain-blacklist.log', 'logs/domain-blacklist.log', 'Text File', 'Local Spam Ruleset', 'What file should Pligg write to if you mark items as spam?', 'normal', '"'),
(15, 'AntiSpam', '$FRIENDLY_DOMAINS', 'logs/domain-whitelist.log', 'logs/domain-whitelist.log', 'Text file', 'Local Domain Whitelist File', 'File containing a list of domains that cannot be banned.', 'normal', '"'),
(16, 'AntiSpam', '$SPAM_LOG_BOOK', 'logs/spam.log', 'logs/spam.log', 'Text File', 'Spam Log', 'File to log spam blocks to.', 'normal', '"'),
(17, 'Live', 'Enable_Live', 'true', 'true', 'true / false', 'Enable Live', 'Enable the live page.', 'define', NULL),
(18, 'Live', 'items_to_show', '20', '20', 'number', 'Live Items to Show', 'Number of items to show on the live page.', 'define', NULL),
(19, 'Live', 'how_often_refresh', '20', '20', 'number', 'How often to refresh', 'How many seconds between refreshes - not recommended to set it less than 5.', 'define', NULL),
(20, 'Submit', 'Story_Content_Tags_To_Allow_Normal', '', '', 'HTML tags', 'HTML tags to allow to Normal users', 'leave blank to not allow tags. Examples are: &lt;strong&gt;&lt;br&gt;&lt;font&gt;&lt;img&gt;&lt;p&gt;', 'define', '"'),
(21, 'Submit', 'Submit_Require_A_URL', 'true', 'true', 'true / false', 'Require a URL when Submitting', 'Require a URL when submitting.', 'define', NULL),
(22, 'Submit', 'Submit_Show_URL_Input', 'true', 'true', 'true / false', 'Show the URL Input Box', 'Show the URL input box in submit step 1.', 'define', NULL),
(23, 'Submit', 'No_URL_Name', 'Editorial', 'Editorial', 'Text', 'No URL text', 'Label to show when there is no URL provided in submit step 1.', 'define', ''''),
(24, 'Avatars', 'Default_Gravatar_Large', '/avatars/Avatar_100.png', '/avatars/Avatar_100.png', 'Path to image', 'Default  avatar (large)', 'Default location of large gravatar.', 'define', ''''),
(25, 'Avatars', 'Default_Gravatar_Small', '/avatars/Avatar_32.png', '/avatars/Avatar_32.png', 'Path to image', 'Default avatar (small)', 'Default location of small gravatar.', 'define', ''''),
(26, 'Misc', 'Enable_Extra_Fields', 'false', 'false', 'true / false', 'Enable Extra Fields', 'Enable extra fields when submittng stories?', 'define', NULL),
(27, 'Comments', 'Enable_Comment_Voting', 'true', 'true', 'true / false', 'Comment Voting', 'Allow users to vote on comments?', 'define', NULL),
(28, 'Comments', '$CommentOrder', '4', '4', '1 - 4', 'Comment Sort Order', '<strong>1</strong> = Top rated comments first \r\n<br /><strong>2</strong> = Newest comments first (reverse chronological) \r\n<br /><strong>3</strong> =  Lowest rated comments first \r\n<br /><strong>4</strong> = Oldest comments first (chronological)', 'normal', NULL),
(29, 'Misc', 'Allow_Friends', 'true', 'true', 'true / false', 'Allow friends', 'Allow adding, removing, and viewing friends.', 'define', NULL),
(30, 'Voting', 'Voting_Method', '1', '1', '1-3', 'Voting Method', '<strong>1</strong> = Up and Down Voting<br /> <strong>2</strong> = 5 Star Ratings<br /><strong>3</strong> = Karma', 'define', NULL),
(31, 'Misc', 'SearchMethod', '3', '3', '1 - 3', 'Search Method', '<strong>1</strong> = uses MySQL MATCH for FULLTEXT indexes (or something). Problems are MySQL STOP words and words less than 4 characters. Note: these limitations do not affect clicking on a TAG to search by it.\r\n<br /><strong>2</strong> = uses MySQL LIKE and is much slower, but returns better results. Also supports "*" and "-"\r\n<br /><strong>3</strong> = is a hybrid, using method 1 if possible, but method 2 if needed.', 'define', NULL),
(32, 'Anonymous', 'anonymous_vote', 'false', 'false', 'true / false', 'Anonymous vote', 'Allow anonymous users to vote on articles.', 'define', '"'),
(33, 'Anonymous', '$anon_karma', '1', '1', 'number', 'Anonymous Karma', 'Karma is an experimental feature that measures user activity and reputation.', 'normal', NULL),
(34, 'Hidden', 'SALT_LENGTH', '9', '9', 'number', 'SALT_LENGTH', 'SALT_LENGTH', 'define', NULL),
(35, 'Misc', '$dblang', 'en', 'en', 'Text', 'Database Language', 'Database language.', 'normal', ''''),
(36, 'Misc', '$page_size', '8', '8', 'number', 'Page Size', 'How many stories to show on a page.', 'normal', NULL),
(37, 'Misc', '$top_users_size', '25', '25', 'number', 'Top Users Size', 'How many users to display in top users.', 'normal', NULL),
(38, 'Template', 'Allow_User_Change_Templates', 'false', 'false', 'true / false', 'Allow User to Change Templates', 'Allow user to change the template. They can do this from the user settings page.', 'define', ''),
(39, 'Template', '$thetemp', 'bootstrap', 'bootstrap', 'Text', 'Template', 'Default Template', 'normal', ''''),
(40, 'OutGoing', 'track_outgoing', 'false', 'false', 'true / false', 'Enable Outgoing Links', 'Out.php is used to track each click to the external story url. Do you want to enable this click tracking?', 'define', ''),
(41, 'OutGoing', 'track_outgoing_method', 'title', 'title', 'url, title or id', 'Outgoing Links Placement', 'What identifier should the out.php URL use?', 'define', ''''),
(42, 'Submit', 'auto_vote', 'true', 'true', 'true / false', 'Auto vote', 'Automatically vote for the story you submitted.', 'define', NULL),
(43, 'Submit', 'Validate_URL', 'true', 'true', 'true / false', 'Validate URL', 'Check to see if the page exists, gets the title from it, and checks if it is a blog that uses trackbacks. This should only be set to false for sites who have hosts that don''t allow fsockopen or for sites that want to link to media (mp3s, videos, etc.)', 'define', NULL),
(44, 'Submit', 'SubmitSummary_Allow_Edit', '0', '0', '1 = yes / 0 = no', 'Allow Edit of Summary', 'Allow users to edit the summary? Setting to yes will add an additional field to the submit page where users can write a brief description for the front page version of the article. Setting this to no the site will just truncate the full story content.', 'define', NULL),
(45, 'Avatars', 'Enable_User_Upload_Avatar', 'true', 'true', 'true / false', 'Allow User to Uploaded Avatars', 'Should users be able to upload their own avatars?', 'define', NULL),
(46, 'Avatars', 'Avatar_Large', '100', '100', 'number', 'Large Avatar Size', 'Size of the large avatars in pixels (both width and height). Commonly used on the profile page.', 'define', NULL),
(47, 'Avatars', 'Avatar_Small', '32', '32', 'number', 'Small Avatar Size', 'Size of the small avatar in pixels (both width and height). Commonly used in the comments page.', 'define', NULL),
(48, 'Story', 'use_title_as_link', 'false', 'false', 'true / false', 'Use Story Title as External Link', 'Use the story title as link to story''s website.', 'define', NULL),
(49, 'Story', 'open_in_new_window', 'false', 'false', 'true / false', 'Open Story Link in New Window', 'If "Use story title as link" is set to true, setting this to true will open the link in a new window.', 'define', NULL),
(50, 'Misc', 'table_prefix', 'pligg_', 'pligg_', 'Text', 'MySQL Table Prefix', 'Table prefix. Ex: pligg_ makes the users table become pligg_users. Note: changing this will not automatically rename your tables!', 'define', ''''),
(51, 'Voting', 'rating_to_publish', '3', '3', 'number', 'Rating To Publish', 'How many star rating votes will publish a story? For use with Voting Method 2.', 'define', NULL),
(52, 'Submit', 'minTitleLength', '10', '10', 'number', 'Minimum Title Length', 'Minimum number of characters for the story title.', 'define', NULL),
(53, 'Submit', 'minStoryLength', '10', '10', 'number', 'Minimum Story Length', 'Minimum number of characters for the story description.', 'define', NULL),
(54, 'Tags', 'tags_min_pts_s', '6', '6', 'number (should be at least 6)', 'Tag minimum points (sidebar)', '<strong>Only used if Tags are enabled.</strong> How small should the text for the smallest tags in the sidebar cloud?', 'define', NULL),
(55, 'Tags', 'tags_max_pts_s', '15', '15', 'number', 'Tag Maximum Points (sidebar)', '<strong>Only used if Tags are enabled.</strong> How big should the text for the largest tags be in the sidebar cloud?', 'define', NULL),
(56, 'Tags', 'tags_words_limit_s', '30', '30', 'number', 'Tag Cloud Word Limit (sidebar)', '<strong>Only used if Tags are enabled.</strong> How many tags to show in the sidebar cloud?', 'define', NULL),
(57, 'Comments', 'comments_length_sidebar', '75', '75', 'number', 'Sidebar Comment Length', 'The maximum number of characters shown for a comment in the sidebar', 'define', NULL),
(58, 'Comments', 'comments_size_sidebar', '5', '5', 'number', 'Sidebar Number of Comments', 'How many comments to show in the Latest Comments sidebar module.', 'define', NULL),
(59, 'Groups', 'enable_group', 'true', 'true', 'true/false', 'Groups', 'Activate the Group Feature?', 'define', 'NULL'),
(60, 'Groups', 'max_user_groups_allowed', '10', '10', 'number', 'Max Groups User Create', 'Maximum number of groups a user is allowed to create', 'define', 'NULL'),
(61, 'Groups', 'max_groups_to_join', '10', '10', 'number', 'Max Joinable Groups', 'Maxiumum number of groups a user is allowed to join', 'define', 'NULL'),
(62, 'Groups', 'auto_approve_group', 'true', 'true', 'true/false', 'Auto Approve New Groups', 'Should new groups be auto-approved? Set to false if you want to moderate all new groups being created.', 'define', 'NULL'),
(63, 'Groups', 'group_avatar_size_width', '100', '100', 'number', 'Width of Group Avatar', 'Width in pixels for the group avatar', 'define', 'NULL'),
(64, 'Groups', 'group_avatar_size_height', '100', '100', 'number', 'Height of Group Avatar', 'Height in pixels for the group avatar', 'define', 'NULL'),
(65, 'Voting', 'votes_per_ip', '1', '1', 'number', 'Votes Allowed from one IP', 'This feature is turned on by default to prevent users from voting from multiple registered accounts from the same computer network. <strong>0</strong> = disable feature.', 'define', NULL),
(66, 'Submit', 'limit_time_to_edit', '0', '0', '1 = on / 0 = off', 'Limit time to edit stories', 'This feature allows you to limit the amount of time a user has before they can no longer edit a submitted story.<br /><strong>0</strong> = Unlimited amount of time to edit<br /><strong>1</strong> = specified amount of time', 'define', NULL),
(67, 'Submit', 'edit_time_limit', '0', '0', 'number', 'Minutes before a user is no longer allowed to edit a story', '<strong>0</strong> = Disable the users ability to ever edit the story. Requires that you enable Limit Time To Edit Stories (set to 1).', 'define', NULL),
(68, 'Groups', 'group_submit_level', 'normal', 'normal', 'normal,moderator,admin', 'Group Create User Level', 'Minimum user level to create new groups', 'define', 'NULL'),
(69, 'Submit', 'Story_Content_Tags_To_Allow_Admin', '', '', 'HTML tags', 'HTML tags to allow for Moderators', 'leave blank to not allow tags. Examples are "&lt;strong>&lt;br>&lt;font>&lt;img>&lt;p>"', 'define', '"'),
(70, 'Submit', 'Story_Content_Tags_To_Allow_God', '', '', 'HTML tags', 'HTML tags to allow for Admins', 'leave blank to not allow tags. Examples are "&lt;strong>&lt;br>&lt;font>&lt;img>&lt;p>"', 'define', '"'),
(71, 'Misc', 'misc_validate', 'false', 'false', 'true / false', 'Validate user email', 'Require users to validate their email address?', 'define', ''),
(72, 'Misc', 'misc_timezone', '0', '0', 'number', 'Timezone offset', 'Should be a number between -12 and 12 for GMT -1200 through GMT +1200 timezone', 'define', ''),
(73, 'Submit', 'maxTitleLength', '120', '120', 'number', 'Maximum Title Length', 'Maximum number of characters for the story title.', 'define', NULL),
(74, 'Submit', 'maxTagsLength', '40', '40', 'number', 'Maximum Tag Line Length', 'Maximum number of characters for the story tags.', 'define', NULL),
(75, 'Submit', 'maxStoryLength', '3000', '3000', 'number', 'Maximum Story Length', 'Maximum number of characters for the story description.', 'define', NULL),
(76, 'Submit', 'maxSummaryLength', '600', '600', 'number', 'Maximum Summary Length', 'Maximum number of characters for the story summary.', 'define', NULL),
(77, 'Comments', 'maxCommentLength', '1200', '1200', 'number', 'Maximum Comment Length', 'Maximum number of characters for the comment.', 'define', NULL),
(78, 'Voting', 'buries_to_spam', '0', '0', 'number', 'Negative votes to remove submission', 'Number of negative votes story is sent to discard state. <strong>0</strong> = disable feature.', 'define', NULL),
(79, 'Comments', 'comment_buries_spam', '0', '0', 'number', 'Negative votes to remove comment', 'Number of negative votes before comment is sent to discard state. <strong>0</strong> = disable feature.', 'define', NULL),
(80, 'Voting', 'karma_to_publish', '100', '100', 'number', 'Karma to publish', 'Minimum karma value before story is sent to the front page.', 'define', NULL),
(81, 'Submit', 'Submit_Complete_Step2', 'true', 'true', 'true / false', 'Complete submission on Submit Step 2?', 'If set to false, the user will be presented with a third step where they can preview and submit the story.', 'define', NULL),
(82, 'Misc', 'Independent_Subcategories', 'false', 'false', 'true / false', 'Show subcategories', 'Top level categories remain independent from subcategory content', 'define', NULL),
(83, 'Submit', 'Multiple_Categories', 'false', 'false', 'true / false', 'Allow multiple categories', 'Setting this to true will allow users to select multiple categories on the submit page.', 'define', NULL),
(84, 'Misc', 'Auto_scroll', '1', '1', '1-3', 'Pagination Mode', '<strong>1.</strong> Use normal pagination links <br /><strong>2.</strong> JavaScript that automatically adds more articles to the bottom of the page<br /><strong>3</strong> JavaScript button to manually load more articles', 'define', NULL),
(85, 'Comments', 'Search_Comments', 'false', 'false', 'true / false', 'Search Comments', 'Use comment data when providing search results', 'define', NULL),
(86, 'Misc', '$language', 'english', 'english', 'text', 'Site Language', 'Site Language', 'normal', ''''),
(87, 'Misc', 'user_language', '0', '0', '1 = yes / 0 = no', 'Select Language', 'Allow users to change Pligg language', 'normal', '''');

-- --------------------------------------------------------

--
-- Table structure for table `pligg_formulas`
--

CREATE TABLE IF NOT EXISTS `pligg_formulas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `formula` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pligg_formulas`
--

INSERT INTO `pligg_formulas` (`id`, `type`, `enabled`, `title`, `formula`) VALUES
(1, 'report', 1, 'Simple Story Reporting', '$reports > $votes * 3');

-- --------------------------------------------------------

--
-- Table structure for table `pligg_friends`
--

CREATE TABLE IF NOT EXISTS `pligg_friends` (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_from` bigint(20) NOT NULL DEFAULT '0',
  `friend_to` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`friend_id`),
  UNIQUE KEY `friends_from_to` (`friend_from`,`friend_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_groups`
--

CREATE TABLE IF NOT EXISTS `pligg_groups` (
  `group_id` int(20) NOT NULL AUTO_INCREMENT,
  `group_creator` int(20) NOT NULL,
  `group_status` enum('Enable','disable') NOT NULL,
  `group_members` int(20) NOT NULL,
  `group_date` datetime NOT NULL,
  `group_safename` text NOT NULL,
  `group_name` text NOT NULL,
  `group_description` text NOT NULL,
  `group_privacy` enum('private','public','restricted') NOT NULL,
  `group_avatar` varchar(255) NOT NULL,
  `group_vote_to_publish` int(20) NOT NULL,
  `group_field1` varchar(255) NOT NULL,
  `group_field2` varchar(255) NOT NULL,
  `group_field3` varchar(255) NOT NULL,
  `group_field4` varchar(255) NOT NULL,
  `group_field5` varchar(255) NOT NULL,
  `group_field6` varchar(255) NOT NULL,
  `group_notify_email` tinyint(1) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `group_name` (`group_name`(100)),
  KEY `group_creator` (`group_creator`,`group_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_group_member`
--

CREATE TABLE IF NOT EXISTS `pligg_group_member` (
  `member_id` int(20) NOT NULL AUTO_INCREMENT,
  `member_user_id` int(20) NOT NULL,
  `member_group_id` int(20) NOT NULL,
  `member_role` enum('admin','normal','moderator','flagged','banned') NOT NULL,
  `member_status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`member_id`),
  KEY `user_group` (`member_group_id`,`member_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_group_shared`
--

CREATE TABLE IF NOT EXISTS `pligg_group_shared` (
  `share_id` int(20) NOT NULL AUTO_INCREMENT,
  `share_link_id` int(20) NOT NULL,
  `share_group_id` int(20) NOT NULL,
  `share_user_id` int(20) NOT NULL,
  PRIMARY KEY (`share_id`),
  UNIQUE KEY `share_group_id` (`share_group_id`,`share_link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_links`
--

CREATE TABLE IF NOT EXISTS `pligg_links` (
  `link_id` int(20) NOT NULL AUTO_INCREMENT,
  `link_author` int(20) NOT NULL DEFAULT '0',
  `link_status` enum('discard','new','published','abuse','duplicate','page','spam') NOT NULL DEFAULT 'discard',
  `link_randkey` int(20) NOT NULL DEFAULT '0',
  `link_votes` int(20) NOT NULL DEFAULT '0',
  `link_reports` int(20) NOT NULL DEFAULT '0',
  `link_comments` int(20) NOT NULL DEFAULT '0',
  `link_karma` decimal(10,2) NOT NULL DEFAULT '0.00',
  `link_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `link_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_published_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_category` int(11) NOT NULL DEFAULT '0',
  `link_lang` int(11) NOT NULL DEFAULT '1',
  `link_url` varchar(200) NOT NULL DEFAULT '',
  `link_url_title` text,
  `link_title` text NOT NULL,
  `link_title_url` varchar(255) DEFAULT NULL,
  `link_content` mediumtext NOT NULL,
  `link_summary` text,
  `link_tags` text,
  `link_field1` varchar(255) NOT NULL DEFAULT '',
  `link_field2` varchar(255) NOT NULL DEFAULT '',
  `link_field3` varchar(255) NOT NULL DEFAULT '',
  `link_field4` varchar(255) NOT NULL DEFAULT '',
  `link_field5` varchar(255) NOT NULL DEFAULT '',
  `link_field6` varchar(255) NOT NULL DEFAULT '',
  `link_field7` varchar(255) NOT NULL DEFAULT '',
  `link_field8` varchar(255) NOT NULL DEFAULT '',
  `link_field9` varchar(255) NOT NULL DEFAULT '',
  `link_field10` varchar(255) NOT NULL DEFAULT '',
  `link_field11` varchar(255) NOT NULL DEFAULT '',
  `link_field12` varchar(255) NOT NULL DEFAULT '',
  `link_field13` varchar(255) NOT NULL DEFAULT '',
  `link_field14` varchar(255) NOT NULL DEFAULT '',
  `link_field15` varchar(255) NOT NULL DEFAULT '',
  `link_group_id` int(20) NOT NULL DEFAULT '0',
  `link_group_status` enum('new','published','discard') CHARACTER SET latin1 NOT NULL DEFAULT 'new',
  `link_out` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`),
  KEY `link_author` (`link_author`),
  KEY `link_url` (`link_url`),
  KEY `link_status` (`link_status`),
  KEY `link_title_url` (`link_title_url`),
  KEY `link_date` (`link_date`),
  KEY `link_published_date` (`link_published_date`),
  FULLTEXT KEY `link_url_2` (`link_url`,`link_url_title`,`link_title`,`link_content`,`link_tags`),
  FULLTEXT KEY `link_tags` (`link_tags`),
  FULLTEXT KEY `link_search` (`link_title`,`link_content`,`link_tags`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_login_attempts`
--

CREATE TABLE IF NOT EXISTS `pligg_login_attempts` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_username` varchar(100) DEFAULT NULL,
  `login_time` datetime NOT NULL,
  `login_ip` varchar(100) DEFAULT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `login_username` (`login_ip`,`login_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_messages`
--

CREATE TABLE IF NOT EXISTS `pligg_messages` (
  `idMsg` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` text CHARACTER SET latin1 NOT NULL,
  `sender` int(11) NOT NULL DEFAULT '0',
  `receiver` int(11) NOT NULL DEFAULT '0',
  `senderLevel` int(11) NOT NULL DEFAULT '0',
  `readed` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idMsg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_misc_data`
--

CREATE TABLE IF NOT EXISTS `pligg_misc_data` (
  `name` varchar(20) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pligg_misc_data`
--

INSERT INTO `pligg_misc_data` (`name`, `data`) VALUES
('pligg_version', '2.0.2'),
('adcopy_lang', 'en'),
('adcopy_theme', 'white'),
('adcopy_pubkey', 'KLoj-jfX2UP0GEYOmYX.NOWL0ReUhErZ'),
('adcopy_privkey', 'Dm.c-mjmNP7Fhz-hKOpNz8l.NAMGp0wO'),
('adcopy_hashkey', 'nePptHN4rt.-UVLPFScpSuddqdtFdu2N'),
('captcha_method', 'solvemedia'),
('reCaptcha_pubkey', '6LfwKQQAAAAAAPFCNozXDIaf8GobTb7LCKQw54EA'),
('reCaptcha_prikey', '6LfwKQQAAAAAALQosKUrE4MepD0_kW7dgDZLR5P1'),
('hash', '~V9£w`ƒvV¥0¸`¹;V“ŸolÀ€3‹q¹¯MÅe'),
('validate', '0'),
('karma_submit_story', '+15'),
('karma_submit_comment', '+10'),
('karma_story_publish', '+50'),
('karma_story_vote', '+1'),
('karma_comment_vote', '0'),
('karma_story_discard', '-250'),
('karma_story_spam', '-10000'),
('karma_comment_delete', '-50');

-- --------------------------------------------------------

--
-- Table structure for table `pligg_modules`
--

CREATE TABLE IF NOT EXISTS `pligg_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` float NOT NULL,
  `latest_version` float NOT NULL,
  `folder` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `pligg_modules`
--

INSERT INTO `pligg_modules` (`id`, `name`, `version`, `latest_version`, `folder`, `enabled`, `weight`) VALUES
(1, 'Admin Modify Language', 2.1, 0, 'admin_language', 1, 0),
(2, 'Captcha', 2.4, 0, 'captcha', 1, 0),
(3, 'Simple Private Messaging', 2.3, 0, 'simple_messaging', 1, 0),
(4, 'Sidebar Stories', 2, 0, 'sidebar_stories', 1, 0),
(5, 'Sidebar Comments', 2, 0, 'sidebar_comments', 1, 0),
(6, 'Karma module', 0.2, 0, 'karma', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pligg_old_urls`
--

CREATE TABLE IF NOT EXISTS `pligg_old_urls` (
  `old_id` int(11) NOT NULL AUTO_INCREMENT,
  `old_link_id` int(11) NOT NULL,
  `old_title_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`old_id`),
  KEY `old_title_url` (`old_title_url`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_redirects`
--

CREATE TABLE IF NOT EXISTS `pligg_redirects` (
  `redirect_id` int(11) NOT NULL AUTO_INCREMENT,
  `redirect_old` varchar(255) CHARACTER SET latin1 NOT NULL,
  `redirect_new` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`redirect_id`),
  KEY `redirect_old` (`redirect_old`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_saved_links`
--

CREATE TABLE IF NOT EXISTS `pligg_saved_links` (
  `saved_id` int(11) NOT NULL AUTO_INCREMENT,
  `saved_user_id` int(11) NOT NULL,
  `saved_link_id` int(11) NOT NULL,
  `saved_privacy` enum('private','public') NOT NULL DEFAULT 'public',
  PRIMARY KEY (`saved_id`),
  KEY `saved_user_id` (`saved_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_tags`
--

CREATE TABLE IF NOT EXISTS `pligg_tags` (
  `tag_link_id` int(11) NOT NULL DEFAULT '0',
  `tag_lang` varchar(4) NOT NULL DEFAULT 'en',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tag_words` varchar(64) NOT NULL DEFAULT '',
  UNIQUE KEY `tag_link_id` (`tag_link_id`,`tag_lang`,`tag_words`),
  KEY `tag_lang` (`tag_lang`,`tag_date`),
  KEY `tag_words` (`tag_words`,`tag_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_tag_cache`
--

CREATE TABLE IF NOT EXISTS `pligg_tag_cache` (
  `tag_words` varchar(64) DEFAULT NULL,
  `count` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_totals`
--

CREATE TABLE IF NOT EXISTS `pligg_totals` (
  `name` varchar(10) NOT NULL DEFAULT '',
  `total` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pligg_totals`
--

INSERT INTO `pligg_totals` (`name`, `total`) VALUES
('published', 0),
('new', 0),
('discard', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pligg_trackbacks`
--

CREATE TABLE IF NOT EXISTS `pligg_trackbacks` (
  `trackback_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trackback_link_id` int(11) NOT NULL DEFAULT '0',
  `trackback_user_id` int(11) NOT NULL DEFAULT '0',
  `trackback_type` enum('in','out') CHARACTER SET latin1 NOT NULL DEFAULT 'in',
  `trackback_status` enum('ok','pendent','error') CHARACTER SET latin1 NOT NULL DEFAULT 'pendent',
  `trackback_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trackback_date` timestamp NULL DEFAULT NULL,
  `trackback_url` varchar(200) NOT NULL DEFAULT '',
  `trackback_title` text,
  `trackback_content` text,
  PRIMARY KEY (`trackback_id`),
  UNIQUE KEY `trackback_link_id_2` (`trackback_link_id`,`trackback_type`,`trackback_url`),
  KEY `trackback_link_id` (`trackback_link_id`),
  KEY `trackback_url` (`trackback_url`),
  KEY `trackback_date` (`trackback_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_users`
--

CREATE TABLE IF NOT EXISTS `pligg_users` (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(32) NOT NULL DEFAULT '',
  `user_level` enum('normal','moderator','admin','Spammer') NOT NULL DEFAULT 'normal',
  `user_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_email` varchar(128) NOT NULL DEFAULT '',
  `user_names` varchar(128) NOT NULL DEFAULT '',
  `user_karma` decimal(10,2) DEFAULT '0.00',
  `user_url` varchar(128) NOT NULL DEFAULT '',
  `user_lastlogin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_facebook` varchar(64) NOT NULL DEFAULT '',
  `user_twitter` varchar(64) NOT NULL DEFAULT '',
  `user_linkedin` varchar(64) NOT NULL DEFAULT '',
  `user_googleplus` varchar(64) NOT NULL DEFAULT '',
  `user_skype` varchar(64) NOT NULL DEFAULT '',
  `user_pinterest` varchar(64) NOT NULL DEFAULT '',
  `public_email` varchar(64) NOT NULL DEFAULT '',
  `user_avatar_source` varchar(255) NOT NULL DEFAULT '',
  `user_ip` varchar(20) DEFAULT '0',
  `user_lastip` varchar(20) DEFAULT '0',
  `last_reset_request` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_reset_code` varchar(255) DEFAULT NULL,
  `user_location` varchar(255) DEFAULT NULL,
  `user_occupation` varchar(255) DEFAULT NULL,
  `user_categories` varchar(255) NOT NULL DEFAULT '',
  `user_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `user_language` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_login` (`user_login`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pligg_users`
--

INSERT INTO `pligg_users` (`user_id`, `user_login`, `user_level`, `user_modification`, `user_date`, `user_pass`, `user_email`, `user_names`, `user_karma`, `user_url`, `user_lastlogin`, `user_facebook`, `user_twitter`, `user_linkedin`, `user_googleplus`, `user_skype`, `user_pinterest`, `public_email`, `user_avatar_source`, `user_ip`, `user_lastip`, `last_reset_request`, `last_reset_code`, `user_location`, `user_occupation`, `user_categories`, `user_enabled`, `user_language`) VALUES
(1, 'admin', 'admin', '2014-11-08 14:31:23', '2014-11-08 14:31:23', '21ee813842c457951cbebe099f549fc6ade93f51f0a6da0b0', 'mukul.shukla1992@gmail.com', '', '10.00', 'http://pligg.com', '2014-11-08 14:31:23', '', '', '', '', '', '', '', '', '0', '0', '2014-11-08 14:31:23', NULL, NULL, NULL, '', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pligg_votes`
--

CREATE TABLE IF NOT EXISTS `pligg_votes` (
  `vote_id` int(20) NOT NULL AUTO_INCREMENT,
  `vote_type` enum('links','comments') CHARACTER SET latin1 NOT NULL DEFAULT 'links',
  `vote_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vote_link_id` int(20) NOT NULL DEFAULT '0',
  `vote_user_id` int(20) NOT NULL DEFAULT '0',
  `vote_value` smallint(11) NOT NULL DEFAULT '1',
  `vote_karma` int(11) DEFAULT '0',
  `vote_ip` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`vote_id`),
  KEY `user_id` (`vote_user_id`),
  KEY `link_id` (`vote_link_id`),
  KEY `vote_type` (`vote_type`,`vote_link_id`,`vote_user_id`,`vote_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pligg_widgets`
--

CREATE TABLE IF NOT EXISTS `pligg_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `version` float NOT NULL,
  `latest_version` float NOT NULL,
  `folder` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `column` enum('left','right') NOT NULL,
  `position` int(11) NOT NULL,
  `display` char(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folder` (`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pligg_widgets`
--

INSERT INTO `pligg_widgets` (`id`, `name`, `version`, `latest_version`, `folder`, `enabled`, `column`, `position`, `display`) VALUES
(1, 'Admin Panel Tools', 0.1, 0, 'panel_tools', 1, 'left', 4, ''),
(2, 'Statistics', 0.2, 0, 'statistics', 1, 'left', 1, ''),
(3, 'Pligg CMS', 1, 0, 'pligg_cms', 1, 'right', 5, ''),
(4, 'Pligg News', 0.1, 0, 'pligg_news', 1, 'right', 6, '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `custlogin`
--
ALTER TABLE `custlogin`
  ADD CONSTRAINT `CustLogin_ibfk_1` FOREIGN KEY (`CustId`) REFERENCES `customer` (`CustId`),
  ADD CONSTRAINT `custlogin_ibfk_1` FOREIGN KEY (`CustId`) REFERENCES `customer` (`CustId`);

--
-- Constraints for table `emplogin`
--
ALTER TABLE `emplogin`
  ADD CONSTRAINT `EmpLogin_ibfk_1` FOREIGN KEY (`EmpId`) REFERENCES `employee` (`EmpId`),
  ADD CONSTRAINT `emplogin_ibfk_1` FOREIGN KEY (`EmpId`) REFERENCES `employee` (`EmpId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
