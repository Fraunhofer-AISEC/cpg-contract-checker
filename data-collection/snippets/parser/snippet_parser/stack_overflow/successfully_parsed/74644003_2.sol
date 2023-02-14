
pragma solidity ^0.8.17;

import "./ParentContract.sol"; 

contract Child {

    address[] public newArr; 

    address parentContract; 

    constructor(address _address) {
        parentContract = _address; 
    }

    function smth() public  {
        InterfaceParentContract b =  InterfaceParentContract(parentContract); 
        newArr = b.viewMyArr();    
    }
}
