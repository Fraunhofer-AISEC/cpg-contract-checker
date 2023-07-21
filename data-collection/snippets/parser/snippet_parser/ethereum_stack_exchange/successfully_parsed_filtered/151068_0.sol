    pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract FishData {
    
    struct fish_info {
        string species;
        string initialLocation;
        uint256 initialTimestamp;
        uint256 initialTemperature;
        temperature_location[10] history;
    }
    
    struct temperature_location {
        uint256 timestamp;
        uint256 temperature;
        string location;
        bool safety;
    }
    
 
    mapping (uint256 => fish_info[]) public fish_infoList;

    event RecordData(uint256 indexed date, string species, string initialLocation, uint256 initialTimestamp, temperature_location[10] history);

    
    function recordCaptureData (uint256 date, string memory species, string memory initialLocation, uint256 initialTimestamp, uint256 initialTemperature) public {
        temperature_location memory initialHistory;
        fish_info memory newinfo;
        initialHistory = temperature_location(block.timestamp, initialTemperature, initialLocation, true);
        newinfo.history[0] = initialHistory;
        newinfo = fish_info(species, initialLocation, block.timestamp, initialTemperature, newinfo.history);
        

        fish_infoList[date].push(newinfo);
        emit RecordData(date, newinfo.species, newinfo.initialLocation, newinfo.initialTimestamp, newinfo.history);
    }
}
