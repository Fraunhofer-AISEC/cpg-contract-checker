msg.data (bytes): complete calldata
msg.gas (uint): remaining gas - deprecated in version 0.4.21 and to be replaced by gasleft()
msg.sender (address): sender of the message (current call)
msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)
msg.value (uint): number of wei sent with the message
