CREATE TABLE IF NOT EXISTS `people` (
  `name` varchar(200) NOT NULL,
  `age` int(3) NULL,
  `adress` varchar(200) NOT NULL,
  PRIMARY KEY (`name`)
) DEFAULT CHARSET=utf8;
INSERT INTO `people` (`name`, `age`, `adress`) VALUES ('Ali', 22, 'Jakarta');
INSERT INTO `people` (`name`, `age`, `adress`) VALUES ('Bali', 22, 'Bandung');
INSERT INTO `people` (`name`, `age`, `adress`) VALUES ('Chandra', 23, 'Jakarta');
INSERT INTO `people` (`name`, `age`, `adress`) VALUES ('Deni', 24, 'Bandung');
INSERT INTO `people` (`name`, `age`, `adress`) VALUES ('Eka', null, 'Semarang');
INSERT INTO `people` (`name`, `age`, `adress`) VALUES ('Fitrah', 21, 'Bali');
