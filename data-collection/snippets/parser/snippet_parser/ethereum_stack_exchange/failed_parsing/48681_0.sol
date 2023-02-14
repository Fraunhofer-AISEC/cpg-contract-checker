':20:16: TypeError: Member "push" not found or not visible after argument-dependent lookup in uint32[100] storage ref\n    uint32 a = people.push(12);\n               ^---------^\n'


pragma solidity ^0.4.18;

contract Voting {


 mapping (bytes32 => uint8) public votesReceived;
 uint32[100] public people;

 bytes32[] public candidateList;

 function Voting(bytes32[] candidateNames) public {
   candidateList = candidateNames;
   people.push(12);
 }

 function onlyOneVote(uint32 ethaddress) returns(bool) {
   bool a = autentic(ethaddress);
   if (a == true) {
     people.push(ethaddress);
   }

 }

 function autentic(uint32 id) view public returns(bool) {
   for(uint i = 0; i< people.length; i++) {
     if(people[i] == id) {
       return (false);
     } else {
       return(true);
     }
   }
 } 
