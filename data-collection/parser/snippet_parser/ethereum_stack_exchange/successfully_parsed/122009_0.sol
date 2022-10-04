function bet(uint256 _gameId, uint8 _teamSelected, uint256 amount) public  {
            Game storage game = gameInfo[_gameId];
            require(_teamSelected==1 || _teamSelected==2);
            require(amount >= minimumBet);
            require(betPoolOpen[_gameId]);


            token.transferFrom(msg.sender,address(this),amount);
            betForGame[_gameId][msg.sender] = amount;

            if(_teamSelected == 1){
                gameInfo[_gameId].teamMeron = msg.sender;
            }

            else if(_teamSelected == 2){
                gameInfo[_gameId].teamWala = msg.sender;
            }
            betPoolForGame[_gameId] += amount;

        }
