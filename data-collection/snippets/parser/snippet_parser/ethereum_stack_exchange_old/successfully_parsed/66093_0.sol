 
pragma solidity >=0.4.21 <0.6.0;

contract Owned {

address owner;

  constructor () public{
   owner=msg.sender;
  }
  modifier onlyOwner(){
 if(msg.sender==owner){
     _;
    }
  }
}
