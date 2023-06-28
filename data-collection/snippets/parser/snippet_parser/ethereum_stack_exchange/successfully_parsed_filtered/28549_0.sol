pragma solidity ^0.4.0;

contract Example {

    mapping(address => uint) public values;
    mapping(address => bool) public usedAddresses;


    function update(uint newVal) {

        values[msg.sender] = newVal;
        usedAddresses[msg.sender] = true;
    }

    function dosomethiingwithval(){

        if(usedAddresses[msg.sender]){ 

             
        }
    }

}
