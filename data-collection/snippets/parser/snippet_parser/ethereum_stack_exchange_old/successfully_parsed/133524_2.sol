pragma solidity ^0.8.0;

interface ISomeOtherContract {
  function bar() external;
}

contract Demo {
  event A(bool);

  function foo(address callee) public {
    
    (bool success,) = callee.call{gas: gasleft() - 2000}(
      abi.encodeWithSelector(ISomeOtherContract.bar.selector)
    );
    emit A(success);
  }
}
