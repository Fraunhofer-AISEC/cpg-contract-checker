
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Art is ERC721URIStorage, Ownable {
   using Counters for Counters.Counter;
   Counters.Counter private _tokenIds;

   constructor() ERC721("Art", "JL") {
       mintNFT(msg.sender,13);
   }

   function mintNFT(address recipient,uint256 _mintAmount)
       public onlyOwner
    
   {    for (uint256 i = 1; i <= _mintAmount; i++) {
       _tokenIds.increment();

       uint256 newItemId = _tokenIds.current();
       _mint(recipient, newItemId);
       _setTokenURI(newItemId, "ipfs://QmdbnwfBNE6ZekuppZnx9rk76sAmMDucnHP78UZzhwu4S3/metadata/{i}.json");
    }

   }
}
