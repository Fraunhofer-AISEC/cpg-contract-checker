pragma solidity ^0.4.8;


contract TestContract  {

bytes32 byt;
string str;

function setByte(bytes32 value) public {
   byt = value;
}


function setStr(string value) public {
   str = value;
}

}
