pragma solidity ^0.6.0;

contract A {
    function foo() public pure returns (uint8){
        return 1;
    }
}



contract B {
    function foo() public pure returns (uint8){
        return 2;
    }
}

contract C is A,B {

}
