
pragma solidity ^0.8.0;

interface MyInterface {
    function myFunction() external;
}

abstract contract MyContract is MyInterface {
    constructor() {
         myFunction();
    }

    
}
