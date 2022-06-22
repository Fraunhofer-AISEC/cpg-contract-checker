pragma solidity ^0.4.21;

contract Patient {
    string public name = "";
    string public dateOfBirth;
    mapping (address => uint) public balances;

    function () payable{
        balances[msg.sender] = 40;
    }

    function getContractAddress() public view returns(address) {
        return address(this);
    }

    
    function getName() external view returns (string) {
        return name;  
    }

    function getDateOfBirth() external view returns (string) {
        return dateOfBirth; 
    }
}
