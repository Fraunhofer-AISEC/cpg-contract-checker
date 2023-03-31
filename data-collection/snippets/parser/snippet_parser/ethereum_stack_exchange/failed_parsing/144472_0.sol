struct Batch {
  uint256 withdrawableTimestamp;
  uint256 amount;
}

contract Depositor {
  
  Batch[] public batches;

  function triggerDeposit() external{
    
    SpiralsImpactVault(0x123).deposit(10 * 10 ** 18);

    
    batches.push(Batch(block.timestamp + 30 days, 10 * 10 ** 18));
  }

  function withdraw() external onlyOwner {
    
    uint256 withdrawableAmount = withdrawable();
    SpiralsImpactVault(0x123).withdraw(withdrawableAmount);

    
    
    
    ...
  }
  
  function withdrawable() public view returns (uint256) {
    uint256 withdrawableAmount = 0;
    
    
    for (uint256 i=0; i < batches.length; ++i) {
      if (block.timestamp >= batches[i].withdrawableTimestamp) {
        withdrawableAmount += batches[i].amount;
      } else {
        break;
      }
    }

    return withdrawableAmount ;
  }
}

