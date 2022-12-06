function awardItem(address player, string memory tokenURI)
        public 
        onlyGame
        returns (uint256)
{
        require(somePartsAmount);
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
}
