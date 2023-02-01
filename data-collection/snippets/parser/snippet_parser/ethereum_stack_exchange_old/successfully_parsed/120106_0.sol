pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameEngine is ERC721Enumerable, Ownable {

  string baseURI;
  uint256 public maxSupply = 10000;

  bool isPopulated = false;
  struct Character {
    uint8 race;
    uint8 strength;
    uint8 agility;
    uint8 hp;
    uint8 xp;
    
  }
  mapping(uint => Character) characters;

  constructor(
    string memory _initBaseURI
  ) ERC721("GameCharacters", "GC") {
    _baseURI = _initBaseURI;
  }

  
}
