modifier hasntBet(uint _betAmount) {
    for (uint i = 0; i <= bettersForA.length; i++) {
        if (bettersForA[i].whosBetting == msg.sender) {
            updateBet(_betAmount, i); 
        } 
    }
    _;
}
