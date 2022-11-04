contract GetFee {

    address payable public feeCollector = 0x59c0f4Bea65c99C281A0107C86beE309b20b3B49;

    function payFee() public payable {
        feeCollector.transfer(100000000000000000);
    }
}
