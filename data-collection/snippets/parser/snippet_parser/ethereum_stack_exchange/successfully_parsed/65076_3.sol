string memory data = 'some data';
string memory salt = 'some salt data';
hash = keccak256(abi.encodePacked(data,salt));
