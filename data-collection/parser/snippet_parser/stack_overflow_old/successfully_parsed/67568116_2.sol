pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

contract Sample {
    function getContractAddress() public view returns (address) {
        return address(this);
    }
    
    function signVerify(uint8 v, bytes32 r, bytes32 s) public view returns (address) {
        string memory text = "test1";
        address contractAddr = address(this);
       bytes32 message = prefixed(keccak256(abi.encodePacked(text, contractAddr)));
        return ecrecover(message, v, r, s);
    }
    
    function prefixed(bytes32 hash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }    
}
