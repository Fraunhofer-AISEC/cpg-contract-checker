contract TestableMyContract is MyContract {
    uint256 _fakeBlockNumber;
    constructor(string memory name_, string memory symbol_) MyContract(name_, symbol_) {
    }

    function __test_setBlockNumber(uint256 blockNumber_) public {
        _fakeBlockNumber = blockNumber_;
    }

    function _blockNumber() internal override view returns (uint256) {
        if (0 == _fakeBlockNumber) {
            return super._blockNumber();
        }
        return _fakeBlockNumber;
    }
}
