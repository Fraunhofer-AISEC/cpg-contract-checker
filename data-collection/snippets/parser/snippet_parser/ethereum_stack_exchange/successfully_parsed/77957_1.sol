pragma solidity ^0.5.0;

contract A {
    function a() payable external {
        B bb = new B();
        bb.b.value(msg.value / 2)();
    }
}

contract B {
    event showb(uint);
    function b() payable external {
        emit showb(msg.value);
    }
}
