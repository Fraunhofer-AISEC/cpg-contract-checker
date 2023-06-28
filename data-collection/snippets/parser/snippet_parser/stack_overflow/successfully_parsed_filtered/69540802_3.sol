pragma solidity ^0.8;

contract MyContract {
    function foo2(address param1, uint256 param2) external {
        
    }
    
    function foo1(bytes memory params) external {
        (address decodedAddress, uint256 decodedUint) = abi.decode(params, (address, uint256));
        this.foo2(decodedAddress, decodedUint);
    }
}
