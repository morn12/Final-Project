use Temp

select* from Tempfinal where IS_HW=1

SELECT *
FROM Tempfinal

--alter table Tempfinal add Is_hw int
--update Tempfinal set Is_hw=0

go
with tem_1 as 
(select date from Tempfinal where temp>=30),
tem_2 as 
(select date from Tempfinal where temp>=30),
tem_3 as 
(select date from Tempfinal where temp>=30),
hit as (select tem_2.date from tem_1 inner join tem_2 on 1=1 inner join tem_3 on 1=1
where dateadd (d,-1,tem_2.date) = tem_1.date and  dateadd (d,1,tem_2.date) = tem_3.date)

update Tempfinal set Is_hw = 1
where date in (select date from hit)
or date in (select dateadd (d,-1,date) from hit)
or date in (select dateadd (d,1,date) from hit)

