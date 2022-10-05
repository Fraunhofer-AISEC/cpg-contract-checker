pragma solidity ^0.5.1;

import "./YourContract.sol";

contract Factory {

    
    
    
    address Admin;

    constructor () public {
        Admin = msg.sender;
    }    

    function createNewContract(string memory Name, string memory Type, uint Fee) public returns(YourContract) {
        address YourContract = address(new YourContract(Name, Type, Fee));
    }
}