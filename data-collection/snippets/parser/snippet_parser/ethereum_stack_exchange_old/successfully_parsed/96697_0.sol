pragma solidity >=0.7.0 <0.9.0;
contract Test {
    function makeHash(uint intValue, string calldata strValue) public view returns (bytes32) {
        bytes32 myHash = keccak256(abi.encode(intValue, strValue, msg.sender));
        return myHash;
    }
}
