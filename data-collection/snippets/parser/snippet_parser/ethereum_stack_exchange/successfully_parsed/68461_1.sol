function onERC721Received(
    address, 
    address, 
    uint256, 
    bytes calldata
)external returns(bytes4) {
    return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
} 
