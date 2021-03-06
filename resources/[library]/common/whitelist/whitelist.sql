CREATE TABLE whitelist (
  `steam_id` varchar(50) NOT NULL,
  `banned` int(11) DEFAULT NULL,
  `banned_reason` text,
  PRIMARY KEY (`steam_id`),
  UNIQUE KEY `steam_id_UNIQUE` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE whitelist ADD COLUMN `priority` INT NULL DEFAULT 100 AFTER `banned_reason`;

 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000000dd523ff', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001068cdef3', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000104f9c8a9', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001036f3eb7', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000108e7da5a', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010c391827', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010ccb8cf7', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000110943e72', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000105791fa5', 0, 1000);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000104cb2ae5', 0, 1000);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001050bea3e', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000104114ff1', 0, 1000);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010193f4b8', 0, 1000);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010785479a', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001074c374b', 0, 1000);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010a75ff99', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000011a4bfa3f', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010995e32b', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000105b04d6a', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001000f32e9', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001036e82f3', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000109819c03', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010204980e', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000106a89fea', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000101f39291', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000119e465bc', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000100a84773', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000101c60750', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000103175ba0', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000011806a433', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010ac6e014', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001060761db', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001037d9c50', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010914d6b3', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001000ac5a9', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001043c12c8', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010ee01daf', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000106fffce3', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001089164ab', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001088309a3', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001159798ba', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010d192097', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010c538601', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001014f6d0f', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000109870e4f', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000101144523', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001037648d5', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010b1cf832', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001197962c7', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010dfcbe25', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010687fe5c', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010444762d', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010015438a', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001028bccdf', 0, 1000);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001013fa3b8', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001037d4b4b', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010a766e38', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001167e08bd', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001048e1339', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000103ec3ae8', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010784cec6', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000102ad3733', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010a269de3', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001084aeb7f', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001027b298c', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000103b1bffe', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010664af2a', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010a1606ae', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010f1a9f45', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001136629ea', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010ee03503', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001086b96f7', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001003c2b8c', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010a6dc37e', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001051721b1', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010170f01b', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000108188932', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001099b606a', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000102ad1276', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010613f547', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000106ef77c0', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001055da309', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001058d9c8b', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000104384c08', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010641e891', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010a3786b6', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010dd523ff', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001089afcfc', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000104d2d027', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010aa6c5bc', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001128e1f22', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001017C0924', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000102e351e5', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000107b72515', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000101c530f2', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000104e3ae0b', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001031dcae7', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010af6665f', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010a4cfdf9', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000106973793', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000104b4a712', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001049f977b', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000105984a81', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010635395b', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000108876905', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001082b1d06', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001009f2765', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000105a07be3', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010283b1b5', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000011a93d8ac', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000105c49f88', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000103be765a', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000100edaef5', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010eaf0ad3', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000101381995', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001013df077', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000119ab11cf', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010809ca3a', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:1100001001085f7', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010494979d', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010302378d', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010a3c1c96', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010b5c4e63', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000103234d60', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000103A83fdb', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000102615ba4', 0, 1000);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:110000117a50cfc', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000011AB44DDE', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000011AA74DEC', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000011AA8CEC8', 0, 100);
 INSERT INTO whitelist (steam_id, banned, priority) VALUES ('steam:11000010002937c', 0, 100);

