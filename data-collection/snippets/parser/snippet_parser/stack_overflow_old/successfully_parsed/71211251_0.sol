function updatePrice(uint256 _elpisHeroId, uint256 _newPrice)
    public
    isApproved(_elpisHeroId)
{
    require(_newPrice > 0, "Price should be greater than zero");

    
    uint256 elpisHeroIndex = _elpisHeroId;

    
    ElpisHeroData storage elpisHeroData = elpisHeroesData[elpisHeroIndex];
    elpisHeroData.heroPrice = _newPrice;
}
