pragma solidity ^0.4.24;

contract VerifyTest {
    
    function verifyMessage(bytes32 messageHash, uint8 v, bytes32 r, bytes32 s) private view returns (bool) {
        bytes memory hashPrefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(abi.encodePacked(hashPrefix, messageHash));
        return ecrecover(prefixedHash, v, r, s) == msg.sender;
    }

    function testBuyOrder(uint256 orderTotal, address tokenContract, uint8 v, bytes32 r, bytes32 s) public view returns (bool) {
        bytes32 messageHash = keccak256(abi.encodePacked(orderTotal, tokenContract));
        return verifyMessage(messageHash, v, r, s);
    }
}
