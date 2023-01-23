contract DriverFactory {

  address[] public deployedDrivers;

  function createDrivers() public {
    Driver createNewDriver =  new Driver(msg.sender);
    
    deployedDrivers.push(address(createNewDriver));
  }

  function getAllRegisteredDrivers() public view returns(address[] memory) {
    return deployedDrivers;
  }

}
