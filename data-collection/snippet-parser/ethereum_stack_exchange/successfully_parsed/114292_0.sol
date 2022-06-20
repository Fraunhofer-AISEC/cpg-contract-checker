pragma solidity ^0.8.7;

contract Test {
    mapping(string=>address) _names;
    mapping(address=>string) _addresses;
    
    function setName(string memory name) external {
        require(_names[name]==address(0), "Duplicate name");
        
        _names[name] = msg.sender;
        _addresses[msg.sender] = name;
    }
    
    function readName() external view returns (string memory) {
        return _addresses[msg.sender];
    }
}
