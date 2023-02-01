pragma solidity ^0.4.23;

contract Two{

    struct Box {
        uint256 id;
        bool isFull;
    }
    Box[] public boxes;

    constructor() public {
        boxes.push(Box(0, false));
        boxes.push(Box(1, true));
    }
}
