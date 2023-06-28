pragma solidity ^0.8.7;
contract Test {
    error TestError(uint32 val);
    function callError() external pure {
        revert TestError(50);
    }
}
