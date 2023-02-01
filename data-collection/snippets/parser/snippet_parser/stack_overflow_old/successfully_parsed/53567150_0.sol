pragma solidity ^0.4.25;

 contract TestMetamask {

 string public name = "Joao";
 event EtherReceived();

 function changeName(string _name) public {
    name = _name;
 }

 function() public payable {
    emit EtherReceived();
 }

 function receiveEther() payable public {
    address(this).transfer(msg.value);
 }

 function balance() public view returns (uint256) {
    return address(this).balance;
 }

 function kill() public {
    selfdestruct(msg.sender);
 }
}
