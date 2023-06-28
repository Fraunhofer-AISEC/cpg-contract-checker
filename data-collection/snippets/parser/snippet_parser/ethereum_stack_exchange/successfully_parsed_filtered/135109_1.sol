
function royaltyInfo(uint256 tokenId, uint256 value)
    external
    view
    override
    returns (address receiver, uint256 royaltyAmount)
{
    RoyaltyInfo memory royalties = _royalties[tokenId];
    receiver = royalties.recipient;

    uint256 tmp = value * royalties.amount;
    if (tmp == 0) {
        royaltyAmount = 0;
    } else {
        royaltyAmount = (tmp - 1) / 10000 + 1;
    }
}
