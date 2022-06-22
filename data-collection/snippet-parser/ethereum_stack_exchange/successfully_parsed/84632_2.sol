    function testUint16Arr3(uint16[] calldata _arr) external returns (address[] memory) {
        return storeIDToAddress.getAddresses(_arr);
    }
