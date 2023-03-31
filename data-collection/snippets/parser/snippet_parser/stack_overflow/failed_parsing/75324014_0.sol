contract ScoreTracker {
    mapping(address => uint) public scores;

    function addScore(address _wallet, uint _score) public {
        if (scores[_wallet] == 0) {
            scores[_wallet] = _score;
        } else {
            scores[_wallet] += _score;
        }
    }

    function getScore(address _wallet) public view returns (uint) {
        return scores[_wallet];
    }
}   

function getAllScores() public view returns (address[] memory, uint256[] memory) {
    address[] memory addresses = new address[](scores.length);
    uint256[] memory scoresList = new uint256[](scores.length);
    uint256 counter = 0;
    for (address; scores) {
        addresses[counter] = a;
        scoresList[counter] = scores[a];
        counter++;
    }
    return (addresses, scoresList);
}
