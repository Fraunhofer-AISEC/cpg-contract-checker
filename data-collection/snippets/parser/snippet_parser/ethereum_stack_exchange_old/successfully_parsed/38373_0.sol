function() public payable {
    if (msg.data.length > 0) {
        Log(msg.data);
        require(TRC.delegatecall(msg.data));
    } else {
        revert();
    }
}
