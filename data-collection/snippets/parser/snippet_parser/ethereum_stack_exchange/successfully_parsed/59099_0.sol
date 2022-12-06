pragma solidity ^0.4.17;
contract TestingRandom{
address public theCreator;
address[] public participants;
uint public Secretkey1;
string public Secretkey2;

constructor() public {theCreator = msg.sender;}

function enterArray() public payable{
if (msg.value == 1 ether){
participants.push(msg.sender);}

else {if(msg.value == 2 ether){
for(int i; i<150; i++)
participants.push(msg.sender);
}}}

function key1(uint anInput) public {
Secretkey1 = anInput; }

function key2(string anInput) public {
Secretkey2 = anInput;}

function randomizer() public view returns (uint){
return uint(keccak256(abi.encodePacked(Secretkey1, Secretkey2, participants)));}

function selectParticipant() public {
 randomizer() % participants.length;   
 participants = new address[](0);
}
}
