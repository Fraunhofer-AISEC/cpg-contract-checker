pragma solidity ^0.8;

import "./Contract1.sol";

contract Contract2 is Contract1 {
    function foo() external {
        Data storage newOne = newData[0];
        
        
    }
}
