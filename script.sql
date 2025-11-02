-- head of file --
drop table if exists interactions;

-- gonna need to change table; made id for drugs - new one would be for interactions, drug_id would just be int --
create table if not exists interactions (
    interaction_id SERIAL PRIMARY KEY,
    name VARCHAR(300),
    food_interactions VARCHAR(1500),
    drug_id int,
    interaction VARCHAR(1500)
)

/copy interactions(interaction_id, name, food_interactions, drug_id, interaction)
from '/tmp/drug_to_food_interactions.csv'
DELIMITER ','
csv HEADER;

select * from interactions

select count(distinct(name)) from interactions
-- there are 1423 distinct drugs in this dataset --

select sum(interaction_count) from interactions;

select count(DISTINCT(food_interactions)) from interactions

select DISTINCT(food_interactions) from interactions

select distinct(food_interactions), count(food_interactions) from interactions
group by food_interactions
order by food_interactions desc;

select * from interactions
where food_interactions like '%Examples%';

select count(*) from interactions
where food_interactions like '%Examples%';