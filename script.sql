-- head of file --
drop table if exists interactions;

create table if not exists interactions (
    drug_id SERIAL PRIMARY KEY,
    name VARCHAR(300),
    food_interactions VARCHAR(1500)
)

/copy interactions(drug_id, name, food_interactions)
from '/tmp/drug_to_food_interactions.csv'
DELIMITER ','
csv HEADER;

select * from interactions

select count(*) from interactions

select count(DISTINCT(food_interactions)) from interactions

select DISTINCT(food_interactions) from interactions

select distinct(food_interactions), count(food_interactions) from interactions
group by food_interactions
order by food_interactions desc;

select * from interactions
where food_interactions like '%Examples%';

select count(*) from interactions
where food_interactions like '%Examples%';