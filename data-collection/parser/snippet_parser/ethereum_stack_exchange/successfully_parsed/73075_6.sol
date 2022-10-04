function AmIRestrictedFromTheDividend(address foo) public view returns (bool) {
    return RestrictedFromDividend[foo];
}
