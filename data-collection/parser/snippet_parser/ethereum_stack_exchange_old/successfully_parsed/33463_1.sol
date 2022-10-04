function BetOnBitcoin() payable public{
      owner = msg.sender;

    }

function startBets(){

      oraclize_setProof(proofType_TLSNotary | proofStorage_IPFS);
      totalBetsBitcoinGoesUp = 0;
      totalBetsBitcoinGoesDown = 0;
      numberOfBettersBitcoinGoesUp = 0;
      numberOfBettersBitcoinGoesDown = 0;
      payOutIndexBitcoinUp = 0;
      payOutIndexBitcoinDown = 0;
      totalBets = 0;
      currentState = GameState.gettingBitcoinPrice;
      update();
    }
