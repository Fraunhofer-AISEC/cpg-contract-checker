uint numberA;
uint numberB;
address playerA;
address playerB;

function playANumber(uint number){
    if(msg.sender == playerA && numberA == 0 && number > 0){
        numberA = number;
    }
    if(msg.sender == playerB && numberB == 0 && number > 0){
        numberB = number;
    }
    if(numberA > 0 && numberB > 0){
        
    }
}
