pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol";


contract Test2 {
       
        IERC20 public token;
       
        constructor(address _token) public {
        token = IERC20(_token);
        }
        
        function getBalance() public view returns(uint) {
            uint balance_ = token.balanceOf(msg.sender);
            return balance_;
        }
        
        function deposit(uint amount) public {
            require(amount <= token.balanceOf(msg.sender), "you don't have enough balance.");
            token.transferFrom(msg.sender, address(this), amount);
        }
    
}
