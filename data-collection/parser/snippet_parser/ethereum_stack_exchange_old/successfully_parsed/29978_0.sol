pragma solidity ^0.4.15;

import "./itMapsLib.sol";

contract User
{
  using itMaps for itMaps.itMapUintAddress;

  itMaps.itMapAddressUint im_myAddressUintMap;

 function addOwner(address _key, uint value) returns (bool){
   im_myAddressUintMap.insert(_key, value);
   return true;
 }

  function allSum() returns (uint sum) 
  { 
  }
}
