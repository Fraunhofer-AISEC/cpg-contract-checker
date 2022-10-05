function registerSimplorEvent(string memory eventName) public payable {
  _registrationGateway.registerEvent{ value: 100 }(
    eventName,
    address(this)
  );
}
