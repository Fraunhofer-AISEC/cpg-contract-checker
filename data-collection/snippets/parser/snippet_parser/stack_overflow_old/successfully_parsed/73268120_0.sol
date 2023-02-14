import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MeowToken is ERC20 {
  constructor() ERC20("MeowToken", "MEO") {
    ERC20._mint(msg.sender, 10_000_000);
  }
  function transferAndCall(
    TokenReceiver to,
    uint256 amount,
    bytes4 selector
  ) external {
    ERC20.transfer(address(to), amount);
    to.onTransferReceived(msg.sender, amount, selector);
  }
}
