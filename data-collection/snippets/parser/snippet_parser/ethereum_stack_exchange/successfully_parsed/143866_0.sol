    function sendRewardToGameWinner(address payable _to, uint256 amount) external payable {
        _to.send(amount);
    }
