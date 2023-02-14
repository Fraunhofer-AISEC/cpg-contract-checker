pragma solidity ^0.4.18;

import 'openzeppelin-solidity/contracts/token/ERC20/CappedToken.sol';

contract YLBToken is CappedToken {
    string public name = "My Token Beta";
    string public symbol = "MTB";
    uint8 public decimals = 18;

    function YLBToken(uint256 cap) CappedToken(cap) {
    }
}
