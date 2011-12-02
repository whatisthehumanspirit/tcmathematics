-- phpMyAdmin SQL Dump
-- version 2.11.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 05, 2010 at 10:19 PM
-- Server version: 5.0.89
-- PHP Version: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wp_0207d37_0`
--
CREATE DATABASE `wp_0207d37_0` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `wp_0207d37_0`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_categories`
--

CREATE TABLE IF NOT EXISTS `wp_categories` (
  `cat_ID` bigint(20) NOT NULL auto_increment,
  `cat_name` varchar(55) NOT NULL default '',
  `category_nicename` varchar(200) NOT NULL default '',
  `category_description` longtext NOT NULL,
  `category_parent` bigint(20) NOT NULL default '0',
  `category_count` bigint(20) NOT NULL default '0',
  `link_count` bigint(20) NOT NULL default '0',
  `posts_private` tinyint(1) NOT NULL default '0',
  `links_private` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`cat_ID`),
  KEY `category_nicename` (`category_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_categories`
--

INSERT INTO `wp_categories` (`cat_ID`, `cat_name`, `category_nicename`, `category_description`, `category_parent`, `category_count`, `link_count`, `posts_private`, `links_private`) VALUES
(1, 'Uncategorized', 'uncategorized', '', 0, 2, 0, 0, 0),
(2, 'Blogroll', 'blogroll', '', 0, 0, 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL auto_increment,
  `comment_post_ID` int(11) NOT NULL default '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL default '',
  `comment_author_url` varchar(200) NOT NULL default '',
  `comment_author_IP` varchar(100) NOT NULL default '',
  `comment_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL default '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL default '0',
  `comment_approved` enum('0','1','spam') NOT NULL default '1',
  `comment_agent` varchar(255) NOT NULL default '',
  `comment_type` varchar(20) NOT NULL default '',
  `comment_parent` bigint(20) NOT NULL default '0',
  `user_id` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`comment_ID`),
  KEY `comment_approved` (`comment_approved`),
  KEY `comment_post_ID` (`comment_post_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'http://wordpress.org/', '', '2007-11-08 17:18:20', '2007-11-08 22:18:20', 'Hi, this is a comment.<br />To delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_link2cat`
--

CREATE TABLE IF NOT EXISTS `wp_link2cat` (
  `rel_id` bigint(20) NOT NULL auto_increment,
  `link_id` bigint(20) NOT NULL default '0',
  `category_id` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`rel_id`),
  KEY `link_id` (`link_id`,`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `wp_link2cat`
--

INSERT INTO `wp_link2cat` (`rel_id`, `link_id`, `category_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) NOT NULL auto_increment,
  `link_url` varchar(255) NOT NULL default '',
  `link_name` varchar(255) NOT NULL default '',
  `link_image` varchar(255) NOT NULL default '',
  `link_target` varchar(25) NOT NULL default '',
  `link_category` bigint(20) NOT NULL default '0',
  `link_description` varchar(255) NOT NULL default '',
  `link_visible` enum('Y','N') NOT NULL default 'Y',
  `link_owner` int(11) NOT NULL default '1',
  `link_rating` int(11) NOT NULL default '0',
  `link_updated` datetime NOT NULL default '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL default '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`link_id`),
  KEY `link_category` (`link_category`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `wp_links`
--

INSERT INTO `wp_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_category`, `link_description`, `link_visible`, `link_owner`, `link_rating`, `link_updated`, `link_rel`, `link_notes`, `link_rss`) VALUES
(1, 'http://inphotos.org/', 'Donncha', '', '', 0, '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', 'http://inphotos.org/feed/'),
(2, 'http://zengun.org/weblog/', 'Michel', '', '', 0, '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', 'http://zengun.org/weblog/feed/'),
(3, 'http://boren.nu/', 'Ryan', '', '', 0, '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', 'http://boren.nu/feed/'),
(4, 'http://photomatt.net/', 'Matt', '', '', 0, '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', 'http://xml.photomatt.net/feed/'),
(5, 'http://zed1.com/journalized/', 'Mike', '', '', 0, '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', 'http://zed1.com/journalized/feed/'),
(6, 'http://www.alexking.org/', 'Alex', '', '', 0, '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', 'http://www.alexking.org/blog/wp-rss2.php'),
(7, 'http://dougal.gunters.org/', 'Dougal', '', '', 0, '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', 'http://dougal.gunters.org/feed/');

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) NOT NULL auto_increment,
  `blog_id` int(11) NOT NULL default '0',
  `option_name` varchar(64) NOT NULL default '',
  `option_can_override` enum('Y','N') NOT NULL default 'Y',
  `option_type` int(11) NOT NULL default '1',
  `option_value` longtext NOT NULL,
  `option_width` int(11) NOT NULL default '20',
  `option_height` int(11) NOT NULL default '8',
  `option_description` tinytext NOT NULL,
  `option_admin_level` int(11) NOT NULL default '1',
  `autoload` enum('yes','no') NOT NULL default 'yes',
  PRIMARY KEY  (`option_id`,`blog_id`,`option_name`),
  KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `blog_id`, `option_name`, `option_can_override`, `option_type`, `option_value`, `option_width`, `option_height`, `option_description`, `option_admin_level`, `autoload`) VALUES
