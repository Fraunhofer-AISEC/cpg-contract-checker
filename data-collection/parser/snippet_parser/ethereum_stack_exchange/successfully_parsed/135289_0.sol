

pragma solidity ^0.8.10;


contract getAddress {

    address public deployer; 

    constructor()    {
        deployer = msg.sender; 
    }


    function getContractAddress() public view returns(address) {
        return address(this); 
    } 
}
