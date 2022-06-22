pragma solidity ^0.4.24;

contract Test {

    uint nonce = 0;

    function PRNG() public returns(uint) {
        nonce += 1;
        return uint(keccak256(abi.encodePacked(nonce, msg.sender, blockhash(block.number - 1))));
    }
}
