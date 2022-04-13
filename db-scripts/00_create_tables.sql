PRAGMA foreign_keys = OFF;

/*************************************\
** PLATFORM
\*************************************/
DROP TABLE IF EXISTS platform;
CREATE TABLE platform (
	platform_id INTEGER NOT NULL
	,name TEXT NOT NULL
	,PRIMARY KEY(platform_id AUTOINCREMENT)
);


/*************************************\
** GENERATION
\*************************************/
DROP TABLE IF EXISTS generation;
CREATE TABLE generation (
	generation_id INTEGER NOT NULL
	,name TEXT NOT NULL
	,PRIMARY KEY(generation_id AUTOINCREMENT)
);


/*************************************\
** GAME
\*************************************/
DROP TABLE IF EXISTS game;
CREATE TABLE game (
	game_id INTEGER NOT NULL
	,name TEXT NOT NULL
	,release_date TEXT NOT NULL
	,platform_id TEXT NOT NULL
	,generation_id TEXT NOT NULL
	,PRIMARY KEY(game_id AUTOINCREMENT)
	,FOREIGN KEY(platform_id) REFERENCES platform(platform_id)
	,FOREIGN KEY(generation_id) REFERENCES generation(generation_id)
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
	,generation_id	INTEGER NOT NULL DEFAULT 0
	,is_legendary INTEGER NOT NULL DEFAULT 0
	,PRIMARY KEY(pokemon_id AUTOINCREMENT)
	,FOREIGN KEY(generation_id) REFERENCES generation(generation_id)	
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


/*************************************\
** REGION_ROUTE_XREF
\*************************************/
DROP TABLE IF EXISTS region_route_xref;
CREATE TABLE region_route_xref (
	region_route_xref_id INTEGER NOT NULL
	,region_id INTEGER NOT NULL
	,route_id INTEGER NOT NULL
	,game_id INTEGER NOT NULL
	,PRIMARY KEY(region_route_xref_id AUTOINCREMENT)
	,FOREIGN KEY(region_id) REFERENCES region(region_id)
	,FOREIGN KEY(route_id) REFERENCES route(route_id)	
	,FOREIGN KEY(game_id) REFERENCES game(game_id)		
);


/*************************************\
** REGION_ROUTE_XREF
\*************************************/
DROP TABLE IF EXISTS pokemon_spawn_rate;
CREATE TABLE pokemon_spawn_rate (
	pokemon_spawn_rate_id INTEGER NOT NULL 
	,pokemon_id INTEGER NOT NULL
	,region_route_xref_id INTEGER NOT NULL
	,location TEXT NOT NULL
	,min_level INTEGER NOT NULL
	,max_level INTEGER NULL
	,rate NUMERIC(3,3) NOT NULL
	,PRIMARY KEY(pokemon_spawn_rate_id AUTOINCREMENT)
	,FOREIGN KEY(pokemon_id) REFERENCES pokemon(pokemon_id)	
	,FOREIGN KEY(region_route_xref_id) REFERENCES region_route_xref(region_route_xref_id)			
);


PRAGMA foreign_keys = ON;
