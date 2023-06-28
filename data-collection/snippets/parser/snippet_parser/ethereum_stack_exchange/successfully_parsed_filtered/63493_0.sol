function createPart (string _pName, string _pDesc, string _pManuf) public {
        partsCount++;
        part_store[partsCount].pNumber = partsCount;
        part_store[partsCount].pName = _pName;
        part_store[partsCount].pDesc = _pDesc;
        part_store[partsCount].pManuf = _pManuf; 
        part_store[partsCount].owners.push(_pManuf);

        
        emit partCreatedEvent(partsCount);
    }
