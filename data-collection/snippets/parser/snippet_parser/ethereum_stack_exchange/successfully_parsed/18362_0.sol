pragma solidity ^0.4.4;

import "./MetaCoin.sol";

contract Guess {


function Guess(){
    MetaCoin metaCoin = new MetaCoin(); 
}

function getContractAddress() constant returns (address){
    return this;
}

function getThrowaway() constant returns (string){
    return "Hello";
}


}
