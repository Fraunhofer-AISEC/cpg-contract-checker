function example() public pure returns (string memory) {
        string memory helloString = "hello";
        bytes memory dataWithSelector = abi.encodeWithSelector(0x12345678, helloString);
        return abi.decode(extractCalldata(dataWithSelector), (string));
    }
