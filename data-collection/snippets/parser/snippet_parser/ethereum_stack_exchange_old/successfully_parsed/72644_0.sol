contract Target {}

contract Deployer {
  function deploy() external returns (Target) {
    return new Target();
  }
}
