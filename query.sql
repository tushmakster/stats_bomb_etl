--passes attempted
SELECT player_name, sum(count) as totalPasses
into passes_attempted
FROM df_events
where type_play = 'attempted pass'
group by player_name
order by player_name;

--passes successful
SELECT player_name, sum(count) as successfulPasses
into passes_success
FROM df_events
where type_play = 'attempted pass' and outcome = 'Successful pass'
group by player_name
order by player_name;


--create into a view
create VIEW pass_rate AS
SELECT t1.player_name,round(t2.successfulPasses/t1.totalPasses,2) as passrate
FROM passes_attempted as t1
left join passes_success as t2
on t1.player_name = t2.player_name ;