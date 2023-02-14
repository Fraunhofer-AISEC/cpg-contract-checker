function getData(string memory _idNumber)
    public
    view
    returns (
        string memory,
        string memory,
        uint256
    )
{
    return (
        idNumberToName[_idNumber],
        idNumberToEmail[_idNumber],
        idNumberToAmount[_idNumber]
    );
}
