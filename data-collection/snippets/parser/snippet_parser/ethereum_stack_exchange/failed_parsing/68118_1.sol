bytes memory _bytesValue = bytes('yo yo');
assert(uint8(_bytesValue[2]) >= 4);
uint _ret = uint8(_bytesValue[2]) - 4;
