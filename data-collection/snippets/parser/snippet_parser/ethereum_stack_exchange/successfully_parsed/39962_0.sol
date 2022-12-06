function getBetsForMatchup(uint matchupIdentifier) public returns (BetProposition[]) {
        return bets[matchupIdentifier];
    }
