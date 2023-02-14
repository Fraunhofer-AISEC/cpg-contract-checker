pragma solidity 0.8.6;
import “@openzeppelin/contracts/utils/structs/EnumerableSet.sol”;

contract Test {
using EnumerableSet for EnumerableSet.AddressSet;

struct Stake {
      uint256 lockedToken;
      uint256 creditsEarned;
   }
  
  

  EnumerableSet.AddressSet private stakeholders;
  mapping(address => Stake) private stakeholderToStake;
      
  uint256 private totalCredits;

  function createStake(
     address stakeholder,
     uint256 lockedToken,
     uint256 creditsEarned
  ) public {
      stakeholders.add(stakeholder);
      stakeholderToStake[stakeholder] = Stake({
      lockedToken: lockedToken,
      creditsEarned: creditsEarned
     });
    totalCredits += creditsEarned;
  }
      
  function distributeRewards() public {
  
   }
