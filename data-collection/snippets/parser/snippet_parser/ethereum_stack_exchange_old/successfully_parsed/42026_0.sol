pragma solidity ^0.4.16;

import "./Set.sol";

contract d3 {
    Set.Data knownValues;

    function register(uint value) public {
        
        
        
        require(Set.insert(knownValues, value));
    }
    function contains(uint value) view public returns (bool) {
        return Set.contains(knownValues, value);
    }
    
}

pragma solidity ^0.4.16;

library Set {
  
  
  struct Data { mapping(uint => bool) flags; }

  
  
  
  
  
  
  function insert(Data storage self, uint value)
      public
      returns (bool)
  {
      if (self.flags[value])
          return false; 
      self.flags[value] = true;
      return true;
  }

  function remove(Data storage self, uint value)
      public
      returns (bool)
  {
      if (!self.flags[value])
          return false; 
      self.flags[value] = false;
      return true;
  }

  function contains(Data storage self, uint value)
      public
      view
      returns (bool)
  {
      return self.flags[value];
  }
}
