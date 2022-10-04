function makeDatum(string dataStr)  payable returns (bool) {
    debug("datum");
    data[msg.sender].payment += msg.value;
}
