address[] public myAddresses;

function getAddressCount() public view returns(uint count) {
  return myAddresses.length;
}
