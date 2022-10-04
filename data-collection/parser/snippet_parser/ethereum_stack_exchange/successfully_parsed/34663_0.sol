pragma solidity ^0.4.19;

contract Test {
    bool public isResult1 = false;
    bool public isResult2 = false;

    function isAddressZero1(address _addr) public {
        isResult1 = (_addr == address(0));
    }

    function isAddressZero2(address _addr) public {
        isResult2 = (_addr == 0);
    }
}
