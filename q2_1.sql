select n.Agency, count(*) as 
from nyc3 n
group by 1
order by 2 desc
limit 1 offset 1

select count(*) as total_count
from nyc3

# then divide second_count / total_count