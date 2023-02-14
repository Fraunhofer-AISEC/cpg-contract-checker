bytes memory _binary = new bytes(8);
uint r = 0;

_binary[i] = abi.encodePacked(r);

return string(_binary);
