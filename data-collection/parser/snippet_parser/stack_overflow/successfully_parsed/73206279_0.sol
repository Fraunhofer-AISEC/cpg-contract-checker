constructor(address _escrow, uint256 _Presale_Start_Countdown, uint256 _Presale_End_Countdown,  uint256 _Softcap_End_Countdown, uint256 _Hardcap_End_Countdown, address _funder1, 
    address _funder2, address _funder3, address _Development, address _Marketing, address _Community, address _TokenStability, uint256 _DropTokens ) public {
    Presale_Start_Countdown = _Presale_Start_Countdown;
    Presale_End_Countdown = _Presale_End_Countdown;
    require(_escrow != address(0));
    escrow = _escrow;
    DropTokens = _DropTokens;
    presaleSupply_ = 3000000000000000000000000;
    funder1 = _funder1;
    funder2 = _funder2;
    funder3 = _funder3;
    Development = _Development;
    Marketing = _Marketing;
    Community = _Community;
    TokenStability =_TokenStability;
    balance[escrow] += DropTokens;
    balance[escrow] += presaleSupply_;
    }
