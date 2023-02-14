function getStakers() external returns(address[] memory, uint256[] memory) {
  
  for(i=0; i < stakers.length; i++) {
    sAddress[i] = address_from_mapping;
    sAmount[i] = uint256_from_mapping;
  }
  return (sAddress, sAmount);
}
