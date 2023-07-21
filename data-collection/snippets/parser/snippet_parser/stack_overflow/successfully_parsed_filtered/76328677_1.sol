pragma solidity ^0.4.11;

import "https://github.com/smartcontractkit/chainlink/contracts/src/v0.4/ERC677Token.sol";
import { StandardToken as linkStandardToken } from "https://github.com/smartcontractkit/chainlink/contracts/src/v0.4/vendor/StandardToken.sol";


contract LinkToken is linkStandardToken, ERC677Token {

  uint public constant totalSupply = 10**27;
  string public constant name = "ChainLink Token";
  uint8 public constant decimals = 18;
  string public constant symbol = "LINK";

  function LinkToken()
    public
  {
    balances[msg.sender] = totalSupply;
  }

  
  function transferAndCall(address _to, uint _value, bytes _data)
    public
    validRecipient(_to)
    returns (bool success)
  {
    return super.transferAndCall(_to, _value, _data);
  }

  
  function transfer(address _to, uint _value)
    public
    validRecipient(_to)
    returns (bool success)
  {
    return super.transfer(_to, _value);
  }

  
  function approve(address _spender, uint256 _value)
    public
    validRecipient(_spender)
    returns (bool)
  {
    return super.approve(_spender,  _value);
  }

  
  function transferFrom(address _from, address _to, uint256 _value)
    public
    validRecipient(_to)
    returns (bool)
  {
    return super.transferFrom(_from, _to, _value);
  }


  

  modifier validRecipient(address _recipient) {
    require(_recipient != address(0) && _recipient != address(this));
    _;
  }

}
