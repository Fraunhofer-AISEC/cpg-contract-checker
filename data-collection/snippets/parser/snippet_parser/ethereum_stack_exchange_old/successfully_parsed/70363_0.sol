pragma solidity ^0.5.8;

contract test1 {

uint256 count =0;
address payable owner;
address[] public players;

 constructor () public { 
    owner = msg.sender; 

 }


function play() payable public { 
            require (msg.value >= 100000000000000000);
            players[count]=msg.sender;
    count++; 
 }
}
