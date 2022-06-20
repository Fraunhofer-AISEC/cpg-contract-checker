import "./IERC20.sol";

contract MyContract {

  function myTokenBalance(address tokenContractAddress) public view returns(uint) {
    IERC20 token = IERC20(tokenContractAddress); 
    return token.balanceOf(msg.sender);
  }
}
