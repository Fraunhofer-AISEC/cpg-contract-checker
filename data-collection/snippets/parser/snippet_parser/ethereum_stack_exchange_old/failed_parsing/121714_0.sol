        uint256 public maxSupply = 2000;

        if(groupA == true) {
            maxSupply = 1000; 
            uint256 totalMinted = ?; 

         uint256 ownerTokenCount = addressMintedBalance[msg.sender];
         require(ownerTokenCount + _mintAmount <= perAddressLimit, "max per address exceeded");
        }
        if(groupB == true) {
            maxSupply = 1000 - totalMinted; 
        } 
        if(groupC == true) {
         maxSupply = 1000;
        }
