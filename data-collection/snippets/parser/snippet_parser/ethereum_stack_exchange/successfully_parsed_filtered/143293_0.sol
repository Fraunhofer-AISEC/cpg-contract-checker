pragma solidity >=0.8.17;

interface Foo {
    function myFunction() external;
}

contract Contract {
    function myOtherFunction(Foo.myFunction func) external;
}
