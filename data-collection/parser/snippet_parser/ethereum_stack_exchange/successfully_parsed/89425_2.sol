
    function initialize(
        address _treasury,
        address _solar,
        address _fhr,
        address _sats,
        uint256 _yield,
        uint256 _tokenId
    ) public {
        tokenId = _tokenId;
        yield = _yield;
        minHold = 14 days;

        solar = ISolar(_solar);
        fhr = IFHR(_fhr);
        sats = ISat(_sats);
        ts = ITreasury(_treasury);
    }
