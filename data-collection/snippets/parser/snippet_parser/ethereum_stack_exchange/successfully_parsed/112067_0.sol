pragma solidity ^0.4.26;

contract Test {
    
    function pre_v0_5_keccak256encodingFormatStandard() external returns (bool, bool) {
        return (
            keccak256(abi.encodePacked(uint8(4))) == keccak256(uint8(4)),
            keccak256(abi.encode(uint8(4))) == keccak256(uint8(4))
            );
    }    
}
