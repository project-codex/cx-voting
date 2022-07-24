ALTER TABLE `players` ADD COLUMN `hasvoted` TINYINT NULL DEFAULT '0'

CREATE TABLE IF NOT EXISTS `election` (
  `name` varchar(50) DEFAULT NULL,
  `party` varchar(50) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL
)
