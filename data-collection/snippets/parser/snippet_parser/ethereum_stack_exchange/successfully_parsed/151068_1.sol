pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract FishData {
    
    struct fish_info {
        uint256 id;
        string species;
        string initialLocation;
        uint256 initialTimestamp;
        uint256 initialTemperature;
    }

    struct temperature_location {
        uint256 timestamp;
        uint256 temperature;
        string location;
        bool safety;
    }
    
    uint256 fishInfoId;
    mapping (uint256 => fish_info[]) public fish_infoList;
    mapping (uint256 => temperature_location[]) public locationList;

    event RecordData(uint256 indexed date, string species, string initialLocation, uint256 initialTimestamp, temperature_location[] history);

    
    function recordCaptureData (uint256 date, string memory species, string memory initialLocation, uint256 initialTimestamp, uint256 initialTemperature) public {
        temperature_location memory initialHistory;
        fish_info memory newinfo;
        initialHistory = temperature_location(block.timestamp, initialTemperature, initialLocation, true);
        
        newinfo = fish_info(fishInfoId, species, initialLocation, block.timestamp, initialTemperature);
        
        locationList[fishInfoId].push(initialHistory);

        fish_infoList[date].push(newinfo);

        fishInfoId++;
        emit RecordData(date, newinfo.species, newinfo.initialLocation, newinfo.initialTimestamp, locationList[fishInfoId]);
    }
}
