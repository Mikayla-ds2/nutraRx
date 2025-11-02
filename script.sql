-- head of file --
drop table if exists interactions;

-- gonna need to change table; made id for drugs - new one would be for interactions, drug_id would just be int --
create table if not exists interactions (
    interaction_id SERIAL PRIMARY KEY,
    name VARCHAR(300),
    drug_id int,
    interaction VARCHAR(1500)
)

/copy interactions(interaction_id, name, drug_id, interaction)
from '/tmp/interactions.csv'
DELIMITER ','
csv HEADER;

select * from interactions
limit 1000;

select count(distinct(name)) from interactions
-- there are 1423 distinct drugs in this dataset --


select count(DISTINCT(interaction)) from interactions
-- i don't care to verify this so 1568 distinct interactions in this dataset --

select name, drug_id, count(interactions) as interaction_count from interactions
group by name, drug_id
order by interaction_count desc;


select count(interaction) from interactions

select DISTINCT name, interaction from interactions
order by interaction asc;

select name, interaction from interactions
where interaction = 'Take with food'
group by name, interaction
order by name asc;


select interaction, count(DISTINCT(drug_id)) as drug_count from interactions
group by interaction
order by drug_count desc;

select drug_id, name from interactions
where interaction = 'Avoid alcohol'
and interaction = 'Avoid chocolate'
-- bc looking for a drug that has both these rows, need to use a different type of query; see below: --

select drug_id, name from interactions
where interaction in ('Avoid alcohol', 'Take with or without food')
group by drug_id, name
having count(DISTINCT interaction) >= 2;

-- thought this would be pretty interesting --
select i1.interaction as interaction1, i2.interaction as interaction2, count(DISTINCT i1.drug_id) as drug_count
from interactions i1
join interactions i2 on i1.drug_id = i2.drug_id and i1.interaction < i2.interaction
group by i1.interaction, i2.interaction
order by drug_count desc
limit 10;