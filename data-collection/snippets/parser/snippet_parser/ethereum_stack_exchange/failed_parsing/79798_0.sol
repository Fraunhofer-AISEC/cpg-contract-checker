pragma solidity ^0.5.11;
contract Analytics {
  struct Field {
    string typeOfFunding; 
    uint amount;
    string cohort;
    string promotion;
  }
  struct Entry {
    string typeofEntry; 
    string channel;
    Field[] funding;
    string createdAt;
    uint totalAmount;
  }
  mapping(string => Entry) entries;


  function updateEntry (string memory id,
                        string memory _typeOfEntry,
                        string memory _channel,
                        Field[]  _funding,
                        string memory _createdAt) public
                        returns (bool sucess)
  {
    Entry storage e = entries[id];
    e.typeofEntry = _typeOfEntry;
    e.channel = _channel;
    
    
    
    e.createdAt = _createdAt;
    
    return true;
  }

  function updateFunding(string memory id,  Field[]  _fundingP) private view returns (Field[] _funding)
  {
    Field[] memory funding;
    Field[] memory amount;

    for _fundingP.amount 
    {
      funding.push(_funding.amount)
    }
  }
