

pragma experimental ABIEncoderV2;
pragma solidity >=0.6.0 <0.8.0;
import "../ERC721/ERC721.sol";

contract newNFT is ERC721 {
 uint internal counterNFT;
    constructor () public{
     counterNFT = 1;
  }
 
  function mint(string memory uri,string memory name,string memory symbol) public {
       name_symbol(name,symbol);
       _safeMint(msg.sender, counterNFT);
        _setTokenURI(counterNFT, uri);
        counterNFT++;
  }
}
