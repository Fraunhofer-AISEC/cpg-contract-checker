
pragma solidity 0.8.0;

import "@0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
import "@0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract newNFT is NFTokenMetadata, Ownable {
    ERC20 KOOLToken;

    constructor() {
        KOOLToken=ERC20(0xxxxxxxxxxxxxxxxxxxxxxxxxxx);
        nftName = "Test NFT 123";
        nftSymbol = "TNFT321";
    }

    function approve() public onlyOwner {
      KOOLToken.approve(address(msg.sender), 1);
    }

function transferFrom() public onlyOwner{
  KOOLToken.transferFrom(msg.sender,msg.sender, 1);
}

function mint(address _to, uint256 _tokenId, string calldata _uri) public onlyOwner {
  super._mint(_to, _tokenId);
  super._setTokenUri(_tokenId, _uri);
}
}
