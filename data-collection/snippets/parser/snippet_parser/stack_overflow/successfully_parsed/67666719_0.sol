    
    pragma solidity ^0.6.2;

    contract Example {
    function signature(uint256 tokenId, uint8 v, bytes32 r, bytes32 s) public view returns(address) {
    return ecrecover(keccak256(abi.encodePacked(this,tokenId)), v, r, s);
    }
}