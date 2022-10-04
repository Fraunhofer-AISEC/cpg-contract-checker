function getAddressCount() public view returns(uint count) {
  return addesses.length;
}

function getAddressAtRow(uint row) public view returns(address theAddress) {
  return addresses[row];
}
