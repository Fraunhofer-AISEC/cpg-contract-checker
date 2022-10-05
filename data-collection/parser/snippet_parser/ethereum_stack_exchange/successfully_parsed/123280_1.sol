function foo() public payable {
  uint256 msgValue = msg.value;
  if (msgValue >= thresholdValue0) {
    
  } else if (msgValue < thresholdValue0 && msgValue >= thresholdValue1) {
    
  } else if (msgValue < thresholdValue1) {
    
  }
}
