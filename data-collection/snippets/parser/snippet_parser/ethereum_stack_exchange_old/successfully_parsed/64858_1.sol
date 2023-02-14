pragma solidity ^0.4.16;

contract init {
    address[] public userAddresses;
    function addStudent(address _user) public {
       userAddresses.push(_user);
     }

     function sendToken(uint value)public payable{
         for (uint i=0; i<userAddresses.length; i++) {
             userAddresses[i].transfer(value);
        }
     }

}
