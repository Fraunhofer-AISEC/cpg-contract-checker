pragma solidity ^0.6.12;

import "./TRC20.sol";

contract Contract1 is ITRC20{
    
    address token;
    
    function emitter() {
        
        emit  ITRC20(token).Transfer(msg.sender, msg.sender, 25);
    }
    
}
