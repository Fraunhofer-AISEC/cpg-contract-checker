function delete_element(uint index) public returns (bool){
    if(index >= prices.length)
      return false;
  
  for (uint i = index; i < prices.length-1 ; i++){
      prices[i] = prices[i+1];
  }
  prices.length--;
  return true;
}
