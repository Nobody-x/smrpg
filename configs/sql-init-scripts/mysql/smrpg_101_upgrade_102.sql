-- rename tables to add prefix
ALTER TABLE players RENAME smrpg_players;
ALTER TABLE upgrades RENAME smrpg_upgrades;
ALTER TABLE player_upgrades RENAME smrpg_player_upgrades;
ALTER TABLE settings RENAME smrpg_settings;

-- Deletes lines that should not exist
DELETE FROM smrpg_player_upgrades WHERE player_id NOT IN (SELECT player_id FROM smrpg_players) OR upgrade_id NOT IN (SELECT upgrade_id FROM smrpg_upgrades);

-- Add foreign key constraints to avoid data pollution
ALTER TABLE smrpg_player_upgrades ADD FOREIGN KEY (player_id) REFERENCES smrpg_players(player_id) ON DELETE CASCADE;
ALTER TABLE smrpg_player_upgrades ADD FOREIGN KEY (upgrade_id) REFERENCES smrpg_upgrades(upgrade_id) ON DELETE CASCADE;

-- Update database version number
UPDATE smrpg_settings SET value = '102' WHERE setting = 'version';