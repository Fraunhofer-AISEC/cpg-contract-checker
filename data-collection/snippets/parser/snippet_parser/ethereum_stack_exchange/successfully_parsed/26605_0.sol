pragma solidity ^0.4.13;

contract Oracle{
    event Print(string _name, bytes32 _value);
    bytes32 key;

    function Store(bytes32 _key) returns (bytes32) {
        key = _key;
        Print("Key",_key);
        return _key;
    }

}
