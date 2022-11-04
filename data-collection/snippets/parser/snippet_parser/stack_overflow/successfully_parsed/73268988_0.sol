address contractDeployer;
uint txCharge = 1 

constructor(string memory name_, string memory symbol_) {
  _name = name_;
  _symbol = symbol_;
  contractDeployer= msg.sender;
}
