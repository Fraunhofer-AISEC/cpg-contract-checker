

pragma solidity >=0.7.0 <0.9.0;

import "./Token.sol";

contract Attacker {
    Token public tokenContract;

    constructor(Token tokenContract) {
        tokenContract = tokenContract;
    }

    function buy() public payable {
        tokenContract.buy{ value: msg.value }();
    }
}
