pragma solidity ^0.5.2;

contract NowContract {
    uint32 public nowValue = 0;

    constructor () public NowContract() {
        computeNow();
    }

    function computeNow() public {
        nowValue = uint32(block.timestamp);
    }
}
