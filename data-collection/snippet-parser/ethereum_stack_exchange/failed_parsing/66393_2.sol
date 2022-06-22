import "./IERC20.sol";

contract MyContract {

  constructor(address tokenContractAddress) public {
    IERC20 token = IERC20(tokenContractAddress); 
    uint deployerBalance = token.balanceOf(msg.sender);
    if (deployerBalance > ...
  }
}
