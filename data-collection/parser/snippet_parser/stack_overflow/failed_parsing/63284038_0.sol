function retrieveEHRs(string stringToBytes32, string retrieve_name, address userPK,string storageName, address AreaID, address PatientID, string Hash_value)
    onlyAdminp public{
        bytes32 key=stringToBytes32(retrieve_name);
        Look up the EHRs data in DHT table;
        DTHtable[key].storageName=storageName;
        DTHtable[key].AreaID=AreaID;
        DTHtable[key].PatientID=PatientID;
        DTHtable[key].Hash_value=Hash_value;
        emit DataResult(userPK);
        
    }
