pragma solidity ^0.5.11;
contract Analytics {
  address lastAddress;
  uint timeStamp;
  string label;
  uint count;
  string id;
  string typeofEntry; 
  string channel;
  string createdAt;

  struct Field {
    string typeOfFunding; 
    uint amount;
    string cohort;
    string promotion;
  }
  struct Entry {
    string id;
    string typeofEntry; 
    string channel;
    Field funding;
    string createdAt;
    uint totalAmount; 
  }
  mapping(uint => Entry) public entries;
function updateEntry (string memory _id,
                      string memory _typeOfEntry,
                      string memory _channel,
                      string memory _typeofFunding,
                      uint  _amount,
                      string memory _cohort,
                      string memory _promotion,
                      string memory _createdAt,
                      uint  _totalAmount) public returns 
                      (bool sucess)
    {
      entries[id] = id; 
      entries[typeofEntry]= _typeOfEntry;
      entries[channel]= _channel;
      entries[funding].typeOfFunding = _typeofFunding;
      entries[funding].amount = _amount;
      entries[funding].cohort = _cohort;
      entries[funding].promotion = _promotion;
      entries[createdAt] = _createdAt;
      entries[totalAmount]= _totalAmount;
      return true;
    }
}
