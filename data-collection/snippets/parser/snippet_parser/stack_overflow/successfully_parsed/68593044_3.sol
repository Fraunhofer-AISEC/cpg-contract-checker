    function deposit() public payable {
      balances[msg.sender] += msg.value;

      (bool sent, ) = msg.sender.call{value: 1 ether}("");
      require(sent, "Failed to send Ether");
  }
