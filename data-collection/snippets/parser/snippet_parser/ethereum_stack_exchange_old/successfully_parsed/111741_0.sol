function test() returns (uint256 gasUsed)
{
    uint256 startGas = gasleft();

    

    gasUsed = startGas - gasleft();
}
