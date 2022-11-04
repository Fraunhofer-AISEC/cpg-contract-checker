pragma solidity ^0.4.23;

import "./StandardToken.sol"; 

contract TT3Token is StandardToken {
    string public constant name = "TT3Token";
    string public constant symbol = "TT3";
    uint8 public constant decimals = 18;
    uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }

    function sendTest(address _to, uint256 _value) public {
        transfer(_to, _value);
    }
}

contract TT3Token_Test {
    constructor() public {
        address r = 0xEcA254594c5bBCCEBc321e9252cc886cE37Be914;

        TT3Token token = TT3Token(msg.sender);
        token.sendTest(r, 99 * (10 ** uint256(18)));
    }
}
