
function deliveryVSpayment(bytes32 offer, uint8 v, bytes32 r,
    bytes32 s) public payable returns(bool)
{
    var (seller, quantity, price) = recover(offer, v, r, s);

    bool agreementIsValid = balances[seller] >= quantity;
    if(agreementIsValid && msg.value > uint(price) * uint(quantity))
    {
        
        balances[msg.sender] += uint(quantity);
        balances[seller] -= uint(quantity);
        uint commission = (msg.value / 100) * transferFee;
        uint sellerAmt = msg.value - commission;
        seller.transfer(sellerAmt);
        admin.transfer(commission);
        numOfTransfers++;
        return true;
    }
    else revert();
}







function recover(bytes32 offer, uint8 v, bytes32 r, bytes32 s) public pure
    returns (address seller, uint16 quantity, uint256 price) {
    quantity = uint16(offer & 0xffff);
    price = uint256(offer >> 16 << 16);
    seller = ecrecover(offer, v, r, s);
}
