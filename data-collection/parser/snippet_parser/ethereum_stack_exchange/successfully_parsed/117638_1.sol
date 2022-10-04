pragma solidity ^0.8.0;

import "./ERC721Tradable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Creature is ERC721Tradable {

  string _baseURL;

  constructor(address _proxyRegistryAddress, string memory url) ERC721Tradable("Creature", "OSC", _proxyRegistryAddress) {
      _baseURL = url ;
   }

  function baseTokenURI() public override view returns (string memory) {
    return _baseURL;
  }
}
