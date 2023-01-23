pragma solidity ^0.4.0;
contract Test {

    uint lastBlockNum;

    function hasNewBlock() constant returns (bool) {
        if (lastBlockNum < block.number) {
            return true;
        }
        return false;
    }

    function updateBlockNum() {
        lastBlockNum = block.number;
    }
}
