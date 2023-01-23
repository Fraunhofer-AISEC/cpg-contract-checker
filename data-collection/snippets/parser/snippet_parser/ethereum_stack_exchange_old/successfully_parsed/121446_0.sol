int256[capacity] data;

function changeArray() private {
  int256[] memory tempArray = int256[capacity](data);

  for(uint256 i = 0; i < tempArray.length; i++) {
    
  }
  
  data = tempArray;
}
