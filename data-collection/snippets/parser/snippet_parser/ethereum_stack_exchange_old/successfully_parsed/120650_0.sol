pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
contract fNftErc20 {
    using EnumerableSet for EnumerableSet.AddressSet;
    using EnumerableSet for EnumerableSet.UintSet;

    struct fCollection{
        EnumerableSet.AddressSet nftAddress;
        EnumerableSet.UintSet nftIds;
        bool mintable;
    }

    mapping(address => fCollection) private fractionalizationCollections;

    function ad(address fnft, address[] calldata nft, uint256[] calldata id) public {
      EnumerableSet.AddressSet lockedNft;
      EnumerableSet.UintSet lockedId;
      for(uint256 i = 0; i<nft.length; i++){
        lockedId.add(id[i]);
        lockedNft.add(nft[i]);
      }
      fractionalizationCollections[fnft] = fCollection(lockedNft, lockedId, true);
    }
}

