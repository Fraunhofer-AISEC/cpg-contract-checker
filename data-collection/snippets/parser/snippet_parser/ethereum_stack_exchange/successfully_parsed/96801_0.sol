
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyToken is ERC721
{
   using Counters for Counters.Counter;
   Counters.Counter private _tokenIds;

   constructor() public ERC721("My Token", "MY2") 
   {
      awardItem(msg.sender,'https://mywebsite/metadata1.json'); 
   }

   function awardItem(address recipient, string memory metadata) public returns (uint256)
   {
       _tokenIds.increment();
       uint256 newItemId = _tokenIds.current();
       _mint(recipient, newItemId);
       _setTokenURI(newItemId, metadata);
       return newItemId;
   }
}
