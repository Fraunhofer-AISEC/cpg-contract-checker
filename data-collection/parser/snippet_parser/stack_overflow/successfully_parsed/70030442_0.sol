function startGame(address secondPlayer, string memory phrase, uint _amount) external { 

require(token.balanceOf(msg.sender) >= _amount); uint _stakedAmountChallenger = stakeZug(_amount);
    uint secret =uint(keccak256(abi.encodePacked(phrase)));

matchLists.push(matchUps(matchStatus.Start,msg.sender,secondPlayer,_stakedAmountChallenger,0,_stakedAmountChallenger,secret,false));
                uint gameNumber = matchLists.length -1;
                isValid[gameNumber] = true;
                emit challengeInitiator(msg.sender, secondPlayer, false, gameNumber);
            }
