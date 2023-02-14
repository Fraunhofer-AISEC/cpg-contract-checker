
pragma solidity ^0.8.17;

contract OutOfOffset {
    function test(address target) public {
        assembly {
          calldatacopy(0, 0, calldatasize())
          let result := delegatecall(gas(), target, 0, calldatasize(), 0, 0)
          returndatacopy(0, 0, add(returndatasize(), 40))
       }
    }
}
