
function __callback(bytes32 id, string result, bytes proof) public {

    makePayment(result);

 }

    function makePayment(string result) public {

    if (result.toSlice().equals("home".toSlice())) --->> IF HOME HAS WON
    {   
       < NEED LOGIC HELP > SEND MONEY TO ADDRESS WHO PLACED BETS ON HOME
    }
    else if(result.toSlice().equals("away".toSlice())) ----->> IF AWAY HAS WON
    {        
       < NEED LOGIC HELP > SEND MONEY TO ADDRESS WHO PLACED BETS ON AWAY
    }

}

