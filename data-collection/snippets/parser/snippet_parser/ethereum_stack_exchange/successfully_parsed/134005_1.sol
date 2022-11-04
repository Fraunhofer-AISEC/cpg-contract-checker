function getUnitStorage(address ownerAddr) internal returns (MappingDataTypes.UintMappingValue storage) {
    return uintStorage[ownerAddr];
}
