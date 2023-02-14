
pragma solidity ^0.8.0;

contract TupleArrayFactory {
    TupleArray newTuple;

    function createTuple() public {
        newTuple = new TupleArray("trait0", "display0", 0);

        TupleArray.Attribute[] memory attributes = new TupleArray.Attribute[](1);
        attributes[0] = TupleArray.Attribute("trait1", "display2", 2);
        newTuple.pushAttribute(attributes);
    }
}

contract TupleArray {
    struct Attribute {
        string trait_type;
        string display_type;
        uint8 value;
    }

    Attribute[] public attributes;

    constructor(string memory trait_type, string memory display_type, uint8 value) payable {
        Attribute[] memory tempAttributeArr = new Attribute[](1);
        tempAttributeArr[0] = Attribute(trait_type, display_type, value);
        pushAttribute(tempAttributeArr);
    }

    function pushAttribute(Attribute[] memory _attr) public payable {
        attributes.push(_attr[0]);
    }
}
