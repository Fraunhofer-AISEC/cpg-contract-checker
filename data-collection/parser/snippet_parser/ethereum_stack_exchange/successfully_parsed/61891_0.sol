pragma solidity ^0.4.24;

contract Gold {
    bool public isTaken = false;

    function take() public {
        isTaken = true;
    }
}

contract TreasureBox {
    Gold g;

    constructor() public {
        g = new Gold();
    }

    function profit() public {
        g.take();
    }
}
