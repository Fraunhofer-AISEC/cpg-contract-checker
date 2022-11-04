
pragma solidity ^0.8.16;

contract MappingStorage {

    mapping(address => uint) public balances;

    constructor() {
        balances[0x6827b8f6cc60497d9bf5210d602C0EcaFDF7C405] = 678;
        balances[0x66B0b1d2930059407DcC30F1A2305435fc37315E] = 501; 
        
    }

    function getStorageLocationForKey(address _key, uint256 p) public pure returns(bytes32) {
        
        bytes memory encoded = abi.encode(_key, p);
        return keccak256(encoded);
    }

}
