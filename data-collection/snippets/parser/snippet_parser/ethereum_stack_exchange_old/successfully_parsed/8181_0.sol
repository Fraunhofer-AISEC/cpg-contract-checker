function SubCoin(){
      balances[msg.sender] = totalPoints;
}

function send(address to, uint256 valueInmWard) {
    if (balances[msg.sender] >= valueInmWard) {
      balances[to] += valueInmWard;
      balances[msg.sender] -= valueInmWard;
      PointTransfer(msg.sender, to, valueInmWard);
    }
  }
