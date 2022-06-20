  function claimToken(bytes32 message, bytes memory _signature, address nativeTokenAddress, uint256 amount) public {
      require( amount > 0, 'Trying to claim 0 tokens.');
      require(nativeTokenAddress != address(0x0));
      require(recoverSigner(message, _signature) == msg.sender);

      <Extra function code in here... >
  }
