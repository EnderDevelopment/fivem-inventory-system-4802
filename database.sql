CREATE TABLE IF NOT EXISTS `inventory_items` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `owner` varchar(50) NOT NULL,
    `item` varchar(50) NOT NULL,
    `count` int(11) NOT NULL,
    `metadata` text,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `inventory_items` (`owner`, `item`, `count`, `metadata`) VALUES
('player1', 'water', 5, '{}'),
('player1', 'bread', 3, '{}'),
('player2', 'phone', 1, '{"serial": "123456789"}');