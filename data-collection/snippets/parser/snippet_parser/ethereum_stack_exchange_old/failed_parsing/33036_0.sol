contract BlipCoinIco is PausableToken {
  *snip*

  function() isIcoOpen payable {
      totalRaised = totalRaised.add(msg.value);

      uint256 tokenAmount = calculateTokenAmount(msg.value);
      balances[fundsWallet] = balances[fundsWallet].sub(tokenAmount);
      balances[msg.sender] = balances[msg.sender].add(tokenAmount);
      Transfer(fundsWallet, msg.sender, tokenAmount);

      
      fundsWallet.transfer(msg.value);
  }

  function calculateTokenAmount(uint256 weiAmount) constant returns(uint256) {
      
      uint256 tokenAmount = weiAmount.mul(50);
      if (now <= startTimestamp + 7 days) {
          
          return tokenAmount.mul(150).div(100);
      } else {
          return tokenAmount;
      }
  }

  *snip*
}
