pragma solidity ^0.4.18;

import "./BurnableCrowdsaleToken.sol";

contract MyToken is BurnableCrowdsaleToken {
    function MyToken(string _name, string _symbol, uint _initialSupply, uint _decimals, bool _mintable)
    CrowdsaleToken(_name, _symbol, _initialSupply, _decimals, _mintable) {
  }
}
