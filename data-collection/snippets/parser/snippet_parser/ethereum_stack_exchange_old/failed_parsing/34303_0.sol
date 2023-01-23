pragma solidity ^0.4.19;

import './InterfacePayroll.sol';
import './EmployeeStorage.sol';
import './Token.sol';

contract Payroll is InterfacePayroll, Ownable {
using SafeMath for uint256;


InterfaceEmployeeStorage public employeeStorage;


Token public employeeToken;


modifier validAddress(address _address){
    require (_address != 0x0);
    _;
}

modifier higherThanZero(uint256 _uint){
    require(_uint > 0);
    _;
}





function Payroll() public{
    setEmployeeStorage(new EmployeeStorage());
    setEmployeeToken(new Token());
}


function setEmployeeStorage(address _newEmployeeStorage) 
internal
onlyOwner validAddress(_newEmployeeStorage){
    employeeStorage = InterfaceEmployeeStorage(_newEmployeeStorage);
}


function setEmployeeToken(address _newEmployeetoken)
internal
onlyOwner validAddress(_newEmployeetoken){
    employeeToken = Token(_newEmployeetoken);
}


function () payable public { }





function addEmployee(address _address, uint256 _monthlySalary, uint256 _startDate)
public
onlyOwner
validAddress(_address)
higherThanZero(_monthlySalary){
    employeeStorage.add(_address, _monthlySalary, _startDate);
}

...
..
.

}
