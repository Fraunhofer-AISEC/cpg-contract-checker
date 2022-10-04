pragma solidity ^0.8.0;

import 'openzeppelin-solidity/contracts/token/ERC20/ERC20.sol';

contract METoken is ERC20 {
    string public constant name = 'Mastering Ethereum Token';
    string public constant symbol = 'MET';
    uint8 public constant decimals = 2;
    uint constant _initial_supply = 2100000000;

    function METoken_settings() public {
        _totalSupply = _initial_supply;
        _balances[msg.sender] = _initial_supply;
        emit Transfer(address(0), msg.sender, _initial_supply);
    }
}
