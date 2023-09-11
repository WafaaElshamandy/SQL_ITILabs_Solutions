Use Company_SD
--1
select * from Employee
--2
select Fname,Lname,Salary,Dno from Employee
--3
select Pname,Plocation,Dnum from Project
--4
select Fname +' '+ Lname as Full_Name,Salary*0.1 as Annual_COMM
from Employee
--5 
select ssn,Fname +' '+ Lname as Full_Name from Employee
where Salary>1000
--6
select ssn,Fname +' '+ Lname as Full_Name from Employee
where Salary*12>10000
--7
select Fname +' '+ Lname as Full_Name,Salary from Employee
where Sex='F'
--8
select Dnum,Dname from Departments
where MGRSSN=968574
--9
select Pnumber,Pname,Plocation from Project
where Dnum=10


 
