contract BadBank {
  mapping(address => uint) balances;

  receive() external payable {
    balances[msg.sender] += msg.value
  }
  
  function withdrawAll() external {
    require(balances[msg.sender] != 0);
    (bool success, ) = payable(msg.sender).call{value: balances[msg.sender]}("");
    require(success);
    balances[msg.sender] = 0;
  }
}
