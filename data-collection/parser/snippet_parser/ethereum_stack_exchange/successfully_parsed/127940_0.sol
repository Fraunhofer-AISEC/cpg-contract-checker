function deploy(bytes memory _data) public returns (address pointer) {

    bytes memory code = abi.encodePacked(
        hex"63",
        uint32(_data.length),
        hex"80_60_0E_60_00_39_60_00_F3",
        _data
    );

    assembly { 
        pointer := create(0, add(code, 32), mload(code)) 
    }
    }



