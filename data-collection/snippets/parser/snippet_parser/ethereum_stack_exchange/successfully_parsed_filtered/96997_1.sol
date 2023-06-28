import "./IERC20.sol";

mapping(address => bool) public tokenApproved;

function receiveTokens(address token, uint amount) public {
  require(tokenApproved[token], "We don't accept those");
  IERC20(token).transferFrom(msg.sender, address(this), amount);
  emit Received(msg.sender, token, amount);
}