(1, 0, 'siteurl', 'Y', 1, 'http://tcmathematics.com/blog1', 20, 8, 'WordPress web address', 1, 'yes'),
(2, 0, 'blogname', 'Y', 1, 'blog1', 20, 8, 'Blog title', 1, 'yes'),
(3, 0, 'blogdescription', 'Y', 1, 'Just another WordPress weblog', 20, 8, 'Short tagline', 1, 'yes'),
(66, 0, 'wp_user_roles', 'Y', 1, 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:47:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 20, 8, '', 1, 'yes'),
(5, 0, 'users_can_register', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(6, 0, 'admin_email', 'Y', 1, 'tad@tcmathematics.com', 20, 8, '', 1, 'yes'),
(7, 0, 'start_of_week', 'Y', 1, '1', 20, 8, '', 1, 'yes'),
(8, 0, 'use_balanceTags', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(9, 0, 'use_smilies', 'Y', 1, '1', 20, 8, '', 1, 'yes'),
(10, 0, 'require_name_email', 'Y', 1, '1', 20, 8, '', 1, 'yes'),
(11, 0, 'comments_notify', 'Y', 1, '1', 20, 8, '', 1, 'yes'),
(12, 0, 'posts_per_rss', 'Y', 1, '10', 20, 8, '', 1, 'yes'),
(13, 0, 'rss_excerpt_length', 'Y', 1, '50', 20, 8, '', 1, 'yes'),
(14, 0, 'rss_use_excerpt', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(15, 0, 'mailserver_url', 'Y', 1, '127.0.0.1', 20, 8, '', 1, 'yes'),
(16, 0, 'mailserver_login', 'Y', 1, 'login@example.com', 20, 8, '', 1, 'yes'),
(17, 0, 'mailserver_pass', 'Y', 1, 'password', 20, 8, '', 1, 'yes'),
(18, 0, 'mailserver_port', 'Y', 1, '110', 20, 8, '', 1, 'yes'),
(19, 0, 'default_category', 'Y', 1, '1', 20, 8, '', 1, 'yes'),
(20, 0, 'default_comment_status', 'Y', 1, 'open', 20, 8, '', 1, 'yes'),
(21, 0, 'default_ping_status', 'Y', 1, 'open', 20, 8, '', 1, 'yes'),
(22, 0, 'default_pingback_flag', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(23, 0, 'default_post_edit_rows', 'Y', 1, '10', 20, 8, '', 1, 'yes'),
(24, 0, 'posts_per_page', 'Y', 1, '10', 20, 8, '', 1, 'yes'),
(25, 0, 'what_to_show', 'Y', 1, 'posts', 20, 8, '', 1, 'yes'),
(26, 0, 'date_format', 'Y', 1, 'F j, Y', 20, 8, '', 1, 'yes'),
(27, 0, 'time_format', 'Y', 1, 'g:i a', 20, 8, '', 1, 'yes'),
(28, 0, 'links_updated_date_format', 'Y', 1, 'F j, Y g:i a', 20, 8, '', 1, 'yes'),
(29, 0, 'links_recently_updated_prepend', 'Y', 1, '<em>', 20, 8, '', 1, 'yes'),
(30, 0, 'links_recently_updated_append', 'Y', 1, '</em>', 20, 8, '', 1, 'yes'),
(31, 0, 'links_recently_updated_time', 'Y', 1, '120', 20, 8, '', 1, 'yes'),
(32, 0, 'comment_moderation', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(33, 0, 'moderation_notify', 'Y', 1, '1', 20, 8, '', 1, 'yes'),
(34, 0, 'permalink_structure', 'Y', 1, '', 20, 8, '', 1, 'yes'),
(35, 0, 'gzipcompression', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(36, 0, 'hack_file', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(37, 0, 'blog_charset', 'Y', 1, 'UTF-8', 20, 8, '', 1, 'yes'),
(38, 0, 'moderation_keys', 'Y', 1, '', 20, 8, '', 1, 'no'),
(39, 0, 'active_plugins', 'Y', 1, '', 20, 8, '', 1, 'yes'),
(40, 0, 'home', 'Y', 1, 'http://tcmathematics.com/blog1', 20, 8, '', 1, 'yes'),
(41, 0, 'category_base', 'Y', 1, '', 20, 8, '', 1, 'yes'),
(42, 0, 'ping_sites', 'Y', 1, 'http://rpc.pingomatic.com/', 20, 8, '', 1, 'yes'),
(43, 0, 'advanced_edit', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(44, 0, 'comment_max_links', 'Y', 1, '2', 20, 8, '', 1, 'yes'),
(45, 0, 'gmt_offset', 'Y', 1, '-5', 20, 8, '', 1, 'yes'),
(46, 0, 'default_email_category', 'Y', 1, '1', 20, 8, 'Posts by email go to this category', 1, 'yes'),
(47, 0, 'recently_edited', 'Y', 1, '', 20, 8, '', 1, 'no'),
(48, 0, 'use_linksupdate', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(49, 0, 'template', 'Y', 1, 'default', 20, 8, '', 1, 'yes'),
(50, 0, 'stylesheet', 'Y', 1, 'default', 20, 8, '', 1, 'yes'),
(51, 0, 'comment_whitelist', 'Y', 1, '1', 20, 8, '', 1, 'yes'),
(67, 0, 'page_uris', 'Y', 1, 'a:1:{s:5:"about";i:2;}', 20, 8, '', 1, 'yes'),
(53, 0, 'blacklist_keys', 'Y', 1, '', 20, 8, '', 1, 'no'),
(54, 0, 'comment_registration', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(55, 0, 'rss_language', 'Y', 1, 'en', 20, 8, '', 1, 'yes'),
(56, 0, 'html_type', 'Y', 1, 'text/html', 20, 8, '', 1, 'yes'),
(57, 0, 'use_trackback', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(58, 0, 'default_role', 'Y', 1, 'subscriber', 20, 8, '', 1, 'yes'),
(59, 0, 'db_version', 'Y', 1, '4773', 20, 8, '', 1, 'yes'),
(60, 0, 'uploads_use_yearmonth_folders', 'Y', 1, '1', 20, 8, '', 1, 'yes'),
(61, 0, 'upload_path', 'Y', 1, 'wp-content/uploads', 20, 8, '', 1, 'yes'),
(62, 0, 'secret', 'Y', 1, '152e114c3c9e9906dbcfa446e9fe9791', 20, 8, '', 1, 'yes'),
(63, 0, 'blog_public', 'Y', 1, '0', 20, 8, '', 1, 'yes'),
(64, 0, 'default_link_category', 'Y', 1, '2', 20, 8, '', 1, 'yes'),
(65, 0, 'show_on_front', 'Y', 1, 'posts', 20, 8, '', 1, 'yes'),
(68, 0, 'cron', 'Y', 1, 'a:1:{s:7:"version";i:2;}', 20, 8, '', 1, 'yes'),
(69, 0, 'doing_cron', 'Y', 1, '0', 20, 8, '', 1, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_post2cat`
--

CREATE TABLE IF NOT EXISTS `wp_post2cat` (
  `rel_id` bigint(20) NOT NULL auto_increment,
  `post_id` bigint(20) NOT NULL default '0',
  `category_id` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`rel_id`),
  KEY `post_id` (`post_id`,`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_post2cat`
--

INSERT INTO `wp_post2cat` (`rel_id`, `post_id`, `category_id`) VALUES
(1, 1, 1),
(2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) NOT NULL auto_increment,
  `post_id` bigint(20) NOT NULL default '0',
  `meta_key` varchar(255) default NULL,
  `meta_value` longtext,
  PRIMARY KEY  (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_postmeta`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL auto_increment,
  `post_author` bigint(20) NOT NULL default '0',
  `post_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_category` int(4) NOT NULL default '0',
  `post_excerpt` text NOT NULL,
  `post_status` enum('publish','draft','private','static','object','attachment','inherit','future') NOT NULL default 'publish',
  `comment_status` enum('open','closed','registered_only') NOT NULL default 'open',
  `ping_status` enum('open','closed') NOT NULL default 'open',
  `post_password` varchar(20) NOT NULL default '',
  `post_name` varchar(200) NOT NULL default '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_content_filtered` text NOT NULL,
  `post_parent` bigint(20) NOT NULL default '0',
  `guid` varchar(255) NOT NULL default '',
  `menu_order` int(11) NOT NULL default '0',
  `post_type` varchar(20) NOT NULL default 'post',
  `post_mime_type` varchar(100) NOT NULL default '',
  `comment_count` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_category`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2007-11-08 17:18:20', '2007-11-08 22:18:20', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', 0, '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2007-11-08 17:18:20', '2007-11-08 22:18:20', '', 0, '', 0, 'post', '', 1),
(2, 1, '2007-11-08 17:18:20', '2007-11-08 22:18:20', 'This is an example of a WordPress page, you could edit this to put information about yourself or your site so readers know where you are coming from. You can create as many pages like this one or sub-pages as you like and manage all of your content inside of WordPress.', 'About', 0, '', 'publish', 'open', 'open', '', 'about', '', '', '2007-11-08 17:18:20', '2007-11-08 22:18:20', '', 0, '', 0, 'page', '', 0),
(3, 1, '2007-11-08 17:19:56', '2007-11-08 22:19:56', 'I don''t really even know what a blog is other than an updated discussion.Â  It could come in handy.', 'hey I can have a blog', 0, '', 'publish', 'open', 'open', '', 'hey-i-can-have-a-blog', '', '', '2007-11-08 17:19:56', '2007-11-08 22:19:56', '', 0, 'http://tcmathematics.com/blog1/?p=3', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) NOT NULL default '0',
  `meta_key` varchar(255) default NULL,
  `meta_value` longtext,
  PRIMARY KEY  (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'rich_editing', 'true'),
(3, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(4, 1, 'wp_autosave_draft_ids', 'a:1:{i:-1194560340;i:3;}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL auto_increment,
  `user_login` varchar(60) NOT NULL default '',
  `user_pass` varchar(64) NOT NULL default '',
  `user_nicename` varchar(50) NOT NULL default '',
  `user_email` varchar(100) NOT NULL default '',
  `user_url` varchar(100) NOT NULL default '',
  `user_registered` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL default '',
  `user_status` int(11) NOT NULL default '0',
  `display_name` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`ID`),
  KEY `user_login_key` (`user_login`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'tad', '492d71ef4c5f547a61f42df30bc29c52', 'tad', 'tad@tcmathematics.com', '', '2007-11-08 22:18:20', '', 0, 'tad');
