mapping (string => mapping(string => int)) scenarioMatrix;

address player1;
address player2;
uint currentGameCost = 0;
uint RevealTime;
bytes32 player1ChoiceHash;
bytes32 player2ChoiceHash;
string public player1Choice;
string public player2Choice;

function register (string choice, string randStr) payable notRegisteredyet()  sentCash(5 wei) {
    
    if(player1 == 0)
    player1=msg.sender;
    else if (player2 == 0)
    player2=msg.sender;
    if (msg.sender == player1)
          player1ChoiceHash = sha3(sha3(choice) ^ sha3(randStr));
    else if (msg.sender == player2)
        player2ChoiceHash =sha3(sha3(choice) ^ sha3(randStr)) ;

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



 modifier sentCash(uint amount) {

 
 if (msg.value < amount) {
    revert();
}
 
 

 if (player1 == 0) {
    currentGameCost = msg.value;
} 
else if (msg.value != currentGameCost) {
    revert();
}

_;

}



 function revealHand(string choice, string randStr)

{  
   
     RevealTime == now;


    if (msg.sender == player1 && sha3(sha3(choice) ^ sha3(randStr)) == player1ChoiceHash)
        player1Choice = choice;
    if (msg.sender == player2 && sha3(sha3(choice) ^ sha3(randStr)) == player2ChoiceHash)
        player2Choice = choice;
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
       currentGameCost=0;
        return winner;
    }

   else if (now > RevealTime + 60)
    {
        
        if (bytes(player1Choice).length != 0)
            player1.send(this.balance);
        else if (bytes(player2Choice).length != 0)
            player2.send(this.balance);
    }

   else
    return -1;
}






function DisplayEther () constant returns (uint amount) {

     return currentGameCost;
 }
