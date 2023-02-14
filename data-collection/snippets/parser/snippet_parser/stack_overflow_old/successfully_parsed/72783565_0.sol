 pragma solidity ^0.8.15;

 contract sendEther {

     function deposit() external payable {}

     function send(address payable _to) external payable {
         _to.transfer(1); 
     }

     function getBalance() public view returns(uint){

         return address(this).balance;
     }

 }

 contract receiveEther {

     function getBalance() external view returns(uint){
         return address(this).balance;
     }
 }
