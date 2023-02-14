

pragma solidity ^0.8.0;

contract Donations {

  struct Donors {
    uint amount;
    address donorAddress;
  }

  struct NewDonation {
    string Name;
    uint  contributors;
    uint  deadline;
    uint unclaimed_deadline ;
    uint  target;
    uint raisedAmount;
    address  owner;
    bool status;
    mapping (uint => Donors) donors;
  }

  NewDonation[] public newdonation;
  uint numDonations;

  function createDonation(string calldata name, address beneficiary, uint _deadline, uint _target) external returns(uint donationID) {
    donationID = numDonations++;
    NewDonation storage d = newdonation[donationID];
    d.Name= name;
    d.deadline =block.timestamp + _deadline;
    d.unclaimed_deadline = _deadline + 300;
    d.target =_target;
    d.owner =  beneficiary;
    d.status =true;
  }
}
