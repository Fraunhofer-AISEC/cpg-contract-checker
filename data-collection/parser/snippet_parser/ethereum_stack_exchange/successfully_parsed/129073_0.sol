uint256 public foo = 5;
uint256 public bar = 10;
uint256 public baz = 10;

function values() public view returns (uint256, uint256, uint256) {
    return (foo, bar, baz);
}
