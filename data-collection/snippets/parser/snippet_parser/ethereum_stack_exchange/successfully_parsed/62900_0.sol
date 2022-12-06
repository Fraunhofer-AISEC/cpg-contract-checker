pragma solidity ^0.4.24;

import "browser/DateTime.sol";

contract Travel {

address private owner;

struct TravelStruct 
{
    
    address clientAddress;
    string originAirportName;
    uint32 originTime; 
    uint16 originBagWeight;
    
    uint32 tapeArrivedTime; 
    
    bytes8 flyCode;
    uint32 takeOffTime; 
    
    string destinationAirportName;
    uint32 destinyTime; 
    uint16 destinyBagWeight;
}

mapping(uint => Travel) travels;
uint public travelsRegistryCount;

constructor() public
{
    owner = msg.sender;
    travelsRegistryCount = 1;
}

modifier ownerFunc 
{
    require(owner == msg.sender);
    _;
}


function setOrigin (string _originAirportName, uint32 _originTime, uint16 _originBagWeight) private
{
    travels[travelsRegistryCount] = TravelStruct(owner, _originAirportName, _originTime, _originBagWeight, 0, "", 0, "", 0, 0);
}  
}
