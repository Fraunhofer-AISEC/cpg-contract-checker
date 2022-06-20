function register (string choice) payable notRegisteredyet()  sentEnoughCash(5 wei) {

        if(player1 == 0)
        player1=msg.sender;
        else if (player2 == 0)
        player2=msg.sender;
        if (msg.sender == player1)
            player1Choice = choice;
        else if (msg.sender == player2)
            player2Choice = choice;




    }

    function rpsgame() 
    {   
        scenarioMatrix["rock"]["rock"] = 0;
        scenarioMatrix["rock"]["paper"] = 2;
        scenarioMatrix["rock"]["scissors"] = 1;
        scenarioMatrix["paper"]["rock"] = 1;
        scenarioMatrix["paper"]["paper"] = 0;
        scenarioMatrix["paper"]["scissors"] = 2;
        scenarioMatrix["scissors"]["rock"] = 2;
        scenarioMatrix["scissors"]["paper"] = 1;
        scenarioMatrix["scissors"]["scissors"] = 0;
    }



    modifier notRegisteredyet() {

        if (msg.sender == player1 || msg.sender == player2)
         revert();
         else
          _;

    }

     modifier sentEnoughCash(uint amount) {
        if (msg.value < amount)
         revert();
         else
         _;
    }

     function play() returns (int w ){

            if (bytes(player1Choice).length != 0 && bytes(player2Choice).length != 0){

            int winner = scenarioMatrix[player1Choice][player2Choice];
            if (winner == 1)
                player1.transfer(this.balance);
            else if (winner == 2)
                player2.transfer(this.balance);

            else
            {
                player1.transfer(this.balance/2);
                player2.transfer(this.balance);
            }
            
           player1Choice = "";
            player2Choice = "";
            player1 = 0;
           player2 = 0;
            return winner;
        }
        else 
            return -1;
    }
}
