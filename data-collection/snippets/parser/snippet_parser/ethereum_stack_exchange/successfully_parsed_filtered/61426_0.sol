pragma solidity 0.4.25;

contract sendether{

     function receiveEther() payable public{
     }

     function sendEther(address _address) payable public{
         uint value = 5 ether;

         _address.transfer(value);
     }

}
