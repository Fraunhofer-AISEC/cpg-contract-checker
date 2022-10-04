function isTokenPairWhitelisted(
    ERC20 baseToken,
    ERC20 quoteToken
)
    public
    constant
    returns (bool)
{
    return (_menu[keccak256(baseToken, quoteToken)] || _menu[keccak256(quoteToken, baseToken)]);
}
