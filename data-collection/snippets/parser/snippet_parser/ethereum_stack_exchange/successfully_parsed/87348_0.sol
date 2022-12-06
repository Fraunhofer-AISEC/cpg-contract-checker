function viewTrail(uint256 _assetNo) public view returns(address[] memory){
   address[] memory listofOwners = new address[](assets[_assetNo].ownerNo);
  for(ownerNo = 1; ownerNo<= assets[_assetNo].ownerNo; ownerNo ++)
  {
  listofOwners.push(owneraddr[_assetNo][ownerNo]);
  }

return listofOwners;}
