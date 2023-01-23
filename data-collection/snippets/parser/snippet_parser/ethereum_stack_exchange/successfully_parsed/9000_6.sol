function _autoDeploy () internal returns (address copy) {
    bytes memory initCode = hex'58333b90818180333cf3';

    assembly {
        let encoded_data := add(0x20, initCode)
        let encoded_size := mload(initCode)
        copy := create(0, encoded_data, encoded_size)
    }
}
