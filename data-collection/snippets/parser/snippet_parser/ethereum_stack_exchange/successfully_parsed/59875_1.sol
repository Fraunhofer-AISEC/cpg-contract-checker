    function getFreeWallets2(  string mybonusname) public view returns ( uint length, uint  k1, uint  length1) {

        bytes32 bonusNameBytes32 = stringToBytes32(mybonusname);
        require(Bonuses[bonusNameBytes32].bonusExists, "Bonus does not exist");
          length = Wallets.length;
          length1 = getNumberWallets();
        address[]  memory    FreeWallets; 
          k1=0;
        for(uint i = 0; i < length; i++)
        {
           address mywallet = Wallets[i];
           if (!WalletBonuses[mywallet][bonusNameBytes32].bonusExists)
           {
            
               k1++;
           }
        }



    }
