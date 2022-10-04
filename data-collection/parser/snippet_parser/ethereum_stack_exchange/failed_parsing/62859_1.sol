pragma solidity ^ "0.4.24";

contract Origin {

struct OriginInfo
{
    string airportName;
    uint32 checkInTime; 
    uint8 bagWeight;
    address clientAddress;
    bool itsHere;
}
mapping (uint256 => OriginInfo) origins;
uint256 public originNonce;

constructor() public
{
    originNonce = 1;
}

function insertOrigin(string _airportName, uint32 _checkInTime, uint8 _bagWeight) 
    public 
{
    origins[originNonce] = OriginInfo(_airportName, _checkInTime, _bagWeight, msg.sender, true);
    originNonce += 1;

    recoverOrigin(originNonce);
}

function recoverOrigin(uint256 _originId) 
    private view 
    returns (string, uint32, uint8, address, bool) 
{
    OriginInfo memory origin = origins[_originId];
    return (
        origin.airportName,
        origin.checkInTime, 
        origin.bagWeight, 
        origin.clientAddress, 
        origin.itsHere
    );
}
}

pragma solidity ^ "0.4.24";

import "./TraceabilityProcedures/Origin.sol";
import "./TraceabilityProcedures/Tape.sol";
import "./TraceabilityProcedures/Plane.sol";
import "./TraceabilityProcedures/Destiny.sol";

contract Travel{


struct TravelInfo {
    uint test;
    
}

mapping(uint => Travel) travels;
uint public travelsRegistryCount;

function addOrigin (string _airportName, uint32 _checkInTime, uint8 _bagWeight) public {
    insertOrigin(_airportName, _checkInTime, _bagWeight);

}
}
