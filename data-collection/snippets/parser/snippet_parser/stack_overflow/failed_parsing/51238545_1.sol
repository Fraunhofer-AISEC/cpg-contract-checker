pragma solidity ^0.4.24;

contract Test2 {
    address public bank;

    struct Box {
        uint size;
    }
    Box public box;

    constructor() public {
        box.size = 3;
        bank = 0xa2079636...;
    }

    function changeBox(uint _change) public {
        box.size = _change;
    }

    function getBox() public returns (uint) {
        return box.size;
    }  
}  
