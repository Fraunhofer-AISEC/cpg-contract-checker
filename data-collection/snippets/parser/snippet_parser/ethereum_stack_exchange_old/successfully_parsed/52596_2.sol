uint256 gameBalance = s_mapGameIdToGame[_gameId].gameBalance;
uint256 gameBalanceTemp = gameBalance.mul(pct_house);
uint256 housePayment = gameBalanceTemp.div(100);
