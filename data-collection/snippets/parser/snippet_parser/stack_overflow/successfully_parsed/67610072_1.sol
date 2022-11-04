pragma solidity ^0.8;
contract B {
    
    address[] public data;
    
    constructor() {
        
        data.push(address(0x789));
    }
}
