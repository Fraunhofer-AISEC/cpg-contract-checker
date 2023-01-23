pragma solidity ^0.8;

contract MyContract {
    function getFunc(bytes calldata _value) public pure returns(bytes calldata) {
        return _value;
    }
}
