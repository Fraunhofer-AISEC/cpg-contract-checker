pragma solidity ^0.8.0;

import { IERC20 } from "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";

contract MyContract {
  
  IERC20 public token;

  constructor(address _tokenAddress) public {
    
    token = IERC20(_tokenAddress);
  }

  function receivePayment(address _from, uint256 _value) public {
    
    require(token.transferFrom(_from, address(this), _value), "ERC20: transfer failed");
  }
}
