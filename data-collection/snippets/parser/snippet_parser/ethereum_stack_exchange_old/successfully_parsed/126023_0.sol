function CryptoRandomMint(address user_addr, uint noOfMints)  contractIsNotPaused public payable returns (uint[] memory,string[] memory) {
     require(noOfMints<4 && noOfMints>0,"You can mint 1-3 NFTs");
     require(TotalNFTsMinted<1000, "Max Minting Limit reached");
     require(msg.value == mintFees*noOfMints, "Not Enough Balance");
     uint[] memory x; 
     string[] memory y;
        for(uint i=0;i<noOfMints;++i){
            (x[i], y[i]) = randomMinting(user_addr);
        }
        depositAmount(_msgSender(), msg.value);
        return (x,y);    
 
    }
