  function setSmartContractAllownace(uint daiAmountIn) public {
     IERC20 daiToken = IERC20(ropstenDAI);
     daiToken.approve(address(this), daiAmountIn);
  }

  function getContractAddress() public view returns (address) {
      return address(this);
  }
  
  function getOwner() public view returns (address) {
      return msg.sender;
  }
