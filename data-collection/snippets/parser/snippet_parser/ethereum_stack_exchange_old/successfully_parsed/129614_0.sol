 function _depositToCompound(uint256 _amount) internal returns (uint256) {
 require(dai.approve(address(cDai), _amount));

 uint256 result = cDai.mint(_amount);
 return result;
}
