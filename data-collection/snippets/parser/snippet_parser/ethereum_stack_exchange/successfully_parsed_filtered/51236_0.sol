pragma solidity ^0.4.18;
import 'zos-lib/contracts/migrations/Migratable.sol';

contract MyContract is Migratable {
    uint256 public x;

    function initialize(uint256 _x) isInitializer("MyContract", "0") public {
        x = _x;
    }

    function baz() public returns (uint256) {
        decrement();
        return x;
    }

    function increment() public {
        x += 1;
    }

    function decrement() public {
        x -= 1;
    }
}
