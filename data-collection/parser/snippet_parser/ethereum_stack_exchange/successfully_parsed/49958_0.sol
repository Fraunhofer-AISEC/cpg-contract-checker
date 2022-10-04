function createNewChangeRequest(
    bytes20 gitHash, string additionalInformation, uint256 costs, uint256 estimation
) public returns (ChangeRequest)
{
    Change memory change = Change(gitHash, additionalInformation, costs, estimation);
    ChangeRequest changerequest = new ChangeRequest(change, msg.sender);
    _changes.push(changerequest);
    emit NewChangeRequest(changerequest, gitHash, additionalInformation, costs, estimation);
}
