    function startBuilding ()
        public
    {
        uint[8] memory _buildingInfo;
        _buildingInfo[1] = uint32(block.timestamp) + 2 minutes;
        addBuilding(_buildingInfo);
    }


    function finishBuilding ()
        public
    {
        uint[8] memory _buildingInfo;
        require (buildingInfo[1] <= block.timestamp);

        buildingInfo[6] = STATUS_NEW;       
    }
