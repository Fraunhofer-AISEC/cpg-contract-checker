contract ethTransferTest {
    function ethTrans(address _to) public {
        uint256 pay = msg.value;
        _to.transfer(pay);
    }
}


contract ethReceiverTest {
    function () payable public {
    }
}
