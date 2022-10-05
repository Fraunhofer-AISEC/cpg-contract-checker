pragma solidity ^0.4.18;

contract myContract {

  struct UserInfo {
    uint uId;
    uint producerId;
    uint clientId;
    uint transId;
    uint weight;
    bytes32 addr;
    bytes32 suburb;
    bytes32 city;
    bytes32 country;
    bytes32 postcode;
    bytes32 lat;
    bytes32 lng;
    bytes32 titleType;
    bytes32 status;
    address advAddress; 
  }

  
  mapping (uint => UserInfo) userIdInfo;  

  
  function landregister (uint uId, uint producerId, uint clientId, uint transId, uint weight, bytes32 addr, bytes32 suburb, bytes32 city, bytes32 country, bytes32 postcode, bytes32 lat, bytes32 lng, bytes32 titleType, bytes32 status) public returns(bool) 
  {
    var userinfo = userIdInfo[uId];

    userinfo.landId         = landId;
    userinfo.producerId     = producerId;
    userinfo.clientId       = clientId;
    userinfo.titleType      = titleType;
    userinfo.landSize       = landSize;
    userinfo.addr           = addr;
    userinfo.suburb         = suburb;
    userinfo.city           = city;
    userinfo.country        = country;
    userinfo.postcode       = postcode;
    userinfo.lat            = lat;
    userinfo.lng            = lng;
    userinfo.transId        = transId;
    userinfo.status         = status;
    userinfo.advAddress     = msg.sender;
    return true;
  }

  
  function getUserById(uint index) public constant returns(uint, uint)
  { 
    return (userIdInfo[index].uId, userIdInfo[index].producerId);
  }
}
