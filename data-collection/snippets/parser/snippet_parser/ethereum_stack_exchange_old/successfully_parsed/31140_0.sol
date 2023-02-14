  pragma solidity ^0.4.15;

  import "./libs/zeppelin/token/MintableToken.sol";

  contract TestToken is MintableToken {

     string public name;
     string public symbol;
     uint8 public constant decimals = 18;
     string public constant version = "1.0";

     string public location;
     uint8 public power;

     uint256 public constant tokenUnit = 10 ** 18;

     function TestToken(string _name, string _symbol, string _location, uint8 _power) {
        name = _name;
        symbol = _symbol;

        location = _location;
        power = _power;
     }
  }
