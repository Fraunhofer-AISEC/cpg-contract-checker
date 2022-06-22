

pragma solidity >=0.7.0 <0.9.0;

contract Jacob {
    string text;
    
    function doStuff() public view returns (string memory) {
        string memory testString = text;
        updateTestString(testString);
        return (testString);
    }
    
    function updateTestString(string memory _text) private pure{
        _text = "Hello, World!";
    }
}
