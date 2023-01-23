pragma solidity ^0.4.4;

 contract TestContract {
    enum TestEnum { ONE, TWO, THREE }
    mapping (bytes32 => uint) testMapping;

    function getValueOne() constant returns(uint) {
        return testMapping[sha3(TestEnum.ONE)];
    }

}
