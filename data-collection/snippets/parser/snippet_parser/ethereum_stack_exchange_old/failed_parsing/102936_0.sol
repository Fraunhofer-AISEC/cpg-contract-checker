    def add_liquidity(_amounts: uint256[N_COINS], _min_mint_amount: uint256, _use_underlying: bool = False) -> uint256:   
@notice Deposit coins into the pool
    @param _amounts List of amounts of coins to deposit
    @param _min_mint_amount Minimum amount of LP tokens to mint from the deposit
    @param _use_underlying If True, deposit underlying assets instead of aTokens
    @return Amount of LP tokens received by depositing
