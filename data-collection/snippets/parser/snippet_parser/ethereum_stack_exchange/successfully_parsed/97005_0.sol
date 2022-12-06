

function isTokenTransferOK(address currentOwner, address newOwner)
    public
    pure
    returns (bool ok)
{
    
    return keccak256(abi.encodePacked(currentOwner, newOwner))[0] == 0x7f;
}
