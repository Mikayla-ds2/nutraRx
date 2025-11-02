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

