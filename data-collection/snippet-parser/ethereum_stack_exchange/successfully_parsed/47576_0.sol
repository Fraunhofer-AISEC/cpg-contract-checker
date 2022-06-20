function _getPrice(
    uint8 _clazz,
    uint256 _quantity
)
internal
view
returns (uint256 _totalPrice, uint256 _priceIncrement, uint256 _currentPrice)
{
    _priceIncrement = priceIncrements[_clazz];
    _currentPrice = currentPrices[_clazz];
    _totalPrice = 0;
    uint256 totalAdoptedInClazz = totalAdoptedCreeptomas[_clazz];

    require(totalAdoptedInClazz.add(_quantity) <= MAXIMUM_ADOPTED_PER_CLASS);

    for (uint256 i = 0; i < _quantity; i++) {
        _totalPrice = _totalPrice.add(_currentPrice);
        totalAdoptedInClazz++;

        if (totalAdoptedInClazz == 100 ||
        totalAdoptedInClazz == 300 ||
        totalAdoptedInClazz == 600 ||
        totalAdoptedInClazz == 1000 ||
        totalAdoptedInClazz == 1500)
        {
            
            _priceIncrement >>= 1;
        }

        _currentPrice = _currentPrice.add(_priceIncrement);
    }
}
