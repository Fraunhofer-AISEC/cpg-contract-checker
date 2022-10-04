pragma solidity ^0.4.0;

contract TokenBase {
    uint _totalSupply;
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
}

contract Token is TokenBase {
    
    constructor() public {
        _totalSupply = 1234; 
    }
}
