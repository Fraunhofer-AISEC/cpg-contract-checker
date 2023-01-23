function sendBatch(address[] addrs) public payable {
    for(uint i = 0; i < addrs.length; i++) {
        addrs[i].transfer(msg.value.div(addrs.length));
    }
}
