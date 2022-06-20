function mintNFT(address recipient, string memory tokenURI) public payable  {
    require(msg.value >= 50000000000000000, "You need 0.05 ETH to mint the NFT");

    
    payable(address(0x123)).transfer(msg.value);

    
}
