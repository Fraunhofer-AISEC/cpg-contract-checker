uint[] private arr;
function func(uint arr0, uint arr1, uint arr2) public returns (uint256) {
    arr = [arr0, arr1, arr2];
    return otherContract.func(arr);
}
