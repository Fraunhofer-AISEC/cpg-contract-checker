function addUnitExp(uint256 _unitId, uint256 _exp, uint32 _type) public {
    Unit storage _unit = tokenToUnit[_unitId];
    _unit.defense = _exp;
}
