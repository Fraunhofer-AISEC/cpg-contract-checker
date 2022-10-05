pragma solidity ^0.4.24;
contract Units {
    uint totalUnits;

    mapping(uint => Unit) public idToUnit;

    struct Unit {
        uint id;
        uint exp;
    }

    constructor() public {
        Unit storage _unit = idToUnit[totalUnits];
        _unit.id = totalUnits;
        _unit.exp = 0;
        totalUnits++;
    }

    function increaseUnitExp(uint _id, uint amount) public {
        Unit storage obj = idToUnit[_id];
        obj.exp = amount;
    }
}
