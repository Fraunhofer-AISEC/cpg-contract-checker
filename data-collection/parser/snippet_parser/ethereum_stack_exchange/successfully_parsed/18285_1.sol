pragma solidity ^0.4.8;

library Data {

  struct LockBox {
    address creator; 
    uint amount; 
    bytes32 password1; 
    bytes32 password2;
    uint creationTime;
    bool active;
    uint index;        
  }        

  struct LockBoxes { 
      mapping(address => LockBox) boxes; 
  } 

  struct LockBoxIndex { 
      address[] boxIndex; 
  }

  function insert(
      LockBoxes storage s1, 
      LockBoxIndex storage s2,
      address _receiver,
      address _creator,
      uint _amount, 
      bytes32 _password1, 
      bytes32 _password2)
      public
      returns (bool)
  {
      if (s1.boxes[_receiver].active)
           return false;
      s1.boxes[_receiver] = LockBox(_creator, _amount, _password1, _password2, now, true, s2.boxIndex.push(_receiver) - 1);
      return true;
  }  
}
