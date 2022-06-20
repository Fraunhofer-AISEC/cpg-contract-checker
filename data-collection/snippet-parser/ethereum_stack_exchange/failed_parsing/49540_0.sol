pragma solidity ^0.4.20;

import './token.sol';

contract Test {
    Token public token;
    constructor () {
        token = new Token("Test", "TST", 18);
        token.mint(msg.sender, 10000);
    }

    function call(address _to, uint256 _value) returns (bool) {
       return  address(token).delegatecall(bytes4(sha3('transfer(address, uint256)')), _to, _value);
    }
} 


status  0x1 Transaction mined and execution succeed  
decoded input   {
        "address _to": "0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C",
        "uint256 _value": "50"
    }
decoded output  {
        "0": "bool: false"
    }
