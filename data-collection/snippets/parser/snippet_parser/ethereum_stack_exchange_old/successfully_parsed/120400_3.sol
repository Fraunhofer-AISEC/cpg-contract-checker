
function createSKU(
    uint256 _shopId,
    uint256 _skuTypeId,
    uint256 _price,
    string _name,
    string _desc,
    bool _consumable,
    bool _limited,
    uint256 _limit
)
    public
    onlyShopOwner(_shopId)
    returns(uint256)
{
    
    require(_price > 0);

    
    uint256 skuId = skus.length;

    
    skus.push(SKU(_shopId, skuId, _skuTypeId, _price, _name, _desc, _consumable, _limited, _limit));

    
    shopSKUs[_shopId].push(skuId);

    
    skuTypeSKUs[_skuTypeId].push(skuId);

    
    emit NewSKU(_shopId, skuId, _name);

    
    return skuId;
}
