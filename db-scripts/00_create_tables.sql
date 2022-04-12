/*************************************\
** GAME
\*************************************/
DROP TABLE IF EXISTS game;
CREATE TABLE game (
	game_id INTEGER NOT NULL
	,name TEXT NOT NULL
	,release_date TEXT NOT NULL
	,platform TEXT NOT NULL
	,generation TEXT NOT NULL
	,PRIMARY KEY(game_id AUTOINCREMENT)
);


/*************************************\
** POKEMON
\*************************************/
DROP TABLE IF EXISTS pokemon;
CREATE TABLE pokemon (
	pokemon_id INTEGER NOT NULL
	,ndex INTEGER NOT NULL
	,name TEXT NOT NULL
	,type_1 TEXT NOT NULL
	,type_2 TEXT NULL
	,total INTEGER NOT NULL
	,hp	INTEGER NOT NULL
	,attack	INTEGER NOT NULL
	,defense INTEGER NOT NULL
	,sp_attack INTEGER NOT NULL
	,sp_defense	INTEGER NOT NULL
	,speed INTEGER NOT NULL
	,generation	INTEGER NOT NULL DEFAULT '?'
	,is_legendary INTEGER NOT NULL DEFAULT 0
	,PRIMARY KEY(pokemon_id AUTOINCREMENT)
);


/*************************************\
** NATURE
\*************************************/
DROP TABLE IF EXISTS nature;
CREATE TABLE nature (
	nature_id INTEGER NOT NULL
	,name TEXT NOT NULL
	,attack	INTEGER NOT NULL
	,defense INTEGER NOT NULL
	,sp_attack INTEGER NOT NULL
	,sp_defense	INTEGER NOT NULL
	,speed INTEGER NOT NULL
	,PRIMARY KEY(nature_id AUTOINCREMENT)
);

/*************************************\
** REGION
\*************************************/
DROP TABLE IF EXISTS region;
CREATE TABLE region (
	region_id INTEGER NOT NULL
	,name TEXT NOT NULL
	,PRIMARY KEY(region_id AUTOINCREMENT)
);


/*************************************\
** REGION_GEN_XREF
\*************************************/
DROP TABLE IF EXISTS region;
CREATE TABLE region (
	region_id INTEGER NOT NULL
	,name TEXT NOT NULL
	,PRIMARY KEY(region_id AUTOINCREMENT)
);


/*************************************\
** ROUTE
\*************************************/
DROP TABLE IF EXISTS route;
CREATE TABLE route (
	route_id INTEGER NOT NULL
	,name TEXT NOT NULL
	,PRIMARY KEY(route_id AUTOINCREMENT)
);
