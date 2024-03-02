select * from Customer_Support;

-- Group Performance Analysis

select Groupname,COUNT(*) as Total_Tickets,
AVG(Full_resolution_time) as Avg_Full_resolution_time,
avg(Requester_wait_time) as Avg_Requester_Wait_time,
AVG(First_reply_time) as Avg_First_reply_time,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
Sum(Replies) as No_of_Replies
from dbo.customer_support
group by Groupname;

Select Groupname,Count(*) as Created_Tickets,
SUM(case when Status = 'Solved' or Status = 'Closed' then 1 else 0 end) as Solved_Tickets,
SUM(case when Status In ('Pending','Hold') and Assigned_at is not null then 1 else 0 end) as Pending_Tickets,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
SUM(case when Assigned_at is null then 1 else 0 end) as UnAssigned_Tickets,
SUM(case when Status = 'Open' and Assigned_at is not null then 1 else 0 end) as Open_Tickets
from Customer_Support
group by Groupname;


--Ticket Priority Analysis

select Priority,COUNT(*) as Total_Tickets,
AVG(First_reply_time) as Avg_First_reply_time,
avg(Requester_wait_time) as Avg_Requester_Wait_time,
AVG(Full_resolution_time) as Avg_Full_resolution_time,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
Sum(Replies) as No_of_Replies
from dbo.customer_support
group by Priority;

Select Priority,Count(*) as Created_Tickets,
SUM(case when Status = 'Solved' or Status = 'Closed' then 1 else 0 end) as Solved_Tickets,
SUM(case when Status In ('Pending','Hold') and Assigned_at is not null then 1 else 0 end) as Pending_Tickets,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
SUM(case when Assigned_at is null then 1 else 0 end) as UnAssigned_Tickets,
SUM(case when Status = 'Open' and Assigned_at is not null then 1 else 0 end) as Open_Tickets
from Customer_Support
group by Priority;

--Communication Channel Analysis

select Via as Communication_Channel,COUNT(*) as Total_Tickets,
AVG(First_reply_time) as Avg_First_reply_time,
avg(Requester_wait_time) as Avg_Requester_Wait_time,
AVG(Full_resolution_time) as Avg_Full_resolution_time,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
Sum(Replies) as No_of_Replies
from dbo.customer_support
group by Via;

Select Via,Count(*) as Created_Tickets,
SUM(case when Status = 'Solved' or Status = 'Closed' then 1 else 0 end) as Solved_Tickets,
SUM(case when Status In ('Pending','Hold') and Assigned_at is not null then 1 else 0 end) as Pending_Tickets,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
SUM(case when Assigned_at is null then 1 else 0 end) as UnAssigned_Tickets,
SUM(case when Status = 'Open' and Assigned_at is not null then 1 else 0 end) as Open_Tickets
from Customer_Support
group by Via;

--Status Distribution Analysis

select Status,COUNT(*) as Total_Tickets,
AVG(First_reply_time) as Avg_First_reply_time,
avg(Requester_wait_time) as Avg_Requester_Wait_time,
AVG(Full_resolution_time) as Avg_Full_resolution_time,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
Sum(Replies) as No_of_Replies
from dbo.customer_support
group by Status;

Select Status,Count(*) as Created_Tickets,
SUM(case when Status = 'Solved' or Status = 'Closed' then 1 else 0 end) as Solved_Tickets,
SUM(case when Status In ('Pending','Hold') and Assigned_at is not null then 1 else 0 end) as Pending_Tickets,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
SUM(case when Assigned_at is null then 1 else 0 end) as UnAssigned_Tickets,
SUM(case when Status = 'Open' and Assigned_at is not null then 1 else 0 end) as Open_Tickets
from Customer_Support
group by Status;


--Category Distribution Analysis

select Manual_Tagging_Of_Categories_list as Categories,COUNT(*) as Total_Tickets,
AVG(First_reply_time) as Avg_First_reply_time,
avg(Requester_wait_time) as Avg_Requester_Wait_time,
AVG(Full_resolution_time) as Avg_Full_resolution_time,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
Sum(Replies) as No_of_Replies
from dbo.customer_support
group by Manual_Tagging_Of_Categories_list;

