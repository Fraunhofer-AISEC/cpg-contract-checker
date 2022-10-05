pragma solidity ^0.4.23;

import "./Two.sol";

contract One {
    Two two = new Two();

    struct Boxv2 {
        uint256 id;
        bool isFull;
        string name;
    }
    Boxv2[] public boxes;

    constructor() public{
    }

    
    function migrateBox(uint _id, string _name) public {
        uint256 id;
        bool isFull;
        (id, isFull) = two.boxes(_id);
        boxes.push(Boxv2(id, isFull, _name));
    }

    
    function getOldBox(uint _id) public view returns (uint256, bool) {
        return two.boxes(_id);
    }
}
