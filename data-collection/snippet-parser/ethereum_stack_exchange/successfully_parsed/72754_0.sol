pragma solidity ^0.5.10;

contract RefundTest {

    bool public boolGasTest;
    uint256 public uintGasTest;

    function unsetBool() public {
        boolGasTest = false;
    }

    function setBool() public {
        boolGasTest = true;
    }

    function unsetUint() public {
        uintGasTest = 0;
    }

    function setUint() public {
        uintGasTest = 1;
    }
}
