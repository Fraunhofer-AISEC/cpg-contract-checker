pragma solidity ^0.5.1;

contract SupplyChain {

  enum Process {
    Unknown,
    Checked,
    Received,
    Paid,
    NotPaid
  }

     Process public status;
     Process public checked;
     Process public userid;


     address user;

     struct User {
       uint  _id;
       string  _firstName;
       string  _lastName;
     }


     constructor() public {
       status = Process.Unknown;
       user = tx.origin;
     }




     function addUser(
       uint256 id,
       string memory _firstName,
       string memory _lastName
     ) public{

     }

     function getStruct() public
     view
     returns (string, uint)
     {
         return (User);

     }

     function Factory() public {
       checked = Process.Checked;
       status = Process.NotPaid;
       
     }
     function TransportOne() public {
       checked = Process.Checked;
       status = Process.NotPaid;
       
     }
     function Deposit() public {
       checked = Process.Checked;
       status = Process.NotPaid;
       
     }
     function TransportTwo() public {
       checked = Process.Checked;
       status = Process.NotPaid;
       
     }
     function Customer() public {
       checked = Process.Received;
       status = Process.NotPaid;
       
     }

}
