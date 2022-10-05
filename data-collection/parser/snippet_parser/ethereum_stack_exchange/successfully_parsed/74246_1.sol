function func(uint arr0, uint arr1, uint arr2) public returns (uint256) {
    uint[] memory arr = new uint[](3);
    arr[0] = arr0;
    arr[1] = arr1;
    arr[2] = arr2;
    return otherContract.func(arr);
}
