contract SubClassChild {

    event LogSender(address sender, address origin, address me);

    function lookWhosTalking() public returns(address) {
        emit LogSender(msg.sender, tx.origin, address(this));
        return msg.sender;
    }

    

    

    function rightHere() public returns(address) {
        emit LogSender(msg.sender, tx.origin, address(this));
        return msg.sender;
    }

}
