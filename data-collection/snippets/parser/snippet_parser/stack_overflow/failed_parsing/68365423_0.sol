function addEmployee(
     int empid, string memory name, 
     string memory department, 
     string memory designation
   ) public{
       Employee memory e
         =Employee(empid,
                   name,
                   department,
                   designation);
       emps.push(e);
