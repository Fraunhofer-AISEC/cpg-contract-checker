    function addressFrom(address _origin, uint _nonce) public pure returns (address) {
        if(_nonce == 0x00)     return address(keccak256(byte(0xd6), byte(0x94), _origin, byte(0x80)));
        if(_nonce <= 0x7f)     return address(keccak256(byte(0xd6), byte(0x94), _origin, byte(_nonce)));
        if(_nonce <= 0xff)     return address(keccak256(byte(0xd7), byte(0x94), _origin, byte(0x81), uint8(_nonce)));
        if(_nonce <= 0xffff)   return address(keccak256(byte(0xd8), byte(0x94), _origin, byte(0x82), uint16(_nonce)));
        if(_nonce <= 0xffffff) return address(keccak256(byte(0xd9), byte(0x94), _origin, byte(0x83), uint24(_nonce)));
        return address(keccak256(byte(0xda), byte(0x94), _origin, byte(0x84), uint32(_nonce))); 
    }
