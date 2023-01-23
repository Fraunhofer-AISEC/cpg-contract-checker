pragma experimental ABIEncoderV2; 
pragma solidity >=0.4.18;

contract Record {
    struct MedRecord {
        string password;
        string name;
        address patient;
        address[] doctor;
    }

    mapping(address => MedRecord) internal medRecords;

    address[] public recordList;

    function addRecord(address _key, string memory password, string memory name) public {
        address docs[] = new ;
        medRecords[_key] = MedRecord(password, name, _key, []);
        recordList.push(_key);
    }
    
    function remove(address _key) public {
        delete medRecords[_key];
    }
    
    
    
    
    
    function getByKey(address _key) public view returns (MedRecord memory) {
        return medRecords[_key];
    }
}
