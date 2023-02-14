import "./LibA.sol";

contract A {
  function sendFunds(address _to, uint256 _amount) public nonReentrant {
    LibA.sendTo(_to, _amount);
}
}