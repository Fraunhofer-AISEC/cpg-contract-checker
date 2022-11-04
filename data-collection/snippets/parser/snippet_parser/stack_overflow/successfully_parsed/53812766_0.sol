pragma solidity ^0.4.17;

contract testalk{

string public message;

function testalk(string initialMsg) public {
    message = initialMsg;
}

function setMessage(string nwMsg) public {
    message = nwMsg;
}

}
