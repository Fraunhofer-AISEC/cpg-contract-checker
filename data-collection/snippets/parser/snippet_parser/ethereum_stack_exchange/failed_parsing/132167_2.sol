contract A is ERC20 {
    IERC1155 public nfts;

    constructor () {
        nfts = IERC1155(nftAddr);
    }
    Library.NFTInfo memory collect = nfts.viewInfo(ipfs); 
        nfts.burn(anAddr, collect.collectId, amount);

    }
}
