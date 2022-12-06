

pragma solidity >=0.7.0 <0.9.0;

import "./Token.sol";

contract Attacker {
    Token public tokenContract;

    constructor(Token _token) {
        tokenContract = _token;
    }

    function buy() public payable {
        tokenContract.buy{ value: msg.value }();
    }
}
