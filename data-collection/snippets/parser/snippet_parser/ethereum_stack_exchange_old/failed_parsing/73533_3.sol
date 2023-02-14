      event  LOGTokenFallBack(address from,bytes4 value);

      function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes _data) external  {
            emit LOGTokenFallBack(_from, bytes4(keccak256("onERC721Received(address,address,uint256,bytes)")));


     } 
} 
