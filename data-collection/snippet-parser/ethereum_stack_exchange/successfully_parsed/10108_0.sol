pragma solidity ^0.4.4;

contract TestContract {
    enum TestEnum { ONE, TWO, THREE }
    mapping (TestEnum => uint) testMapping;
}
