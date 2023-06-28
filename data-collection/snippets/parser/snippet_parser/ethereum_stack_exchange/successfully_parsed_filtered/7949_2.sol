pragma solidity ^0.4.8;

contract Test {

    bytes32 public constant MY_DATE = keccak256(now);

    function check() constant returns (bytes32) {
        return MY_DATE;
    }
}
