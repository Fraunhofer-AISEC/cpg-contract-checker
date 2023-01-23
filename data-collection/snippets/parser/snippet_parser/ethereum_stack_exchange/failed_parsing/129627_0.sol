

pragma solidity ^0.8.0;

contract MyContract {

  uint256 public value=0;  
  uint256 public posterItemID;
  
  event _meBid(address _sender, uint256 _itemValue, uint256 _bidItemID);

  function bid(address _anotherMyContractAddress) external returns (bool) {. 
    
    MyContract _mycon = MyContract(_anotherMyContractAddress);  
    
    uint256 _itemValue = _mycon.value();
    uint256 _bidItemID = _mycon.posterItemID();
    string memory _bidState = _mycon.returnState();
    if (keccak256(abi.encodePacked(_bidState)) != keccak256(abi.encodePacked("ForTrade"))) return false;  
    

    emit _meBid(msg.sender, _itemValue, _bidItemID);  
    return true;
  }
}
