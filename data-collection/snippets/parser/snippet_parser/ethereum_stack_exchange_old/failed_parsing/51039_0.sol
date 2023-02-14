event LogNewVoter(address sender, string name, bool isSuccess);


function addVoter(address _voter,string _name, bytes _voterImageHash) payable public returns(bool) {
    require(msg.sender == votingAdmin);
    Voter storage sender = voters[_voter];
    if(sender.isVoter){
        revert("This address is all ready registered as a voter!");
       
    }
    voters[_voter].name = _name;
    voters[_voter].hasVoted = false;
    voters[_voter].isVoter = true;
    voters[_voter].voterImageHash = _voterImageHash;
    LogNewVoter(msg.sender,_name,true);
    return true;
}
