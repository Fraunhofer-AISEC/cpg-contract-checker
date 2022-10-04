pragma solidity ^0.4.6;

contract EmailIntegrity {

  
  
  

  enum ItemType { Integrity, Audit }
  
  struct EmailIntegrityStruct {
    ItemType itemType;
    uint timestamp;
    string data;
  }

  mapping(address => EmailIntegrityStruct[])  emailIntegrityStructs;

  function hasEmailIntegrityData(address emailAddress) public constant returns(bool isEmail) {
    return emailIntegrityStructs[emailAddress][0].timestamp == 0;
  }

  function insertIntegrityData(address emailAddress, uint timestamp, string data) public returns(bool success) {
    if (hasEmailIntegrityData(emailAddress)) {
        revert(); 
    }
    EmailIntegrityStruct memory integrityData;
    integrityData.itemType = ItemType.Integrity;
    integrityData.timestamp = timestamp;
    integrityData.data = data;
    emailIntegrityStructs[emailAddress].push(integrityData);
    return emailIntegrityStructs[emailAddress].length == 1;
  }

  function insertAuditData(address emailAddress, uint timestamp, string data) public returns(bool success) {
    if (!hasEmailIntegrityData(emailAddress)) {
        revert(); 
    }
    EmailIntegrityStruct memory auditData;
    auditData.itemType = ItemType.Audit;
    auditData.timestamp = timestamp;
    auditData.data = data;
    emailIntegrityStructs[emailAddress].push(auditData);
    return emailIntegrityStructs[emailAddress].length > 1;
  }
  
  function getIntegrityData(address emailAddress) public constant returns(string data) {
    if (!hasEmailIntegrityData(emailAddress)) {
        revert(); 
    }
    return emailIntegrityStructs[emailAddress][0].data; 
  } 

  function getAuditData(address emailAddress) public constant returns(string[] data) {
    if (!hasEmailIntegrityData(emailAddress)) {
        revert(); 
    }
    var length = emailIntegrityStructs[emailAddress].length;
    string[] memory auditData = new string[](length - 1);
    for (uint i = 1; i < length ; i++) {
           auditData[i] = emailIntegrityStructs[emailAddress][i].data;
    }
    return auditData; 
  }

}
