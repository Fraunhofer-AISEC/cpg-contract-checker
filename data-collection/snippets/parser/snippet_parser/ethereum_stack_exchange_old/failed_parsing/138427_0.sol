mapping(uint => Ballot) public ballots; 
uint public nextBallotId;
...
function getBallots(uint from, uint offset) public view returns(Ballot[] memory) {
    uint ballotsAmount = nextBallotId - from > offset ? offset : nextBallotId - from;
    Ballot[] memory _ballots = new Ballot[](ballotsAmount);
    for (uint i = from; i < from + ballotsAmount; i++) {
        _ballots[i] = ballots[i];
    }
    return _ballots;
}
