function scheduleTransaction(uint256 _fromNow) public {
    aion = AionContract(0x2fC197cD7897f41957F72e8E390d5a7cF2858CBF);
    uint256 callCost = 10e16 + 800000*100e9 + aion.serviceFee();
    aion.ScheduleCall.value(callCost)( block.timestamp + _fromNow, Reciever, 10e16, 800000, 100e9, hex"00", true);
}


function scheduleMultipleTransactions(uint _period, uint _nonce) public {
    for(uint i=0; i<=_period*(_nonce-1); i+_period) {
        scheduleTransaction(i);
    }
}

function () public payable {}
