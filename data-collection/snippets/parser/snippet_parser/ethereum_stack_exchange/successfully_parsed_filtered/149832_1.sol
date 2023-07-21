abstract contract B1 {
    function foo () view external returns (uint256) {
        return this.someAbstract();
    }
    function someAbstract() public view virtual returns (uint256);
}
contract B2 {
    function someAbstract() public view virtual returns (uint256) {
        return 5;
    }
}
contract A is B1, B2 {
    function someAbstract() override(B1, B2) public view virtual returns (uint256) {
        return super.someAbstract();
    }
}
