pragma solidity ^0.4.24;

contract Random {

    uint nonce = 0;

    function random() public returns(uint) {
        nonce += 1;
        return uint(keccak256(abi.encodePacked(nonce)));
    }
}
