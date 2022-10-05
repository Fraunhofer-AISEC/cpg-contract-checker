contract ContractsCaller {

    function execute(address contractAt, uint _i, bytes32 _b) returns (bool) {
        return contractAt.call(bytes4(sha3("testMethod(uint256,bytes32)")), _i, _b);
    }
}

contract Test {

    uint256 public i;
    bytes32 public b;

    function testMethod(uint256 _i, bytes32 _b) {
        i = _i;
        b = _b;
    }
}
