
pragma solidity ^0.7.1;

contract A {
    mapping(uint => uint) public objects;

    
    
    function setObject(uint _id) public {
        objects[_id] = 42;
    }
}

contract B {
    A a;

    
    
    constructor(address aAddress) {
        a = A(aAddress);
    }

    function get() external view returns(uint) {
        return a.objects(0);
    }
}
