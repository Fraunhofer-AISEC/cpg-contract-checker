import "./IERC20.sol";

contract Checker {

  function checkBal(address token, address holder) public view returns(uint) {
    IERC20 token = IERC20(token);
    return token.balanceOf(holder);
  }
}
