pragma solidity ^0.8.4;

contract MyContract {
    enum VerifiedResult {VerifiedSuccessfully, VerifiedFailed, NotClear}
    
    VerifiedResult result;
    
    function foo() external {
        result = VerifiedResult.NotClear; 
    }
}
