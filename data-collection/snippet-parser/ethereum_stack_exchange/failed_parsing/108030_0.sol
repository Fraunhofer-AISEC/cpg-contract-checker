BaseContract.sol:

contract layeredNFT is ERC1155 {
  using baseLayer for uint256;

  struct NFT {
    
    uint256 layer1;
    uint256 layer2;
    uint256 layer3;
  }

LayerContract.sol:

contract layer is ERC1155 { 

This token's URI points to the metadata with image..

}
