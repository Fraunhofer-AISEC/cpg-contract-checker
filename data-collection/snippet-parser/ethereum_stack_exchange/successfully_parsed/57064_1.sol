    pragma solidity ^0.4.24;
    import "openzeppelin-                        solidity/contracts/token/ERC20/StandardToken.sol";
    contract TestToken is StandardToken {
    string public name = "TMED Token";
    string public symbol = "TMED1";
    uint8 public decimals = 18;
    uint public INITIAL_SUPPLY = 4000000000000000000000000000;
    constructor() public {
      totalSupply_ = INITIAL_SUPPLY;
      balances[msg.sender] = INITIAL_SUPPLY;
    }
    }
