function getUserDataStructValue(MyStruct memory data) private view returns (uint256 _u, uint256 _v, uint256 _w, uint256 _x, uint256 _y, uint256 _z) {
    assembly {
        _u := mload(data)
        _v := mload(add(data,0x20))
        _w := mload(add(data,0x40))
        _x := mload(add(data,0x60))
        _y := mload(add(data,0x80))
        _z := mload(add(data,0xA0))
    }
}
