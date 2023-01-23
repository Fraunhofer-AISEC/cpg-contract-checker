pragma solidity ^0.4.8;

contract Rental {
    struct PaidRent {
        uint id;
        uint value;
    }
    event RentPaid(bool Status);
    PaidRent[] public paidrents;
    function payRent(uint _rent) public payable returns(bool status) {
        owner.send(_rent);
        paidrents.push(PaidRent({
            id : paidrents.length + 1,
            value : _rent
        }));
        RentPaid(true);
        return true;
    }
}
