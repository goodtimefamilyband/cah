CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
	created TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_users_username_password ON users (username, password);
CREATE INDEX idx_users_username ON users (username);

CREATE TABLE user_proxy (
	id INT PRIMARY KEY AUTO_INCREMENT,
	userid INT DEFAULT NULL,
	created TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_user_proxy_userid ON user_proxy (userid);

CREATE TABLE roles (
	id INT PRIMARY KEY AUTO_INCREMENT,
	rolename VARCHAR(255) NOT NULL
);

CREATE TABLE role_user (
	userid INT NOT NULL,
	roleid INT NOT NULL,
	PRIMARY KEY(userid, roleid),
	FOREIGN KEY (userid) REFERENCES users (id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (roleid) REFERENCES roles (id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE game (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE player (
	id INT PRIMARY KEY AUTO_INCREMENT,
	gameid INT NOT NULL,
	userid INT NOT NULL,
	FOREIGN KEY (gameid) REFERENCES game (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (userid) REFERENCES user_proxy (id)
    	ON UPDATE CASCADE
    	ON DELETE CASCADE
);

CREATE TABLE card (
	id INT PRIMARY KEY AUTO_INCREMENT,
	ctext TEXT,
	isblack BIT,
	enabled BIT
);

CREATE TABLE card_instance (
	cardid INT NOT NULL,
	gameid INT NOT NULL,
	owner INT DEFAULT NULL,
	available BIT DEFAULT 1,
	deck_order INT NOT NULL,
	PRIMARY KEY(cardid, gameid),
	FOREIGN KEY (cardid) REFERENCES card (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (gameid) REFERENCES game (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO roles (rolename) VALUES ('ROLE_USER');
