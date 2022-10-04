pragma solidity ^0.4.24;

contract Names {

 string[] names;

 function setname(uint i, string s)public returns(bool){

     names[i]=s;
     return true;
 }
}
