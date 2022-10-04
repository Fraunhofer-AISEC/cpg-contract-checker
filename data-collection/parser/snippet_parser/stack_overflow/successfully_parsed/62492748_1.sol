function buyRep(uint _amount) {
    uint repAmount = _amount.mul(3);
    profiles[msg.sender].uRep.repToGive.add(repAmount);
    Token.burn(_amount);
}
