
function isDuplicate() public view returns (bool){
    for(uint i = 0; i < addressIndices.length; i++){
        if(addressIndices[i] == msg.sender) return true;
        else return false;
  }
}
