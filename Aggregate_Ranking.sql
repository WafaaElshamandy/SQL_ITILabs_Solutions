Use ITI
--1
select count(St_Id)
from student
where St_Age is not null
--2
select distinct Ins_Name 
from Instructor
--3
select St_Id [Student ID],isnull(St_Fname+' '+St_Lname,'No Data') [Student Full Name],isnull(Dept_Name,'No Data') [Department Name]
from student S,Department D
where D.Dept_Id=S.Dept_Id
--4
select Ins_Name ,Dept_Name
from Instructor I left outer join Department D
on D.Dept_Id=I.Dept_Id
--5
select St_Fname+' '+St_Lname [Full Name],Crs_Name
from student S inner join stud_course SC
on S.St_Id=SC.St_Id
inner join Course C
on C.Crs_Id=SC.Crs_Id and Grade is not null
--6
select count(C.crs_id) ,Top_Name
from Course C,Topic 
group by Top_Name
--7
select max(Salary) Max_Sal , min(Salary) Min_Sal
from Instructor
--8
select Ins_Name
from Instructor
where Salary<(select avg(salary) from Instructor)
--9
select Dept_Name
from department  D inner join Instructor I 
on D.Dept_Id=I.Dept_Id and  Salary= (select min(salary) from instructor )
--10
select distinct top(2) salary
from Instructor
order by salary desc
--another sol using agg_Fun and subQueries
select max(salary)
from instructor 
union all
select max(salary)
from instructor 
where salary != (select max(salary) from Instructor)
--11
select Ins_Name,coalesce(convert(varchar(10),Salary),'Instructor Bouns') [Salary]
from instructor 
--12
Select avg(salary) [Average Salary]
from Instructor
--13-----------------------------ERROR
select S.St_Fname,Sp.St_Fname +' '+Sp.St_Lname [Super Name],
Sp.St_Address [Super Address], Sp.St_Age [Super Age],
Sp.Dept_Id [Super Dept_Id]
from Student s inner join Student Sp
on Sp.St_super=S.St_super
--14
select *
from(select salary ,Dense_rank() over(Partition by dept_id order by salary desc ) DR
from Instructor) as new_table
where DR<=2
--15
select * 
from (select *,row_number() over (partition by dept_id order by newid()) RN 
from Student)as new_table 
where RN=1 and Dept_Id is not null