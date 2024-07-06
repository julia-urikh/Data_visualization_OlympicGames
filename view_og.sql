use olympics;

CREATE OR REPLACE VIEW view_olympic_games AS
select 
	p.full_name,
    p.gender,
    p.height,
    p.weight,
    gc.age, 
	nr.noc,
    nr.region_name,
	g.games_year,
    g.games_name,
    g.season,
	c.city_name,
    s.sport_name,
    e.event_name,
	m.medal_name
from games_competitor gc  
left join competitor_event ce on  ce.competitor_id = gc.id
left join medal m on ce.medal_id = m.id
left join event e on ce.event_id = e.id
left join sport s on e.sport_id = s.id
left join games g on gc.games_id = g.id
left join games_city gct on g.id = gct.games_id --  +
left join city c on gct.city_id = c.id
left join person p on gc.person_id = p.id
left join person_region pr on p.id = pr.person_id -- +
left join noc_region nr on pr.region_id = nr.id;

