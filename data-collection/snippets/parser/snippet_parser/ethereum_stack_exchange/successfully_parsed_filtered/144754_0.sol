
function fulfillRandomWords(uint256 requestId, uint256[] memory randomness)
    internal
    override
{
    randomRes = randomness[0];
    uint256 gameId = _requestIdToGameId[requestId];
    Game storage game = _gameIdToGame[gameId];
    game.randomNumber = randomRes;
            _nftContract.safeTransferFrom(  
                game.from, 
                game.to, 
                197 
            );
    
    emit RequestRandomnessFulfilledRun(requestId, randomResult);
}
