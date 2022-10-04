pragma solidity ^0.6.6;
import "./newERC20.sol";
contract TokenTimelock {

  newERC20 token;
  address beneficiary;
  uint releaseTime;


  function timelock(newERC20 _token, address _beneficiary, uint _releaseTime) public {
    require(_releaseTime > now);
    token = _token;
    beneficiary = _beneficiary;
    releaseTime = _releaseTime;
  }
  function claim() public {
    require(msg.sender == beneficiary);
    require(now >= releaseTime);

    uint amount = token.balanceOf(this);
    

    require(amount > 0);

    token.transfer(beneficiary, amount);
  }
}
