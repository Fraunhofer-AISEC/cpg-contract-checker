## MouseGame.sol

function startGame() public onlyReferee {
        if (getInscriptionTimeLeft() > 0) revert MouseGame__notReadyToStart();
        if (getGameTimeLeft() < 9999) revert MouseGame__gameInProgress();
        if (s_players.length < MIN_PLAYERS) {
            revertGame();
        } else {
            requestRandomWords();
        }
    }

    function fulfillRandomWords(
        uint256,
        uint256[] memory _randomWords
    ) internal override {
        uint256 mouseOwnerIndex = _randomWords[0] % s_players.length;
        address mouseOwner = s_players[mouseOwnerIndex];
        mouseNft.mint(mouseOwner);
        s_gameStartTime = block.timestamp;

        emit gameStarted(block.timestamp, mouseOwner);
    }

