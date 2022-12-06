pragma solidity ^0.8.0;

import "./Token.sol";
contract Dai is Token{
    
    constructor() Token("Dai", "DAI") {
    }
}
