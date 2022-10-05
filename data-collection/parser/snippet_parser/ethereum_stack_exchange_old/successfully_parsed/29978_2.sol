pragma solidity ^0.4.15;

import "./itMapsLib.sol";  


contract User
{
  using itMaps for itMaps.itMapAddressUint;

  itMaps.itMapAddressUint im_myAddressUintMap;

  function insert ( address key, uint value) public {
    im_myAddressUintMap.insert( key, value);
  }
}
