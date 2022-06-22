

pragma solidity 0.7.4;

interface IChild {
   function birthday() external view returns(uint);  
}

contract Child is IChild {
    
    uint public override birthday;
    
    constructor() {
        birthday = block.timestamp;
    }
}


contract Parent {
    
    event NewChild(Child child);
    
    function newChild() public returns(Child child) {
        child = new Child();
        emit NewChild(child);
    }
}

contract Family {
    
    
    
    
    function getBirthday(IChild child) public view returns(uint birthday) {
        return child.birthday();
    }
}
