function CreateFFA(string memory _Name, uint256 _maxentries, uint8 _entryFee, uint8 _validatorReward) public
{
    FFAArray.push(FFA(_Name, msg.sender, msg.sender, _entryFee, _maxentries, _validatorReward));
}
