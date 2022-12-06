contract DepositPaying {
 ...
}

contract Factory {

  address[] public deployed;

  event Deployed(address newContract);

  function deployDepositPaying() public returns(address addr) {
    addr = new DepositPaying(msg.sender);
    deployed.push(addr);
    emit Deployed(addr);
  }
