   * @dev Creates an upgradeability proxy with initial implementation and calls it.
   * This is useful to initialize the proxied contract.
   * @param implementation Address of the initial implementation.
   * @param serviceRegistry service registry
   * @param data Data to send as msg.data in the low level call.
   * It should include the signature and the parameters of the function to be
   * called, as described in
   * https:
   * @return Address of the new proxy.
   */


  function createProxyAndCall(
    address implementation,
    address serviceRegistry,
    bytes data
  ) public payable returns (MaintainableUpgradeabilityProxy) {
    MaintainableUpgradeabilityProxy proxy = _createProxy(implementation, serviceRegistry);
    
    
    require(address(proxy).call.value(msg.value)(data), "failed to call proxy with data");

    if (autoActivate) {
      Activatable(address(proxy)).activate();
    }

    return proxy;
  }
