interface Challenge {
    
    function winners(uint256) external view returns (address);
}

contract WinnersHack {
    address challengeAddress = 0xcD7........;
    Challenge challengeInstance = Challenge(challengeAddress);

    
    
    function showWinner(address _winner, uint256 _numOfWinners)
        public
        view
        returns (bool)
    {
        for (uint256 i = 0; i < _numOfWinners; i++) {
            if (challengeInstance.winners(i) == _winner) {
                return true;
            } else {
                return false;
            }
        }
    }
}
