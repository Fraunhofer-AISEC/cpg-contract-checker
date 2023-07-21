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
    temperature_location[10] public historys;
    fish_info public newinfo;
function recordCaptureData (uint256 date, string memory species, string memory initialLocation, uint256 initialTimestamp, uint256 initialTemperature) public {
        
        historys[0].timestamp = block.timestamp;
        historys[0].temperature = initialTemperature;
        historys[0].location = initialLocation;
        historys[0].safety = true;

        newinfo.species = species;
        newinfo.initialLocation = initialLocation;
        newinfo.initialTimestamp = block.timestamp;
        newinfo.initialTemperature = initialTemperature;
        newinfo.history = historys;
        
        fish_infoList[date].push(newinfo);
        emit RecordData(date, newinfo.species, newinfo.initialLocation, newinfo.initialTimestamp, newinfo.history);
    }
}
