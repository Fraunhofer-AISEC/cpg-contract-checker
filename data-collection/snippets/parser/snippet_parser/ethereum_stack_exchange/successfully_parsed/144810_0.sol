
pragma solidity 0.8.16;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Contract {

    IERC20 public token;
    address public owner;


    constructor(IERC20 _token) {
        token = _token;
    }

    function approve(address spender, uint256 amount) external  {
        token.approve(spender, amount);
    }

    
    function transfer(address from, address to, uint256 amount) external {
        token.transferFrom(from, to, amount);
    }


}


