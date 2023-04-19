struct Stake {
  uint256 timeStaked
  uint256 amount
  bool withdrawn
}

mapping (address => Stake[]) stakes;

function withdraw external returns(bool) {
  
  
}
