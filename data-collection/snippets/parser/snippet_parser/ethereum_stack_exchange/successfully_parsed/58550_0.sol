function getTimestampsFromArray(address[] contentProviders) public view returns (uint[][]) {
        uint[][] storage returnTimestamps;
        for(uint i = 0; i < contentProviders.length; i++) {
            returnTimestamps.push(addressToTimestamps[contentProviders[i]]);
        }
        return returnTimestamps;
    }
