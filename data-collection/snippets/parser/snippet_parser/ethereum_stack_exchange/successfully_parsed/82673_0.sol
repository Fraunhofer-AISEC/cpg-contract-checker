function array(uint256 index) public view returns (string, address, uint256) {
    return (array[index].field1, array[index].field2, array[index].field3);
}
