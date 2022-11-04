pragma solidity 0.5.11;

contract Test {
    
    string stringTest;
    
    function memoryTest(string memory _exampleString) public returns (string memory) {
        _exampleString = "example";  
        string memory newString = _exampleString;  
        return newString;  
    }
    
    function calldataTest(string calldata _exampleString) external returns (string memory) {
        
        
        return _exampleString;
    }
}
