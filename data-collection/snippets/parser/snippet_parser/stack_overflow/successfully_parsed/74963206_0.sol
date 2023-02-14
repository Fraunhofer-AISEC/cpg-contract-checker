
    
    function getStatisticsOfAllVote()
        public
        view
        returns (SingleElectionStatistics[] memory )
    {

        SingleElectionStatistics[] memory results = new SingleElectionStatistics[](BallotArray.length);

        for (uint256 i = 0; i < BallotArray.length; i++) {
            SingleElectionStatistics memory temp = SingleElectionStatistics(
                BallotArray[i]._getName(), 
                BallotArray[i]._getDescription(),
                BallotArray[i]._getTotalVoteCounted(),
                BallotArray[i]._isVotingEnded(),
                BallotArray[i]._getWinningProposalName()
            );
            results[i] = temp;
        }
        
        return results;
    }
