-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ascemu_world
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievement_reward`
--

DROP TABLE IF EXISTS `achievement_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) NOT NULL DEFAULT '2',
  `title_A` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_H` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`entry`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ai_agents`
--

DROP TABLE IF EXISTS `ai_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ai_agents` (
  `entry` int(10) unsigned NOT NULL,
  `instance_mode` tinyint(1) unsigned NOT NULL DEFAULT '4',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `event` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `chance` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spell` int(10) unsigned NOT NULL DEFAULT '0',
  `spelltype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `targettype_overwrite` tinyint(3) NOT NULL DEFAULT '-1',
  `cooldown_overwrite` mediumint(10) NOT NULL DEFAULT '-1',
  `floatMisc1` float NOT NULL DEFAULT '0',
  `Misc2` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  UNIQUE KEY `entry` (`entry`,`instance_mode`,`type`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='AI System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ai_threattospellid`
--

DROP TABLE IF EXISTS `ai_threattospellid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ai_threattospellid` (
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `mod` int(11) NOT NULL DEFAULT '0',
  `modcoef` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='AI System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areatriggers`
--

DROP TABLE IF EXISTS `areatriggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areatriggers` (
  `entry` smallint(5) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `screen` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT 'Unknown',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `required_honor_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auctionhouse`
--

DROP TABLE IF EXISTS `auctionhouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auctionhouse` (
  `creature_entry` smallint(5) unsigned NOT NULL,
  `ahgroup` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Auction House';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battlemasters`
--

DROP TABLE IF EXISTS `battlemasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlemasters` (
  `creature_entry` smallint(5) unsigned NOT NULL,
  `battleground_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_difficulty`
--

DROP TABLE IF EXISTS `creature_difficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_difficulty` (
  `entry` int(30) unsigned NOT NULL DEFAULT '0',
  `difficulty_1` int(30) unsigned NOT NULL DEFAULT '0' COMMENT 'Dungeon heroic / Raid 25 man',
  `difficulty_2` int(30) unsigned NOT NULL DEFAULT '0' COMMENT 'Raid heroic 10 man',
  `difficulty_3` int(30) unsigned NOT NULL DEFAULT '0' COMMENT 'Raid heroic 25 man',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature Difficulty System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_formations`
--

DROP TABLE IF EXISTS `creature_formations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_formations` (
  `spawn_id` int(10) unsigned NOT NULL DEFAULT '0',
  `target_spawn_id` int(10) unsigned NOT NULL DEFAULT '0',
  `follow_angle` float NOT NULL DEFAULT '0',
  `follow_dist` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`spawn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_initial_equip`
--

DROP TABLE IF EXISTS `creature_initial_equip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_initial_equip` (
  `creature_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemslot_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemslot_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemslot_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_properties`
--

DROP TABLE IF EXISTS `creature_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_properties` (
  `entry` int(30) unsigned NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `killcredit1` int(10) DEFAULT '0',
  `killcredit2` int(10) DEFAULT '0',
  `male_displayid` int(10) DEFAULT '0',
  `female_displayid` int(10) DEFAULT '0',
  `male_displayid2` int(10) DEFAULT '0',
  `female_displayid2` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `subname` varchar(100) DEFAULT '',
  `info_str` varchar(500) DEFAULT '',
  `type_flags` int(10) DEFAULT NULL,
  `type` int(10) DEFAULT '0',
  `family` int(10) DEFAULT '0',
  `rank` int(10) DEFAULT '0',
  `encounter` int(10) DEFAULT '0',
  `base_attack_mod` float DEFAULT NULL,
  `range_attack_mod` float DEFAULT NULL,
  `leader` tinyint(3) DEFAULT '0',
  `minlevel` int(30) unsigned NOT NULL,
  `maxlevel` int(30) unsigned NOT NULL,
  `faction` int(30) unsigned NOT NULL DEFAULT '0',
  `minhealth` int(30) unsigned NOT NULL,
  `maxhealth` int(30) unsigned NOT NULL,
  `mana` int(30) unsigned NOT NULL DEFAULT '0',
  `scale` float NOT NULL DEFAULT '0',
  `npcflags` int(30) unsigned NOT NULL DEFAULT '0',
  `attacktime` int(30) unsigned NOT NULL DEFAULT '0',
  `attack_school` tinyint(4) DEFAULT NULL,
  `mindamage` float NOT NULL DEFAULT '0',
  `maxdamage` float NOT NULL DEFAULT '0',
  `can_ranged` int(11) unsigned NOT NULL DEFAULT '0',
  `rangedattacktime` int(30) unsigned NOT NULL DEFAULT '0',
  `rangedmindamage` float unsigned NOT NULL DEFAULT '0',
  `rangedmaxdamage` float unsigned NOT NULL DEFAULT '0',
  `respawntime` int(30) unsigned NOT NULL DEFAULT '0',
  `armor` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `resistance1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Holy',
  `resistance2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Fire',
  `resistance3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Nature',
  `resistance4` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Frost',
  `resistance5` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shadow',
  `resistance6` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Arcane',
  `combat_reach` float NOT NULL DEFAULT '1',
  `bounding_radius` float NOT NULL DEFAULT '1',
  `auras` longtext NOT NULL,
  `boss` int(11) unsigned NOT NULL DEFAULT '0',
  `money` int(30) NOT NULL DEFAULT '0',
  `invisibility_type` int(30) unsigned NOT NULL DEFAULT '0',
  `walk_speed` float NOT NULL DEFAULT '2.5',
  `run_speed` float NOT NULL DEFAULT '8',
  `fly_speed` float NOT NULL DEFAULT '14',
  `extra_a9_flags` int(30) NOT NULL DEFAULT '0',
  `spell1` int(10) unsigned NOT NULL DEFAULT '0',
  `spell2` int(10) unsigned NOT NULL DEFAULT '0',
  `spell3` int(10) unsigned NOT NULL DEFAULT '0',
  `spell4` int(10) unsigned NOT NULL DEFAULT '0',
  `spell5` int(10) unsigned NOT NULL DEFAULT '0',
  `spell6` int(10) unsigned NOT NULL DEFAULT '0',
  `spell7` int(10) unsigned NOT NULL DEFAULT '0',
  `spell8` int(10) unsigned NOT NULL DEFAULT '0',
  `spell_flags` int(30) NOT NULL DEFAULT '0',
  `modImmunities` int(30) unsigned NOT NULL DEFAULT '0',
  `isTrainingDummy` int(10) unsigned NOT NULL DEFAULT '0',
  `guardtype` int(10) unsigned NOT NULL DEFAULT '0',
  `summonguard` int(10) unsigned NOT NULL DEFAULT '0',
  `spelldataid` int(10) unsigned NOT NULL DEFAULT '0',
  `vehicleid` int(10) unsigned NOT NULL DEFAULT '0',
  `rooted` int(10) unsigned NOT NULL DEFAULT '0',
  `questitem1` int(11) DEFAULT '0',
  `questitem2` int(11) DEFAULT '0',
  `questitem3` int(11) DEFAULT '0',
  `questitem4` int(11) DEFAULT '0',
  `questitem5` int(11) DEFAULT '0',
  `questitem6` int(11) DEFAULT '0',
  `waypointid` int(10) DEFAULT '0',
  PRIMARY KEY (`entry`,`build`),
  UNIQUE KEY `unique_index` (`entry`,`build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_quest_finisher`
--

DROP TABLE IF EXISTS `creature_quest_finisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_quest_finisher` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `quest` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_quest_starter`
--

DROP TABLE IF EXISTS `creature_quest_starter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_quest_starter` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `quest` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_spawns`
--

DROP TABLE IF EXISTS `creature_spawns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_spawns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `min_build` int(6) NOT NULL DEFAULT '12340',
  `max_build` int(6) NOT NULL DEFAULT '12340',
  `entry` mediumint(10) unsigned NOT NULL,
  `map` smallint(5) unsigned NOT NULL,
  `position_x` float NOT NULL,
  `position_y` float NOT NULL,
  `position_z` float NOT NULL,
  `orientation` float NOT NULL,
  `movetype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayid` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `faction` mediumint(10) unsigned NOT NULL DEFAULT '14',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes0` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `emote_state` smallint(5) unsigned NOT NULL DEFAULT '0',
  `npc_respawn_link` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_spell` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_target_sqlid` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_target_sqlid_creature` int(10) unsigned NOT NULL DEFAULT '0',
  `standstate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `death_state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mountdisplayid` int(10) unsigned NOT NULL DEFAULT '0',
  `slot1item` int(10) unsigned NOT NULL DEFAULT '0',
  `slot2item` int(10) unsigned NOT NULL DEFAULT '0',
  `slot3item` int(10) unsigned NOT NULL DEFAULT '0',
  `CanFly` smallint(3) unsigned NOT NULL DEFAULT '0',
  `phase` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Phase mask',
  `event_entry` int(6) NOT NULL DEFAULT '0',
  `waypoint_group` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`min_build`),
  UNIQUE KEY `unique_index` (`id`,`min_build`) USING BTREE,
  KEY `entry` (`entry`)
) ENGINE=MyISAM AUTO_INCREMENT=397570 DEFAULT CHARSET=latin1 COMMENT='Spawn System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_timed_emotes`
--

DROP TABLE IF EXISTS `creature_timed_emotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_timed_emotes` (
  `spawnid` int(10) unsigned NOT NULL DEFAULT '0',
  `rowid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `msg` text,
  `msg_type` int(10) unsigned NOT NULL DEFAULT '0',
  `msg_lang` int(10) unsigned NOT NULL DEFAULT '0',
  `expire_after` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spawnid`,`rowid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_waypoints`
--

DROP TABLE IF EXISTS `creature_waypoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_waypoints` (
  `spawnid` int(10) unsigned NOT NULL DEFAULT '0',
  `waypointid` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL,
  `position_y` float NOT NULL,
  `position_z` float NOT NULL,
  `waittime` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `forwardemoteoneshot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `forwardemoteid` int(10) unsigned NOT NULL DEFAULT '0',
  `backwardemoteoneshot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `backwardemoteid` int(10) unsigned NOT NULL DEFAULT '0',
  `forwardskinid` int(10) unsigned NOT NULL DEFAULT '0',
  `backwardskinid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spawnid`,`waypointid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_waypoints_manual`
--

DROP TABLE IF EXISTS `creature_waypoints_manual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_waypoints_manual` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `waypoint_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float(8,2) NOT NULL DEFAULT '0.00',
  `position_y` float(8,2) NOT NULL DEFAULT '0.00',
  `position_z` float(8,2) NOT NULL DEFAULT '0.00',
  `wait_time` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `forward_emote_oneshot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `forward_emote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `backward_emote_oneshot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `backward_emote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forward_skin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `backward_skin_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`waypoint_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Manual Waypoint Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `display_bounding_boxes`
--

DROP TABLE IF EXISTS `display_bounding_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `display_bounding_boxes` (
  `displayid` smallint(5) unsigned NOT NULL,
  `lowx` float NOT NULL,
  `lowy` float NOT NULL,
  `lowz` float NOT NULL,
  `highx` float NOT NULL,
  `highy` float NOT NULL,
  `highz` float NOT NULL,
  `boundradius` float NOT NULL,
  PRIMARY KEY (`displayid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_properties`
--

DROP TABLE IF EXISTS `event_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_properties` (
  `entry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `min_build` int(6) NOT NULL DEFAULT '12340',
  `max_build` int(6) NOT NULL DEFAULT '12340',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  `announce` tinyint(3) unsigned DEFAULT '2' COMMENT '0 dont announce, 1 announce, 2 value from config',
  PRIMARY KEY (`entry`,`min_build`),
  UNIQUE KEY `unique` (`entry`,`min_build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_scripts`
--

DROP TABLE IF EXISTS `event_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_scripts` (
  `event_id` int(11) NOT NULL,
  `function` int(11) NOT NULL,
  `script_type` mediumint(8) NOT NULL,
  `data_1` mediumint(8) DEFAULT NULL,
  `data_2` mediumint(8) DEFAULT NULL,
  `data_3` mediumint(8) NOT NULL DEFAULT '0',
  `data_4` mediumint(8) DEFAULT NULL,
  `data_5` mediumint(8) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `z` float DEFAULT NULL,
  `o` float DEFAULT NULL,
  `delay` int(11) DEFAULT NULL,
  `next_event` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fishing`
--

DROP TABLE IF EXISTS `fishing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fishing` (
  `zone` smallint(5) unsigned NOT NULL,
  `MinSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Fishing System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_properties`
--

DROP TABLE IF EXISTS `gameobject_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_properties` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Type of this go. Fill in all necessary parameters',
  `display_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Go visible display id',
  `name` varchar(100) DEFAULT '',
  `category_name` varchar(100) DEFAULT '',
  `cast_bar_text` varchar(100) DEFAULT '',
  `UnkStr` varchar(100) DEFAULT NULL,
  `parameter_0` int(10) DEFAULT NULL,
  `parameter_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_6` int(10) DEFAULT NULL,
  `parameter_7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_10` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_11` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_12` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_13` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_14` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_15` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_16` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_17` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_18` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_19` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_20` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_21` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_22` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `parameter_23` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parameter for type',
  `size` float unsigned NOT NULL DEFAULT '1' COMMENT 'Default size for this gameobject',
  `QuestItem1` int(11) unsigned NOT NULL DEFAULT '0',
  `QuestItem2` int(11) unsigned NOT NULL DEFAULT '0',
  `QuestItem3` int(11) unsigned NOT NULL DEFAULT '0',
  `QuestItem4` int(11) unsigned NOT NULL DEFAULT '0',
  `QuestItem5` int(11) unsigned NOT NULL DEFAULT '0',
  `QuestItem6` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`build`),
  UNIQUE KEY `unique_index` (`entry`,`build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Gameobject System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_quest_finisher`
--

DROP TABLE IF EXISTS `gameobject_quest_finisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_quest_finisher` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `quest` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quest System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_quest_item_binding`
--

DROP TABLE IF EXISTS `gameobject_quest_item_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_quest_item_binding` (
  `entry` int(11) NOT NULL DEFAULT '0',
  `quest` int(11) NOT NULL DEFAULT '0',
  `item` int(11) NOT NULL DEFAULT '0',
  `item_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quest System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_quest_pickup_binding`
--

DROP TABLE IF EXISTS `gameobject_quest_pickup_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_quest_pickup_binding` (
  `entry` int(11) NOT NULL DEFAULT '0',
  `quest` int(11) NOT NULL DEFAULT '0',
  `required_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quest System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_quest_starter`
--

DROP TABLE IF EXISTS `gameobject_quest_starter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_quest_starter` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `quest` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quest System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_spawns`
--

DROP TABLE IF EXISTS `gameobject_spawns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_spawns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Spawn Identifier',
  `min_build` int(6) NOT NULL DEFAULT '12340',
  `max_build` int(6) NOT NULL DEFAULT '12340',
  `entry` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` int(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `facing` float NOT NULL DEFAULT '0',
  `orientation1` float NOT NULL DEFAULT '0',
  `orientation2` float NOT NULL DEFAULT '0',
  `orientation3` float NOT NULL DEFAULT '0',
  `orientation4` float NOT NULL DEFAULT '0',
  `state` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `faction` int(10) unsigned NOT NULL DEFAULT '0',
  `scale` float unsigned NOT NULL DEFAULT '1',
  `respawnNpcLink` int(11) unsigned NOT NULL DEFAULT '0',
  `phase` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Phase mask',
  `overrides` int(10) unsigned NOT NULL DEFAULT '0',
  `event_entry` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`min_build`),
  UNIQUE KEY `unique_index` (`id`,`min_build`) USING BTREE,
  KEY `Entry` (`entry`)
) ENGINE=MyISAM AUTO_INCREMENT=637669 DEFAULT CHARSET=latin1 COMMENT='Spawn System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_teleports`
--

DROP TABLE IF EXISTS `gameobject_teleports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_teleports` (
  `entry` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mapid` int(10) unsigned NOT NULL,
  `x_pos` float NOT NULL,
  `y_pos` float NOT NULL,
  `z_pos` float NOT NULL,
  `orientation` float NOT NULL,
  `required_level` int(10) unsigned NOT NULL,
  `required_class` tinyint(2) NOT NULL DEFAULT '0',
  `required_achievement` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM AUTO_INCREMENT=700001 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Optional table to create custom portals';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_menu`
--

DROP TABLE IF EXISTS `gossip_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gossip_menu` (
  `gossip_menu` int(10) NOT NULL COMMENT 'initial gossip menu text',
  `text_id` int(10) DEFAULT '0',
  `Comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`gossip_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_menu_items`
--

DROP TABLE IF EXISTS `gossip_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gossip_menu_items` (
  `id` int(10) NOT NULL,
  `item_order` int(10) NOT NULL DEFAULT '1',
  `menu_option` int(10) NOT NULL DEFAULT '0' COMMENT 'gossip_menu_option table',
  `icon` int(10) NOT NULL DEFAULT '0',
  `point_of_interest` int(10) NOT NULL DEFAULT '0' COMMENT 'point_of_interest table',
  `next_gossip_menu` int(10) NOT NULL DEFAULT '0',
  `next_gossip_text` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`item_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_menu_option`
--

DROP TABLE IF EXISTS `gossip_menu_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gossip_menu_option` (
  `entry` int(10) NOT NULL AUTO_INCREMENT,
  `option_text` text NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `graveyards`
--

DROP TABLE IF EXISTS `graveyards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graveyards` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `zoneid` tinyint(1) unsigned NOT NULL,
  `adjacentzoneid` tinyint(1) unsigned NOT NULL,
  `mapid` smallint(3) unsigned NOT NULL,
  `faction` enum('0','1','3') NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2001 DEFAULT CHARSET=latin1 COMMENT='Graveyard System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_bosses`
--

DROP TABLE IF EXISTS `instance_bosses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_bosses` (
  `mapid` int(11) unsigned NOT NULL DEFAULT '0',
  `creatureid` int(11) unsigned NOT NULL DEFAULT '0',
  `trash` text NOT NULL,
  `trash_respawn_override` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`,`creatureid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Instance Boss Definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_pages`
--

DROP TABLE IF EXISTS `item_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_pages` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `text` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `next_page` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_properties`
--

DROP TABLE IF EXISTS `item_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_properties` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field4` int(11) NOT NULL DEFAULT '-1',
  `name1` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `flags2` int(11) unsigned NOT NULL DEFAULT '0',
  `buyprice` int(10) unsigned NOT NULL DEFAULT '0',
  `sellprice` int(10) unsigned NOT NULL DEFAULT '0',
  `inventorytype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowableclass` int(11) NOT NULL DEFAULT '-1',
  `allowablerace` int(11) NOT NULL DEFAULT '-1',
  `itemlevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `requiredlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredPlayerRank1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredPlayerRank2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionStanding` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Unique` int(11) NOT NULL DEFAULT '1',
  `maxcount` int(11) NOT NULL DEFAULT '0',
  `ContainerSlots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `itemstatscount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value1` smallint(6) NOT NULL DEFAULT '0',
  `stat_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value2` smallint(6) NOT NULL DEFAULT '0',
  `stat_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value3` smallint(6) NOT NULL DEFAULT '0',
  `stat_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value4` smallint(6) NOT NULL DEFAULT '0',
  `stat_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value5` smallint(6) NOT NULL DEFAULT '0',
  `stat_type6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value6` smallint(6) NOT NULL DEFAULT '0',
  `stat_type7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value7` smallint(6) NOT NULL DEFAULT '0',
  `stat_type8` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value8` smallint(6) NOT NULL DEFAULT '0',
  `stat_type9` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value9` smallint(6) NOT NULL DEFAULT '0',
  `stat_type10` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value10` smallint(6) NOT NULL DEFAULT '0',
  `ScaledStatsDistributionId` smallint(6) NOT NULL DEFAULT '0',
  `ScaledStatsDistributionFlags` int(6) unsigned NOT NULL DEFAULT '0',
  `dmg_min1` float NOT NULL DEFAULT '0',
  `dmg_max1` float NOT NULL DEFAULT '0',
  `dmg_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min2` float NOT NULL DEFAULT '0',
  `dmg_max2` float NOT NULL DEFAULT '0',
  `dmg_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `armor` smallint(5) unsigned NOT NULL DEFAULT '0',
  `holy_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fire_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nature_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frost_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `shadow_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `arcane_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delay` smallint(5) unsigned NOT NULL DEFAULT '1000',
  `ammo_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `range` float NOT NULL DEFAULT '0',
  `spellid_1` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_1` smallint(4) NOT NULL DEFAULT '0',
  `spellcooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellid_2` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_2` smallint(4) NOT NULL DEFAULT '0',
  `spellcooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellid_3` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_3` smallint(4) NOT NULL DEFAULT '0',
  `spellcooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellid_4` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_4` smallint(4) NOT NULL DEFAULT '0',
  `spellcooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellid_5` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_5` smallint(4) NOT NULL DEFAULT '0',
  `spellcooldown_5` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int(11) NOT NULL DEFAULT '-1',
  `bonding` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `page_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_material` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `quest_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lock_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lock_material` tinyint(4) NOT NULL DEFAULT '0',
  `sheathID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `randomprop` mediumint(8) NOT NULL DEFAULT '0',
  `randomsuffix` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `block` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemset` int(5) NOT NULL DEFAULT '0',
  `MaxDurability` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ZoneNameID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mapid` smallint(6) NOT NULL DEFAULT '0',
  `bagfamily` mediumint(9) NOT NULL DEFAULT '0',
  `TotemCategory` mediumint(9) NOT NULL DEFAULT '0',
  `socket_color_1` tinyint(4) NOT NULL DEFAULT '0',
  `unk201_3` mediumint(9) NOT NULL DEFAULT '0',
  `socket_color_2` tinyint(4) NOT NULL DEFAULT '0',
  `unk201_5` mediumint(9) NOT NULL DEFAULT '0',
  `socket_color_3` tinyint(4) NOT NULL DEFAULT '0',
  `unk201_7` mediumint(9) NOT NULL DEFAULT '0',
  `socket_bonus` mediumint(9) NOT NULL DEFAULT '0',
  `GemProperties` mediumint(9) NOT NULL DEFAULT '0',
  `ReqDisenchantSkill` smallint(6) NOT NULL DEFAULT '-1',
  `ArmorDamageModifier` float NOT NULL DEFAULT '0',
  `existingduration` int(11) NOT NULL DEFAULT '0',
  `ItemLimitCategoryId` smallint(6) NOT NULL DEFAULT '0',
  `HolidayId` int(11) unsigned NOT NULL DEFAULT '0',
  `food_type` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`build`),
  UNIQUE KEY `unique_index` (`entry`,`build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_quest_association`
--

DROP TABLE IF EXISTS `item_quest_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_quest_association` (
  `item` int(11) NOT NULL DEFAULT '0',
  `quest` int(11) NOT NULL DEFAULT '0',
  `item_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quest System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_randomprop_groups`
--

DROP TABLE IF EXISTS `item_randomprop_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_randomprop_groups` (
  `entry_id` smallint(4) unsigned NOT NULL,
  `randomprops_entryid` smallint(4) unsigned NOT NULL,
  `chance` float NOT NULL,
  PRIMARY KEY (`entry_id`,`randomprops_entryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_randomsuffix_groups`
--

DROP TABLE IF EXISTS `item_randomsuffix_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_randomsuffix_groups` (
  `entry_id` smallint(3) unsigned NOT NULL,
  `randomsuffix_entryid` tinyint(2) unsigned NOT NULL,
  `chance` float NOT NULL,
  PRIMARY KEY (`entry_id`,`randomsuffix_entryid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemset_linked_itemsetbonus`
--

DROP TABLE IF EXISTS `itemset_linked_itemsetbonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemset_linked_itemsetbonus` (
  `itemset` int(5) NOT NULL,
  `itemset_bonus` int(5) NOT NULL COMMENT 'linked itemset for itemset bonus',
  PRIMARY KEY (`itemset`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lfg_dungeon_rewards`
--

DROP TABLE IF EXISTS `lfg_dungeon_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lfg_dungeon_rewards` (
  `dungeon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Dungeon entry from dbc',
  `max_level` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Max level at which this reward is rewarded',
  `quest_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for first dungeon this day',
  `money_var_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Money multiplier for completing the dungeon first time in a day with less players than max',
  `xp_var_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Experience multiplier for completing the dungeon first time in a day with less players than max',
  `quest_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for Nth dungeon this day',
  `money_var_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Money multiplier for completing the dungeon Nth time in a day with less players than max',
  `xp_var_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Experience multiplier for completing the dungeon Nth time in a day with less players than max',
  PRIMARY KEY (`dungeon_id`,`max_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_creature`
--

DROP TABLE IF EXISTS `locales_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_creature` (
  `id` int(30) unsigned NOT NULL,
  `language_code` varchar(5) CHARACTER SET latin1 NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `subname` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_gameobject`
--

DROP TABLE IF EXISTS `locales_gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_gameobject` (
  `entry` int(30) NOT NULL,
  `language_code` varchar(5) CHARACTER SET latin1 NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_gossip_menu_option`
--

DROP TABLE IF EXISTS `locales_gossip_menu_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_gossip_menu_option` (
  `entry` int(10) NOT NULL,
  `language_code` varchar(5) NOT NULL,
  `option_text` text NOT NULL,
  PRIMARY KEY (`entry`,`language_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_item`
--

DROP TABLE IF EXISTS `locales_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_item` (
  `entry` int(30) NOT NULL,
  `language_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_item_pages`
--

DROP TABLE IF EXISTS `locales_item_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_item_pages` (
  `entry` int(30) NOT NULL,
  `language_code` varchar(5) CHARACTER SET latin1 NOT NULL,
  `text` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_npc_monstersay`
--

DROP TABLE IF EXISTS `locales_npc_monstersay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_npc_monstersay` (
  `entry` int(10) NOT NULL DEFAULT '0',
  `type` int(1) unsigned NOT NULL DEFAULT '0',
  `language_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enGB',
  `monstername` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `text0` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `text1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `text2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `text3` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `text4` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`,`type`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='NPC System localized';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_npc_script_text`
--

DROP TABLE IF EXISTS `locales_npc_script_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_npc_script_text` (
  `entry` int(10) NOT NULL DEFAULT '0',
  `language_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='NPC System localized';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_npc_text`
--

DROP TABLE IF EXISTS `locales_npc_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_npc_text` (
  `entry` int(30) NOT NULL,
  `language_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `text0` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text0_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text1_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text2` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text2_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text3` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text3_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text4` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text4_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text5` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text5_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text6` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text6_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text7` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text7_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_quest`
--

DROP TABLE IF EXISTS `locales_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_quest` (
  `entry` int(30) NOT NULL,
  `language_code` varchar(5) CHARACTER SET latin1 NOT NULL,
  `Title` text CHARACTER SET latin1 NOT NULL,
  `Details` text CHARACTER SET latin1 NOT NULL,
  `Objectives` text CHARACTER SET latin1 NOT NULL,
  `CompletionText` text CHARACTER SET latin1 NOT NULL,
  `IncompleteText` text CHARACTER SET latin1 NOT NULL,
  `EndText` text CHARACTER SET latin1 NOT NULL,
  `ObjectiveText1` text CHARACTER SET latin1 NOT NULL,
  `ObjectiveText2` text CHARACTER SET latin1 NOT NULL,
  `ObjectiveText3` text CHARACTER SET latin1 NOT NULL,
  `ObjectiveText4` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_worldbroadcast`
--

DROP TABLE IF EXISTS `locales_worldbroadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_worldbroadcast` (
  `entry` int(11) NOT NULL,
  `language_code` varchar(5) CHARACTER SET latin1 NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_worldmap_info`
--

DROP TABLE IF EXISTS `locales_worldmap_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_worldmap_info` (
  `entry` int(11) NOT NULL,
  `language_code` varchar(5) NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_worldstring_table`
--

DROP TABLE IF EXISTS `locales_worldstring_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_worldstring_table` (
  `entry` int(11) NOT NULL,
  `language_code` varchar(5) NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`entry`,`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loot_creatures`
--

DROP TABLE IF EXISTS `loot_creatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loot_creatures` (
  `entryid` int(10) unsigned NOT NULL DEFAULT '0',
  `itemid` int(11) NOT NULL DEFAULT '0',
  `normal10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `normal25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `mincount` int(30) unsigned NOT NULL DEFAULT '1',
  `maxcount` int(30) unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `UNIQUE` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loot_fishing`
--

DROP TABLE IF EXISTS `loot_fishing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loot_fishing` (
  `entryid` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `normal10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `normal25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `mincount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `UNIQUE` (`itemid`,`entryid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loot_gameobjects`
--

DROP TABLE IF EXISTS `loot_gameobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loot_gameobjects` (
  `entryid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Loot Identifier',
  `itemid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `normal10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `normal25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `mincount` int(30) unsigned NOT NULL DEFAULT '1',
  `maxcount` int(30) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loot_items`
--

DROP TABLE IF EXISTS `loot_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loot_items` (
  `entryid` int(11) unsigned NOT NULL DEFAULT '0',
  `itemid` int(11) unsigned NOT NULL DEFAULT '0',
  `normal10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `normal25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `mincount` int(30) unsigned NOT NULL DEFAULT '1',
  `maxcount` int(30) unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `UNIQUE` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loot_pickpocketing`
--

DROP TABLE IF EXISTS `loot_pickpocketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loot_pickpocketing` (
  `entryid` int(10) unsigned NOT NULL DEFAULT '0',
  `itemid` int(10) unsigned NOT NULL DEFAULT '0',
  `normal10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `normal25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `mincount` int(10) unsigned NOT NULL DEFAULT '1',
  `maxcount` int(10) unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `UNIQUE` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loot_skinning`
--

DROP TABLE IF EXISTS `loot_skinning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loot_skinning` (
  `entryid` int(10) unsigned NOT NULL DEFAULT '0',
  `itemid` int(10) unsigned NOT NULL DEFAULT '0',
  `normal10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `normal25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic10percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `heroic25percentchance` float(5,2) NOT NULL DEFAULT '0.00',
  `mincount` int(30) unsigned NOT NULL DEFAULT '1',
  `maxcount` int(30) unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `UNIQUE` (`entryid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_gossip_textid`
--

DROP TABLE IF EXISTS `npc_gossip_textid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_gossip_textid` (
  `creatureid` int(10) unsigned NOT NULL DEFAULT '0',
  `textid` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `UNIQUE` (`creatureid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='NPC System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_monstersay`
--

DROP TABLE IF EXISTS `npc_monstersay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_monstersay` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `event` int(10) unsigned NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `language` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `monstername` longtext COLLATE utf8_unicode_ci,
  `text0` longtext COLLATE utf8_unicode_ci,
  `text1` longtext COLLATE utf8_unicode_ci,
  `text2` longtext COLLATE utf8_unicode_ci,
  `text3` longtext COLLATE utf8_unicode_ci,
  `text4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`entry`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='NPC System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_script_text`
--

DROP TABLE IF EXISTS `npc_script_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_script_text` (
  `entry` int(10) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `creature_entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'entry from creature_names',
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'creature_entry and id (unique)',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `probability` float NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `duration` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `broadcast_id` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM AUTO_INCREMENT=8947 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_text`
--

DROP TABLE IF EXISTS `npc_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_text` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `prob0` float NOT NULL DEFAULT '0',
  `text0_0` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text0_1` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang0` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay0_0` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote0_0` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay0_1` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote0_1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay0_2` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote0_2` int(10) unsigned NOT NULL DEFAULT '0',
  `prob1` float NOT NULL DEFAULT '0',
  `text1_0` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text1_1` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1_0` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote1_0` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1_1` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote1_1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1_2` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote1_2` int(10) unsigned NOT NULL DEFAULT '0',
  `prob2` float NOT NULL DEFAULT '0',
  `text2_0` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text2_1` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang2` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2_0` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote2_0` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2_1` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote2_1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2_2` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote2_2` int(10) unsigned NOT NULL DEFAULT '0',
  `prob3` float NOT NULL DEFAULT '0',
  `text3_0` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text3_1` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang3` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3_0` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote3_0` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3_1` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote3_1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3_2` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote3_2` int(10) unsigned NOT NULL DEFAULT '0',
  `prob4` float NOT NULL DEFAULT '0',
  `text4_0` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text4_1` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang4` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4_0` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote4_0` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4_1` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote4_1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4_2` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote4_2` int(10) unsigned NOT NULL DEFAULT '0',
  `prob5` float NOT NULL DEFAULT '0',
  `text5_0` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text5_1` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang5` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay5_0` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote5_0` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay5_1` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote5_1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay5_2` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote5_2` int(10) unsigned NOT NULL DEFAULT '0',
  `prob6` float NOT NULL DEFAULT '0',
  `text6_0` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text6_1` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang6` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay6_0` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote6_0` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay6_1` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote6_1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay6_2` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote6_2` int(10) unsigned NOT NULL DEFAULT '0',
  `prob7` float NOT NULL DEFAULT '0',
  `text7_0` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text7_1` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang7` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay7_0` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote7_0` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay7_1` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote7_1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay7_2` int(10) unsigned NOT NULL DEFAULT '0',
  `Emote7_2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='NPC System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_level_abilities`
--

DROP TABLE IF EXISTS `pet_level_abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_level_abilities` (
  `level` int(3) unsigned NOT NULL DEFAULT '0',
  `health` int(5) unsigned NOT NULL DEFAULT '0',
  `armor` int(5) unsigned NOT NULL DEFAULT '0',
  `strength` int(5) unsigned NOT NULL DEFAULT '0',
  `agility` int(5) unsigned NOT NULL DEFAULT '0',
  `stamina` int(5) unsigned NOT NULL DEFAULT '0',
  `intellect` int(5) unsigned NOT NULL DEFAULT '0',
  `spirit` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `petdefaultspells`
--

DROP TABLE IF EXISTS `petdefaultspells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petdefaultspells` (
  `entry` int(11) NOT NULL DEFAULT '0',
  `spell` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_xp_for_level`
--

DROP TABLE IF EXISTS `player_xp_for_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_xp_for_level` (
  `player_lvl` tinyint(3) unsigned NOT NULL,
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `next_lvl_req_xp` int(10) unsigned NOT NULL,
  PRIMARY KEY (`player_lvl`,`build`),
  UNIQUE KEY `unique_index` (`player_lvl`,`build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo`
--

DROP TABLE IF EXISTS `playercreateinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playercreateinfo` (
  `Index` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mapID` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneID` int(10) unsigned NOT NULL DEFAULT '0',
  `positionX` float NOT NULL DEFAULT '0',
  `positionY` float NOT NULL DEFAULT '0',
  `positionZ` float NOT NULL DEFAULT '0',
  `orientation` float DEFAULT '0',
  `BaseStrength` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BaseAgility` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BaseStamina` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BaseIntellect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BaseSpirit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BaseHealth` smallint(5) unsigned NOT NULL DEFAULT '0',
  `BaseMana` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BaseRage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `BaseFocus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `BaseEnergy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attackpower` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mindmg` float NOT NULL DEFAULT '0',
  `maxdmg` float NOT NULL DEFAULT '0',
  `taximask` tinytext,
  PRIMARY KEY (`Index`,`build`),
  UNIQUE KEY `unique_index` (`Index`,`build`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=latin1 COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_bars`
--

DROP TABLE IF EXISTS `playercreateinfo_bars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playercreateinfo_bars` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `button` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `action` mediumint(10) unsigned DEFAULT NULL,
  `type` tinyint(3) unsigned DEFAULT NULL,
  `misc` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`race`,`class`,`button`,`build`),
  UNIQUE KEY `unique_index` (`race`,`class`,`button`,`build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_items`
--

DROP TABLE IF EXISTS `playercreateinfo_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playercreateinfo_items` (
  `indexid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `protoid` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `slotid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `amount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`indexid`,`protoid`,`slotid`,`build`),
  UNIQUE KEY `unique_index` (`indexid`,`protoid`,`slotid`,`build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_skills`
--

DROP TABLE IF EXISTS `playercreateinfo_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playercreateinfo_skills` (
  `indexid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `skillid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `level` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxlevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`indexid`,`skillid`,`build`),
  UNIQUE KEY `unique_index` (`indexid`,`skillid`,`build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_spells`
--

DROP TABLE IF EXISTS `playercreateinfo_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playercreateinfo_spells` (
  `indexid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  PRIMARY KEY (`indexid`,`spellid`,`build`),
  UNIQUE KEY `unique_index` (`indexid`,`spellid`,`build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `points_of_interest`
--

DROP TABLE IF EXISTS `points_of_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points_of_interest` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `icon` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_name` text NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Points of interest';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `professiondiscoveries`
--

DROP TABLE IF EXISTS `professiondiscoveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professiondiscoveries` (
  `SpellId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellToDiscover` int(10) unsigned NOT NULL DEFAULT '0',
  `SkillValue` int(10) unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpellId`,`SpellToDiscover`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_poi`
--

DROP TABLE IF EXISTS `quest_poi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_poi` (
  `questId` smallint(5) unsigned NOT NULL COMMENT 'Quest ID',
  `poiId` tinyint(3) unsigned NOT NULL COMMENT 'Refers to quest_poi_points',
  `objIndex` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'Objective ID',
  `mapId` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Map ID',
  `mapAreaId` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Zone ID',
  `floorId` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Area ID',
  `unk3` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `unk4` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`questId`,`poiId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_poi_points`
--

DROP TABLE IF EXISTS `quest_poi_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_poi_points` (
  `questId` smallint(5) unsigned NOT NULL,
  `poiId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  KEY `idx_poip` (`questId`,`poiId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_properties`
--

DROP TABLE IF EXISTS `quest_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_properties` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `ZoneId` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `MinLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `questlevel` int(10) NOT NULL DEFAULT '0',
  `Type` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredRaces` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredClass` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredTradeskill` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredTradeskillValue` int(5) unsigned NOT NULL DEFAULT '0',
  `RequiredRepFaction` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredRepValue` int(10) unsigned NOT NULL DEFAULT '0',
  `LimitTime` int(10) unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `PrevQuestId` int(10) unsigned NOT NULL DEFAULT '0',
  `NextQuestId` int(10) unsigned NOT NULL DEFAULT '0',
  `srcItem` int(10) unsigned NOT NULL DEFAULT '0',
  `SrcItemCount` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(255) NOT NULL,
  `Details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Objectives` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CompletionText` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IncompleteText` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `EndText` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ObjectiveText1` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ObjectiveText2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ObjectiveText3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ObjectiveText4` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ReqItemId1` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemId2` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemId3` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemId4` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemId5` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemId6` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount1` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount2` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount3` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount4` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount5` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount6` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqKillMobOrGOId1` int(10) NOT NULL DEFAULT '0',
  `ReqKillMobOrGOId2` int(10) NOT NULL DEFAULT '0',
  `ReqKillMobOrGOId3` int(10) NOT NULL DEFAULT '0',
  `ReqKillMobOrGOId4` int(10) NOT NULL DEFAULT '0',
  `ReqKillMobOrGOCount1` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqKillMobOrGOCount2` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqKillMobOrGOCount3` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqKillMobOrGOCount4` int(10) unsigned NOT NULL DEFAULT '0',
  `ReqCastSpellId1` int(11) NOT NULL DEFAULT '0',
  `ReqCastSpellId2` int(11) NOT NULL DEFAULT '0',
  `ReqCastSpellId3` int(11) NOT NULL DEFAULT '0',
  `ReqCastSpellId4` int(11) NOT NULL DEFAULT '0',
  `ReqEmoteId1` int(10) unsigned DEFAULT '0',
  `ReqEmoteId2` int(10) unsigned DEFAULT '0',
  `ReqEmoteId3` int(10) unsigned DEFAULT '0',
  `ReqEmoteId4` int(10) unsigned DEFAULT '0',
  `RewChoiceItemId1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId5` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId6` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount5` int(10) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount6` int(10) unsigned NOT NULL DEFAULT '0',
  `RewItemId1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewItemId2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewItemId3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewItemId4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewItemCount1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewItemCount2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewItemCount3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewItemCount4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewRepFaction1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewRepFaction2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewRepFaction3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewRepFaction4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewRepFaction5` int(10) unsigned NOT NULL DEFAULT '0',
  `RewRepFaction6` int(10) unsigned NOT NULL DEFAULT '0',
  `RewRepValue1` int(10) NOT NULL DEFAULT '0',
  `RewRepValue2` int(10) NOT NULL DEFAULT '0',
  `RewRepValue3` int(10) NOT NULL DEFAULT '0',
  `RewRepValue4` int(10) NOT NULL DEFAULT '0',
  `RewRepValue5` int(10) NOT NULL DEFAULT '0',
  `RewRepValue6` int(10) NOT NULL DEFAULT '0',
  `RewRepLimit` int(10) unsigned NOT NULL DEFAULT '0',
  `RewMoney` int(10) NOT NULL DEFAULT '0',
  `RewXP` int(10) unsigned NOT NULL DEFAULT '0',
  `RewSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `CastSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `MailTemplateId` int(10) unsigned NOT NULL DEFAULT '0',
  `MailDelaySecs` int(10) unsigned NOT NULL DEFAULT '0',
  `MailSendItem` int(10) unsigned NOT NULL DEFAULT '0',
  `PointMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `PointX` float NOT NULL DEFAULT '0',
  `PointY` float NOT NULL DEFAULT '0',
  `PointOpt` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardMoneyAtMaxLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `ExploreTrigger1` int(10) unsigned NOT NULL DEFAULT '0',
  `ExploreTrigger2` int(10) unsigned NOT NULL DEFAULT '0',
  `ExploreTrigger3` int(10) unsigned NOT NULL DEFAULT '0',
  `ExploreTrigger4` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredOneOfQuest` longtext NOT NULL,
  `RequiredQuest1` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredQuest2` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredQuest3` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredQuest4` int(10) unsigned NOT NULL DEFAULT '0',
  `RemoveQuests` longtext NOT NULL,
  `ReceiveItemId1` int(10) unsigned NOT NULL DEFAULT '0',
  `ReceiveItemId2` int(10) unsigned NOT NULL DEFAULT '0',
  `ReceiveItemId3` int(10) unsigned NOT NULL DEFAULT '0',
  `ReceiveItemId4` int(10) unsigned NOT NULL DEFAULT '0',
  `ReceiveItemCount1` int(10) unsigned NOT NULL DEFAULT '0',
  `ReceiveItemCount2` int(10) unsigned NOT NULL DEFAULT '0',
  `ReceiveItemCount3` int(10) unsigned NOT NULL DEFAULT '0',
  `ReceiveItemCount4` int(10) unsigned NOT NULL DEFAULT '0',
  `IsRepeatable` int(11) NOT NULL DEFAULT '0',
  `bonushonor` int(10) unsigned NOT NULL DEFAULT '0',
  `bonusarenapoints` int(10) unsigned NOT NULL DEFAULT '0',
  `rewardtitleid` int(10) unsigned NOT NULL DEFAULT '0',
  `rewardtalents` int(10) unsigned NOT NULL DEFAULT '0',
  `suggestedplayers` int(10) unsigned NOT NULL DEFAULT '0',
  `detailemotecount` int(10) unsigned NOT NULL DEFAULT '0',
  `detailemote1` int(10) unsigned NOT NULL DEFAULT '0',
  `detailemote2` int(10) unsigned NOT NULL DEFAULT '0',
  `detailemote3` int(10) unsigned NOT NULL DEFAULT '0',
  `detailemote4` int(10) unsigned NOT NULL DEFAULT '0',
  `detailemotedelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `detailemotedelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `detailemotedelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `detailemotedelay4` int(10) unsigned NOT NULL DEFAULT '0',
  `completionemotecnt` int(10) unsigned NOT NULL DEFAULT '0',
  `completionemote1` int(10) unsigned NOT NULL DEFAULT '0',
  `completionemote2` int(10) unsigned NOT NULL DEFAULT '0',
  `completionemote3` int(10) unsigned NOT NULL DEFAULT '0',
  `completionemote4` int(10) unsigned NOT NULL DEFAULT '0',
  `completionemotedelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `completionemotedelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `completionemotedelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `completionemotedelay4` int(10) unsigned NOT NULL DEFAULT '0',
  `completeemote` int(10) unsigned NOT NULL DEFAULT '0',
  `incompleteemote` int(10) unsigned NOT NULL DEFAULT '0',
  `iscompletedbyspelleffect` int(10) unsigned NOT NULL DEFAULT '0',
  `RewXPId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`build`),
  UNIQUE KEY `unique_index` (`entry`,`build`) USING BTREE,
  KEY `ReqKillMobOrGOId` (`ReqKillMobOrGOId1`,`ReqKillMobOrGOId2`,`ReqKillMobOrGOId3`,`ReqKillMobOrGOId4`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Quests System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recall`
--

DROP TABLE IF EXISTS `recall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recall` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `min_build` int(6) NOT NULL DEFAULT '12340',
  `max_build` int(6) NOT NULL DEFAULT '12340',
  `name` varchar(100) NOT NULL,
  `MapId` int(10) unsigned NOT NULL DEFAULT '0',
  `positionX` float NOT NULL DEFAULT '0',
  `positionY` float NOT NULL DEFAULT '0',
  `positionZ` float NOT NULL DEFAULT '0',
  `Orientation` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`min_build`),
  UNIQUE KEY `UNIQUE` (`name`),
  UNIQUE KEY `unique_index` (`id`,`min_build`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=811 DEFAULT CHARSET=utf8 COMMENT='Tele Command';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputation_creature_onkill`
--

DROP TABLE IF EXISTS `reputation_creature_onkill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reputation_creature_onkill` (
  `creature_id` int(30) NOT NULL,
  `faction_change_alliance` int(30) NOT NULL,
  `faction_change_horde` int(30) NOT NULL,
  `change_value` int(30) NOT NULL,
  `rep_limit` int(30) NOT NULL,
  UNIQUE KEY `creature_id_2` (`creature_id`,`faction_change_alliance`,`faction_change_horde`),
  KEY `creature_id` (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputation_faction_onkill`
--

DROP TABLE IF EXISTS `reputation_faction_onkill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reputation_faction_onkill` (
  `faction_id` smallint(5) unsigned NOT NULL,
  `change_factionid_alliance` smallint(5) unsigned NOT NULL DEFAULT '0',
  `change_deltamin_alliance` mediumint(10) NOT NULL DEFAULT '0',
  `change_deltamax_alliance` mediumint(10) NOT NULL DEFAULT '0',
  `change_factionid_horde` smallint(5) unsigned NOT NULL DEFAULT '0',
  `change_deltamin_horde` mediumint(10) NOT NULL DEFAULT '0',
  `change_deltamax_horde` mediumint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`faction_id`,`change_factionid_alliance`,`change_factionid_horde`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputation_instance_onkill`
--

DROP TABLE IF EXISTS `reputation_instance_onkill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reputation_instance_onkill` (
  `mapid` smallint(5) unsigned NOT NULL,
  `mob_rep_reward` mediumint(10) NOT NULL DEFAULT '0',
  `mob_rep_limit` mediumint(10) NOT NULL DEFAULT '0',
  `boss_rep_reward` mediumint(10) NOT NULL DEFAULT '0',
  `boss_rep_limit` mediumint(10) NOT NULL DEFAULT '0',
  `faction_change_alliance` smallint(5) unsigned NOT NULL,
  `faction_change_horde` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`mapid`,`faction_change_alliance`,`faction_change_horde`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_area`
--

DROP TABLE IF EXISTS `spell_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_area` (
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aura_spell` mediumint(8) NOT NULL DEFAULT '0',
  `racemask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `autocast` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`quest_start_active`,`aura_spell`,`racemask`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_custom_override`
--

DROP TABLE IF EXISTS `spell_custom_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_custom_override` (
  `spell_id` int(10) NOT NULL DEFAULT '0',
  `rank` tinyint(3) DEFAULT NULL,
  `assign_on_target_flag` int(10) DEFAULT NULL,
  `assign_from_caster_on_self_flag` int(10) DEFAULT NULL,
  `assign_self_cast_only` tinyint(1) DEFAULT NULL,
  `assign_c_is_flag` int(10) DEFAULT NULL,
  `coef_flags` bigint(30) DEFAULT NULL,
  `coef_Dspell` float DEFAULT NULL,
  `coef_Otspell` float DEFAULT NULL,
  `proc_on_namehash` bigint(30) DEFAULT NULL,
  `proc_flags` bigint(30) DEFAULT NULL,
  `proc_target_selfs` tinyint(1) DEFAULT NULL,
  `proc_chance` int(30) DEFAULT NULL,
  `proc_charges` int(30) DEFAULT NULL,
  `proc_interval` int(30) DEFAULT NULL,
  `proc_effect_trigger_spell_0` int(10) DEFAULT NULL,
  `proc_effect_trigger_spell_1` int(10) DEFAULT NULL,
  `proc_effect_trigger_spell_2` int(10) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_disable`
--

DROP TABLE IF EXISTS `spell_disable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_disable` (
  `spellid` mediumint(10) unsigned NOT NULL,
  `replacement_spellid` mediumint(10) unsigned NOT NULL,
  PRIMARY KEY (`spellid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_disable_trainers`
--

DROP TABLE IF EXISTS `spell_disable_trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_disable_trainers` (
  `spellid` int(30) NOT NULL,
  `replacement_spellid` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Trainer System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_effects_override`
--

DROP TABLE IF EXISTS `spell_effects_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_effects_override` (
  `spellId` int(30) unsigned NOT NULL DEFAULT '0',
  `EffectID` int(30) unsigned NOT NULL DEFAULT '0',
  `Disable` int(30) unsigned NOT NULL DEFAULT '0',
  `Effect` int(30) unsigned NOT NULL DEFAULT '0',
  `BasePoints` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `ApplyAuraName` int(30) unsigned NOT NULL DEFAULT '0',
  `SpellGroupRelation` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `MiscValue` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `TriggerSpell` int(30) unsigned NOT NULL DEFAULT '0',
  `ImplicitTargetA` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ImplicitTargetB` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectCustomFlag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_teleport_coords`
--

DROP TABLE IF EXISTS `spell_teleport_coords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_teleport_coords` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Teleport Spell ID',
  `name` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mapId` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0' COMMENT 'Destination x coord',
  `position_y` float NOT NULL DEFAULT '0' COMMENT 'Destination y coord',
  `position_z` float NOT NULL DEFAULT '0' COMMENT 'Destination z coord',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='World System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spellclickspells`
--

DROP TABLE IF EXISTS `spellclickspells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spellclickspells` (
  `CreatureID` int(10) unsigned NOT NULL,
  `SpellID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`CreatureID`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spelloverride`
--

DROP TABLE IF EXISTS `spelloverride`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spelloverride` (
  `overrideId` int(10) unsigned NOT NULL DEFAULT '0',
  `spellId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`overrideId`,`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spelltargetconstraints`
--

DROP TABLE IF EXISTS `spelltargetconstraints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spelltargetconstraints` (
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier of the spell',
  `TargetType` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Type of the target ( 0 = Creature, 1 = Gameobject )',
  `TargetID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier of the target',
  PRIMARY KEY (`SpellID`,`TargetType`,`TargetID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `totemdisplayids`
--

DROP TABLE IF EXISTS `totemdisplayids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `totemdisplayids` (
  `race` smallint(2) NOT NULL,
  `build` smallint(8) NOT NULL DEFAULT '12340',
  `totem` int(8) NOT NULL,
  `displayid` int(8) DEFAULT NULL,
  PRIMARY KEY (`race`,`build`,`totem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trainer_defs`
--

DROP TABLE IF EXISTS `trainer_defs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer_defs` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `required_skill` int(11) unsigned NOT NULL DEFAULT '0',
  `required_skillvalue` int(11) unsigned DEFAULT '0',
  `req_class` int(11) unsigned NOT NULL DEFAULT '0',
  `RequiredRace` int(11) NOT NULL DEFAULT '0',
  `RequiredReputation` int(11) NOT NULL DEFAULT '0',
  `RequiredReputationValue` int(11) NOT NULL DEFAULT '0',
  `trainer_type` int(11) unsigned NOT NULL DEFAULT '0',
  `trainer_ui_window_message` text,
  `can_train_gossip_textid` int(11) NOT NULL,
  `cannot_train_gossip_textid` int(11) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trainer System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trainer_spells`
--

DROP TABLE IF EXISTS `trainer_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer_spells` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `cast_spell` int(11) unsigned NOT NULL DEFAULT '0',
  `learn_spell` int(11) unsigned NOT NULL,
  `spellcost` int(11) unsigned NOT NULL DEFAULT '0',
  `reqspell` int(11) unsigned NOT NULL DEFAULT '0',
  `reqskill` int(11) unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` int(11) unsigned NOT NULL DEFAULT '0',
  `reqlevel` int(11) unsigned NOT NULL DEFAULT '0',
  `deletespell` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`cast_spell`,`learn_spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trainer System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transport_creatures`
--

DROP TABLE IF EXISTS `transport_creatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_creatures` (
  `guid` int(16) NOT NULL AUTO_INCREMENT COMMENT 'GUID of NPC on transport - not the same as creature.guid',
  `transport_entry` int(8) NOT NULL COMMENT 'Transport entry',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `npc_entry` int(8) NOT NULL COMMENT 'NPC entry',
  `TransOffsetX` float NOT NULL DEFAULT '0',
  `TransOffsetY` float NOT NULL DEFAULT '0',
  `TransOffsetZ` float NOT NULL DEFAULT '0',
  `TransOffsetO` float NOT NULL DEFAULT '0',
  `emote` int(16) NOT NULL,
  PRIMARY KEY (`guid`,`transport_entry`,`build`),
  UNIQUE KEY `entry` (`transport_entry`,`guid`),
  UNIQUE KEY `unique_index` (`guid`,`transport_entry`,`build`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transport_data`
--

DROP TABLE IF EXISTS `transport_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_data` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `name` text,
  `period` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`build`),
  UNIQUE KEY `unique_index` (`entry`,`build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicle_accessories`
--

DROP TABLE IF EXISTS `vehicle_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_accessories` (
  `creature_entry` int(10) unsigned NOT NULL DEFAULT '0',
  `accessory_entry` int(10) unsigned NOT NULL DEFAULT '0',
  `seat` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_entry`,`seat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_restrictions`
--

DROP TABLE IF EXISTS `vendor_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_restrictions` (
  `entry` int(10) unsigned NOT NULL,
  `racemask` int(11) NOT NULL DEFAULT '-1',
  `classmask` int(11) NOT NULL DEFAULT '-1',
  `reqrepfaction` int(10) unsigned NOT NULL DEFAULT '0',
  `reqrepfactionvalue` int(10) unsigned NOT NULL DEFAULT '0',
  `canbuyattextid` int(10) unsigned NOT NULL DEFAULT '0',
  `cannotbuyattextid` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0 - check for all values, 1 - classic mount vendor',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `item` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `max_amount` int(11) NOT NULL DEFAULT '0',
  `inctime` bigint(20) NOT NULL DEFAULT '0',
  `extended_cost` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `entry` (`entry`,`item`,`extended_cost`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='NPC System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather` (
  `zoneId` int(11) unsigned NOT NULL DEFAULT '0',
  `high_chance` int(11) unsigned NOT NULL DEFAULT '0',
  `high_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'High chance weather type',
  `med_chance` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Must be < than high_chance',
  `med_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Medium chance weather type',
  `low_chance` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Must be < than med_chance',
  `low_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Low chance weather type',
  PRIMARY KEY (`zoneId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wordfilter_character_names`
--

DROP TABLE IF EXISTS `wordfilter_character_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordfilter_character_names` (
  `regex_match` varchar(500) NOT NULL,
  `regex_ignore_if_matched` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`regex_match`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wordfilter_chat`
--

DROP TABLE IF EXISTS `wordfilter_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordfilter_chat` (
  `regex_match` varchar(500) NOT NULL,
  `regex_ignore_if_matched` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`regex_match`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `world_db_version`
--

DROP TABLE IF EXISTS `world_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world_db_version` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `LastUpdate` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worldbroadcast`
--

DROP TABLE IF EXISTS `worldbroadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worldbroadcast` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `interval` int(3) NOT NULL DEFAULT '1' COMMENT 'Time in minutes',
  `random_interval` int(3) NOT NULL DEFAULT '0' COMMENT 'Random time in minutes (interval + rand(random_interval)',
  `text` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Text to worldbroadcast',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worldmap_info`
--

DROP TABLE IF EXISTS `worldmap_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worldmap_info` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '12340',
  `screenid` int(10) unsigned DEFAULT '0',
  `type` int(10) unsigned DEFAULT '0',
  `maxplayers` int(10) unsigned DEFAULT '0',
  `minlevel` int(10) unsigned DEFAULT '1',
  `minlevel_heroic` int(10) unsigned NOT NULL DEFAULT '0',
  `repopx` float DEFAULT '0',
  `repopy` float DEFAULT '0',
  `repopz` float DEFAULT '0',
  `repopentry` int(10) unsigned DEFAULT '0',
  `area_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `cooldown` int(10) unsigned NOT NULL DEFAULT '0',
  `lvl_mod_a` int(10) unsigned NOT NULL DEFAULT '0',
  `required_quest_A` int(10) unsigned NOT NULL DEFAULT '0',
  `required_quest_H` int(10) unsigned NOT NULL DEFAULT '0',
  `required_item` int(10) unsigned NOT NULL DEFAULT '0',
  `heroic_keyid_1` int(30) NOT NULL DEFAULT '0',
  `heroic_keyid_2` int(30) NOT NULL DEFAULT '0',
  `viewingDistance` float NOT NULL DEFAULT '80',
  `required_checkpoint` int(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`build`),
  UNIQUE KEY `unique_index` (`entry`,`build`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='World System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worldstate_templates`
--

DROP TABLE IF EXISTS `worldstate_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worldstate_templates` (
  `map` int(10) unsigned NOT NULL DEFAULT '0',
  `zone` int(10) unsigned NOT NULL DEFAULT '0',
  `field` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`,`zone`,`field`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worldstring_tables`
--

DROP TABLE IF EXISTS `worldstring_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worldstring_tables` (
  `entry` int(11) NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zoneguards`
--

DROP TABLE IF EXISTS `zoneguards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoneguards` (
  `zone` int(10) unsigned NOT NULL,
  `horde_entry` int(10) unsigned NOT NULL DEFAULT '0',
  `alliance_entry` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`zone`,`horde_entry`,`alliance_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='World System';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-05  7:54:10
