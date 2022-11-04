
function makePayments(
        uint256 _gameId, 
        bytes32[] _aryVideoIds, 
        bytes32[] _aryOwnerIds,
        address[] _aryWinnerAddr,
        address[] _aryBandAddr
    )
        public payable 
        onlyIfValidGameId(_gameId) onlyIfHouseAddr(_gameId) onlyIfPlayingState(_gameId) {
    
    require(_aryVideoIds.length > 0, "(makePayments) The video ID array is empty.");
    require(_aryVideoIds.length == _aryOwnerIds.length && _aryOwnerIds.length == _aryWinnerAddr.length && _aryWinnerAddr.length == _aryBandAddr.length,
        "(makePayments) One or more of the given arrays is not the same length.");

    
    
    
    
    s_mapGameIdToGame[_gameId].gameState = enGameState.GAME_OVER;

    uint256 numVideos = _aryVideoIds.length;

    
    uint256 housePayment = s_mapGameIdToGame[_gameId].gameBalance.div(100).mul(pct_house);

    
    uint256 remainder = s_mapGameIdToGame[_gameId].gameBalance - housePayment;

    require(remainder > 0, "(makePayments) The game balance after removing the house percentage is 0 or less.");

    uint256 bandPaymentPool = 0;
    uint256 perBandPayment = 0;
    uint256 playerPaymentPool = 0;
    uint256 perVideoPayment = 0;

    
    if (s_mapGameIdToGame[_gameId].bandDonationPercent == 0)
    {
        
        playerPaymentPool = remainder;
        perVideoPayment = playerPaymentPool.div(numVideos);
    } 
    else if (s_mapGameIdToGame[_gameId].bandDonationPercent == 100)
    {
        
        bandPaymentPool = remainder;
        perBandPayment = bandPaymentPool.div(numVideos);
    }
    else
    {
        
        
        bandPaymentPool = remainder.div(100).mul(s_mapGameIdToGame[_gameId].bandDonationPercent);

        
        perBandPayment = bandPaymentPool.div(numVideos);

        
        playerPaymentPool = remainder.sub(bandPaymentPool);

        
        
        perVideoPayment = playerPaymentPool.div(numVideos);
    }

    
    require(perBandPayment == 0 && perVideoPayment == 0, "(makePayments) There are no payments to be made for this game, given the current amounts.");

    
    if (perBandPayment > 0)
    {
        processBandPayments(_gameId, _aryOwnerIds, _aryBandAddr, perBandPayment);
    }

    if (perVideoPayment > 0)
    {
        
        processPlayerPayments(_gameId, _aryWinnerAddr, perVideoPayment);
    }
}
