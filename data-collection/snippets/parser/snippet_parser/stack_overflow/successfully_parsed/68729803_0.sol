pragma solidity 0.8.4;
contract HashTextMap {
    
    mapping(string=>string) textMap;
    
    
    function set(string memory text) public  {
        bytes32 val;
        val = sha256(abi.encodePacked(text));
        string memory key = string(abi.encodePacked(val));
        textMap[key] = text; 
        
    }
    function get(string memory key) public view returns(string memory) {
        return textMap[key];
    }
    
    function hash(string memory text) public pure returns(string memory) {
        bytes32 val;
        val = sha256(abi.encodePacked(text));
        string memory key = string(abi.encodePacked(val));
        return key;
        
    }
}
