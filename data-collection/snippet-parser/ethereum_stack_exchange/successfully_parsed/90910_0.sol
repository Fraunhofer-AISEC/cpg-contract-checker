function wrap() public payable restricted {
    if (msg.value != 0) {
      WETH.deposit{value : msg.value}();
      WETH.transfer(address(this), msg.value);
    }
  }
