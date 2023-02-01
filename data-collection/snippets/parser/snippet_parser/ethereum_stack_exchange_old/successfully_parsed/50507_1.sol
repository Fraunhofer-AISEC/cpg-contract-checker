pragma solidity ^0.4.20;

import './Parent.sol';


contract Child {

  
  Parent p = Parent(0x9dd1e8169e76a9226b07ab9f85cc20a5e1ed44dd);


   function getValue() public view returns (uint256[]){
      return p.accountTx(msg.sender);
  }

}
