pragma solidity ^0.4.25;

contract Main {
  struct Model {
    uint256 key;
    uint64 createTime;
  }

  Model[] public models;

  mapping(uint256 => address) public modelOwner;

  function total() view public returns (uint256) {
    return models.length;
  }

  function getData(uint256 _tokenId) view returns ( uint256, uint64){

    Model _model = models[_tokenId];
    return  (_model.key, _model.createTime);
  }

  function createData(uint256 _key, address _owner) returns (uint){

    Model memory _model = Model({key : _key, createTime : uint64(now)});

    uint256 newModelId = models.push(_model) - 1;

    

    return newModelId;
  }
}
