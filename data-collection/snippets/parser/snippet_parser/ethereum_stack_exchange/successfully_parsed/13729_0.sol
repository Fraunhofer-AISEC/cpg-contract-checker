    function voteForAnswer(bytes32 questionKey, bytes32[] answerKeys)
     returns (bool success)
{
    
    if (voters[msg.sender].enabled == false) {
        throw;
    }
    
    if (questions[questionKey].alreadyVoted[msg.sender] == true) {
        throw;
    }
    questions[questionKey].alreadyVoted[msg.sender] = true;
    for (uint i; i <= answerKeys.length; i++) {
        questions[questionKey].answers[answerKeys[i]].voteCount += 1;
        VoterVotedFor(msg.sender, questionKey, answerKeys[i]);
    }
}
