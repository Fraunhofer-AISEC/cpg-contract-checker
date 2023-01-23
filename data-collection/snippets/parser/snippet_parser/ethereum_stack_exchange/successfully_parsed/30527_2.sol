require(myToken.allowance(msg.sender, this) > 0);
uint tokenAmount = myToken.allowance(msg.sender, this);
require(myToken.transferFrom(msg.sender, this, tokenAmount));
msg.sender.transfer(getRate(tokenAmount));
