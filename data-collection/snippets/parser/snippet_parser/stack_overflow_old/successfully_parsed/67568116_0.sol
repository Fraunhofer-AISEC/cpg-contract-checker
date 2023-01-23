pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

contract Sample {
    function getContractAddress() public view returns (address) {
        return address(this);
    }
    
    function verifySign(uint8 v, bytes32 r, bytes32 s) public view returns (address) {
        return ecrecover(keccak256(abi.encodePacked("test1", address(this))), v, r, s);
    }
}
