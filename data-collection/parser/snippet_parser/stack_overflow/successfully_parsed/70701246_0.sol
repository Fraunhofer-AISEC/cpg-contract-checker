    mapping(address=>uint256) public txSender;
    function test() public {
        address _txSender = getTxSender();
        txSender[_txSender]++;
    }
    
    function getTxSender() public view returns(address) {
        return msg.sender;
    }
