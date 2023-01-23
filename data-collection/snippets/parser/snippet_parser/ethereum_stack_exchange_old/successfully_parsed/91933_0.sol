 function getFrom(bytes32 transferId)public returns (address ) {
    Transfer memory transfer = transfers[transferId];        
    if (msg.sender != transfer.to && msg.sender != transfer.from)  return 0x0;
    return transfer.from;
}
function getTo(bytes32 transferId)public returns (address) {
    Transfer memory transfer = transfers[transferId];
 if (msg.sender != transfer .to && msg.sender != transfer .from) return 0x0;
    return transfer.to;
}
