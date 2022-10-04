pragma solidity ^0.4.11;

import "./SilverCoin.sol";

contract Banker {
    function abc_1() constant returns (uint) {
        return SilverCoin.abc();
    }
}
