CREATE TABLE IF NOT EXISTS bot_runs (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    bot_key VARCHAR(128) NOT NULL,
    strategy_key VARCHAR(128) NOT NULL,
    started_at VARCHAR(64) NOT NULL,
    finished_at VARCHAR(64) NULL,
    status VARCHAR(32) NOT NULL,
    metadata_json JSON NOT NULL,
    INDEX idx_bot_runs_bot_key (bot_key),
    INDEX idx_bot_runs_strategy_key (strategy_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
