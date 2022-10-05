pragma solidity ^0.4.17;

import 'zeppelin-solidity/contracts/token/StandardToken.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

    contract TutorialToken is StandardToken, Ownable {

        string public name = 'TutorialToken';
        string public symbol = 'TT';
        uint8 public decimals = 2;
        uint public INITIAL_SUPPLY = 12000;

        function TutorialToken() public {
        totalSupply = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        owner = msg.sender;
    }

    }
