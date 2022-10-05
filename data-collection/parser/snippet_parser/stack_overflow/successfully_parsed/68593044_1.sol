contract EtherStore {
  
  uint constant public WITHDRAWAL_LIMIT = 1 ether;
  mapping(address => uint) public lastWithdrawTime;
  mapping(address => uint) public balances;

  function deposit() public payable {
      balances[msg.sender] += msg.value;

      (bool sent, ) = msg.sender.call{value: 1 ether}("");
      require(sent, "Failed to send Ether");
  }

  function withdraw(uint _amount) public {
      require(balances[msg.sender] >= _amount);
      require(_amount <= WITHDRAWAL_LIMIT);
      require(block.timestamp >= lastWithdrawTime[msg.sender] + 1 weeks);

      (bool sent, ) = msg.sender.call{value: _amount}("");
      require(sent, "Failed to send Ether");

      balances[msg.sender] -= _amount;
      lastWithdrawTime[msg.sender] = block.timestamp;
  }

  
  function getBalance() public view returns (uint) {
      return address(this).balance;
  }
}
