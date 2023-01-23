

pragma solidity 0.8.7;

contract Jacob {
    
    string public text; 
    
    event Updated(address sender, string text);
    
    function doStuff(string memory _text) public returns (string memory) {
        updateTestString(_text);
        return text;
    }
    
    function updateTestString(string memory _text) private {
        text = _text;
        emit Updated(msg.sender, _text); 
    }
}
