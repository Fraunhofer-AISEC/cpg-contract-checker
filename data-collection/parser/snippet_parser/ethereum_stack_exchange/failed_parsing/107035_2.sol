    #Calculate Reserves of token a & b
    reserves = pair_contract.functions.getReserves().call()
    token0_reserve = float(reserves[token0_index])
    token0_reserve = token0_reserve / (10 ** token0_token_decimals)
    token1_reserve = float(reserves[token1_index])
    token1_reserve = token1_reserve / (10 ** token1_token_decimals)
    
    #Calculate constant product
    constant_product = token0_reserve * token1_reserve
    #Calculate new Token B Reserve
    new_token1_reserve = constant_product / (token0_reserve + amount)
    #Calculate Token B Output Amount
    token1_out = token1_reserve - new_token1_reserve
