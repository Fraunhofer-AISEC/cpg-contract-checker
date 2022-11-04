pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract VeryGoodNftWithMaxSupply is ERC721URIStorage {

  uint256 private _currentId = 0;
  address public rootAddress = address(0);
  uint256 public _maxSupply = 3;

  event Minted(address to, uint256 nftId, address minter);

  modifier shouldLessThanMaxSupply(){
    require(
      _currentId < _maxSupply, "Reached max supply, no available nft left"
    );
    
    _;
  }

  constructor() ERC721("VeryGoodNftWithMaxSupply", "VGNWM") {
    rootAddress = msg.sender;
  }

  function mint(address to) external shouldLessThanMaxSupply{
    uint256 nftId = _currentId + 1;
    _mint(to, nftId);
    _currentId = nftId;
    address from = msg.sender;
    emit Minted(to, nftId, from);
  }
}
