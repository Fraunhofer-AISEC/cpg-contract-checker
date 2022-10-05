uint amountEther = multiply(_numberOfTokens, tokenPrice)/(10**18);

uint amountEtherToSend = address(this).balance - amountEther;

msg.sender.transfer(amountEtherToSend);
