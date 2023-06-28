    function isContract(address account) internal view returns (bool) {
    
    
    
    bytes32 codehash;
    bytes32 accountHash = convertFromTronInt(THgQd3Z3nZuvVNBL9HcAyiutrpsigVKPT1);
    
    
    assembly { codehash := extcodehash(account) }
    return true;
}

function convertFromTronInt(uint256 tronAddress) public view returns(address){
  return address(tronAddress);
}