contract Base {
    uint256 public baseProperty;
}

contract Derived is Base {
    function getBaseProperty() public view returns (uint256) {
        return super.baseProperty;
    }
}
