mapping(uint256 => address) internal list;
uint256 internal listCount;

function getList() public override view returns (address[] memory) {
    address[] memory assets = new address[](listCount);

    for (uint256 i = 0; i < listCount; i++) {
      assets[i] = list[i];
    }
    return assets;
}
