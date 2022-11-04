function verifyPass(address _owner) {
  require(_owner != 0x0);
  var (,c,h,) = Storage(usedStorage).passByOwner(_owner);
  uint _country = uint(c);

  
  require(_country != 0 && _country == embassiesOfCountry[msg.sender]);

  Storage(usedStorage).updatePassport(_owner, _country, bytes32(h), true);
}
