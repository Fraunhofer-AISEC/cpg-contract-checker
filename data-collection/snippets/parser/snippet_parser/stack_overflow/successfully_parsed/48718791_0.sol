mapping (address => uint8) votes;
function vote(address _address, uint8 _vote) {
   require(notVotedYet(_address))
   votes[_address] = _vote
}
