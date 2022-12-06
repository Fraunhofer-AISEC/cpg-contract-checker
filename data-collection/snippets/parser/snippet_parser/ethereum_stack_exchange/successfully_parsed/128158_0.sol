pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

error TransferFailed();
 
contract StakeContract{

    mapping(address => uint256) public s_balances;

    function stake(uint256 amount, address token) external returns(bool){
        s_balances[msg.sender][token] += amount;
        bool success =  IERC20(token).transferFrom(msg.sender, address(this),amount);
        if(!success) revert TransferFailed();
        return success; 
    }
}
