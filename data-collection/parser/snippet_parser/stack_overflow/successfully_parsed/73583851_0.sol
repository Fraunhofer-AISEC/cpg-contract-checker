pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyContract {
    IERC20 public immutable token;

    constructor(IERC20 _token) {
        token = _token;
    }

    function transferIn() external {
        bool success = token.transferFrom(msg.sender, address(this), 100 * 1e18);
        
    }
}
