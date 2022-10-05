uint256[] memory a = new uint256[](256);
uint256[] memory b = a;
bool aEqualsB;
assembly {
    aEqualsB := eq(a, b)
}


b = new uint256[](256);
assembly {
    aEqualsB := eq(a, b)
}

