--Day3--Second Time
use Company_SD
--1
select Dnum,Dname,MGRSSN,Fname
from Departments,Employee
where Dnum=Dno
--2
select Dname,Pname
from Departments d,Project p
where d.Dnum=p.Dnum
--3
select d.*,Fname
from Dependent d,Employee e
where SSN=ESSN
--4
select Pnumber,Pname,Plocation
from Project
where City in ('cairo','alex')
--5
select *
from project
where Pname like 'a%'
--6
select Fname+' '+Lname [Full Name]
from employee
where Dno=30 and Salary between 1000 and 2000
--7
select Fname+' '+Lname [Full Name]
from Employee e inner join Works_for w
on e.SSN=w.ESSn and e.Dno=10 and Hours>=10
inner join Project p
on p.Pnumber=w.Pno and Pname='AL Rabwah' 
--8
select x.Fname+' '+x.Lname [Full name]
from Employee x, Employee y
where y.SSN=x.Superssn and y.Fname='Kamel' and y.Lname='mohamed'
--9
select Fname+' '+Lname [Full Name],Pname
from Employee e inner join Works_for w
on e.SSN=w.ESSn 
inner join Project p
on p.Pnumber=w.Pno 
order by Pname
--10
select Pnumber,Dname,Lname,Address,Bdate
from Project P inner join Departments D
on d.Dnum=p.Dnum and City='cairo'
inner join Employee E
on e.SSN=d.MGRSSN
--11
select *
from Employee,Departments
where SSN=MGRSSN
--12
select *
from Employee left outer join Dependent
on SSN=ESSN
--13
insert into Employee
values('Wafaa','Hamada',102672,'3-21-2000','Assiut Dirout','F',3000,112233,30)
--14
insert into Employee(Fname,Lname,SSN,Bdate,Address,Sex,Dno)
values('Manar','Ahmed',102660,'7-5-2000','Assiut Abnoub','F',30)
--15
update Employee
set Salary= Salary+Salary*0.2
where SSN=102672
