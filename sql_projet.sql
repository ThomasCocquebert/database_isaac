DROP TABLE if EXISTS objet, item_pool, transformation, type, consommable, trinket;

CREATE TABLE item_pool(
	id_pool int (3) primary key,
	nom varchar (25) not null
	);

CREATE TABLE transformation(
	id_transfo int (2) primary key,
	nom varchar (25) not null,
	descrip varchar (50) not null
	);

CREATE TABLE trinket(
	id_trin int (3) primary key,
	nom varchar (25) not null,
	descrip varchar (50) not null
	);

CREATE TABLE objet(
	id_obj int (3) primary key,
	nom varchar (25) not null,
	descrip varchar (50) not null,
	transfo int (2),
	pool int (2),
	foreign key (transfo) references transformation(id_transfo),
	foreign key (pool) references item_pool(id_pool)
	);
	
CREATE TABLE type(
	nom varchar (25) primary key,
	obj int (3),
	trink int (3),
	foreign key (obj) references objet(id_obj),
	foreign key (trink) references trinket(id_trin)
	);
	
CREATE TABLE consommable(
	nom varchar (25) primary key,
	descrip varchar (50) not null,
	transfo int (2),
	nom_type varchar (25) not null,
	foreign key (transfo) references transformation(id_transfo),
	foreign key (nom_type) references type(nom)
	);

INSERT INTO item_pool VALUES
(000, "BEGGAR"),
(001, "ITEM ROOM"),
(002, "SHOP"),
(003, "LIBRARY"),
(004, "CURSE ROOM"),
(005, "BOSS"),
(006, "SECRET ROOM"),
(007, "DEVIL ROOM"),
(008, "ANGEL ROOM"),
(009, "CHEST"),
(019, "ITM + CHEST"),
(017, "ITM + DEV"),
(010, "ITM + BEGG"),
(015, "ITM + BOSS"),
(150, "ITM + BOSS + BEGG"),
(020, "SHOP + BEGG"),
(050, "BOSS + BEGG"),
(238, "SHOP + LIB + ANG"),
(037, "LIB + DEV"),
(367, "LIB + SEC + DEV"),
(547, "BOSS + CUR + DEV"),
(013, "ITM + LIB"),
(018, "ITM + ANG"),
(016, "ITM + SEC"),
(012, "ITM + SHOP"),


INSERT INTO objet VALUES
(1, "The Sad Onion", "Tears up", null, 001), 
(2, "The Inner Eye", "Triple Shot", null, 001),
(3, "Sponn Bender", "Homing shots", null, 001),
(4, "Cricket's Head", "DMG up", null, 019), 
(5, "My Reflection", "Boomerang tears", null, 001),
(6, "Number One", "Tears up", null, 001),
(7, "Blood of The Martyr", "DMG up", null, 001),
(8, "Brother Bobby", "Friends 'till the end", null, 017), 
(9, "Skatole", "Fly love", null, null),
(10, "Halo of Flies", "Projectile protection", null, 010), 
(11, "1Up", "Extra Life", null, 006), 
(12, "Magic Mushroom", "All stats up!", null, 015), 
(13, "The Virus", "Poison touch", null, 010),
(14, "Roid Rage", "Speed and range up", null, 150),
(15, "<3", "HP up", null, 015),
(16, "Raw Liver", "HP up", null, 006),
(17, "Skeleton Key", "99 keys", null, 006),
(18, "A Dollar", "$$$", null, null),
(19, "BOOM!", "10 bombs", null, 010),
(20, "Transcendence", "We all float down here...", null, 006),
(21, "The Compass", "The end is near", null, 020),
(22, "Lunch", "HP up", null, 050),
(23, "Dinner", "HP up", null, 050),
(24, "Dessert", "HP up", null, 050),
(25, "Breakfast", "Hp up", null, 050),
(26, "Rotten Meat", "Hp up", null, 050),
(27, "Wooden Spoon", "Speed up", null, 005),
(28, "The Belt", "Speed up", null, 005),
(29, "Mom's Underwear", "Range up", null, 005),
(30, "Mom's Heels", "Range up", null, 005),
(31, "Mom's Lipstock", "Range up", null, 005),
(32, "Wire Coat Hanger", "Tears up", null, 005),
(33, "The Bible", "Temporary flight", null, 238),
(34, "The Book of Belial", "Temporary DMG up", null, 037),
(35, "The Necronomicon", "Mass room damage", null, 367),
(36, "The Poop", "Plop!", null, 001),
(37, "Mr. Boom", "Reusable bomb buddy", null, 010),
(38, "Tammy's Head", "Reusable tear burst", null, 009),
(39, "Mom's Bra", "Mass fear", null, 001),
(40, "Kamikaze", "Become the bomb!", null, 001),
(41, "Mom's Pad", "Gross...", null, 001),
(42, "Bob's Rotten Head", "Reusable ranged bomb", null, 019),
(44, "Teleport", "Teleport!", null, 001),
(45, "Yum Heart", "Reusable regeneration", null, 001),
(46, "Lucky Foot", "Luck up", null, 010),
(47, "Doctor's Remote", "Reusable air strike", null, 001),
(48, "Cupid's Arrow", "Piercing shots", null, 001),
(49, "Shoop Da Whoop!", "BLLLARRRRGGG!", null, 001),
(50, "Steven", "DMG up", null, null),
(51, "Pentagram", "DMG up", null, 547),
(52, "Dr. Fetus", "???", null, 001),
(53, "Magneto", "Item snatcher", null, 001),
(54, "Treasure Map", "Full visible map", null, 020),
(55, "Mom's Eye", "Eye in the back of your head", null, 001),
(56, "Lemon Mishap", "Oops...", null, 001),
(57, "Distant Admiration", null, 010),
(58, "Book of Shadows", "Temporary invincibility", null, 013),
(60, "The Ladder", "Building bridges", null, 002),
(62, "Charm of The Vampire", "Kills heal", null, 001),
(63, "The Battery", "Stores energy", null, 002),
(64, "Steam Sale", "50% off", null, 002),
(65, "Anarchist's Cookbook", "Summon bombs", null, 013),
(66, "The Hourglass", "Temporary enemy slowdown", null, 001),
(67, "Sister Maggy", "Friends 'till the end", null, 017),
(68, "Technology", "Lasers tears", null, 001),
(69, "Chocolate Milk", "Charge shots", null, 001),
(70, "Growth Hormones", "DMG up + speed up", null, 050),
(71, "Mini Mush", "Speed + range up", null, 001),
(72, "Rosary", "Faith up", null, 018),
(73, "Cube of Meat", "Gotta meat em all", null, null),
(74, "A Quarter", "+25 coins", null, 016),
(75, "PHD", "Better pills", null, 012),