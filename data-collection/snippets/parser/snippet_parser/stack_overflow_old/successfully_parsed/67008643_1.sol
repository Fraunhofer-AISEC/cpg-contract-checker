pragma solidity ^0.8.0;

contract LuggageStorage {
    uint256 releaseDate;
    
    constructor(uint256 _releaseDate) {
        releaseDate = _releaseDate;
    }
    
    function retrieveLuggage() public {
        

        require(block.timestamp >= releaseDate, "You're too early");

        
    }
}
