pragma solidity ^0.4.4;
import "zeppelin-solidity/contracts/token/StandardToken.sol";

contract Bencoin is StandardToken {
  string public name = "Bencoin"; 
  string public symbol = "BEN";
  uint public decimals = 18;
  uint public INITIAL_SUPPLY = 0;

  function Bencoin() {
    totalSupply = INITIAL_SUPPLY;
  }

  function mintCoin(address _to, uint256 _value) {
    balances[_to] = balances[_to].add(_value);
    totalSupply = totalSupply.add(_value); 
  }
}
