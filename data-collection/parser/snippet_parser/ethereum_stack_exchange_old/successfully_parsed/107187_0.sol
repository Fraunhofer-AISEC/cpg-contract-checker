

pragma solidity >=0.7.0 <0.9.0;

contract Jacob {
    string text;
    
    function doStuff() public view returns (string memory) {
        string memory testString = text;
        
        updateTestString(testString);
    
        return (testString);
    }
    
    function updateTestString(string storage _text) private view {
        _text = "Hello, World!";
    }
}
