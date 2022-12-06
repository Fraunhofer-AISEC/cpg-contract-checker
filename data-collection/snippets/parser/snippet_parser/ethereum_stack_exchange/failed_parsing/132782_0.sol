
pragma solidity ^0.7.1;
contract A {
    mapping(uint => uint) public objects;

    function B()  returns {
        objects[0] = 42;
    }
}

contract B {
    
    A a = A(0x692a70d2e424a56d2c6c27aa97d1a86395877b3a);

    function get() returns(uint) {
        return a.objects(0);
    }
}
