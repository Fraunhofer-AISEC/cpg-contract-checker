function payRent() public payable returns(bool status) {
    require(msg.value == rent);

    if(owner.send(msg.value)){
      RentPaid(true);
      return true;
    } else {
      return false;
    }
}
