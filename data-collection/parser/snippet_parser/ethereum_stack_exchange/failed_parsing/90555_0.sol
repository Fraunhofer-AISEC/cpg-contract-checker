library SafeERC20 {
using SafeMath for uint256;

function safeTransfer(IERC20 token, address to, uint256 value) internal {
    require(token.transfer(to, value));    **---------  Issue Line -------**
}
