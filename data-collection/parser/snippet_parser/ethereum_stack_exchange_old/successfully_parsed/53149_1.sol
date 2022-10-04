pragma solidity ^0.4.20;

import "../tokens/NFTokenMetadata.sol";
import "../../node_modules/@0xcert/ethereum-utils/contracts/ownership/Ownable.sol";


contract MyNFToken is
  NFTokenMetadata,
  Ownable

{

function MyNFToken(
    string _name,
    string _symbol
)
public
{
     nftName = _name;
     nftSymbol = _symbol;
  }

function mint(
    address _owner,
    uint256 _id
)
 onlyOwner
 external
{
    super._mint(_owner, _id);
 }

}
