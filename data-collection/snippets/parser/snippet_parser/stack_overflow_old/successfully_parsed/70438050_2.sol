function sendToWinner() public payable onlyOwner {
        uint8[100] memory participatorsRates;
        uint8 rate;
        uint8 participatorsRatesIndex=0;
        for(uint8 participatorIndex = 0; participatorIndex<participators.length; participatorIndex++){
            rate = uint8(balances[participators[participatorIndex]]*100/pot);
            for(; participatorIndex<rate ; participatorsRatesIndex++){
                participatorsRates[participatorsRatesIndex] = participatorIndex;
            }
            balances[participators[participatorIndex]]=0;
        }
        uint8 winningParticipatorIndex = participatorsRates[random()];
        (bool success, ) = payable(participators[winningParticipatorIndex]).call{value:pot}("");
        require(success, "Transfer failed.");
        
    }
