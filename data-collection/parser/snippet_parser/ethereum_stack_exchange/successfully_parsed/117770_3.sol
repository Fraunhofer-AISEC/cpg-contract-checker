contract C {
    struct S {
        uint x;
    }

    function convertToS(bytes calldata input) internal pure returns (S calldata result) {
        assembly {
            result := input.offset
        }
    }

    function run(bytes calldata input) external pure returns (S calldata result) {
        S calldata s = convertToS(input[32:]);
        return s;
    }
}
