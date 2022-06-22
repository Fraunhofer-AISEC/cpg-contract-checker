
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Token721 is Ownable, ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  
  
  event CreatedNewHero(uint heroId, string uri);
  
  address coin;
  uint amountInvoke = 300;
 
  constructor(address _coin) ERC721("Token721", "SAKH") {
    coin = _coin;
  }

  function setCoin(address _coin) public{
    coin = _coin;
  }

  function invokeRandomHero(address _player, string memory _tokenURI, address _recepient) public returns (uint){
    
    IERC20 tokenA = IERC20(coin);
    uint _total = tokenA.balanceOf(_player);

    if(_total < amountInvoke)
      revert("No Founds");
      
    tokenA.transferFrom(_player, _recepient, 300);

    _tokenIds.increment();

    uint256 newHeroId = _tokenIds.current();
    _mint(_player, newHeroId);
    _setTokenURI(newHeroId, _tokenURI);

    

    return newHeroId;       
  }

  function totalHeroes() public view returns(uint){
    return _tokenIds.current();
  }

}
