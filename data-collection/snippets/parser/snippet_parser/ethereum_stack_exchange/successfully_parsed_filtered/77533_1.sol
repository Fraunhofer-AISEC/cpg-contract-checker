contract testRand {

    uint256 public num;

    event showLottery(uint256 _lottery);

    function rand() private view returns (uint256) {
       return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, now , block.coinbase)))%(10**6);
    }

    function implement() public {
        num = rand();
        emit showLottery(num);
    }

}
