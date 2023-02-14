function setBasicDetails(string memory _registrationNo,
                             string memory _farmerName,
                             string memory _farmAddress,
                             string memory _exporterName,
                             string memory _importerName
                             
                            ) public onlyAuthCaller returns(address) {
        
        uint tmpData = uint(keccak256(msg.sender));
        address batchNo = address(tmpData);
        
        basicDetailsData.registrationNo = _registrationNo;
        basicDetailsData.farmerName = _farmerName;
        basicDetailsData.farmAddress = _farmAddress;
        basicDetailsData.exporterName = _exporterName;
        basicDetailsData.importerName = _importerName;
        
        batchBasicDetails[batchNo] = basicDetailsData;
        
        nextAction[batchNo] = 'FARM_INSPECTION';   
        
        
        return batchNo;
    }
