
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract HeroToken is Ownable, ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  
  
  event CreatedNewHero(uint heroId, string uri);
 
  constructor() ERC721("HeroToken", "HERT") {}

  function invokeRandomHero(address _player, string memory _tokenURI) public{
    
     

    _tokenIds.increment();

    uint256 newHeroId = _tokenIds.current();
    _mint(_player, newHeroId);
    _setTokenURI(newHeroId, _tokenURI);

    emit CreatedNewHero(newHeroId, _tokenURI);        
  }

  function totalHeroes() public view returns(uint){
    return _tokenIds.current();
  }

}
