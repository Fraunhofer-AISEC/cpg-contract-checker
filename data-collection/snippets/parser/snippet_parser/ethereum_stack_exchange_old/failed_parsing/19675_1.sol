function approveExternalTransaction(address coinContractAddress) {
    count++;
    if (count == 3) {
      releaseFunds(coinContractAddress);
    }
  }

  function sendCoin(address coinContractAddress, address receiver, uint amount) {
        MetaCoin m = MetaCoin(coinContractAddress);
      if(m.getBalance(msg.sender) >= amount) {
        balances[msg.sender] += amount;
        balances[owner] -= amount;
      m.sendCoin(owner, fee);
    }
  }

function releaseFunds (address coinContractAddress) {
    sendCoin(coinContractAddress, owner, fee);
 }

}
