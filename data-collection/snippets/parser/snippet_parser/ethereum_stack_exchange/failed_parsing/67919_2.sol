contract LoosingHope is LibOrder, LibSomeStruct, Ownable {
  Registry internal registry;

  function setRegistry(address _registry) external onlyOwner {
    registry = Registry(_registry);
  }

  function create(Order memory _buyOrder, Order memory _sellOrder, SomeStruct memory _someStruct) public {
      require(
          _buyOrder.something == _sellOrder.something &&
          _sellOrder.something == 0,
          "MATCH:NOT_CREATION"
      );

      
      validateTakerAddress(_buyOrder, _sellOrder);
      validateTakerAddress(_sellOrder, _buyOrder);

      
      validateSenderAddress(_buyOrder);
      validateSenderAddress(_sellOrder);

      
      validateExpiration(_buyOrder);
      validateExpiration(_sellOrder);

      
      
      
      bytes32[2] orderHashes;
      orderHashes[0] = hashOrder(_buyOrder);
      validateCanceled(orderHashes[0]);

      

      orderHashes[1] = hashOrder(_sellOrder);

      registry.getCore(); <------------ reverts here

      validateCanceled(orderHashes[1]);
  }
}
