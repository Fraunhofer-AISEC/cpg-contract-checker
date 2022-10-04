


struct Entry {
    mapping (uint8 => EntryVersion) hashVersions;
}

struct EntryVersion {
    bytes32 hash;
    bool published;

}


mapping (uint => Entry) entryMap;




function getEntry(uint entryID, uint8 version) public constant returns(bytes32 hashEntry, bool entryExists) {

    
    if ( !_hasPermissions() ) 
        return ("", false);

    
    Entry currEntry = entryMap[entryID];

    
    return (currEntry.hashVersions[version].hash, currEntry.hashVersions[version].published);

}
