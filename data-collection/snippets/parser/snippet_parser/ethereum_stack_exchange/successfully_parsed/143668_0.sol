pragma solidity ^0.8.0;

interface MyInterface {
    struct MyStruct {
        string bar;
    }
    function foo(MyStruct memory _data) external;
}

contract MyContract is MyInterface {
    function foo(MyStruct memory _data) external {
        
    }
}
