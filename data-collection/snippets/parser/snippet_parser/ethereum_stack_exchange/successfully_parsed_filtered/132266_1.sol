    function test() public {
        string memory str = "testing";
        uint256 number1 = 123;
        int256 number2 = -321;
        bool boolean = true;

        bytes memory encoded;

        encoded = abi.encode(str, number1);
        encoded = abi.encode(encoded, number2);
        encoded = abi.encode(encoded, boolean);

        bytes memory decoded;

        (decoded, boolean) = abi.decode(encoded, (bytes, bool));
        (decoded, number2) = abi.decode(decoded, (bytes, int256));
        (str, number1) = abi.decode(decoded, (string, uint256));
    }
