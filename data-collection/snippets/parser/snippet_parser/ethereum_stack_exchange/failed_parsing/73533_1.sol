   function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) public  {
    transferFrom(_from, _to, _tokenId);

    
    uint32 size;
    assembly {
        size := extcodesize(_to)
    }
    if(size > 0){
       ERC721TokenReceiver receiver = ERC721TokenReceiver(_to);
       require(receiver.onERC721Received(msg.sender,_from,_tokenId,data) == bytes4(keccak256("onERC721Received(address,address,uint256,bytes)")));

    }
