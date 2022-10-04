pragma solidity ^0.4.19;

contract Lease {

  function Lease(
                address _owner,
                address _tenant,
                uint _startDate,
                uint _fee,
                uint _deposit)
    public {
    require(_owner != _tenant);
    require(_startDate > now);
    require(_fee > 0);
    require(_deposit >= fee * 2);
  }
}
