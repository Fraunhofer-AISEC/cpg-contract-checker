struct LogisticsData {
        address cargo;
        address orgin;
        address destination;
        string memo;
        uint createdAt;
        uint queryCount;
}

function getLogisticsInfo(address cargo) public returns(LogisticsData[] memory _cargoLogisticsData) {
    _cargoLogisticsData = new LogisticsData[](3);
   
}
