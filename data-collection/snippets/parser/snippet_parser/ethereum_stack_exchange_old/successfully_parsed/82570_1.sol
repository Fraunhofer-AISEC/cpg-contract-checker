function placeBet(uint _betMask, uint _modulo, uint _commit, bytes32 _r, bytes32 _s)
    payable
    public
  {
    Bet storage bet = bets[_commit];
    require (bet.gambler == address(0), "Bet should be in a 'clean' state.");
    bytes32 signatureHash = keccak256(abi.encodePacked(_commit));
    require (secretSigner == ecrecover(signatureHash, 27, _r, _s), "ECDSA signature is not valid.");
    uint amount = msg.value;
    require (_modulo > 1 && _modulo <= MAX_MODULO, "Modulo should be within range.");
    require (amount >= minBet && amount <= MAX_AMOUNT, "Amount should be within range.");
    require (_betMask > 0 && _betMask < MAX_BET_MASK, "Mask should be within range.");
    uint rollRange;

    if (_modulo <= MAX_MASK_MODULO) {
      
      
      
      
      rollRange = ((_betMask * POPCNT_MULT) & POPCNT_MASK) % POPCNT_MODULO;
    } else {
        
        uint8 lower = uint8(_betMask);
        uint8 upper = uint8(_betMask >> 8); 
        if((_betMask >> 16) == 0){
          rollRange = upper - lower + 1;    
        } else {
          rollRange = upper > lower ? _modulo - (upper-lower) + 1 : _modulo;
        }

        require ( lower > 0 &&
              upper >= lower && 
              upper <= _modulo && 
              rollRange <= _modulo * maxRollRange / 100, "Roll out of range.");
    }
      
    
    uint possibleWinAmount;
    uint _jackpot_fee;
    
    (possibleWinAmount, _jackpot_fee) = getDiceWinAmount(amount, _modulo, rollRange);
    
    
    require (possibleWinAmount <= amount + maxProfit, "maxProfit limit violation.");
    
    
    lockedInBets += uint128(possibleWinAmount);
    if(amount >= minGoldenPotBet){
      goldenPotSize += uint128(_jackpot_fee);
    }      
    else if(amount >= minSilverPotBet){
      silverPotSize += uint128(_jackpot_fee);
    }      
    
    
    require (goldenPotSize + silverPotSize + lockedInBets <= address(this).balance, "Cannot afford to lose this bet.");
    
    
    emit OnCommit(_commit);
    
    
    bet.amount = amount;
    bet.modulo = uint8(_modulo);
    bet.rollRange = uint8(rollRange);
    bet.placeBlockNumber = uint40(block.number);
    bet.mask = uint40(_betMask);
    bet.gambler = msg.sender;
  }

