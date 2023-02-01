
pragma solidity 0.8.16;
pragma abicoder v2;

type EmployeeId is uint;
type CompanyId is uint;
    
contract CompanyEmployee {

    uint256 public companyIndex;
    uint256 public employeeIndex;

    struct Company {
        string name;
        }

    struct Employee {
        CompanyId companyId;
        string name;
    }    
    
    mapping(CompanyId => Company) public Companies;
    mapping(EmployeeId => Employee) public Employees;

    mapping(CompanyId => Employee[]) public companyEmployees;

    

    function addCompany(string memory name) public
    {
        CompanyId companyId = CompanyId.wrap(++companyIndex); 
        
        
        Companies[companyId] = Company(name);
    }


    function getCompany(CompanyId companyId) public view returns (CompanyId, string memory)
    {
        return (companyId, Companies[companyId].name);
    }
 
 

    function addEmployee(CompanyId companyId, string memory name) public

    {
        EmployeeId employeeId = EmployeeId.wrap(++employeeIndex); 
        
        

        Employee memory emp = Employee(companyId,name);
        Employees[employeeId] = Employee(companyId,name);

        
        companyEmployees[companyId].push(emp);
    }


    function getEmployee(EmployeeId employeeId) public view returns (Employee memory)
    {
        return Employees[employeeId];
    }

    function getCompanyEmployees(CompanyId companyId) public view returns(Employee[] memory) {
        return companyEmployees[companyId];
    }

}
