    function getRecords()
    public
    view
    returns (Record[] memory)
{
    return AddressToRecord[msg.sender];
}
