function debugActivationTime (uint32 setting_delay, uint16 currentLevel) public constant returns (uint32) {
    return uint32(now + ((2**(currentLevel-1)) * setting_delay)); 
}
