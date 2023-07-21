interface IContractB {
    function someAbstract() external view returns (uint256);
}

abstract contract B1 is IContractB {
    function foo () view external returns (uint256) {
        return this.someAbstract();
    }

}
contract B2 is IContractB {
    function someAbstract() override external view returns (uint256) {
        return 5;
    }
}
contract A is B1, B2 {

}
