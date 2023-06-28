
pragma solidity ^0.8.17;

contract Messenger{

address [] public authorisedAddresses;

struct User {
    address sender;
    string message;
}
constructor(){
    authorisedAddresses.push(msg.sender);
}

User[] internal user;

function authoriseAddress(address _input) external {
    bool address_bool = verifyAddress();
    if (address_bool == true){
        authorisedAddresses.push(_input);
    }
    else {revert("User not authorised!");}
}
function writeMessage(string calldata _input) external {
    bool address_bool = verifyAddress();
    if (address_bool == true){
        user.push(User(msg.sender, _input));
    }
    else {revert("User not authorised!");}
}
function userLength() public view returns (uint) {
    return user.length;
}
function addressLength() internal view returns (uint) {
    return authorisedAddresses.length;
}
function verifyAddress() internal view returns (bool) {
    uint i = 0;
    while (i <= addressLength()){
        if (authorisedAddresses[i] == msg.sender) {
            return true;
        }
        ++i;
    }
    return false;
}
function viewMessages(uint _input) public view returns(address, string memory){
    bool address_bool = verifyAddress();
    if (address_bool == true){
        User storage text = user[_input];
        return (text.sender, text.message);
    }
    else {revert("User not authorised!");}
}
}