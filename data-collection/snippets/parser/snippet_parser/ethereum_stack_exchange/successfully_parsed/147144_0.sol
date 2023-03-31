function stake (
        AssetType _assetType,
        uint256 _timelockId,
        uint256,
        uint256,
        uint256
    ) external nonReentrant {

        function (uint256) _s1 = _stakeS1Citizen;
        function (uint256) _s2 = _stakeS2Citizen;
        function (uint256) _b = _stakeBytes;
        function (uint256) _lp = _stakeLP;

        function (uint256) _stake;
        assembly {
            switch _assetType
                case 0 {
                    _stake := _s1
                }
                case 1 {
                    _stake := _s2
                }
                case 2 {
                    _stake := _b
                }
                case 3 {
                    _stake := _lp
                }
                default {}
        }

        _stake(timelockOption);
    }
