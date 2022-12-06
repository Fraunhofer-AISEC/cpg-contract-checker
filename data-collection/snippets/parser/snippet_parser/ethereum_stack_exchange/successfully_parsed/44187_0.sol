    pragma solidity ^0.4.18;
contract ValueIO {

 uint myidaaaa;

 uint price = 100000000 wei;

 function Input(uint feion) public payable {
     require(msg.value > price);  

     myidaaaa = feion;
 }

 function Output() public constant returns (uint,bool) {
     return (myidaaaa,true);
 }
}
