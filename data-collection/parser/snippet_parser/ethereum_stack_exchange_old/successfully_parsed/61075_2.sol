pragma solidity 0.4.25;

contract ApproveInterface {
    function approve(address to, uint256 tokenId) public;
}

contract Approve is ApproveInterface {
    function approve(address to, uint256 tokenId) public returns(bool success) {
        return true;
    }
}
