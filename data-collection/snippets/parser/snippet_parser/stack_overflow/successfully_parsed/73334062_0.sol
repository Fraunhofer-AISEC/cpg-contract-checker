    pragma solidity 0.7.5;
contract Employee {
    
    uint256 companyIndex;
    uint256 employeeIndex;

   
    struct Company {
        string name;
        }

    struct Employee {
        uint256 companyId;
        string name;
        }    
    
    mapping(uint256 => Company) Companies;
    mapping(uint256 => Employee) Employees;

    

    function addCompany(string memory name) public
    {
        uint256 companyId = companyIndex++;
        Companies[companyId] = Company(name);
    }


    function getCompany(uint256 companyId) public view returns (uint256, string memory)
    {
        return (companyId, Companies[companyId].name);
    }
 
 

    function addEmployee(uint256 companyId,string memory name) public

    {
        uint256 employeeId = employeeIndex++;
        Employees[employeeId] = Employee(companyId,name);
    }


    function getEmployee(uint256 companyId) public view returns (uint256, string memory)
    {
        return (companyId, Employees[companyId].name);
    }

}
