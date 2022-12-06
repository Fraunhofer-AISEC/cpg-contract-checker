pragma solidity ^0.4.18;

contract TextSave {
    uint public mostSent = 0;
    string public currentText = "Put your own text here!";
    address public owner = msg.sender;
    uint private maxLength = 50;

    function setText(string newText) public payable returns (bool) {
        if (msg.value > mostSent && bytes(newText).length < maxLength) {
            currentText = newText;
            mostSent = msg.value;
            return true;
        } else {
            msg.sender.transfer(msg.value);
            return false;
        }
    }

    function withdrawEther() external {
        require(msg.sender == owner);
        owner.transfer(this.balance);
    }

    function () public payable{
        setText("Default text!");
    }
 }
