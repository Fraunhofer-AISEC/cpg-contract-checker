
pragma solidity 0.8.16;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Contract {

    IERC20 public token;
    address public owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Not owner");
        _;
    }

    constructor(IERC20 _token) {
        token = _token;
        owner = msg.sender;
    }

    function approve(address spender, uint256 amount) external onlyOwner {
        token.approve(spender, amount);
    }

    

}
