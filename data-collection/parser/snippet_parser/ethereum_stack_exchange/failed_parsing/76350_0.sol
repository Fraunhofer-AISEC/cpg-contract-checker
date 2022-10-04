modifier onlyOwner()
{
    require(msg.sender==owner,"msg.sender is not the Owner");
    _;
}

function addEmployee(address payable employeeWallet) onlyOwner external
{
    emp[emp.length-1] = employeeWallet;
}
