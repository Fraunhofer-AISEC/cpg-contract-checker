
pragma solidity ^0.8.17;

contract A {
    uint public x = 3;
}

contract B {
    A public contractA ;

    function getAcontractState() public returns (uint256){
        contractA = new A();
        uint256 y = contractA.x(); 
        return y;
    }
}
