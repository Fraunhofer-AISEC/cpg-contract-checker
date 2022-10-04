contract Compeny{
  address constant  ADMIN_ADDRESS = 0x8c0199C5D6e4B22A1948358F1bf48dD095Ae5300; 

  struct Person {
    uint ppNo ;
    bytes32  firstName;
    string gender ;
    string dayOfbirth ;
    string country ;
  }
   mapping(address => Person) private PersoneDictionary;
   HistoryRecord[] private historyRecords;
  function createOrUpdatePassport(
        address _owner,
        uint _ppNo ,
        bytes32 _firstName ,
        string memory _gender ,
        string memory _dayOfbirth ,
        string memory _country 
        ) public 
  {     
     checkAdminPermission();
    Person memory person = Person(
        _ppNo ,
     _firstName ,
     _gender ,
     _dayOfbirth, 
     _country 
     ) ;

      PersoneDictionary[_owner] = person;
      historyRecords.push(HistoryRecord({
          incidentTime : block.timestamp ,
          owner : _owner,
          person : person 
     }));
  }

  function getPerson() public view returns (Person memory) {
      return PersoneDictionary[msg.sender];
  }

 
  function getHistoryRecord(uint index) public view returns 
  (uint256 incidentTime, address owner, Person memory person) {
      checkAdminPermission();
      return (historyRecords[index].incidentTime, 
              historyRecords[index].owner, historyRecords[index].person);
  }

  struct HistoryRecord {
      uint256 incidentTime;
      address owner;
      Person  person;
  }

  
  function getHistoryRecordLength() public view returns (uint) {
      checkAdminPermission();
      return historyRecords.length;
  }

  function checkAdminPermission() private view {
      if (msg.sender != ADMIN_ADDRESS) {
          revert();
      }
  }

}



