

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

pragma solidity ^0.8.0;

contract Contract is ERC721 {
  
  uint num_of_nfts = 0;
  mapping (uint => ERC721) nft_holdings;

  function call_when_recieve_nft(nft) public {
    nft_holdings[num_of_nfts] = nft;
  }
}
