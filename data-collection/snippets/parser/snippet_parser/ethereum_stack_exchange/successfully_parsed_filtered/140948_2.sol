pragma solidity ^0.8.0;

import { IERC20 } from "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";

contract MyContract {
  
  IERC20 public token;

  
  address[] public acceptedTokens;

  constructor(address[] memory _acceptedTokens) public {
    
    acceptedTokens = _acceptedTokens;
  }

  function receivePayment(address _from, uint256 _value, address _token) public {
    
    require(isAcceptedToken(_token), "ERC20: token not accepted");

    
    token = IERC20(_token);

    
    require(token.transferFrom(_from, address(this), _value), "ERC20: transfer failed");
  }

  function isAcceptedToken(address _token) public view returns (bool) {
    
    for (uint256 i = 0; i < acceptedTokens.length; i++) {
      if (acceptedTokens[i] == _token) {
        return true;
      }
    }

    return false;
  }
}
