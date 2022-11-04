pragma solidity 0.8.1;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TransferTokens {

    IERC20 token;

    constructor(){
        token = IERC20(0x...);
    }

    function sendTokens(address receiver, uint256 amount) external {
        token.transfer(receiver, amount);
    }
}
