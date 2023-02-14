pragma solidity ^0.4.10;

import '../SimpleToken.sol';

contract SimpleTokenAttack {
    SimpleToken public victim;

    function SimpleTokenAttack(address _addr) public {
        victim =  SimpleToken(_addr);
    }

    function buy() public returns(bool) {
        
    }

    function send() public returns(bool) {
        
    }
}
