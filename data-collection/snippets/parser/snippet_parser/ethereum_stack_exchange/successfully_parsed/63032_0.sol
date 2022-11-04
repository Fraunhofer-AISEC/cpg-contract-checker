pragma solidity ^0.4.24;

import "browser/DateTime.sol";

contract Travel {

address private owner;

modifier isOwner
{
    require (owner == msg.sender);
    _;
}

struct TravelStruct 
{
    
    address clientAddress;
    string originAirportName;
    uint32 originTime; 
    uint16 originBagWeight;
    
    uint32 tapeArrivedTime; 
    
    string flyCode;
    uint32 takeOffTime; 
    
    string destinationAirportName;
    uint32 destinyTime; 
    uint16 destinyBagWeight;
}

mapping(uint => TravelStruct) travels;
uint public travelsRegistryCount;

constructor()
{
    owner = msg.sender;
    travelsRegistryCount = 1;
}


function setOrigin (string _originAirportName, uint32 _originTime, uint16 _originBagWeight) public
{
    travels[travelsRegistryCount].clientAddress = owner;
    travels[travelsRegistryCount].originAirportName = _originAirportName;
    travels[travelsRegistryCount].originTime = _originTime;
    travels[travelsRegistryCount].originBagWeight = _originBagWeight;
    travelsRegistryCount++;
}  

function getOrigin (uint _id) isOwner public constant returns (address, string, uint32, uint16)
{
    return (travels[_id].clientAddress, travels[_id].originAirportName ,travels[_id].originTime ,travels[_id].originBagWeight);
}
}
