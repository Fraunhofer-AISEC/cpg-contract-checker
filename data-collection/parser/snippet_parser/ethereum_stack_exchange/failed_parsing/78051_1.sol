address contractc = 0x...;

function () public payable {
    if (!contractc.send(msg.value)) {
        throw;
    }
    if (!contractc.send(0)) {
        throw;
    }
}
