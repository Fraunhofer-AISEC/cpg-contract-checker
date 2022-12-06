    library Set {
  
  
  struct Data { mapping(string => bool) flags; }

  
  
  
  
  
  
  function insert(Data storage self, string memory value)
      public
      returns (bool)
  {
      if (self.flags[value])
          return false; 
      self.flags[value] = true;
      return true;
  }

  function remove(Data storage self, string memory value)
      public
      returns (bool)
  {
      if (!self.flags[value])
          return false; 
      self.flags[value] = false;
      return true;
  }

  function contains(Data storage self, string memory value)
      public
      view
      returns (bool)
  {
      return self.flags[value];
  }
}
