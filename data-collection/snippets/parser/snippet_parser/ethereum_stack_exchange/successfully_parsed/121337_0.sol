
function parseBytes32_op1(bytes32 _data) pure public returns (byte fist, byte second, bytes10 third, bytes20 fourth) {
    assembly {
        let freemem_pointer := mload(0x40)
        mstore(add(freemem_pointer,0x00), _data)
        _first := mload(add(freemem_pointer,0x00))
        _second := mload(add(freemem_pointer,0x01))
        _third := mload(add(freemem_pointer,0x02))
        _fourth := mload(add(freemem_pointer,0x0b))
      }
   

  }


function parseBytes32_op2(bytes32 _data) pure public returns (byte fist, byte second, bytes10 third, bytes20 fourth) {
    
        first = uint8(bytes1(_data));
        second = bool(uint8(bytes1(_data << 8)));
        third = uint10(bytes9(_data << 8 * 2));
        fourth = address(bytes9(_data << 8 * 12));
}
