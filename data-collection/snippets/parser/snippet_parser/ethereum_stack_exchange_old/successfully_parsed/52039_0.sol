pragma solidity ^0.4.18;

import 'github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC20/CappedToken.sol';

contract MyCoin is CappedToken {
    string public name = "MY COIN";
    string public symbol = "MYC";
    uint8 public decimals = 18;
    uint256 public cap = 500000000000000000000000;

    function MyCoin ()
        CappedToken(cap)
        public
        payable
    {

    }
}
