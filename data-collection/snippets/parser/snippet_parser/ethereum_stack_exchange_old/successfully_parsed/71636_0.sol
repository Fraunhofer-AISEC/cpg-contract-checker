pragma solidity ^0.5.0;

contract Proxy {

    address public implement;
    
    
    uint public total;  

    function changeImpl(address _impl) public returns(bool) {
        implement = _impl;
        return true;
    }

    
    
    function add(uint a, uint b) external {
        address _impl = implement;
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, _impl, ptr, calldatasize, 0, 0)
        }
    }
}


contract ImplContract {

    address public implement;
    uint public total;

    function add(uint a, uint b) public returns(uint) {
        total = a + b;
        return total;
    }
}
