pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract MyNFT is ERC721URIStorage {

  

  modifier onlyRoot(address message_sender){
    emit SenderAddress(message_sender);
    string memory message = string.concat("caller",  Strings.toHexString(uint160(message_sender), 20) , " is not the contract root.");
    require(rootAddress == message_sender, message);
    _;
  }

  function mint(address to, string calldata _uri) public onlyRoot(msg.sender) {
     
  }
}