pragma solidity ^0.4.6;

contract test {

    mapping (address => mapping (address => uint[])) public allowed;

    function approve (address _to, uint256 tokenId) external {
       allowed [msg.sender][_to].push(tokenId);
    }

    function getArray(address testAddress) constant returns (uint[]) {
        return allowed[msg.sender][testAddress];
    }
}
