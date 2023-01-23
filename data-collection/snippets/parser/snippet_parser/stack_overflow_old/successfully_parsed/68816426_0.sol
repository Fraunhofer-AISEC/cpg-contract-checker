
pragma solidity ^0.8.0;

contract TupleArrayFactory {
    TupleArray newTuple;

    function createTuple() public {
        newTuple = new TupleArray("trait0", "display0", 0);
       
        
        newTuple.pushAttribute(["trait1","display2",2]);
        
    }
}

contract TupleArray {
    struct Attribute {
        string trait_type;
        string display_type;
        uint8 value;
    }
    
    Attribute[] public attributes;
    Attribute[] public tempAttributeArr;

    constructor(string memory trait_type, string memory display_type, uint8 value) payable {
        Attribute memory Attribute0 = Attribute(trait_type, display_type, value);
        tempAttributeArr.push(Attribute0);
        pushAttribute(tempAttributeArr);
        
        
        
    }
    
    function pushAttribute(Attribute[] memory _attr) public payable {
        attributes.push(_attr[0]);
    }
}
