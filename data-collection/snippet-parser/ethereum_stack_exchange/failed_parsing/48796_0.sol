pragma solidity ^0.4.23;




contract ERC721Receiver {
    
    
    
    bytes4 constant ERC721_RECEIVED = 0xf0b9e5ba;

    
    
    
    
    
    
    
    
    
    
    `bytes4(keccak256("onERC721Received(address,uint256,bytes)"))`
    function onERC721Received(address _from, uint256 _tokenId, bytes _data) public returns(bytes4);
}
