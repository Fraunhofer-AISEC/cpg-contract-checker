

pragma solidity >=0.8.0 <0.9.0;

contract Contract {
    mapping (bytes32 => uint) public mapTest;

    function addKVpair(bytes32 key, uint value) public {
        mapTest[key] = value;
    }
}
