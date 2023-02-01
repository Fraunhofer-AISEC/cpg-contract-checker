pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract TimeLocked {
  using SafeMath for uint;

  uint public lockPeriod;
  uint public startTime;

  constructor(uint _lockPeriod) public {
    lockPeriod = _lockPeriod;
    startTime = now;
  }

  function closeProposal() public {
    require(now >= startTime.add(lockPeriod), "TimeLocked: lock period has not expired");

    
  }
}
