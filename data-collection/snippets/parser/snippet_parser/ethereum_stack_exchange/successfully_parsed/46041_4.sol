function payRent() public payable returns(bool status) {
    require(msg.value == rent);
    RentPaid(true);
    owner.transfer(msg.value);
    return true;
}
