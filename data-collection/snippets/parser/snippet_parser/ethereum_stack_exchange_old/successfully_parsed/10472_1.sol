function start(address seller, address thirdParty) returns (uint) {
    uint escrowId = numEscrows;
    numEscrows++;
    escrow memory e;
    e.thirdParty = thirdParty;
    e.seller = seller;
    e.buyer = msg.sender;
    e.amount = msg.value;
    e.recipient = seller;
    e.status = 1; 
    escrows[escrowId] = e;

    escrowStart(e.buyer, e.seller, e.thirdParty); 

    return escrowId;
}
