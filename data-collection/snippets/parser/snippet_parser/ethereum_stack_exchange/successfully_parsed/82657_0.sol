function placeBet(uint betMask, uint modulo, uint commitLastBlock, uint commit, uint8 v, bytes32 r, bytes32 s) external payable {
        
        Bet storage bet = bets[commit];
        require (bet.gambler == address(0), "Bet should be in a 'clean' state.");

        
        uint amount = msg.value;
        require (modulo > 1 && modulo <= MAX_MODULO, "Modulo should be within range.");
        require (amount >= MIN_BET && amount <= MAX_AMOUNT, "Amount should be within range.");
        require (betMask > 0 && betMask < MAX_BET_MASK, "Mask should be within range.");

        
        require (block.number <= commitLastBlock, "Commit has expired.");
        require (verifySignature(commitLastBlock, commit, v, r, s), "ECDSA signature is not valid.");
        uint rollUnder;
        uint mask;

        if (modulo <= MAX_MASK_MODULO) {

            rollUnder = ((betMask * POPCNT_MULT) & POPCNT_MASK) % POPCNT_MODULO;
            mask = betMask;
        } else {
            
            
            require (betMask > 0 && betMask <= modulo, "High modulo range, betMask larger than modulo.");
            rollUnder = betMask;
        }

        
        uint possibleWinAmount;
        uint jackpotFee;

        (possibleWinAmount, jackpotFee) = getDiceWinAmount(amount, modulo, rollUnder);

        
        require (possibleWinAmount <= amount + maxProfit, "maxProfit limit violation.");

        
        lockedInBets += uint128(possibleWinAmount);
        jackpotSize += uint128(jackpotFee);

        
        require (jackpotSize + lockedInBets <= address(this).balance, "Cannot afford to lose this bet.");

        
        bet.amount = amount;
        bet.modulo = uint8(modulo);
        bet.rollUnder = uint8(rollUnder);
        bet.placeBlockNumber = uint40(block.number);
        bet.mask = uint40(mask);
        bet.gambler = msg.sender;

        
       emit OnCommit(commit);
       emit BetPlaced(commit, bet.gambler, bet.amount, bet.mask, bet.modulo);
    }

