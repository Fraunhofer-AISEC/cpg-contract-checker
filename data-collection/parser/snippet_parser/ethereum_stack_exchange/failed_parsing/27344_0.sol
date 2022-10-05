modifier validateValue(uint fee){ if(msg.value != ((0.1 ether) * fee)) revert(); _; }

modifier checkFee(address payOutAddr){
    uint begin = 30 * uint(payment[phoneBook[payOutAddr]].paymentsCount);
    uint end = begin + 15;
    uint cycleOfContract = now - startDate;
    if(begin < cycleOfContract && cycleOfContract < end){
        return validateValue(1);
    }
    else {
        uint totalFee = (int(cycleOfContract/30) + 1) * 0.02 ether;
        return validateValue(totalFee);
    }
}