Select Manual_Tagging_of_Categories_list,Count(*) as Created_Tickets,
SUM(case when Status = 'Solved' or Status = 'Closed' then 1 else 0 end) as Solved_Tickets,
SUM(case when Status In ('Pending','Hold') and Assigned_at is not null then 1 else 0 end) as Pending_Tickets,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
SUM(case when Assigned_at is null then 1 else 0 end) as UnAssigned_Tickets,
SUM(case when Status = 'Open' and Assigned_at is not null then 1 else 0 end) as Open_Tickets
from Customer_Support
group by Manual_Tagging_of_Categories_list;

--Monthly Trend Analysis

select Datename(M,Created_at) as Month_Name,COUNT(*) as Total_Tickets,
AVG(First_reply_time) as Avg_First_reply_time,
avg(Requester_wait_time) as Avg_Requester_Wait_time,
AVG(Full_resolution_time) as Avg_Full_resolution_time,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
Sum(Replies) as No_of_Replies
from dbo.customer_support
group by Datename(M,Created_at);

Select Datename(M,Created_at) as Month_Name,Count(*) as Created_Tickets,
SUM(case when Status = 'Solved' or Status = 'Closed' then 1 else 0 end) as Solved_Tickets,
SUM(case when Status In ('Pending','Hold') and Assigned_at is not null then 1 else 0 end) as Pending_Tickets,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
SUM(case when Assigned_at is null then 1 else 0 end) as UnAssigned_Tickets,
SUM(case when Status = 'Open' and Assigned_at is not null then 1 else 0 end) as Open_Tickets
from Customer_Support
group by Datename(M,Created_at);


--Weekly Trend Analysis

select DATENAME(M,Created_at) as Month_Name,Week_Num,COUNT(*) as Total_Tickets,
AVG(First_reply_time) as Avg_First_reply_time,
avg(Requester_wait_time) as Avg_Requester_Wait_time,
AVG(Full_resolution_time) as Avg_Full_resolution_time,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
Sum(Replies) as No_of_Replies
from customer_support
group by Week_Num,DATENAME(M,Created_at)
order by Week_Num;

---Overall ticket Status

Select Count(*) as Created_Tickets,
SUM(case when Status = 'Solved' or Status = 'Closed' then 1 else 0 end) as Solved_Tickets,
SUM(case when Status In ('Pending','Hold') and Assigned_at is not null then 1 else 0 end) as Pending_Tickets,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
SUM(case when Assigned_at is null then 1 else 0 end) as UnAssigned_Tickets,
SUM(case when Status = 'Open' and Assigned_at is not null then 1 else 0 end) as Open_Tickets
from Customer_Support;

--Over all time status

select COUNT(*) as Total_Tickets,
AVG(First_reply_time)/60 as Avg_First_reply_time,
AVG(First_resolution_time)/60 as Avg_First_resolution_time,
avg(Requester_wait_time)/60 as Avg_Requester_Wait_time,
SUM(Reopens) as No_of_Reopens
from dbo.customer_support;


--Satisfaction Score Analysis

select Satisfaction_Score,COUNT(*) as Total_Tickets,
AVG(First_reply_time) as Avg_First_reply_time,
avg(Requester_wait_time) as Avg_Requester_Wait_time,
AVG(Full_resolution_time) as Avg_Full_resolution_time,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
Sum(Replies) as No_of_Replies
from dbo.customer_support
group by Satisfaction_Score;

Select Satisfaction_Score,Count(*) as Created_Tickets,
SUM(case when Status = 'Solved' or Status = 'Closed' then 1 else 0 end) as Solved_Tickets,
SUM(case when Status In ('Pending','Hold') and Assigned_at is not null then 1 else 0 end) as Pending_Tickets,
cast((cast(SUM(Reopens) as float) / COUNT(*))*100 as int) as Reopen_Rate,
SUM(case when Assigned_at is null then 1 else 0 end) as UnAssigned_Tickets,
SUM(case when Status = 'Open' and Assigned_at is not null then 1 else 0 end) as Open_Tickets
from Customer_Support
group by Satisfaction_Score;