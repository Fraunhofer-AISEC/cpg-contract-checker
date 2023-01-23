uint minAmount = 1 ether;
uint state;
function payDeposit() payable {
    if(msg.value < minAmount ) {
        state = 2;
        throw;
    }
    state = 1;
 }
