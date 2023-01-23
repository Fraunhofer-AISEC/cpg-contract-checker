pragma solidity ^0.8.0;

import "path/to/openzeppelin/contracts/token/IERC20.sol";

contract Owner {

    function safeTransferFrom(address token, address from, address to, uint256 amount) external return bool{
            IERC20 token = IERC20(token);
            if(token.allowance(from, to) < amount){
                revert("You don't have allowance for that")
            }
            token.transferFrom(from, to, amount);
            return true;
    }
}

