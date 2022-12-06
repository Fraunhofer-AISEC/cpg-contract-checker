pragma solidity ^0.4.18;
import './DormantAsset.sol';
contract DormantAssetFactory {
  
  address[] public dormantAssets;
  uint256 public _heartbeatTimeout =1000000;
  function getContractCount()     public    constant    returns(uint contractCount)
  {
    return dormantAssets.length;
  }
  
  function newDormantAsset()    public     returns(address _newDormantAssetContract)
  {
    DormantAsset c = new DormantAsset(_heartbeatTimeout);
    dormantAssets.push(c);
    return c;
  }
}