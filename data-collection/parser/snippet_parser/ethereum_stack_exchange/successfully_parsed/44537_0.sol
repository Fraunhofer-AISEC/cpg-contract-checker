pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import 'zeppelin-solidity/contracts/lifecycle/Destructible.sol';
import 'zeppelin-solidity/contracts/lifecycle/Pausable.sol';
import 'zeppelin-solidity/contracts/math/SafeMath.sol';

contract CryptoTwittos is Ownable, Pausable, Destructible {
  using SafeMath for uint;

  
  struct Twitto {
    address stealer;
    uint price;
  }

  
  mapping(uint => Twitto) public twittos;

  
  uint[] public twittoIds;
  uint public twittosCounter;


  
  event stealEvent(
    uint indexed id,
    address indexed owner,
    uint price,
    address indexed stealer,
    uint newPrice
  );


  
  function getTwittoIds(bool all) public view returns (uint[]) {
    
    if (twittosCounter == 0) return new uint[](0);

    if (all) {
      
      return twittoIds;

    } else {
      
      uint[] memory filteredIds = new uint[](twittosCounter);
      
      uint twittosCount = 0;

      for (uint i = 0; i < twittosCounter; i++) {
        
        if (twittos[twittoIds[i]].stealer == msg.sender) {
          filteredIds[twittosCount] = twittoIds[i];
          twittosCount++;
        }
      }

      
      uint[] memory trophies = new uint[](twittosCount);
      for (uint j = 0; j < twittosCount; j++) {
        trophies[j] = filteredIds[j];
      }
      return trophies;
    }
  }

  
  function steal(uint id, uint256 newPrice) payable whenNotPaused public {

    
    Twitto storage _twitto = twittos[id];

    
    require(msg.sender != _twitto.stealer);

    
    require(msg.value == _twitto.price);

    
    require(newPrice > _twitto.price);

    
    if (msg.value > 0) {
      _twitto.stealer.transfer(msg.value.mul(99).div(100));
    }

    
    if (_twitto.price == 0) {
      twittoIds.push(id);
      twittosCounter++;
    }

    
    stealEvent(id, _twitto.stealer, _twitto.price, msg.sender, newPrice);

    
    _twitto.stealer = msg.sender;

    
    _twitto.price = newPrice;

  }

  function withdraw() public onlyOwner {

    
    msg.sender.transfer(address(this).balance);
  }


}
