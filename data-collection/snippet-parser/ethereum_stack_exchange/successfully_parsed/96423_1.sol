function binarySearch(
    uint256[6] memory data,
    uint256 begin,
    uint256 end,
    uint256 value
) internal pure returns (uint256 ret) {
    uint256 len = end - begin;
    if (len == 0 || (len == 1 && data[begin] != value)) {
        return type(uint256).max;
    }
    uint256 mid = begin + len / 2;
    uint256 v = data[mid];
    if (value < v) {
        return binarySearch(data, begin, mid, value);
    } else if (value > v) {
        return binarySearch(data, mid + 1, end, value);
    } else {
        return mid;
    }
}

function isPowerOfTen(uint256 x) external view returns (bool result) {
    uint256[6] memory powersOfTen = [uint256(10**0), 10**1, 10**2, 10**3, 10**4, 10**5];
    result = binarySearch(powersOfTen, 0, powersOfTen.length, x) != type(uint256).max;
}
