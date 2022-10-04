uint8[3] memory foo = [98, 97, 122]; 
string memory bar = "baz";

bool result = keccak256(abi.encodePacked(foo)) == keccak256(abi.encodePacked(bytes(bar))); 
