pragma solidity 0.5.1;

import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";


contract MyCarCollection is
  NFTokenMetadata,
  Ownable
{

  
  constructor()
    public
  {
    nftName = "My Car Collection";
    nftSymbol = "MCC";
  }

  
  function mint(
    address _to,
    uint256 _tokenId,
    string calldata _uri
  )
    external
    onlyOwner
  {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }

  
  function burn(
    uint256 _tokenId
  )
    external
    onlyOwner
  {
    super._burn(_tokenId);
  }

}
