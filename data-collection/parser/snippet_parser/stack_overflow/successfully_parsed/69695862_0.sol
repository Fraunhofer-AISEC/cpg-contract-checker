struct StrData{
      
      string dhash;
       uint sizeOfMapping;
        mapping(uint => string) strDataMap;
  }
  StrData data;
 
function set(string memory x) public {
     data.strDataMap[data.sizeOfMapping++] = x;
   
   
  }

  function get() public view returns (string[] memory) {
      
      string[] memory memoryArray = new string[](data.sizeOfMapping);
        for(uint i = 0; i < data.sizeOfMapping; i++) {
             memoryArray[i] = data.strDataMap[i];
        }
        return memoryArray;
   
  }
