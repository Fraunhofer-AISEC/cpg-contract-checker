function CreateFFA(
    string memory _Name, 
    uint256 _maxentries, 
    uint256 _entryFee, 
    uint8 _validatorReward
) public {
    
    FFA storage ffa = FFAArray.push();

    
    ffa.Name = _Name;
    ffa.Creator = msg.sender;
    ffa.Wallet = msg.sender;
    ffa.entryFee = uint8(_entryFee);
    ffa.maxentries = _maxentries;
    ffa.validatorReward = _validatorReward;
}
