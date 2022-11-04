contract ContractA {
    function callBFromA(
        address contractB,
        uint256 a,
        uint256 b
    ) external pure returns (uint256) {
        
        return ContractB(contractB).sumOnB(a, b);
    }
}

interface IContractB {
    function sumOnB(uint256 a, uint256 b) external pure returns (uint256);
}

contract ContractB is IContractB {
    function sumOnB(uint256 a, uint256 b) override external pure returns (uint256) {
        return a + b;
    }
}
