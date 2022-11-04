  function claimToken(address nativeTokenAddress, uint256 amount) public {
      require( amount > 0, 'Trying to claim 0 tokens.');
      require(msg.sender != address(0x0)); <---- I need to test this

    
     emit Claimed(msg.sender, amount, wrappedTokenAddress);
   }
