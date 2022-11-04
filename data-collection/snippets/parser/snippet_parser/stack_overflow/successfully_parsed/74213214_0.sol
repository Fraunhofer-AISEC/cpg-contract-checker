    function getUserInv(address user) public view returns (uint[] memory) {
        uint nftCount = 0;
        for(uint i = 0; i < nfts.totalSupply(); i++) {
            if(nfts.ownerOf(i) == user) {
                nftCount++;
            }
        }
        uint[] memory userInv = new uint[](nftCount);

        uint index = 0;
        for (uint i = 0; i < nfts.totalSupply(); i++) {
            if(nfts.ownerOf(i) == user) {
                userInv[index] = i;
                index++;
            }
        }

        return userInv;
        
    }
