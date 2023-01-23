 contract EmpCheck{   
    private mapping(address,bool) private emps;

        function getSalary() onlyEmp public returns (uint){
            return 100;   
        }

    modifier onlyEmp(){
     require(emps[msg.sender] == true);
     -;   
    } 
}
