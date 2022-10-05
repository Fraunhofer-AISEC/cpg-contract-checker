function getBoolean(
    uint256 _packedBools,
    uint256 _boolNumber
)
    public
    view
    returns (bool)
{
    uint256 flag = (_packedBools >> _boolNumber) & uint256(1);
    return (flag == 1 ? true : false);
}
