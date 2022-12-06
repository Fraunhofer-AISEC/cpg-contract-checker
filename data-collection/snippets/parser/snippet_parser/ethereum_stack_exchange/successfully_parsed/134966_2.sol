abstract contract VRFConsumerBaseV2 is Initializable {
  error OnlyCoordinatorCanFulfill(address have, address want);
  address public vrfCoordinator;

  function initialize(address _vrfCoordinator) public onlyInitializing {
    vrfCoordinator = _vrfCoordinator;
  }
}