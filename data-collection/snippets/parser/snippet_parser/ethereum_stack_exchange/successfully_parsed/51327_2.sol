pragma solidity ^0.4.24;

import "./StandardToken.sol";
import "./Ownable.sol";

contract CommissionToken is StandardToken, Ownable {

  uint256 public commission = 1000;

  
  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    balances[_from] = balances[_from].sub(commission);
    balances[owner] = balances[owner].add(commission);
    return super.transferFrom(_from, _to, _value);
  }

  
  function transfer(
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    balances[msg.sender] = balances[msg.sender].sub(commission);
    balances[owner] = balances[owner].add(commission);
    return super.transfer(_to, _value);
  }
}
