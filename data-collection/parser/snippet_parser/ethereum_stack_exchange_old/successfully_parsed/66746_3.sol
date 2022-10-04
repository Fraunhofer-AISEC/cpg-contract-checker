pragma solidity 0.5.1;

contract OrderMatters {
    
    
    
    address it; 
    
    constructor() public {
        it = msg.sender;
    }
    
    function tagYoureIt(address _newIt) public returns(address newIt) {
        require(msg.sender == it); 
        it = _newIt;
        return it;
    }
}
