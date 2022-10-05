pragma solidity ^0.8.0;

import "./Ownable.sol";
import "./upcomingRace.sol";

contract RaceFactory is Ownable {
    
    mapping(string => upcomingRace) public races;
    event raceCreated(string, address);
    event raceEnded(string, string);
    
    
    
    function createUpcomingRace(string calldata _raceID, string[12] calldata _horses, uint32 _startTime ) public onlyOwner returns (address){
        upcomingRace _race = new upcomingRace(_raceID, _horses, _startTime);
        address _raceAddress = address(_race);
        races[_raceID] = _race;
        emit raceCreated(_raceID, _raceAddress);
        return _raceAddress;
    }
    
    function endRace(string calldata _raceID, string calldata _winner) public onlyOwner {
        upcomingRace _race;
        _race = races[_raceID];
        _race.announceWinner(_winner);
    }
}
