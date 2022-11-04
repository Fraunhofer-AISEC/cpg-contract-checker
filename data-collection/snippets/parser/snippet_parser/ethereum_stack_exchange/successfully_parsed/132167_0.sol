contract NFT is ERC1155 {
mapping(string => Library.NFTInfo) public nft;

function viewNFTInfo(string calldata _uri) public view returns(Library.NFTInfo memory) {        
        return Library.viewInfo(nft, _uri);
    }
}
