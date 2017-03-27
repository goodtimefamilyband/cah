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

INSERT INTO card (ctext, isblack, enabled) VALUES ("Coat hanger abortions", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Man meat", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Autocannibalism", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Vigorous jazz hands", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Flightless birds", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Pictures of boobs", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Doing the right thing", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Hunting accidents", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A cartoon camel enjoying the smooth, refreshing taste of a cigarette", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The violation of our most basic human rights", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Viagra", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Self-loathing", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Spectacular abs", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("An honest cop with nothing left to lose", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Abstinence", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A balanced breakfast", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Mountain Dew Code Red", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Concealing a boner", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Roofies", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Glenn Beck convulsively vomiting as a brood of crab spiders hatches in his brain and erupts from his tear ducts", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Tweeting", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Big Bang", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Amputees", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dr. Marting Luther King Jr", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Former President George W. Bush", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Being marginalized", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Smegma", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Laying an egg", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Cuddling", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Aaron Burr", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Pope", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A bleached asshole", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Horse meat", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Genital piercings", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Fingering", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Elderly Japanese men", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Stranger danger", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Fear itself", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Science", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Praying the gay away", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Same-sex ice dancing", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The terrorists", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Making sex at her", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("German dungeon porn", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Bingeing and purging", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Ethnic cleansing", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Cheating in the Special Olympics", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Nickelback", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Heteronormativity", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("William Shatner", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Making a pouty face", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Chainsaws for hands", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The placenta", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The profoundly handicapped", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Tom Cruise", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Object permanence", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Goblins", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("An icepick lobotomy", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Arnold Schwarzenegger", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Hormone injections", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A falcon with a cap on its head", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Foreskin", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dying", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Stunt doubles", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The invisible hand", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Jew-fros", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A really cool hat", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Flash flooding", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Flavored condoms", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dying of disentery", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sexy pillow fights", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Three-Fifths compromise", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A sad handjob", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Men", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Historically black colleges", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sean Penn", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Heartwarming orphans", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Waterboarding", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The clitoris", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Vikings", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Friends who eat all the snacks", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Underground Railroad", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Pretending to care", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Raptor attacks", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A micropenis", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A Gypsy curse", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Agriculture", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Bling", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A clandestine butt scratch", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The South", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sniffing glue", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Consultants", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("My humps", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Geese", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Being a dick to children", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Party poopers", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sunshine and rainbows", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("YOU MUST CONSTRUCT ADDITIONAL PYLONS", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Mutually-assured destruction", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Heath Ledger", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sexting", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("An Oedipus complex", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Eating all of the cookies before the AIDS bake-sale", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A sausage festival", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Michael Jackson", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Skeletor", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Chivalry", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sharing needles", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Being rich", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Muzzy", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Count Chocula", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Spontaneous human combustion", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("College", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Necrophilia", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Chinese gymnastics team", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Global warming", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Farting and walking away", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Cookie Monster devouring the Eucharist wafers", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Stifling a giggle at the mention of Hutus and Tutsis", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Penis envy", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Letting yourself go", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("White people", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dick Cheney", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Leaving an awkward voicemail", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Yeast", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Natural selection", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Masturbation", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Twinkies", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A LAN party", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Opposable thumbs", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A grande sugar-free iced soy caramel macchiato", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Soiling oneself", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A sassy black woman", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sperm whales", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Teaching a robot to love", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Scrubbing under the folds", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A drive-by shooting", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Whipping it out", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Panda sex", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Catapults", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Will Smith", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Toni Morrison's vagina", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Five-Dollar Foot-longs", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Land mines", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A sea of troubles", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A zesty breakfast burrito", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Christopher Walken", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Friction", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Balls", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("AIDS", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The KKK", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Figgy pudding", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Seppuku", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Marky Mark and the Funky Bunch", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Gandhi", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dave Matthews Band", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Preteens", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The token minority", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Friends with benefits", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Re-gifting", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Pixelated bukkake", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Substitute teachers", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Take-backsies", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A thermonuclear detonation", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Tempur-Pedic Swedish Sleep System", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Waiting 'til marriage", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A tiny horse", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A can of whoop-ass", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dental dams", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Feeding Rosie O'Donnell", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Old-people smell", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Genghis Khan", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Authentic Mexican cuisine", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Oversized lollipops", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Garth Brooks", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Keanu Reeves", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Drinking alone", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The American Dream", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Taking off your shirt", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Giving 110%", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Flesh-eating bacteria", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Child abuse", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A cooler full of organs", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A moment of silence", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Rapture", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Keeping Christ in Chrismas", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Robocop ", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("That one gay Teletubby", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sweet, sweet vengeance", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Fancy Feast", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Pooping back and forth. Forever.", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Being a motherfucking sorcerer", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Jewish fraternities", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Edible underpants", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Poor people", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("All-you-can-eat shrimps for $4.99", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Britney Spears at 55", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("That thing that electrocutes your abs", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The folly of man", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Fiery poops", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Cards Against Humanity", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A murder most foul", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Me time", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The inevitable heat death of the universe", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Nocturnal emissions", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Daddy issues", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The hardworking Mexican", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Natalie Portman", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Waking up half-naked in a Denny's parking lot", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Nipple blades", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Assless chaps", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Full frontal nudity", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Hulk Hogan", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Passive-aggression", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Ronald Reagan", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Vehicular manslaughter", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Menstruation", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Pulling out", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Picking up girls at the abortion clinic", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The homosexual agenda", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Holy Bible", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("World peace", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dropping a chandelier on your enemies and riding the rope up", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Testicular torsion", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The milk man", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A time-travel paradox", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Hot Pockets", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Guys who don't call", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Eating the last known bison", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Darth Vader", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Scalping", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Homeless people", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Worlds of Warcraft", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Gloryholes", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Saxophone solos", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sean Connery", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("God", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Intelligent design", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The taint; the grundle, the fleshy fun-bridge", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Friendly fire", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Keg stands", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Eugenics", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A good sniff", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Lockjaw", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A neglected Tamagotchi", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The People's Elbow", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Robert Downey Jr.", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The heart of a child", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Seduction", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Smallpox blankets", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Licking things to claim them as your own", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A salty surprise", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Poorly-timed Holocaust jokes", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("My soul", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("My sex life", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Pterodactyl eggs", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Altar boys", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Forgetting the Alamo", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("72 virgins", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Raping and pillaging", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Pedophiles", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Eastern European Turbo-Folk music", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A snapping turtle biting the tip of your penis", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Pabst Blue Ribbon", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Domino's Oreo Dessert Pizza", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("My collection of high-tech sex toys", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A middle-aged man on roller skates", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Blood of Christ", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Half-assed foreplay", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Free samples", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Douchebags on their iPhones", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Hurricane Katrina", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Wearing underwear inside-out to avoid doing laundry", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Republicans", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The glass ceiling", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A foul mouth", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Jerking off into a pool of children's tears", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Getting really high", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The deformed", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Michelle Obama's arms", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Explosions", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Übermensch", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Donald Trump", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sarah Palin", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Attitude", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("This answer is postmodern", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Crumpets with the Queen", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Frolocking", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Team-building exercises", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Repression", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Road head", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A bag of magic beans", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("An asymmetric boob job", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dead parents", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Public ridicule", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A mating display", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A mime having a stroke", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Stephen Hawking talking dirty", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("African Children", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Mouth herpes", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Overcompensation", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Bill Nye the Science Guy", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Bitches", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Italians", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Have some more kugel", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A windmill full of corpses", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Her Royal Highness, Queen Elizabeth II", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Crippling debt", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Adderall", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A stray pube", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Shorties and blunts", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Passing a kidney stone", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Prancing", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Leprosy", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A brain tumor", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Bees ?", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Puppies !", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Cockfights", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Kim Jong-Il", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Hope", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("9oz. of sweet Mexican black-tar heroin", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Incest", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Grave robbing", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Asians who aren't good at math", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Alcoholism", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("(I am doing Kegels right now.)", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Justin Bieber", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Jews", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Bestiality", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Winking at old people", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Drum circles", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Kids with ass cancer", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Loose lips", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Auschwitz", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Civilian casualties", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Inappropriate yodeling", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Tangled Slinkys", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Being on fire", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Thong Song", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A vajazzled vagina", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Riding off into the sunset", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Exchanging pleasantries", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("My relationship status", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Shaquille O'Neal's acting career", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Being fabulous", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Lactation", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Not reciprocating oral sex", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sobbing into a Hungry-Man Frozen Dinner", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("My genitals", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Date rape", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Ring Pops", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("GoGurt", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Judge Judy", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Lumberjack fantasies", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The gays", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Scientology", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Estrogen", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Police brutality", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Passable transvestites", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Virginia Tech Massacre", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Tiger Woods", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dick Fingers", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Racism", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Glenn Beck being harried by a swarm of buzzards", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Surprise sex !", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Classist undertones", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Booby-trapping the house to foil burglars", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("New Age music", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("PCP", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A lifetime of sadness", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Doin't it in the butt", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Swooping", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Hamburglar", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Tentacle porn", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A hot mess", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Too much hair gel", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A look-see", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Not giving a shit about the Third World", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("American Gladiators", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Kool-Aid Man", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Mr. Snuffleupagus", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Barack Obama", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Golden showers", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Wiping her butt", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Queefing", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Getting drunk on mouthwash", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A M. Night Shyamalan plot twist", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A robust mongoloid", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Nazis", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("White privilege", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("An erection that lasts longer than four hours", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A disappointing birthday party", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Puberty", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Two midgets shitting into a bucket", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Wifely duties", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The forbidden fruit", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Getting so angry that you pop a boner", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Sexual tension", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Third base", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A gassy antelope", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Those times when you get sand in your vagina", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A Super Soaker full of cat pee", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Muhammad (Praise Be Unto Him)", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Racially-biased SAT questions", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Porn stars", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A fetus", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Obesity", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("When you fart and a little bit comes out", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Oompa-Loompas", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("BATMAN!!!", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Black people", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Tasteful sideboob", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Hot people", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Grandma", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Cooping a feel", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Trail of Tears", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Famine", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Finger painting", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The miracle of childbirth", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Goats eating cans", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A monkey smoking a cigar", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Faith healing", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Parting the Red Sea", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dead babies", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Amish", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Impotence", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Child beauty pageants", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Centaurs", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("AXE Body Spray", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Kanye West", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Women's suffrage", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Children on leashes", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Harry Potter erotica", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Dance of the Sugar Plum Fairy", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Lance Armstrong's missing testicle", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dwarf tossing", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Mathletes", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Lunchables", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Women in yogurt commercials", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("John Wilkes Booth", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Powerful thighs", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Mr Clean, right behind you", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Multiple stab wounds", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Cybernetic enhancements", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Serfdom", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Another goddamn vampire movie", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Glenn Beck catching his scrotum on a curtain hook", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A big hoopla about nothing", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Peeing a little bit", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Hustle", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Ghosts", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Bananas in Pajamas", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Active listening", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Dry heaving", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Kamikaze pilots", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Force", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Anal beads", false, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The Make-A-Wish Foundation", false, true);

INSERT INTO card (ctext, isblack, enabled) VALUES ("____ ? There's a app for that.", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Why can't I sleep at night ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's that smell ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("I got 99 problems but _____ ain't one.", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Who stole the cookies from the cookie jar ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's the next Happy Meal toy ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Anthropologists have recently discovered a primitive tribe that worships ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("It's a pity that kids these days are all getting involved with ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("During Picasso's often-overlooked Brown Period, he produced hundreds of paintings of ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Alternative medecine is now embracing the curative powers of ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("And the Academy Award for ____ goes to ____ (2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's that sound ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What ended my last relationship ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("MTV's new reality show features eight washed-up celebrities living with ____ ", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("I drink to forget ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("I'm sorry Professor, but I couldn't complete my homework because of ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What is Batman's guilty pleasure ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("This is the way the worlds ends, Not with a bang but with ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's a girl's best friend ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("TSA guidelines now prohibits ____ on airplanes.", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("____. This is how I die", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("For my next trick, I will pull ____ out of ____ (2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("In the new Disney Channel Original Movie, Hannah Montana struggles with ____ for the first time.", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("____ is a slippery slope that leads to ____ (2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What does Dick Cheney prefer ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("I wish I hadn't lost the instruction manual for ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Instead of coal, Santa now gives the bad children ____.", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's the most emo ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("In 1000 years, when paper money is but a distant memory, ____ will be our currency.", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's the next superhero/sidekick duo ? (2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("In M. Night Shyamalan's new movie, Bruce Willis discovers that ____ had really been ___ all along (2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("A romantic, candlelit dinner would be incomplete without ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("_____. Betcha can't have just one!", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("White people like ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("____. High five, bro.", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Next from J.K. Rowling: Harry Potter and the Chamber of ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("BILLY MAYS HERE FOR", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("In a world savaged by ____, our only solace is _____(2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("War! What is it good for ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("During sex, I like to think about ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What are my parents hiding from me ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What will always get you laid ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("When I'm in prison, I'll have ____ smuggled in.", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What did I bring back from Mexico ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What don't you want to find in your Chinese food ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What will I bring back in time to convince people that I am a powerful wizard ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("How am I maintaining my relationship status ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("____. It's a trap !", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Coming to Broadway this season,  ____: the musical.", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("While the United States raced the Soviet Union to the moon, the Mexican government funneled millions of pesos into research on ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("After Hurricane Katrina, Sean Penn brought ____ to the people of New Orleans", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Due to a PR fiasco, Walmart no longer offers ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("In his new summer comedy, Rob Schneider is ____ trapped in the body of ____ (2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Rumor has it that Vladimir Putin's favorite dish is ____ stuffed with ____ (2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("But before I kill you, Mr Bond, I must show you ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What gives me uncontrollable gas ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What do old people smell like ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The class field trip was completely ruined by ___", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("When Pharaoh remained unmoved, Moses called down a Plague of ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's my secret power ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's there a ton of in heaven ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What would grandma find disturbing, yet oddly charming ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("I never truly understood ____ until I encountered ____ (2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("The US has begun airdropping ___ to the children of Afghanistan", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What helps Obama unwind ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What did Vin Diesel eat for dinner ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("____ : Good to the last drop", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Why am I sticky ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What gets better with age ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("____: kid-tested, mother-approved", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's the crustiest ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's Teach for America using to inspire inner city student to succeed?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Studies show that lab rats navigate mazes 50% after being exposed to ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Life was difficult for cavemen before _____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Make a haiku. (draw 2, pick 3)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("I do not know with what weapons World War III will be fought, but World War IV will be fought with ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Why do I hurt all over ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What am I giving up for Lent ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("In Michael Jackson's final moments, he thought about ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("In an attempt to reach a wider audience, the Smithsonian Museum of Natural History has opened an interactive exhibit on ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("When I am President of the United States, I will create the Department of ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("LifeTime presents _____, the story of ____(2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("When I am a billionaire, I shall erect a 50-foot statue to commemorate ____", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("When I was tripping on acid, ____ turned into ____ (2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("That's right, I killed ____, How, you ask ? ____ (2)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's my anti-drug ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("____ + ____ = _____ (draw 2, pick 3)", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What never fails to liven up the party ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("What's the new fad diet ?", true, true);
INSERT INTO card (ctext, isblack, enabled) VALUES ("Major League Baseball has banned ____ for giving players an unfair advantage.", true, true);
