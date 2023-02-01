        struct round {
           uint roundId;
           uint betAmount;
           bool playerChoice; 
           bool draw;
           bool win; 
        }
    
        function fulfillRandomWords(
            uint256, 
            uint256[] memory randomWords
        ) internal override {


            myRound.draw = (randomWords[0] % 2); 
        }
