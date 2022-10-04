pragma solidity ^0.5.0;

interface IStampCollector {   
  function isCollected(address stamp) external returns (bool);   
  function collectStamp(address stamp) external; 
}

contract Stamp {   bytes32 public id;   uint public rarity;
    constructor(bytes32 _id, uint _rarity) public {
      id = _id;
      rarity = _rarity;   } 
    }

contract NotStamp {   bytes32 public notId;   uint public notRarity;
    constructor(bytes32 _id, uint _rarity) public {
      notId = _id;
      notRarity = _rarity;   } 
    }

contract StampCollector is IStampCollector, Stamp, NotStamp {

    bool public genuine;

    function isCollected(address stamp) public returns (bool) {
      require(address(stamp).id());
      genuine = true;
       }

      function collectStamp(address stamp) public {
       }
     }
