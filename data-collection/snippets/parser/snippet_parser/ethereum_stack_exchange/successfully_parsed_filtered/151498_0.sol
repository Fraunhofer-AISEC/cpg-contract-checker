uint256 requiredAmount = 1 ether; 

function myPayableFunc() external payable {
 require(msg.value > requiredAmount); 
 _processEther(msg.value);
}

function _processEther(uint256 etherValue) internal {
 if(etherValue > requiredAmount) {
  uint256 refundAmount = etherValue - requiredAmount;
  address(msg.sender).call{ value: refundAmount }("");
 }
}
