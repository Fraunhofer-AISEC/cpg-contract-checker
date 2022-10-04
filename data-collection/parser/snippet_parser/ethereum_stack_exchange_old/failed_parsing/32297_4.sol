event LogNewAddress(address sender, address newAddress);

function appendAddress(address newAddress) returns(bool success) {
  require(!isAddress(newAddress));
  addressList.push(newAddress);
  addressStructs[newAddress].isAddress = true;
  LogNewAddress(msg.sender, newAddress);
  return true;
}
