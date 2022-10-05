pragma solidity >=0.4.17 <0.7.0;
contract EmployeeOrder{

    struct Employee{
        string employeeName;
        uint128 order;
    }

    uint128 departmentId;
    uint128 goal;
    uint32 startDate;
    uint32 endDate;
    mapping (uint128 => Employee) public employees;
    uint128[] public departmentEmployees;
    address public owner;
    uint128 minimumOrder;
    uint128 public totalOrder;

    
    constructor(uint128 _departmentId, uint128 _expectedOrder, uint32 _startDate, uint32 _endDate) public {
        owner = msg.sender;
        minimumOrder = 1;
        totalOrder = 0;
        departmentId = _departmentId;
        goal = _expectedOrder;
        startDate = _startDate;
        endDate = _endDate;
    }

    
    event logEmployeeData(uint256 _employeeId, string _name, uint _order, uint256 _time);

    
    modifier restricted() {
        require(msg.sender == owner);
        _;
    }

    
    modifier beforeEndDate() {
        require(now < endDate);
        _;
    }

    
    function addEmployee(uint128 _employeeId, string memory _name, uint128 _order) public {
        require(_order >= minimumOrder);
        Employee storage employee = employees[_employeeId];
        employee.employeeName = _name;
        employee.order = _order;
        totalOrder = totalOrder + _order;
        departmentEmployees[_employeeId] = _employeeId;
        emit logEmployeeData(_employeeId, _name, _order, now);
    }

    
    function updateEmployeeOrder(uint128 _employeeId,  uint128 _order) public {
        require(_order >= minimumOrder);
        employees[_employeeId].order = employees[_employeeId].order + _order;
        totalOrder = totalOrder + _order;
        emit logEmployeeData(_employeeId, employees[_employeeId].employeeName, _order, now);
    }

    
    function extendEndDate(uint32 _newEndDate) public {
        endDate = _newEndDate;
    }

    
    function getAllEmployees() public view returns (uint128[] memory) {
        return departmentEmployees;
    }

    
    function isGoalAchieved() public view returns (bool) {
        if(totalOrder>= goal) return true;
        else return false;
    }
}
