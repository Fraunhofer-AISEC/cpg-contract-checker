pragma solidity >=0.7.0 <0.9.0;
contract Test {
struct Messanges{
    string message;
    address sender;
}
Messanges[] public chatverlauf;
address a = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
function add(string calldata _message, address calldata _sender) public{
    
    Messanges memory newMessage;
    newMessage.message = _message;
    newMessage.sender = _sender;
    chatverlauf.push(newMessage);

}
}