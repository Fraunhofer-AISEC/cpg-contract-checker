function except(string _item, mapping(string => bool) _ownedSymbols, mapping(string => bool) _targetAssets) internal returns (bool) {
    return _ownedSymbols[_item] && !_targetAssets[_item];
}
