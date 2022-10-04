pragma solidity 0.4.25;

contract ApproveInterface {
    function approve(address to, uint256 tokenId) public;
}

contract Approve is ApproveInterface {
    uint x;
    function approve(address to, uint256 tokenId, bytes32 other) public {
        x = 1;
    }
}
