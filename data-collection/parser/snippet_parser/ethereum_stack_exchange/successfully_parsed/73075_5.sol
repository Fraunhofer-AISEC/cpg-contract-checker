function AmIRestrictedFromTheDividend(address) public view returns (bool) {
    return RestrictedFromDividend[address];
}
