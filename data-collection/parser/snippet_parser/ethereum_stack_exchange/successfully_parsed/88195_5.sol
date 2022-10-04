 function getNFTBalance(address _owner) public view returns (uint256){
        
       return nft.balanceOf(_owner);
   }
