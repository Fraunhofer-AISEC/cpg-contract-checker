library DataSet {   
  struct IndexValue { uint keyIndex; uint256 value;}  
  struct KeyFlag { uint key; bool deleted; }  
  struct KeyValue { uint key; uint value; }  

  struct Data {   
      mapping(uint => IndexValue) data;  
      KeyFlag[] keys;  
      
      uint size;  
  }  

  function insert(Data storage self, uint key, uint256 value) returns (bool replaced){  
    uint keyIndex = self.data[key].keyIndex;  
    self.data[key].value = value;  
    if (keyIndex > 0)  
      return true;  
    else  
    {  
      keyIndex = self.keys.length++;   
      self.data[key].keyIndex = keyIndex + 1;  
      self.keys[keyIndex].key = key;  
      self.size++;  
      return false;  
    }  
  }  

  function getCurrent(Data storage self) returns(uint index){  
      return self.size - 1;  
  }  

}  
