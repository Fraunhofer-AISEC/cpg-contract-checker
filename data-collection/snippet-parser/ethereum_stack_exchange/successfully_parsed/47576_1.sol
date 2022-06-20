function _adopt(
    address _adopter,
    uint8 _clazz,
    uint256 _quantity,
    address _referrer
)
private
returns (uint256 _totalPrice)
{
    (_totalPrice, priceIncrements[_clazz], currentPrices[_clazz]) = _creeptomaPrice(_clazz, _quantity);

    userAdoptedCreeptomas[_adopter][_clazz] = userAdoptedCreeptomas[_adopter][_clazz].add(_quantity);
    totalAdoptedCreeptomas[_clazz] = totalAdoptedCreeptomas[_clazz].add(_quantity);

    emit AdoptedCreeptomasEvent(_adopter, _clazz, _quantity, _referrer);
}
