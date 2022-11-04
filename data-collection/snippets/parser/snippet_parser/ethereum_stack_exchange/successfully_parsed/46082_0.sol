pragma solidity ^0.4.8;

contract Rental {
    struct PaidRent {
        uint id;
        uint value;
    }
    PaidRent[] public paidrents;
    event RentPaid(bool Status);
    function payRent() public payable returns(bool status) {

        if(owner.send(msg.value)) {
          RentPaid(true);
          return true;
        } else {
          RentPaid(false);
          return false;
        }

    }
}
