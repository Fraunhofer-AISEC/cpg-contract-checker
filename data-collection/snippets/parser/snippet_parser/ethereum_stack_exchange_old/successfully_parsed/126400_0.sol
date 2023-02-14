pragma solidity ^0.4.23;


contract One {
    Two two = new Two();

    constructor() public{
    }

    function getOldBox(uint _id) public view returns (uint256, bool) {
        return two.boxes(_id);
    }

    function getOldBoxmapping(uint _id, address asdf) public view returns (uint){
        return two.boxes(_id).testmapping[asdf];
    }
}

contract Two{

    struct Box {
        uint256 id;
        bool isFull;
        mapping(address=>uint) testmapping;
    }
    Box[] public boxes;
    
    function setmappingvalue(address asdf, uint someuint) public {
        boxes[boxes.length-1].testmapping[asdf] = someuint;
    } 

    constructor() public {
        boxes.push(Box(0, false));
        boxes.push(Box(1, true));
    }
 

}
