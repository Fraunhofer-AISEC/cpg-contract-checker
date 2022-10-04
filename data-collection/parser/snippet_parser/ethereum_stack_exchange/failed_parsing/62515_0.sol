function compareResults(uint256 _timestamp) public returns (uint256){
    if (sourceOneWeather[_timestamp] > sourceTwoWeather[_timestamp]):
        if (sourceOneWeather[_timestamp] > sourceThreeWeather[_timestamp]):
            return sourceOneWeather[_timestamp];
        else:
            return sourceThreeWeather[_timestamp];
    else if (sourceTwoWeather[_timestamp] > sourceThreeWeather[_timestamp]):
        return sourceTwoWeather[_timestamp];
    return sourceThreeWeather[_timestamp];
