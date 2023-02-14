constructor(
        EggToken _egg,
        address _devaddr,
        address _feeAddress,
        uint256 _eggPerBlock,
        uint256 _startBlock
    ) public {
        egg = _egg;
      `enter code here`     devaddr = _devaddr;
            feeAddress = _feeAddress;
            eggPerBlock = _eggPerBlock;
            startBlock = _startBlock;
    }
