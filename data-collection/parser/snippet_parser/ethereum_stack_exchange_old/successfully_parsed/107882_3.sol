pragma solidity ^0.8.0;

contract TargetCall {
    
    fallback() external payable {
        assert(false);
    }
}
