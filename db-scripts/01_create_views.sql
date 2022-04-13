/******************************************************\
** VIEW TO FETCH ALL POKEMON BY REGION / ROUTE
\******************************************************/
CREATE VIEW vw_pokemon_spawn_rate_by_route
AS 
SELECT 
	g.name AS Game
	,p.name AS Platform
	,gn.name AS Generation
	,rg.name AS Region
	,rt.name AS Route 
	,pk.ndex AS Pokedex
	,pk.name AS Pokemon
	,pk.type_1 AS Type1
	,pk.type_2 AS Type2
	,pk.total AS BaseTotal
	,pk.hp AS BaseHP
	,pk.attack AS BaseAttack
	,pk.defense AS BaseDefense
	,pk.sp_attack AS BaseSPAttack
	,pk.sp_defense AS BaseSPDefense
	,pk.speed AS BaseSpeed
	,psr.location AS Location
	,psr.min_level AS MinLevel
	,psr.max_level AS MaxLevel
	,psr.rate AS SpawnRate
FROM game g
INNER JOIN platform p ON p.platform_id = g.platform_id
INNER JOIN generation gn ON gn.generation_id = g.generation_id
LEFT OUTER JOIN region_route_xref rrx ON rrx.game_id = g.game_id
LEFT OUTER JOIN region rg ON rg.region_id = rrx.region_id
LEFT OUTER JOIN route rt ON rt.route_id = rrx.route_id
LEFT OUTER JOIN pokemon_spawn_rate psr ON psr.region_route_xref_id = rrx.region_route_xref_id
LEFT OUTER JOIN pokemon pk ON pk.pokemon_id = psr.pokemon_id;