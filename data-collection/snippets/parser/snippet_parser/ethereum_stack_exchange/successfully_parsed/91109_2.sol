pragma solidity >=0.4.23 <0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/IERC20.sol";

contract SmartMatrix is IERC20 {
    IERC20 private _token;
    constructor(IERC20 token) public {
        _token = token;
    }
    function sendERC20TokeToDnividends(address sender, address recipient, uint256 amount) public returns (bool) {    
        _token.transferFrom(sender, recipient, amount);
        return true;
    }
}
