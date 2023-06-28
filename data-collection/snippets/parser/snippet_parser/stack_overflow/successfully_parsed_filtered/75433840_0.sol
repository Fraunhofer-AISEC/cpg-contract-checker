pragma solidity 0.8.17;

struct NftSpec {
        uint256 supplyLimit;
        uint256 cost;
        uint256 maxMintAmountPerTx;
        uint256 alreadyMinted;
        bool toggle;
    }
enum MintingFeature {
        publicMinting,
        whitelistMinting,
        giftMinting
    }

mapping(MintingFeature => NftSpec) public feature;

constructor() ERC721("Testing", "TSNG") {
        feature[MintingFeature.publicMinting] = NftSpec(2000, 0.02 ether, 3, 0, false );
        feature[MintingFeature.whitelistMinting] = NftSpec(1000, 0.015 ether, 1, 0, false );
    }
