function _mixDnaX(uint256 _dadDna, uint256 _mumDna)
    internal
    view
    returns (uint256)
{
    uint256 dadPart = _dadDna / 10000000000;
    uint256 mumPart = _mumDna % 10000000000;

    uint256 newDna = (dadPart * 10000000000) + mumPart;


    uint8 random = uint8(block.timestamp % 7) + 1;

    uint256 removeBit = newDna % 100;

    newDna = (newDna - removeBit) + (random * 10) + 1;

    return newDna;
}
