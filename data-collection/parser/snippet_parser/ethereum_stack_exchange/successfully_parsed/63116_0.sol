pragma solidity ^0.4.24;

interface InterfaceTest{
    function testInterface() external pure returns(uint);
}

contract TestContract {   

    InterfaceTest _inter;  

    function test2(address _addr) public returns(uint) {
        _inter = InterfaceTest(_addr);
        return 2;
    }

    function test4() public view returns(uint) {
        uint t = _inter.testInterface();
        return t;
    }
}
