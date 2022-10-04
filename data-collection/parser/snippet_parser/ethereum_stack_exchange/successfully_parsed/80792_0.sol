pragma solidity >=0.4.17 <0.7.0;
pragma experimental ABIEncoderV2;
contract Department{

    struct Employee{
        uint empId;
        string empName;
        uint256 empSalary;
    }

    uint departmentId;
    string departmentName;
    mapping (uint => Employee) public employees;
    uint public employeeCount;

    constructor(uint _departmentId, string memory _departmentName) public {
        employeeCount = 0;
        departmentId = _departmentId;
        departmentName = _departmentName;
    }

    function addEmployee(uint _empId, string memory _empName, uint _empSalary ) public {
        employees[employeeCount] = Employee(_empId, _empName, _empSalary);
        employeeCount++;
    }

    
    function get(uint _index) public view returns(Employee memory) {
        return employees[_index];
    }

    
    function getEmployee() public view returns (uint[] memory, string[] memory, uint[] memory) {
        uint[]    memory id = new uint[](employeeCount);
        string[]  memory name = new string[](employeeCount);
        uint[]    memory salary = new uint[](employeeCount);
        for (uint i = 0; i < employeeCount; i++) {
          Employee storage employee = employees[i];
          id[i] = employee.empId;
          name[i] = employee.empName;
          salary[i] = employee.empSalary;
        }
        return (id, name, salary);
    }

    
    function getEmployees() public view returns (Employee[] memory) {
        Employee[]  memory id = new Employee[](employeeCount);
        for (uint i = 0; i < employeeCount; i++) {
          Employee storage employee = employees[i];
          id[i] = employee;
        }
        return id;
    }

}
