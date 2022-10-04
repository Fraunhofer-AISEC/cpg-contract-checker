(...)
    function abc_1() constant returns (uint) {
        SilverCoin instanceSilverCoin = SilverCoin(silverCoinAddress);
        return instanceSilverCoin.abc();
    }
}
