CREATE TABLE smrpg_players (
	player_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(64) NOT NULL DEFAULT ' ',
	steamid INTEGER DEFAULT NULL UNIQUE,
	level INTEGER DEFAULT '1',
	experience INTEGER DEFAULT '0',
	credits INTEGER DEFAULT '0',
	showmenu INTEGER DEFAULT '1',
	fadescreen INTEGER DEFAULT '1',
	lastseen INTEGER DEFAULT '0',
	lastreset INTEGER DEFAULT '0'
) DEFAULT CHARSET=utf8;

CREATE TABLE smrpg_upgrades (
	upgrade_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	shortname VARCHAR(32) UNIQUE NOT NULL,
	date_added INTEGER
) DEFAULT CHARSET=utf8;

CREATE TABLE smrpg_player_upgrades (
	player_id INTEGER,
	upgrade_id INTEGER,
	purchasedlevel INTEGER NOT NULL,
	selectedlevel INTEGER NOT NULL,
	enabled INTEGER DEFAULT '1',
	visuals INTEGER DEFAULT '1',
	sounds INTEGER DEFAULT '1',
	PRIMARY KEY(player_id, upgrade_id),
	FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE,
	FOREIGN KEY (upgrade_id) REFERENCES upgrades(upgrade_id) ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE smrpg_settings (
	setting VARCHAR(64) PRIMARY KEY NOT NULL,
	value VARCHAR(256) NOT NULL
) DEFAULT CHARSET=utf8;

INSERT INTO smrpg_settings (setting, value) VALUES ('version', '102');