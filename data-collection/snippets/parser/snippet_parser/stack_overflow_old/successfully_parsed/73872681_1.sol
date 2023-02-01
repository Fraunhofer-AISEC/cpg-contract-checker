 


function _setRoyalties(address newRecipient) internal {
    require(
        newRecipient != address(0),
        "Royalties: new recipient is the zero address"
    );
    _recipient = newRecipient;
}

function setRoyalties(address newRecipient) external onlyOwner {
    _setRoyalties(newRecipient);
}


function royaltyInfo(uint256 _tokenId, uint256 _salePrice)
    external
    view
    override
    returns (address receiver, uint256 royaltyAmount)
{
    return (_recipient, (_salePrice * 1000) / 10000);
}
