function deposit() public payable {
        Maker storage depM = addressToMaker[msg.sender];
        depM.contributionBalance += msg.value;
}
