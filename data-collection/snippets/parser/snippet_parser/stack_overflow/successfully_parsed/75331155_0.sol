function transferData(address payable newContractAddress) public {
    
    NFTMinter newContract = NFTMinter(newContractAddress);

    
    
    for (uint256 i = 0; i < _balances.length; i++) {
      newContract.setBalance(_balances[i], _balances[_balances[i]]);
    }

    
    
    for (uint256 i = 0; i < _tokenIds.length; i++) {
      for (uint256 j = 0; j < _tokenIds[i].length; i++) {
        newContract.addTokenId(_tokenIds[i], _tokenIds[i][j]);
      }
    }

    
    
    for (uint256 i = 0; i < tokenPrice.length; i++) {
      newContract.setTokenPrice(tokenPrice[i], tokenPrice[tokenPrice[i]]);
    }
}
