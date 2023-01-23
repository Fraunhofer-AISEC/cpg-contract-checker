pragma solidity ^0.6.6;

import "./new1ERC20.sol";

  contract ConfigureERC20 is new1ERC20 {

     uint256 tokenPrice = 500000000000000 wei;
     uint256 public tokensToGet = 0;

     fallback() external payable {
        require(msg.value > 0);
     
        tokensToGet = msg.value / tokenPrice;

        
        
        emit Transfer(address(this), msg.sender, tokensToGet);
        msg.sender.transfer(tokensToGet);
    }
}
