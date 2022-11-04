pragma solidity 0.4.19;

contract A {
    event LOG(uint _num);
}

contract B is A {
    function doSomething() public{
        LOG(3);
    }
}
