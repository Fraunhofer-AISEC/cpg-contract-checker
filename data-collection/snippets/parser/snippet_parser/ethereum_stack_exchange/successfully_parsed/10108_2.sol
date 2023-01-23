pragma solidity ^0.4.4;

contract TestContract {
    enum TestEnum { ONE, TWO, THREE }
    mapping (uint => uint) testMapping;

    function getValueOne() constant returns(uint) {
        return testMapping[uint(TestEnum.ONE)];
    }
}
