pragma solidity >=0.8.0;

interface D { function e() external; }

contract C {
    bool locked = true;

    function call(address target) public {
        locked = false;
        D(target).e();
        locked = true;
    }

    function broken() public view {
        assert(locked);
    }
}
