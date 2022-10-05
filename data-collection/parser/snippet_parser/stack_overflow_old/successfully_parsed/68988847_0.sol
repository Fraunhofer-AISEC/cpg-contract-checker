contract SmartContract {
    uint256 public contractProperty = 10;

    function changeProperty(int256 newVal) external {
        contractProperty = uint256(newVal);
    }
}
