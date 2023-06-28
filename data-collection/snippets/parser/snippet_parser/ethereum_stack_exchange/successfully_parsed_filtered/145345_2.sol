contract ReceiveEther {
    
  receive() external payable {}‍
  
  
  fallback() external payable {}‍
  
  function getBalance() public view returns (uint) {
    return address(this).balance;
   }
  }
