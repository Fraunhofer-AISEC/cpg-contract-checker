function send(uint256 _transfer) public payable {
        
  balanceOf[msg.sender] += _transfer;
  
  (bool success, bytes memory data) = address(this).call{value: msg.value)("")
} 
