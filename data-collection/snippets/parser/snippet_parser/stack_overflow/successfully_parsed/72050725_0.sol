pragma solidity 0.8.13;

contract student {
    string public value;

    constructor() public {
        value="sami";
    } 
    
    function set(string memory _value) public {
        value = _value;
    }
    
    function get() public view returns(string memory) {
        return _value;
    }
}
