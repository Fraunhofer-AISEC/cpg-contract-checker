 function selectWinners(uint256 noOfWinners) public onlyOwner {
    require(!paused, "ERROR: Contract is paused");
    require(lotteryActive, "ERROR: Lottery not active yet");
    require(noOfWinners <= 50, "ERROR: Too many winners selected");

    uint256 epochNow = block.timestamp;
    uint256 nextLotteryDate = lotteryDates[lotteryDates.length - 1];

    require(epochNow >= nextLotteryDate, "ERROR: Cannot draw yet, too early");

    for (uint256 i = 0; i < noOfWinners; i++) {
        selectAWinner(
            0,
            epochNow,
            msg.sender,
            nextLotteryDate,
            msg.sender,
            0
        );
    }

    lotteryDates.push(epochNow + (epochDay * lotteryIntervalDays));

    
    drawNumber++;
}


function selectAWinner(
    uint256 it,
    uint256 epochNow,
    address sender,
    uint256 lotteryDate,
    address randomAddr,
    uint256 randomNo
) internal {
    

    uint256 winningToken = rand(randomAddr, randomNo);
    address winnerAddress = ERC721.ownerOf(winningToken);
    uint256 lastWon = _winners[winnerAddress];

    bool alreadyWon = (lastWon == lotteryDate);

    Winner memory win;

    if ((it < 5) && alreadyWon) {
        uint256 newIt = it + 1;
        return
            selectAWinner(
                newIt,
                epochNow,
                sender,
                lotteryDate,
                winnerAddress,
                winningToken
            );
    } else if ((it >= 5) && alreadyWon) {
        return;
    } else {
        win.date = lotteryDate;
        win.winner = winnerAddress;
        win.tokenId = winningToken;
        winnerLog[drawNumber].push(win);

        _winners[winnerAddress] = lotteryDate;
    }

    return;
}

function rand(address randomAddress, uint256 randomNo) internal view returns (uint256) {
    uint256 seed = uint256(
        keccak256(
            abi.encodePacked(
                (block.timestamp - randomNo) +
                    block.difficulty +
                    ((
                        uint256(keccak256(abi.encodePacked(block.coinbase)))
                    ) / (block.timestamp)) +
                    block.gaslimit +
                    ((uint256(keccak256(abi.encodePacked(randomAddress)))) /
                        (block.timestamp)) +
                    block.number
            )
        )
    );

    return (seed - ((seed / maxSupply) * maxSupply)) + 1;
}
