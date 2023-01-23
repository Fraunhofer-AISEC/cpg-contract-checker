pragma solidity >= 0.5.0 < 0.7.0;

contract Adoption {
  address[16] public adopters;
 function getAdopters() public view returns(address[16]) {
   return adopters;

 }
 function adopt(uint petId) public returns(uint) {
   require(petId>=0 && petId<=15,"oops");
   adopters[petId] = msg.sender;
   return petId;

 }

}
