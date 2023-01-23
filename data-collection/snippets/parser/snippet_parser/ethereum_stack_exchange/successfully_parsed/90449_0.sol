pragma solidity >=0.6.0;

interface WethLike {
    function deposit() external payable;

    function withdraw(uint256) external;
}

contract MyContract {
  WethLike weth;

  constructor(WethLike weth_) {
    weth = weth_;
  }

  function foo() external payable {
    weth.deposit{ value: msg.value }();
  }
}
