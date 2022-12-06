    function listMyPromises() public returns(uint256[] memory ){ 
  uint256[] memory List;
  for(uint i=0; i<table.length; i++){
    if(table[i].userAddress==msg.sender){
      List.push(uint256(table[i].friendAddress));
    }
  }
    return List;
}
