    uint256 constant ADDRESS_LENGTH = 0x14;

    function testDecodePacked(address _x, address _y) external view returns(address, address) {
        bytes memory packed = abi.encodePacked(_x, _y);

        address x;
        address y;
        assembly {
            x := mload(add(packed, ADDRESS_LENGTH))
            y := mload(add(packed, mul(ADDRESS_LENGTH, 2)))
        }

        require((x == _x) && (y == _y));
        return (x, y);
    }
