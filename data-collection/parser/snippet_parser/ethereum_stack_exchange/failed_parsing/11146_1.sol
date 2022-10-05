pragma solidity ^0.4.0;
contract Subject {
    bool public contractStatus = false;
    address public adminAddress;
    mapping (address => Data) adminToDataMapping;

    struct Data {
      string name;
      string details;
    }

   modifier onlyIfActive() {
     if (contractStatus) throw;
     _;
   }

   modifier onlyByCreator(address addr){
      if (msg.sender != addr) throw;
      _;
  }

  function addData(string someName, string someDetails address adminAddr) onlyIfActive {
    Admin admin = Admin(adminAddr);
    if(admin.checkCreatePermission(someSpecialValues)  && admin.isOwner(msg.sender)) {
      adminToDataMapping[msg.sender].name = someName;
      adminToDataMapping[msg.sender].details = someDetails;
    } else() {
      throw;
    }
  }
}
