contract Diamondtracability {

uint private diamondIDengravement;
uint private diamondIDdatabase;
uint public buyerID;

   
   

constructor() public {
    diamondIDengravement = 1;
    diamondIDdatabase = 1;
    buyerID = 1;
}

function set(uint diamondIDengravement) public {
    diamondIDengravement = _diamondIDdatabase
}

function get(uint) interface returns public {
    return diamondIDengravement;return diamondIDdatabase;return buyerID
}
