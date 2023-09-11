Use Company_SD
--1
select Dependent_name,sex
from Dependent
where sex='F' and ESSN in (select SSN from Employee where sex='F')
union
select Dependent_name,sex
from Dependent
where sex='M' and ESSN in (select SSN from Employee where sex='M')
--------------------------
--2
select Pname,sum(Hours)
from Project inner join Works_for
on Pnumber=Pno
group by Pname
--------------------------
--3
select d.*
from Departments d,Employee e
where Dnum=Dno and SSN=(select min(SSN) from Employee)
-------------------------
--4
select Dname,max(Salary) as Max_Value,min(Salary) as Min_Value,avg(Salary) as Avg_Value
from Departments ,Employee 
where Dnum=Dno
group by Dname
------------------------
--5
select Fname+' '+Lname as FullName
from Employee inner join Departments
on SSN=MGRSSN and SSN not in (select Essn from Dependent)
-------------------------
--6
select Dname,Dnum,count(SSN)
from Departments innner join Employee
on Dnum=Dno 
group by Dname,Dnum
having avg(Salary)<(select AVG(salary) from Employee)
------------------------
--7
select Fname+' '+Lname as FullName,Pname
from Employee inner join Works_for
on SSN=ESSn
inner join
Project
on Pnumber=Pno
order by Dno,Lname,Fname
-----------------------
--8
select max(salary)
from employee
union all
select max(salary)
from employee
where Salary not in (select max(salary) from employee)
--Another Sol
select salary
from employee
where salary=(select max(Salary) from Employee) 
or Salary=(select max(salary) from Employee 
where salary !=(select max(Salary)from Employee))
------------------
--9
select Fname+' '+Lname as FullName
from Employee
intersect
select Dependent_name
from Dependent
-------------------
--10
select SSN,Fname+' '+Lname as FullName
from Employee
where exists(select essn from dependent where ESSN=ssn)
-------------------
--11
insert into Departments
values('DEPT IT',100,112233,'1-11-2006')
--------------------
--12
--a
update Departments
set MGRSSN=968574
where Dnum=100
--b
update Departments
set MGRSSN=102672
where Dnum=20
--c
update Employee
set Superssn=102672
where SSN=102660
---------------------
--13
delete from Dependent
where ESSN=223344

update Departments
set MGRSSN=102672
where MGRSSN=223344

update Employee
set Superssn=102672
where Superssn=223344

delete from Works_for
where ESSN=223344

delete from Employee
where SSN=223344
------------------------
--14
update Employee
set Salary=Salary+(Salary*0.3)
where ssn in (select essn from Works_for inner join Project on Pnumber=Pno and Pname='Al Rabwah')