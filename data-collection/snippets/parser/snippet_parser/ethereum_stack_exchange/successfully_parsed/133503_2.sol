
pragma solidity 0.7.5;
pragma abicoder v2;

contract Employee {
    
    uint256 public companyIndex;
    uint256 public employeeIndex;

   
    struct Company {
        string name;
        }

    struct Employee {
        uint256 companyId;
        string name;
    }    
    
    mapping(uint256 => Company) public Companies;
    mapping(uint256 => Employee) public Employees;

    mapping(uint256 => Employee[]) public companyEmployees;

    

    function addCompany(string memory name) public
    {
        uint256 companyId = ++companyIndex; 
        
        
        Companies[companyId] = Company(name);
    }


    function getCompany(uint256 companyId) public view returns (uint256, string memory)
    {
        return (companyId, Companies[companyId].name);
    }
 
 

    function addEmployee(uint256 companyId,string memory name) public

    {
        uint256 employeeId = ++employeeIndex; 
        
        

        Employee memory emp = Employee(companyId,name);
        Employees[employeeId] = Employee(companyId,name);

        
        companyEmployees[companyId].push(emp);
    }


    function getEmployee(uint256 companyId) public view returns (uint256, string memory)
    {
        return (companyId, Employees[companyId].name);
    }

    function getCompanyEmployees(uint256 companyId) public view returns(Employee[] memory) {

        return companyEmployees[companyId];

    }

}
