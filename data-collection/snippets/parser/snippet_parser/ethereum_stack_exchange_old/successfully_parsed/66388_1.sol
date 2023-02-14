uint[16] x = [10, 2, 6, 42, 19, 5, 4, 36, 6, 6, 5, 5, 5, 46, 4, 4];

function foo(uint i, uint j) external view returns (uint) {
    return x[i] + x[j] * 12;
}
