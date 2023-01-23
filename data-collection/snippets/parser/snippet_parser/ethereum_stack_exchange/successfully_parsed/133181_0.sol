struct Employee {
    address payable to;
    string name;
    uint256 startTime;
}


Employee[] public employee;

function addEmployee(address payable _to, string memory _name) public {
    require(_to != address(0), "Address can't be 0x0");
    employee.push(Employee(_to, _name, block.timestamp));
    totalEmployee++;
}

function sendPayment() public payable {}
