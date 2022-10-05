modifier restrictTargetType(uint contractType) {
    if (contractTypes[target] != contractType) { throw; }
    _
}
