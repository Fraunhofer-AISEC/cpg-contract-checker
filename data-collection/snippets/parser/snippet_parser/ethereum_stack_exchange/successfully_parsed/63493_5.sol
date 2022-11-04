function getProductOwnerCount(uint part) public view returns(uint) { 
  return prod_store[part].owners.length; 
}

function getProductOwnerAtIndex(uint part, uint index) public view returns(address) { 
  return prod_store[part].owners[index]; 
}
