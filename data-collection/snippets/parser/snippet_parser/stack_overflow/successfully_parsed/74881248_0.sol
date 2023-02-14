
pragma solidity ^0.8.17;

contract NoteDrop {
    string public text = "Hello, world!";
    address public lastPoster;

    event NewText(
        string text,
        address lastPoster
    );

    constructor() {
        
    }

    function setText(string memory _text) public {
        text = _text;
        lastPoster = msg.sender;
        emit NewText(_text, msg.sender);
    }
}
