pragma solidity 0.4.24;

contract HashToUint {

    uint256 randNonce;

    function test() public returns(uint) {
        randNonce++;
        return uint(keccak256(abi.encodePacked(msg.sender, randNonce, now)));
    }
}
