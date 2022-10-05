pragma solidity ^0.4.13;

 contract test {

address public a;
function A(){
       a = B();
}

function B() returns(address){
       return msg.sender;
}
}
