
mapping(uint256 => structGame) public s_mapGameIdToGame;


mapping (address => uint256) public s_mapRequestNonceToGameId;



mapping (address => uint256) public s_mapAddressToClaimAmount;



mapping (bytes32 => uint256) public s_mapOwnerIdToEscrowAmount;


mapping (uint256 => structGameRoundResults[]) public s_mapGameIdToGameResults;


function processBandPayments(
        uint256 _gameId, 
        uint256 _perBandPayment
    )
        private 
        onlyIfValidGameId(_gameId) onlyIfPlayingState(_gameId) {

    
    
    require(s_mapGameIdToGameResults[_gameId].length > 0, "(processBandPayments) The game round results array is empty.");

    
    require(_perBandPayment > 0, "(processBandPayments) The payment for each band is 0.");

    
    for (uint i = 0; i < s_mapGameIdToGameResults[_gameId].length; i++)
    {
        require(s_mapGameIdToGameResults[_gameId][i].ownerId.length > 0, "(processBandPayments) An owner ID was not set.");

        
        if (s_mapGameIdToGameResults[_gameId][i].bandAddr == address(0)) {
            
            s_mapOwnerIdToEscrowAmount[s_mapGameIdToGameResults[_gameId][i].ownerId].add(_perBandPayment);
        }
        else {
            
            s_mapAddressToClaimAmount[s_mapGameIdToGameResults[_gameId][i].bandAddr].add(_perBandPayment);
        }
    }
}
