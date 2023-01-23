pragma solidity ^0.8;

contract MyContract {
    function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes memory _data) external returns(bytes4) {
        

        
        return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
    }
}
