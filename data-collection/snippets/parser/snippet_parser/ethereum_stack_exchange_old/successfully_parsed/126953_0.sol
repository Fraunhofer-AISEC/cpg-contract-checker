function myFunction() returns (uint256)
{
    uint256 startGas = gasleft();

    

    return (startGas - gasleft());
}
