uint256 userVotesIndex = proposal.voteInfo.userVotes.length; 
proposal.voteInfo.userVotes.push();
UserVotes storage userVote = proposal.voteInfo.userVotes[userVotesIndex];
