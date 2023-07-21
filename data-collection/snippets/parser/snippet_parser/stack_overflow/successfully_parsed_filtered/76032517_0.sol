function mintToken() external payable {
    (int responseCode, address _tokenAddress) = htsProxy.mintToken(
        "OraCRE",
        "OraCRE",
        address(this),
        1000000000,
        8
    );
}
