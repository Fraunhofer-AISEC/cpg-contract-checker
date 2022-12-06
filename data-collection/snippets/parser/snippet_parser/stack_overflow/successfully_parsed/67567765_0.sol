    function getAllTokensMintedByUser(address user) public view returns(CryptoBoy[] memory result){
        
        uint256 k=0;
        result=new CryptoBoy[](totalMintedTokens[user]);
        if(totalMintedTokens[user]!=0){
            for(uint256 i=1; i<=cryptoBoyCounter; i++) {
            
            CryptoBoy memory cryptoboy=allCryptoBoys[i];
            if(cryptoboy.mintedBy==user){
              result[k]=cryptoboy;
              k++;
            }
          }
        }
        
        return result;
      }
