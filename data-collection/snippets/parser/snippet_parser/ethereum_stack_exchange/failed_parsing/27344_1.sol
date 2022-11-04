modifier checkFee(address payOutAddr){
    uint begin = 30 * uint(payment[phoneBook[payOutAddr]].paymentsCount);
    uint end = begin + 15;
    uint cycleOfContract = now - startDate;
    if(begin < cycleOfContract && cycleOfContract < end){
        if(!validateValue(1,msg.value)) revert();
        _;
    }
    else {
        uint totalFee = (int(cycleOfContract/30) + 1) * 0.02 ether;
         if(!validateValue(totalFee,msg.value)) revert();
        _;
    }
}

function validateValue(uint fee, uint amount) constant returns (bool){
    if(amount != ((0.1 ether) * fee)) return false; 
    else return true;
}
