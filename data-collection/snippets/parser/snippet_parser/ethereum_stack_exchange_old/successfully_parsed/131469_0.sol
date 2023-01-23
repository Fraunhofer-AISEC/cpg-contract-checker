pragma solidity 0.8.14;

contract Modifiers {

    uint balance;
    uint refreshTime;
    uint rate = 2;
    uint PRECISION = 1e18;

    modifier accrueInterest {
        uint duration = block.timestamp - refreshTime;
        uint interest = duration * rate / PRECISION;
        balance += interest;
        refreshTime = block.timestamp;
        _;
    }

    constructor() {
        refreshTime = block.timestamp;
    }

    function balanceOf() public view accrueInterest returns (uint) {
        return balance;
    }
}
