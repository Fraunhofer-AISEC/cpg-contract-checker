

pragma solidity 0.8.12;

contract test2 {

 bool myBool;

 function getBool() public view returns(bool){
    return myBool;
 }

 function setBool(bool _bool) public {
    myBool = _bool;
 }
}